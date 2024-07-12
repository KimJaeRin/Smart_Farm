// 필요한 네임스페이스 추가
using System;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Threading;
using InTheHand.Net.Bluetooth;
using InTheHand.Net.Sockets;

namespace SFARM.Views
{
    public partial class PanelLiveInfo : UserControl
    {
        public PanelLiveInfo()
        {
            InitializeComponent();

            // 싱글톤 BluetoothManager 인스턴스 사용
            BluetoothManager bluetoothManager = BluetoothManager.Instance;

            // BluetoothManager의 DataReceived 이벤트를 구독
            bluetoothManager.DataReceived += OnDataReceived;
        }

        // 데이터 수신 시 UI를 업데이트하는 메소드
        private void OnDataReceived(string data)
        {
            Dispatcher.Invoke(() =>
            {
                // 수신된 데이터를 파싱하고 UI를 업데이트
                string[] dataParts = data.Split(',');

                if (dataParts.Length == 5)
                {
                    string soilMoisturePart = dataParts[0].Split(':')[1].Trim();
                    string tempPart = dataParts[1].Split(':')[1].Trim();
                    //string humidPart = dataParts[2].Split(':')[1].Trim();
                    string lightPart = dataParts[2].Split(':')[1].Trim();
                    string waterPart = dataParts[3].Split(':')[1].Trim();

                    lblSoilMoisture.Content = soilMoisturePart + "%";
                    lblTemperature.Content = tempPart + "˚C";
                    // lblHumidity.Content = humidPart + "%";
                    lblLight.Content = lightPart + "lux";
                    lblWater.Content = waterPart;
                }
            });
        }
    }
}
