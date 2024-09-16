using System.Data;
using System.Data.SQLite;
using System.Timers;


namespace restraunt
{
    public partial class Form3 : Form
    {
        private readonly SQLiteConnection connectionString = new SQLiteConnection("Data Source=C:\\Users\\Lenovo\\Desktop\\SurGU\\3 курс\\БД курсовая\\restraunt\\db.db");

        private System.Timers.Timer timer;

        public Form3()
        {
            InitializeComponent();
            connectionString.Open();
            ComboBoxRandom();
            FillComboBoxWithDates();
            FillComboBoxWithTime();
            FillComboCheckBoxWithData();
            LoadDataIntoListBox();

            timer = new System.Timers.Timer();
            timer.Elapsed += TimerElapsed;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (checkedListBox1.CheckedItems.Count > 0)
            {
                button1.Text = "Ожидайте подтверждения заказа.";
                button1.Enabled = false;
                // Задайте ваш диапазон времени (в миллисекундах).
                int minDelayMilliseconds = 5000; // 5 секунд
                int maxDelayMilliseconds = 15000; // 15 секунд

                // Создайте объект Random.
                Random random = new Random();

                // Генерируйте случайное время задержки в заданном диапазоне.
                int delayMilliseconds = random.Next(minDelayMilliseconds, maxDelayMilliseconds + 1);

                // Установите интервал таймера равным случайному времени задержки.
                timer.Interval = delayMilliseconds;

                // Запустите таймер.
                timer.Start();
            }
            else
            {
                MessageBox.Show("Выберите хотя бы одно блюдо.", "Ошибка");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedItem != null && comboBox2.SelectedItem != null && comboBox3.SelectedItem != null)
            {
                // Извлекаем выбранное значение
                int selectedValue = (int)comboBox1.SelectedItem;
                DateTime selectedDate = (DateTime)comboBox2.SelectedItem;
                TimeSpan selectedTime = (TimeSpan)comboBox3.SelectedItem;

                // Выводим значение в MessageBox
                MessageBox.Show($"Выбранный столик: {selectedValue}\nВыбранная дата: {selectedDate.ToShortDateString()}\nВыбранное время: {selectedTime}", "Бронь");
                connectionString.Close();
                Application.Exit();
            }
            else
            {
                MessageBox.Show("Заполните данные.", "Ошибка");
            }
        }
        private void FillComboCheckBoxWithData()
        {
            try
            {
                using (SQLiteConnection connection = new SQLiteConnection(connectionString))
                {
                    string query = "SELECT name FROM onlineOrder";

                    using (SQLiteCommand command = new SQLiteCommand(query, connection))
                    {
                        using (SQLiteDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Добавляем каждый элемент в CheckedListBox
                                checkedListBox1.Items.Add(reader["name"]);

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке данных из базы данных: {ex.Message}", "Ошибка");
            }
        }

        private void TimerElapsed(object? sender, ElapsedEventArgs e)
        {
            timer.Stop();

            string selectedItems = string.Join(", ", checkedListBox1.CheckedItems.Cast<object>());

            int min = 20;
            int max = 50;
            Random random = new Random();
            int time = random.Next(min, max + 1);

            MessageBox.Show($"Заказ принят. Курьер прибудет через {time} минут.\nВыбранные пункты в заказе:\n{selectedItems}.", "Статус заказа");

            connectionString.Close();
            Application.Exit();
        }

        private void ComboBoxRandom()
        {
            comboBox1.Items.Clear();

            // Задайте количество значений, которые вы хотите добавить
            int numberOfValues = 7;

            int minValue = 1;
            int maxValue = 60;

            Random random = new Random();

            for (int i = 0; i < numberOfValues; i++)
            {
                int randomValue = random.Next(minValue, maxValue + 1);
                comboBox1.Items.Add(randomValue);
            }
        }

        private void FillComboBoxWithDates()
        {
            // Очищаем ComboBox перед добавлением новых значений
            comboBox2.Items.Clear();

            // Задаем диапазон дат
            DateTime startDate = DateTime.Today;
            DateTime endDate = DateTime.Today.AddDays(15); // Например, добавим 3 месяца к текущей дате

            // Добавляем даты в ComboBox
            for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
            {
                comboBox2.Items.Add(date);
            }
        }
        private void FillComboBoxWithTime()
        {
            // Очищаем ComboBox перед добавлением новых значений
            comboBox3.Items.Clear();

            // Задаем интервал времени (15 минут)
            TimeSpan timeInterval = TimeSpan.FromMinutes(15);

            // Добавляем время в ComboBox
            DateTime startTime = DateTime.Today;

            while (startTime.Date == DateTime.Today)
            {
                comboBox3.Items.Add(startTime.TimeOfDay);
                startTime = startTime.Add(timeInterval);
            }
        }

        private void LoadDataIntoListBox()
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = "SELECT cost FROM onlineOrder";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    using (SQLiteDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string? value = reader["cost"].ToString();
                            listBox1.Items.Add(value + " рублей");
                        }
                    }
                }
            }
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
