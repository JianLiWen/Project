using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dao;
using domain;
namespace Service
{
  public  class UserService
    {
        UserDao dao = new UserDao();
        public void add(string name,string pawd)
        {
            dao.AddUser(name,pawd);
        }
        public bool  find(string name)
        {
           return dao.finduser(name);
        }
        public void update(string pawd,string name)
        {
            dao.updatepawd(pawd,name);
            
        }
        public User Catch(string name)
        {
           return dao.Catch(name);
        }
    }
}
