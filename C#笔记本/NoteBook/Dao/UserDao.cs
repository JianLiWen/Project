using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDao;
using domain;
using System.Data.SqlClient;
namespace Dao
{
   public  class UserDao:IUserDao
    {
       
        public void AddUser(string name, string pawd)
        {
            string sql = "insert into db_User(UserName,UserPassword) values(@name,@pawd)";
            SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name},
                  new SqlParameter("@pawd",System.Data.SqlDbType.VarChar,50){Value=pawd},
            };
             Util.ExecuteNonQuery(sql, pms);
        }
        public Boolean finduser(string name)
        {
            Boolean flag=false;
            string sql = "select * from db_User where UserName=@name";
            SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name },
                
            };
            SqlDataReader reader = Util.ExecuteReader(sql, pms);
            while (reader.Read())
            {
                flag = true;
            }
            return flag;
        }
       
       //修改密码
        public void updatepawd(string pawd, string name)
        {
            string sql = "update db_User set UserPassword=@password  where UserName=@name";
            SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@password",System.Data.SqlDbType.VarChar,50){Value=pawd}, 
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name}, 
            };
            Util.ExecuteNonQuery(sql, pms);
        }
        User user = new User();
        public User Catch(string name)
        {
            string sql = "select * from db_User where UserName=@name";
            SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name },
                
            };
            SqlDataReader reader = Util.ExecuteReader(sql, pms);
            while (reader.Read())
            {
                user.Username= reader["UserName"].ToString();
                user.Userpwd = reader["UserPassword"].ToString();
            }
            return user;
        }

    }
}
