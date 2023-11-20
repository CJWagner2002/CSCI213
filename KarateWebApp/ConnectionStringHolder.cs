using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KarateWebApp
{
    internal class ConnectionStringHolder
    {
        public static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Noah\\Desktop\\213-assignment-4\\KarateWebApp\\App_Data\\KarateSchool.mdf;Integrated Security=True;Connect Timeout=30";
        
        private ConnectionStringHolder()
        {
        }
    }
}