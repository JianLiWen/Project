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
    public partial class AddFolderForm : Form
    {
        public AddFolderForm()
        {
            InitializeComponent();
        }

        private void AddFolderForm_Load(object sender, EventArgs e)
        {
            // TODO: 这行代码将数据加载到表“noteBook1DataSet3.db_Folder”中。您可以根据需要移动或删除它。
         
            // TODO: 这行代码将数据加载到表“noteBook1DataSet2.db_Note”中。您可以根据需要移动或删除它。
          
            
          
             
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

       

        private void label2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void label3_Click(object sender, EventArgs e)
        {
            FolderService myfolderservice = new FolderService();
            string na = textBox1.Text;
            if (na == null)
                MessageBox.Show("文件名为空");
            else if (myfolderservice.findfolder(na))
            {
                MessageBox.Show("文件夹已存在");
                textBox1.Clear();
            }
            else
            {
                myfolderservice.add(na);
                MessageBox.Show("新建文件夹成功！");
                this.Dispose();
            }
        }
    }
}
