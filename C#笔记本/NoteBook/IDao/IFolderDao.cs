using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using domain;
namespace IDao
{
   public  interface IFolderDao
    {
       void AddFoloder(string name);//新建文件夹
       List<Mynote> OpenFolder(string name);//打开文件夹
       List<MyFolder> findFolder();//查询文件夹
       void updatename(string newname,string name);//文件夹重命名
       Boolean findfolder(string name);//根据文件夹名查询文件夹
       void delete(string name);//删除文件夹
    }
}
