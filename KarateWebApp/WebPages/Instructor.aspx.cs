using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateWebApp.WebPages
{
    public partial class Instructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConnectionStringHolder.connectionString;

            /*
            string queryString = @"
             SELECT 
                Section.SectionName, 
                Member.MemberFirstName, 
                Member.MemberLastName
             FROM 
                Section
             INNER JOIN 
                Member ON Section.Member_ID = Member.Member_UserID;";

            using (SqlConnection connection = new SqlConnection(conn))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
            */

            using (var dbcon = new KarateDBDataContext(conn))
            {
                if (Session["user_id"] != null && (int) Session["user_id"] > 0)
                {
                    // look for instructor
                    var user = (from instructors in dbcon.Instructors
                                where instructors.InstructorID == Convert.ToInt32(Session["user_id"])
                                select instructors).FirstOrDefault();

                    // instructor found; show data
                    if (user != null)
                    {
                        instructorNameLabel.Text = "Hello, " + user.InstructorFirstName + " " + user.InstructorLastName;

                        var mySections = (from sections in dbcon.Sections
                                          where sections.Instructor_ID == Convert.ToInt32(Session["user_id"])
                                          select sections);

                        instructorSectionsGridView.DataSource = mySections;
                        instructorSectionsGridView.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}