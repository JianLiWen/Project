using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using Service;
using domain;
namespace NoteBook
{
    public partial class MainForm : Form
    {
        public static string fname;
        public static string cname;
        public MainForm()
        {
            InitializeComponent();
           
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            // TODO: 这行代码将数据加载到表“noteBook1DataSet1.db_Note”中。您可以根据需要移动或删除它。
         
            // TODO: 这行代码将数据加载到表“noteBook1DataSet.db_Folder”中。您可以根据需要移动或删除它。
       
            // TODO: 这行代码将数据加载到表“noteBookDataSet2.db_Note”中。您可以根据需要移动或删除它。          
            search.Hide();
            lblfile.Hide();
            newname.Hide();
            lblrename.Hide();
            txtrename.Hide();
            lblconfirm.Hide();
            FolderService myFolderservice = new FolderService();
            for (int i = 0; i < myFolderservice.find().Count; i++)
            {
                folderdisplay.Items.Add(myFolderservice.find()[i].Foldername,1);
            }
        }

      

        private void 新建ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AddFolderForm form = new AddFolderForm();
            form.Show();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
                  this.Dispose();
        }

        private void 复制CToolStripButton1_Click(object sender, EventArgs e)
        {
            TextContent.Copy();
        }

        private void 粘贴PToolStripButton1_Click(object sender, EventArgs e)
        {
            TextContent.Paste();
        }

        private void 剪切UToolStripButton_Click(object sender, EventArgs e)
        {
            TextContent.Cut();
        }

        private void toolStripButton2_Click_1(object sender, EventArgs e)
        {
            String fontName;
            float fontSize;
            FontStyle myfontstyle;
            DialogResult fontdialogresult;
            fontdialogresult = fontDialog1.ShowDialog();
            if (fontdialogresult == DialogResult.OK)
            {
                fontName = fontDialog1.Font.Name;
                fontSize = fontDialog1.Font.Size;
                myfontstyle = fontDialog1.Font.Style;
                TextContent.SelectionFont = new Font(fontName, fontSize, myfontstyle);
            }
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            colorDialog1.ShowDialog();
            TextContent.SelectionColor = colorDialog1.Color;    
            
        }

