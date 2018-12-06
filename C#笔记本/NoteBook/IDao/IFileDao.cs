using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using domain;
namespace IDao
{
   public  interface IFileDao
    {
       Mynote openFile(string name);  //打开文件
       void saveFile(string content,string name);//保存文件
       void NewFile(string name, string content);//新建文件
       Boolean findfile(string name);//查询文件
       void delete(string name);//删除文件
    }
}
