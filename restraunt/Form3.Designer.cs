namespace restraunt
{
    partial class Form3
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            label1 = new Label();
            button1 = new Button();
            button2 = new Button();
            comboBox1 = new ComboBox();
            label2 = new Label();
            label3 = new Label();
            comboBox2 = new ComboBox();
            label4 = new Label();
            comboBox3 = new ComboBox();
            checkedListBox1 = new CheckedListBox();
            label5 = new Label();
            listBox1 = new ListBox();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 14F);
            label1.Location = new Point(326, 9);
            label1.Name = "label1";
            label1.Size = new Size(152, 25);
            label1.TabIndex = 0;
            label1.Text = "Что пожелаете?";
            // 
            // button1
            // 
            button1.Location = new Point(12, 350);
            button1.Name = "button1";
            button1.Size = new Size(171, 61);
            button1.TabIndex = 1;
            button1.Text = "Сделать онлайн-заказ";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // button2
            // 
            button2.Location = new Point(617, 350);
            button2.Name = "button2";
            button2.Size = new Size(171, 66);
            button2.TabIndex = 2;
            button2.Text = "Забронировать столик";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // comboBox1
            // 
            comboBox1.FormattingEnabled = true;
            comboBox1.Location = new Point(611, 35);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(161, 23);
            comboBox1.TabIndex = 3;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(611, 17);
            label2.Name = "label2";
            label2.Size = new Size(170, 15);
            label2.TabIndex = 4;
            label2.Text = "Выберите свободный столик:";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(611, 120);
            label3.Name = "label3";
            label3.Size = new Size(90, 15);
            label3.TabIndex = 5;
            label3.Text = "Выберите дату:";
            // 
            // comboBox2
            // 
            comboBox2.FormattingEnabled = true;
            comboBox2.Location = new Point(611, 138);
            comboBox2.Name = "comboBox2";
            comboBox2.Size = new Size(161, 23);
            comboBox2.TabIndex = 6;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(611, 224);
            label4.Name = "label4";
            label4.Size = new Size(101, 15);
            label4.TabIndex = 7;
            label4.Text = "Выберите время:";
            // 
            // comboBox3
            // 
            comboBox3.FormattingEnabled = true;
            comboBox3.Location = new Point(611, 242);
            comboBox3.Name = "comboBox3";
            comboBox3.Size = new Size(161, 23);
            comboBox3.TabIndex = 8;
            // 
            // checkedListBox1
            // 
            checkedListBox1.FormattingEnabled = true;
            checkedListBox1.Location = new Point(12, 51);
            checkedListBox1.Name = "checkedListBox1";
            checkedListBox1.Size = new Size(199, 274);
            checkedListBox1.TabIndex = 9;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(13, 23);
            label5.Name = "label5";
            label5.Size = new Size(252, 15);
            label5.TabIndex = 10;
            label5.Text = "Выберите блюда, которые желаете заказать:";
            // 
            // listBox1
            // 
            listBox1.Enabled = false;
            listBox1.Font = new Font("Segoe UI", 10F);
            listBox1.FormattingEnabled = true;
            listBox1.ItemHeight = 17;
            listBox1.Location = new Point(217, 51);
            listBox1.Name = "listBox1";
            listBox1.Size = new Size(120, 276);
            listBox1.TabIndex = 11;
            // 
            // Form3
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(listBox1);
            Controls.Add(label5);
            Controls.Add(checkedListBox1);
            Controls.Add(comboBox3);
            Controls.Add(label4);
            Controls.Add(comboBox2);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(comboBox1);
            Controls.Add(button2);
            Controls.Add(button1);
            Controls.Add(label1);
            Name = "Form3";
            Text = "Ресторан";
            FormClosing += MainForm_FormClosing;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Button button1;
        private Button button2;
        private ComboBox comboBox1;
        private Label label2;
        private Label label3;
        private ComboBox comboBox2;
        private Label label4;
        private ComboBox comboBox3;
        private CheckedListBox checkedListBox1;
        private Label label5;
        private ListBox listBox1;
    }
}