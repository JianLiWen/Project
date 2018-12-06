using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
namespace Dao
{
    public class Util
    {
        public static void ExecuteNonQuery(string sql, params SqlParameter[] parameters)
        {
            String connStr = ConfigurationManager.ConnectionStrings["NoteBook.Properties.Settings.ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            foreach (SqlParameter parameter in parameters)
            {
                cmd.Parameters.Add(parameter);
            }
            cmd.ExecuteNonQuery();
        }

        public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] parameters)
        {
            String connStr = ConfigurationManager.ConnectionStrings["NoteBook.Properties.Settings.ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = sql;
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                return cmd.ExecuteReader();
            }
            catch (Exception)
            {
                conn.Close();
                throw;
            }
        }
    }
}
