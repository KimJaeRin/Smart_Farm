using InTheHand.Net.Sockets;
using System;
using System.Windows;
using System.Windows.Controls;

namespace SFARM.Views
{
    public partial class PanelControl : UserControl
    {

        // BluetoothManager 인스턴스 가져오기
        private BluetoothManager bluetoothManager = BluetoothManager.Instance;

        public PanelControl()
        {
            InitializeComponent();

        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            RadioButton rb = sender as RadioButton;
            if (rb != null && bluetoothManager != null)
            {
                string fanSpeed = rb.Content.ToString();
                switch (fanSpeed)
                {
                    case "약":
                        bluetoothManager.SendData("A");
                        break;
                    case "중":
                        bluetoothManager.SendData("B");
                        break;
                    case "강":
                        bluetoothManager.SendData("C");
                        break;
                }
            }
        }
        private void TextBox_LEDLightTick_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (int.TryParse(textBox_LEDLightTick.Text, out int ledBrightness))
            {
                if (ledBrightness >= 1 && ledBrightness <= 10)
                {
                    // LED 밝기 값을 BluetoothManager를 통해 전송
                    bluetoothManager.SendData(ledBrightness.ToString());
                }
                else
                {
                    MessageBox.Show("입력된 값이 유효하지 않습니다. 1에서 10 사이의 값을 입력하세요.");
                }
            }
            else
            {
                MessageBox.Show("숫자를 입력하세요.");
            }
        }

        private void TempSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            double sliderValue = TempSlider.Value;
            int adjustedValue = (int)sliderValue + 100; // 슬라이더 값에 100을 더한 후 정수형으로 변환

            string dataToSend = adjustedValue.ToString(); // 문자열로 변환하여 전송 준비
            bluetoothManager.SendData(dataToSend); // BluetoothManager로 데이터 전송


        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (int.TryParse(soil.Text, out int soil_moisture))
            {
                if (soil_moisture >= 30 && soil_moisture <= 80)
                {
                    // LED 밝기 값을 BluetoothManager를 통해 전송
                    bluetoothManager.SendData(soil_moisture.ToString());
                }
                else
                {
                    MessageBox.Show("입력된 값이 유효하지 않습니다. 30에서 80 사이의 값을 입력하세요.");
                }
            }
            else
            {
                MessageBox.Show("숫자를 입력하세요.");
            }
        }

        private void textBox_CumstomSliderWithTick_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (int.TryParse(textBox_CumstomSliderWithTick.Text, out int watersupply))
            {
                if (watersupply >= 0 && watersupply <= 250)
                {
                    watersupply += 200;
                    // LED 밝기 값을 BluetoothManager를 통해 전송
                    bluetoothManager.SendData(watersupply.ToString());
                }
                else
                {
                    MessageBox.Show("입력된 값이 유효하지 않습니다. 30에서 80 사이의 값을 입력하세요.");
                }
            }
            else
            {
                MessageBox.Show("숫자를 입력하세요.");
            }
        }
    }
}
