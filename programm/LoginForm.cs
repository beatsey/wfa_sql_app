using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace programm
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();

            textBoxLogin.KeyPress += (object sender, KeyPressEventArgs e) => {
                if (e.KeyChar == (char) Keys.Enter) textBoxPassword.Focus();
            };
            textBoxPassword.KeyPress += (object sender, KeyPressEventArgs e) => {
                if (e.KeyChar == (char)Keys.Enter) {
                    buttAUTH.Focus();
                    authenticate_user();
                }
            };
        }

        private void authenticate_user()
        {
            string login = textBoxLogin.Text;
            string password = textBoxPassword.Text;

            var user = dbconnect.getUserByLoginPassword(login, password);
            if (user == null)
            {
                MessageBox.Show(this, "Пользователь с введённой парой логин/пароль не найден!", "Ошибка авторизации", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                // Успешно удалось найти нужного пользователя
                string usergroupname = (string)user["usergroupname"];

                // Запускаем окно с нужным типом пользователя или выводим ошибку
                Form form = null;
                if (usergroupname == "Администратор") form = new AdminForm(user);
                else if (usergroupname == "Учитель") form = new TeacherForm(user);
                else if (usergroupname == "Ученик") form = new StudentForm(user);
                else if (usergroupname == "Пользователь") form = new UserForm(user);
                else
                {
                    MessageBox.Show(this, $"Группа пользователя {user["usergroupname"]} не поддерживается!", "Ошибка авторизации", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                if (form != null)
                {
                    Hide(); // Скрываем форму авторизации
                    form.ShowDialog(this);
                    Close(); // Закрываем форму авторизации
                }

            }
        }

        private void buttAUTH_Click(object sender, EventArgs e)
        {
            authenticate_user();
        }
    }
}