        private void 打印PToolStripButton1_Click(object sender, EventArgs e)
        {
            printDialog1.ShowDialog();
        }

     
        private void pictureBox2_Click_2(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void 存储为ToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            saveFileDialog1.Filter = ("文本文件(*.txt)|*.txt|所有文件(*.*)|*.*");
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string myfilename = saveFileDialog1.FileName;
                try
                {
                    File.WriteAllText(myfilename, TextContent.Text, Encoding.Unicode);
                }
                catch
                {
                    MessageBox.Show("文件保存失败！", "提示", MessageBoxButtons.OK);
                }
            }
           
        }

        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            folderdisplay.Items.Clear();
            FolderService myFolderservice = new FolderService();
            for (int i = 0; i < myFolderservice.find().Count; i++)
            {
                folderdisplay.Items.Add(myFolderservice.find()[i].Foldername,1);
            }
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            AddFolderForm form = new AddFolderForm();
            form.Show();
        }

        private void toolStripLabel2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void toolStripMenuItem4_Click(object sender, EventArgs e)
        {
            openFileDialog1.FileName = "";
            openFileDialog1.Filter = ("文本文件(*.txt)|*.txt|*.cs|*.cs");
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    string myfilestream = File.ReadAllText(openFileDialog1.FileName, Encoding.Default);
                    TextContent.Text = myfilestream;
                }
                catch
                {

                    MessageBox.Show("文件打开失败！");
                }
            }
        }

     

        private void folderdisplay_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int index = 0;
            folderdisplay.Hide();
            filedisplay.Items.Clear();
            FolderService myFolderservice = new FolderService();
            if (this.folderdisplay.SelectedItems.Count > 0)//判断listview有被选中项
            {
                index = this.folderdisplay.SelectedItems[0].Index;//取当前选中项的index,SelectedItems[0]这必须为0
                String na = folderdisplay.Items[index].SubItems[0].Text;//用我们刚取到的index取被选中的某一列的值从0开始
                cname = na;
                for (int i = 0; i < myFolderservice.Open(na).Count; i++)
                {
                    filedisplay.Items.Add(myFolderservice.Open(na)[i].Filename, 0);
                }

            }
            
           

        }

        private void filedisplay_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            int index = 0;
            FileService myfilerservice = new FileService();
            if (this.filedisplay.SelectedItems.Count > 0)//判断listview有被选中项
            {
                index = this.filedisplay.SelectedItems[0].Index;//取当前选中项的index,SelectedItems[0]这必须为0
                String na = filedisplay.Items[index].SubItems[0].Text;//用我们刚取到的index取被选中的某一列的值从0开始
                TextContent.Text = myfilerservice.Open(na).Filecontent;
                fname = na;
            }

            
        }

        private void before_Click(object sender, EventArgs e)
        {
            search.Hide();
            folderdisplay.Show();
        }

        private void pictureBox2_Click_1(object sender, EventArgs e)
        {
            search.Show();
            FileService myfileservice = new FileService();
            FolderService myFolderservice = new FolderService();
            string name=searchnote.Text;
            if (myfileservice.find(name))
            {   
              search.Items.Add(name, 0);
              MessageBox.Show("查找成功！");
            }
            else
                MessageBox.Show("没查到该文件！");
        }

        private void SaveSToolStripButton1_Click(object sender, EventArgs e)
        {
            if (newname.Text=="")
            {
                FileService myfileservice = new FileService();
                string name = fname;
                string content = TextContent.Text;
                myfileservice.Save(content, name);
                MessageBox.Show("保存成功！");
            }
            else
            {
                FileService myfileservice = new FileService();
                string content = TextContent.Text;
                string na = newname.Text;
                myfileservice.New(cname, na, content);
                MessageBox.Show("保存成功！");
            }
           
            
        }

        private void search_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = 0;
            FileService myfilerservice = new FileService();
            if (this.search.SelectedItems.Count > 0)//判断listview有被选中项
            {
                index = this.search.SelectedItems[0].Index;//取当前选中项的index,SelectedItems[0]这必须为0
                String na = search.Items[index].SubItems[0].Text;//用我们刚取到的index取被选中的某一列的值从0开始
                TextContent.Text = myfilerservice.Open(na).Filecontent;
                fname = na;
            }
        }

        private void newnoteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            lblfile.Show();
            newname.Show();
            folderdisplay.Show();
            TextContent.Clear();
           
        }

        private void deletefile_Click(object sender, EventArgs e)
        {
            FileService myfileservice = new FileService();
            myfileservice.Delete(fname);
            MessageBox.Show("删除成功！");
        }

        private void renameToolStripMenuItem_Click(object sender, EventArgs e)
        {
            lblconfirm.Show();
            lblrename.Show();
            txtrename.Show();           
          
        }
        private void lblconfirm_Click(object sender, EventArgs e)
        {
            FolderService myfolderservice = new FolderService();
            string nname = txtrename.Text;
            if (nname == "")
                MessageBox.Show("输入文件夹名为空！");
            else if (myfolderservice.findfolder(nname))
            {
                MessageBox.Show("文件夹已存在");
                txtrename.Clear();
            }
            else
            {
      
                myfolderservice.update(nname, cname);
            }
        }

        private void deletefolder_Click(object sender, EventArgs e)
        {
            FolderService myfolderservice = new FolderService();
            myfolderservice.delete(cname);
            MessageBox.Show("删除文件夹成功！");
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            TextContent.Undo();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void toolStripMenuItem5_Click(object sender, EventArgs e)
        {
            updatepawd form = new updatepawd();
            form.Show();
        }
       

        
       
       
       
     

    
      

      
       
       

       
        }
              
}
