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
    public partial class updatepawd : Form
    {

        public updatepawd()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            UserService myuserservice = new UserService();
            string name = txtname.Text;
            string password = txtward.Text;
            if (name == "" || password == "")
                MessageBox.Show("输入为空！");
            else
            {
                myuserservice.update(password, name);
                MessageBox.Show("修改成功！");
            }
        }

    
    }
}
