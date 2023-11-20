using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateWebApp.WebPages
{
    public partial class Login : System.Web.UI.Page
    {
        private string connectionString = ConnectionStringHolder.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = userameTextBox.Text.Trim();
            string password = passwordTextBox.Text.Trim();

            using (var dbcon = new KarateDBDataContext(connectionString))
            {
                var user = from netUser in dbcon.NetUsers
                           where netUser.UserName == username && netUser.UserPassword == password
                           select netUser.UserType;

                if (user.Count() < 1)
                {
                    return;
                }

                foreach (var netUser in user)
                {
                    Response.Redirect($"{netUser}.aspx");
                }
            };
        }
    }
}