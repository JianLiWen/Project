using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dao;
using domain;

namespace Service
{
  public class FileService
    {
       FileDao dao = new FileDao();
       public Mynote Open(string name)
        {
            Mynote note = new Mynote();          
            note = dao.openFile(name);
            return note;
        }
       public void  Save(string content,string name)
       {
           
            dao.saveFile(content,name);
       }
       public bool find(string name)
       {
           return dao.findfile(name);
       }
       public void New(string cname,string name,string content)
       {
           dao.convert(cname);
           dao.NewFile(name,content);
       }
       public void Delete(string name)
       {
           dao.delete(name);
       }
      
      }
}
