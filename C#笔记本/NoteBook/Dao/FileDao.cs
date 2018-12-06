using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using domain;
using IDao;
namespace Dao
{
    public class FileDao:IFileDao
    {
           Mynote note = new Mynote();
           //打开文件
           public Mynote openFile(string name)
            {
                string sql = "select * from db_Note,db_Folder where FileName=@name and db_Folder.id=db_Note.Folderid";
                SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name },
                
            };
                SqlDataReader reader = Util.ExecuteReader(sql, pms);
                while (reader.Read())
                {
                    note.Filecontent = reader["FileContent"].ToString();

                }
                return note;
            }

           //保存文件
           public void saveFile(string content, string name)
           {
               string sql = "update db_Note set FileContent=@Content  where FileName=@na";
               SqlParameter[] pms = new SqlParameter[]
            {
                 new SqlParameter("@Content",System.Data.SqlDbType.VarChar,50){Value=content},
                  new SqlParameter("@na",System.Data.SqlDbType.VarChar,50){Value=name},
            };
               Util.ExecuteNonQuery(sql, pms);
           }
           //新建文件
          public  string fid;
          //将文件名转换为文件ID 
           public void convert(string name)
           {
               string sql = "select id from db_Folder where FolderName='" + name + "'";
               SqlDataReader reader = Util.ExecuteReader(sql);
               while (reader.Read())
                   fid = reader["id"].ToString();

           }
           public void NewFile(string name,string content)
           {
            
               string sql = "insert into db_Note values(@name,@content,@id)";
               SqlParameter[] pms = new SqlParameter[]
            {
     
                 new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name}, 
                 new SqlParameter("@content",System.Data.SqlDbType.VarChar,50){Value=content},
                 new SqlParameter("@id",System.Data.SqlDbType.VarChar,50){Value=fid},
            };
               Util.ExecuteNonQuery(sql, pms);
           }
          //查询文件
           public Boolean findfile(string name)
           {
               Boolean flag = false;
               string sql = "select * from db_Note where FileName=@name";
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

          //删除文件
           public void delete(string name)
           {
               string sql = "delete from db_Note where FileName=@name";
               SqlParameter[] pms = new SqlParameter[]
            {
                
                  new SqlParameter("@name",System.Data.SqlDbType.VarChar,50){Value=name},
            };
               Util.ExecuteNonQuery(sql, pms);
           }
    }
}
