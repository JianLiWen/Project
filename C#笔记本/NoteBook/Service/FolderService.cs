using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dao;
using IDao;
using domain;
namespace Service
{
    public class FolderService
    {
        FolderDao dao = new FolderDao();
        public void add(string na)
        {
            dao.AddFoloder(na);
        }

        public List<Mynote> Open(string name)
        {
            List<Mynote> list = new List<Mynote>();
            list=dao.OpenFolder(name);
            return list;
        }
        public List<MyFolder> find()
        {
            List<MyFolder> list = new List<MyFolder>();
            list = dao.findFolder();
            return list;
        }
        public void update(string newname,string name)
        {
            dao.updatename(newname,name);
        }
        public bool findfolder(string name)
        {
          return  dao.findfolder(name);
        }
        public void delete(string name)
        {
            dao.delete(name);
        }
    }
}
