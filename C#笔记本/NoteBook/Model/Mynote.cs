using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace domain
{
    public class Mynote
    {   
        string filename;

        public string Filename
        {
            get { return filename; }
            set { filename = value; }
        }
        string filecontent;

        public string Filecontent
        {
            get { return filecontent; }
            set { filecontent = value; }
        }

        private string folderid;

        public string Folderid
        {
            get { return folderid; }
            set { folderid = value; }
        }

    }
}
