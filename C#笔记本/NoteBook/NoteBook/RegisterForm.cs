using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Service;
namespace NoteBook
{
    public partial class RegisterForm : Form
    {
        public RegisterForm()
        {
            InitializeComponent();
        }

        private void label5_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void label4_Click(object sender, EventArgs e)
        {
            UserService myuserservice = new UserService();
            string name = username.Text;
            string pawdd = pawd.Text;
            string confir = confirm.Text;
            if (name == ""|| pawdd==""||confir == "")
                MessageBox.Show("输入信息为空！");
            else if (myuserservice.find(name))
            {
                MessageBox.Show("用户名已存在！");

            }
            else if (pawd.Equals(pawdd))
                MessageBox.Show("输入密码不一致，请重新输入！");
            else
            {
                myuserservice.add(name, pawdd);
                MessageBox.Show("注册成功！");
            }
            this.Dispose();
        }
    }
}
