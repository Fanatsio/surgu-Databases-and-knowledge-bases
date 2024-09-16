using System.Data.SQLite;

namespace restraunt
{
    public partial class Form1 : Form
    {
        private readonly SQLiteConnection connectionString = new SQLiteConnection("Data Source=C:\\Users\\Lenovo\\Desktop\\SurGU\\3 курс\\БД курсовая\\restraunt\\db.db");

        public Form1()
        {
            InitializeComponent();

        }
        private void Form1_Load(object sender, EventArgs e)
        {
            connectionString.Open();

            textBox1.MaxLength = 11;
            textBox1.KeyPress += textBox1_KeyPress;


            //SQLiteDataReader? dataReader;

            //SQLiteCommand command = connectionString.CreateCommand();
            //command.CommandText = "SELECT name FROM client";

            //dataReader = command.ExecuteReader();
            //while (dataReader.Read())
            //{
            //    comboBox1.Items.Add(dataReader.GetString(0));
            //}
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string phoneNumber = textBox1.Text;

            if (!string.IsNullOrEmpty(phoneNumber) || textBox1.TextLength < 10)
            {
                try
                {
                    using (SQLiteConnection connection = new SQLiteConnection(connectionString))
                    {
                        string query = $"SELECT * FROM client WHERE phone = '{phoneNumber}'";

                        using (SQLiteCommand command = new SQLiteCommand(query, connection))
                        {
                            using (SQLiteDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    this.Invoke((MethodInvoker)delegate
                                    {
                                        string? firstName = reader["name"].ToString();
                                        MessageBox.Show($"Здравствуйте, {firstName}!", "Приветствие");
                                        connection.Close();
                                        Form3 f3 = new Form3();
                                        this.Hide();
                                        f3.ShowDialog();
                                    });
                                }
                                else
                                {
                                    this.Invoke((MethodInvoker)delegate
                                    {
                                        MessageBox.Show("Номер телефона не найден. Пожалуйста, зарегистрируйтесь.", "Ошибка");
                                    });
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при поиске номера телефона: {ex.Message}", "Ошибка");
                }
            }
            else
            {
                MessageBox.Show("Введите номер телефона или убедитесь в правильности введенных данных.", "Ошибка");
            }
        }

        private void textBox1_KeyPress(object? sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //connectionString.Close();
            Form2 f2 = new Form2();
            this.Hide();
            f2.Show();
        }
    }
}
