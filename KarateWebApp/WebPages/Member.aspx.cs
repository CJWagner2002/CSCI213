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
        }
    }
}