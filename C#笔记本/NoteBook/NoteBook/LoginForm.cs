using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using domain;
using Service;
namespace NoteBook
{
    public partial class LoginForm : Form
    {
        public static string uname;
        public LoginForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            UserService myuserservice = new UserService();
            uname = txtname.Text;
            string password = myuserservice.Catch(uname).Userpwd.ToString();
            if (password == txtpwd.Text)
            {
                 MainForm Form = new MainForm();
                Form.Show();
                this.Hide();
            }
         
            else
                MessageBox.Show("登录失败！");     
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            RegisterForm form = new RegisterForm();
            form.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        

      
    

       
    }
}
