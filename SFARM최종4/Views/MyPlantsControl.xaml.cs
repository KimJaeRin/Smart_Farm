using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SFARM.Views
{
    /// <summary>
    /// MyPlantsControl.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class MyPlantsControl : UserControl
    {
        private WebClient _webClient;
        private bool _isStreaming;
        private const string StreamUrl = "http://210.119.12.74/mjpeg/1"; // Replace with your ESP32-CAM MJPEG stream URL
        public MyPlantsControl()
        {
            InitializeComponent();
            StartMjpegStream();
        }

        private void StartMjpegStream()
        {
            _webClient = new WebClient();
            _webClient.Headers[HttpRequestHeader.Accept] = "multipart/x-mixed-replace";
            _isStreaming = true;

            Task.Run(() => StreamMjpeg());
        }

        private async void StreamMjpeg()
        {
            try
            {
                using (Stream stream = await _webClient.OpenReadTaskAsync(new Uri(StreamUrl)))
                {
                    byte[] buffer = new byte[4096];
                    MemoryStream imageStream = null;
                    bool imageStarted = false;

                    while (_isStreaming)
                    {
                        int bytesRead = await stream.ReadAsync(buffer, 0, buffer.Length);
                        if (bytesRead == 0)
                            break;

                        for (int i = 0; i < bytesRead; i++)
                        {
                            if (!imageStarted)
                            {
                                // Find the start of a new MJPEG frame
                                if (i + 1 < bytesRead && buffer[i] == 0xFF && buffer[i + 1] == 0xD8)
                                {
                                    imageStarted = true;
                                    imageStream = new MemoryStream();
                                }
                            }

                            if (imageStarted)
                            {
                                imageStream.WriteByte(buffer[i]);

                                // Find the end of the MJPEG frame
                                if (i + 1 < bytesRead && buffer[i] == 0xFF && buffer[i + 1] == 0xD9)
                                {
                                    imageStarted = false;
                                    imageStream.Seek(0, SeekOrigin.Begin);
                                    Dispatcher.Invoke(() => UpdateImage(imageStream));
                                    imageStream.Dispose();
                                    imageStream = null;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error streaming MJPEG: " + ex.Message);
            }
        }

        private void UpdateImage(MemoryStream imageStream)
        {
            try
            {
                BitmapImage bitmap = new BitmapImage();
                bitmap.BeginInit();
                bitmap.CacheOption = BitmapCacheOption.OnLoad;
                bitmap.StreamSource = imageStream;
                bitmap.EndInit();
                streamImage.Source = bitmap;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error updating image: " + ex.Message);
            }
        }

        private void CaptureButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (streamImage.Source != null)
                {
                    BitmapSource bitmapSource = (BitmapSource)streamImage.Source;
                    BitmapEncoder encoder = new PngBitmapEncoder(); // You can use different encoder based on your need (e.g., JpegBitmapEncoder)
                    encoder.Frames.Add(BitmapFrame.Create(bitmapSource));

                    string fileName = $"capture_{DateTime.Now:yyyyMMdd_HHmmss}.png"; // Unique file name based on timestamp
                    using (FileStream fileStream = new FileStream(fileName, FileMode.Create))
                    {
                        encoder.Save(fileStream);
                    }

                    MessageBox.Show($"Capture saved as {fileName}", "Capture Successful", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("No image to capture", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error capturing image: " + ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

    }
}
