using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDao;
using System.Data.SqlClient;
using domain;

namespace Dao
{
   public  class FolderDao:IFolderDao
    {
       Mynote note;
       MyFolder folder;
       //新建文件夹
        public void AddFoloder(string name)
        {
            string sql = "Insert into db_Folder(FolderName) values(@name)";
            SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name},
            };
             Util.ExecuteNonQuery(sql, pms);
        }
       //打开文件夹
        public  List<Mynote> OpenFolder(string name)
        {
            string sql = "select * from db_Note,db_Folder where FolderName=@name and db_Note.Folderid=db_Folder.id";
            SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name },
                
            };
            List<Mynote>  list=new List<Mynote>();
            SqlDataReader reader = Util.ExecuteReader(sql, pms);
            while (reader.Read())
            {
                note = new Mynote();
                note.Filename= reader["FileName"].ToString();
                list.Add(note);
            }
            return list;
        }
       //查询文件夹
        public List<MyFolder> findFolder()
        {
            string sql = "select distinct FolderName from db_Folder ";
            List<MyFolder> list = new List<MyFolder>();
            SqlDataReader reader = Util.ExecuteReader(sql);
            while (reader.Read())
            {
               folder = new MyFolder();
               folder.Foldername = reader["FolderName"].ToString();
               list.Add(folder);
            }
             return list;
        }
       //重命名文件夹
        public void updatename(string newname, string name)
        {
            string sql = "update db_Folder set FolderName=@na  where FolderName=@name";
            SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@na",System.Data.SqlDbType.VarChar,50){Value=newname}, 
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name}, 
            };
            Util.ExecuteNonQuery(sql, pms);
        }

       //查询文件夹
        public bool findfolder(string name)
        {
            Boolean flag = false;
            string sql = "select * from db_Folder where FolderName=@name";
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

        public void delete(string name)
        {
            string sql = "delete from db_Folder where FolderName=@name";
            SqlParameter[] pms = new SqlParameter[]
            {
                
                  new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name},
            };
            Util.ExecuteNonQuery(sql, pms);
        }
    }
    
}
