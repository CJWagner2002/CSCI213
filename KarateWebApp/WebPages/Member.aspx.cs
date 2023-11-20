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
    public partial class Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConnectionStringHolder.connectionString;

            /*
            string queryString = @"
              SELECT 
                 Section.SectionName, 
                 Instructor.InstructorFirstName, 
                 Instructor.InstructorLastName, 
                 Section.SectionStartDate, 
                 Section.SectionFee
              FROM 
                 Section
              INNER JOIN 
                 Instructor ON Section.Instructor_ID = Instructor.InstructorID;";

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
                if (Session["user_id"] != null && (int)Session["user_id"] > 0)
                {
                    // look for member
                    var user = (from member in dbcon.Members
                                where member.Member_UserID == Convert.ToInt32(Session["user_id"])
                                select member).FirstOrDefault();

                    // member found, show data
                    if (user != null)
                    {
                        memberNameLabel.Text = "Hello, " + user.MemberFirstName + " " + user.MemberLastName;

                        var mySections = (from sections in dbcon.Sections
                                          where sections.Member_ID == Convert.ToInt32(Session["user_id"])
                                          select sections);

                        memberSectionGridView.DataSource = mySections;
                        memberSectionGridView.DataBind();

                        decimal total = 0;
                        foreach (var section in mySections)
                        {
                            total += section.SectionFee;
                        }
                        totalPaidLabel.Text = total.ToString("c");
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