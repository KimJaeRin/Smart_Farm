using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SFARM
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            ActiveItem.Content = new Views.HomeControl();
        }

        private void BtnMnuHome_Click(object sender, RoutedEventArgs e)
        {
            ActiveItem.Content = new Views.HomeControl();

        }

        private void BtnMunMyPlants_Click(object sender, RoutedEventArgs e)
        {
            ActiveItem.Content = new Views.MyPlantsControl();

        }

        private void BtnMyInfo_Click(object sender, RoutedEventArgs e)
        {
            ActiveItem.Content = new Views.MyInfoControl();

        }
    }
}