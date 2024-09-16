using System.Data.SQLite;

namespace restraunt
{
    public partial class Form2 : Form
    {
        private readonly SQLiteConnection connectionString = new SQLiteConnection("Data Source=C:\\Users\\Lenovo\\Desktop\\SurGU\\3 курс\\БД курсовая\\restraunt\\db.db");

        Form1 f1 = new Form1();

        public Form2()
        {
            InitializeComponent();
            textBox5.MaxLength = 11;
            textBox5.KeyPress += textBox5_KeyPress;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string firstName = textBox1.Text;
            string lastName = textBox2.Text;
            string middleName = textBox3.Text;
            string address = textBox4.Text;
            string phoneNumber = textBox5.Text;

            if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName) && !string.IsNullOrEmpty(address) && !string.IsNullOrEmpty(phoneNumber))
            {
                if (phoneNumber.Length == 11)
                    try
                    {
                        using (SQLiteConnection connection = new SQLiteConnection(connectionString))
                        {
                            connection.Open();

                            string query = $"INSERT INTO client (name, surname, middleName, address, phone) VALUES ('{firstName}', '{lastName}', '{middleName}', '{address}', '{phoneNumber}')";

                            using (SQLiteCommand command = new SQLiteCommand(query, connection))
                            {
                                command.ExecuteNonQuery();
                                MessageBox.Show("Вы зарегистрировались.", "Регистрация");
                                connection.Close();
                                this.Hide();
                                f1.Show();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Ошибка при регистрации: {ex.Message}", "Ошибка");
                    }
                else
                {
                    MessageBox.Show("Убедитесь в правильности введенных данных.", "Ошибка");
                }
            }
            else
            {
                MessageBox.Show("Заполните все поля.", "Ошибка");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            f1.Show();
        }

        private void textBox5_KeyPress(object? sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
