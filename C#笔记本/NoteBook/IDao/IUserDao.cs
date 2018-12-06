using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using domain;
namespace IDao
{
    public interface IUserDao
    {
       void AddUser(string name,string pawd);//添加用户
        Boolean finduser(string name);//查找用户
        void updatepawd(string pawd,string name);//更新密码
        User Catch(string name);//匹配密码
    }
}
