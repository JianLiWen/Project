using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace domain
{
   public class User
    {
       public static string userid;
       public static  string username;

        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public static string userpwd;

        public string Userpwd
        {
            get { return userpwd; }
            set { userpwd = value; }
        }
    }
}
