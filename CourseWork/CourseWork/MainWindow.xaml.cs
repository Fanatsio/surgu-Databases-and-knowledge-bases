// Views/MainWindow.xaml.cs
using System.Windows;

namespace CourseWork.Views
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            // DataContext уже установлен в XAML через <vm:MainViewModel/>
            // Поэтому здесь дополнительная инициализация не требуется
        }
    }
}