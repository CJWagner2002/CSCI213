using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateWebApp.WebPages
{
    public partial class Administrator : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["KarateSchoolConnectionString"].ConnectionString;

        private void RefreshRecords()
        {
            using (var dbcon = new KarateDBDataContext(connectionString))
            {
                var memberRecords =
                    from member in dbcon.Members
                    select new
                    {
                        FirstName = member.MemberFirstName,
                        LastName = member.MemberLastName,
                        PhoneNumber = member.MemberPhoneNumber,
                        DateJoined = member.MemberDateJoined
                    };

                memberGridView.DataSource = memberRecords;
                memberGridView.DataBind();

                memberDDL.DataSource =
                    from members in dbcon.Members
                    select new
                    {
                        members.Member_UserID,
                        MemberFullName = members.MemberFirstName+" "+members.MemberLastName,
                    };
                memberDDL.DataTextField = "MemberFullName";
                memberDDL.DataValueField = "Member_UserID";
                memberDDL.DataBind();

                var instructorRecords =
                    from instructor in dbcon.Instructors
                    select new
                    {
                        FirstName = instructor.InstructorFirstName,
                        LastName = instructor.InstructorLastName,
                    };

                instructorGridView.DataSource = instructorRecords;
                instructorGridView.DataBind();

                instructorDDL.DataSource =
                    from instructors in dbcon.Instructors
                    select new
                    {
                        instructors.InstructorID,
                        InstructorFullName = instructors.InstructorFirstName+" "+instructors.InstructorLastName,
                    };
                instructorDDL.DataTextField = "InstructorFullName";
                instructorDDL.DataValueField = "InstructorID";
                instructorDDL.DataBind();
            };
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                using (var dbcon = new KarateDBDataContext(connectionString))
                {
                    var user = (from netUser in dbcon.NetUsers
                                where netUser.UserID == (int) Session["user_id"]
                                select netUser).FirstOrDefault();

                    if (user.UserType != "Administrator")
                    {
                        Response.Redirect("Login.aspx");
                    };
                };
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            RefreshRecords();
        }

        protected void instructorGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (var dbcon = new KarateDBDataContext(connectionString))
                {
                    // this is super bad but it works so uh
                    var toDelete = from instructors in dbcon.Instructors
                                   where instructors.InstructorFirstName == e.Values["FirstName"].ToString()
                                   && instructors.InstructorLastName == e.Values["LastName"].ToString()
                                   select instructors;

                    dbcon.Instructors.DeleteOnSubmit(toDelete.FirstOrDefault());
                    dbcon.SubmitChanges();

                    RefreshRecords();
                }
            }
            catch (Exception ex)
            {
                statusLabel.Text = ex.Message;
            }
        }

        protected void memberGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (var dbcon = new KarateDBDataContext(connectionString))
                {
                    // this is also very bad but you know
                    var toDelete = from members in dbcon.Members
                                   where members.MemberFirstName == e.Values["FirstName"].ToString()
                                   && members.MemberLastName == e.Values["LastName"].ToString()
                                   && members.MemberPhoneNumber == e.Values["PhoneNumber"].ToString()
                                   select members;

                    dbcon.Members.DeleteOnSubmit(toDelete.FirstOrDefault());
                    dbcon.SubmitChanges();

                    RefreshRecords();
                }
            }
            catch (Exception ex)
            {
                statusLabel.Text = ex.Message;
            }
        }

        protected void insertButton_Click(object sender, EventArgs e)
        {
            try
            {
                using (var dbcon = new KarateDBDataContext(connectionString))
                {
                    KarateWebApp.NetUser newUser = new KarateWebApp.NetUser
                    {
                        UserName = usernameTextBox.Text,
                        UserPassword = passwordTextBox.Text,
                        UserType = userTypeDDL.SelectedValue
                    };

                    dbcon.NetUsers.InsertOnSubmit(newUser);
                    dbcon.SubmitChanges(); // need to submit early so that newUser is assigned a user id

                    switch (userTypeDDL.SelectedValue)
                    {
                        case "Member":
                            KarateWebApp.Member newMember = new KarateWebApp.Member
                            {
                                Member_UserID = newUser.UserID,
                                MemberFirstName = firstNameTextBox.Text,
                                MemberLastName = lastNameTextBox.Text,
                                MemberDateJoined = dateJoinedCalendar.SelectedDate,
                                MemberPhoneNumber = phoneNumberTextBox.Text,
                                MemberEmail = emailTextBox.Text,
                            };

                            dbcon.Members.InsertOnSubmit(newMember);

                            break;
                        case "Instructor":
                            KarateWebApp.Instructor newInstructor = new KarateWebApp.Instructor
                            {
                                InstructorID = newUser.UserID,
                                InstructorFirstName = firstNameTextBox.Text,
                                InstructorLastName = lastNameTextBox.Text,
                                InstructorPhoneNumber = phoneNumberTextBox.Text,
                            };

                            dbcon.Instructors.InsertOnSubmit(newInstructor);

                            break;
                        case "default":
                            break;
                    }

                    dbcon.SubmitChanges();
                };

                statusLabel.Text = "Successful insert!";
                RefreshRecords();
            }
            catch (Exception ex)
            {
                statusLabel.Text = ex.Message;
            }
        }

        protected void assignButton_Click(object sender, EventArgs e)
        {
            try
            {
                using (var dbcon = new KarateDBDataContext(connectionString))
                {
                    KarateWebApp.Section newSection = new KarateWebApp.Section
                    {
                        SectionName = sectionNameDDL.SelectedValue,
                        SectionStartDate = sectionStartCalendar.SelectedDate,
                        Member_ID = Convert.ToInt32(memberDDL.SelectedValue),
                        Instructor_ID = Convert.ToInt32(instructorDDL.SelectedValue),
                        SectionFee = Convert.ToDecimal(sectionFeeTextBox.Text),
                    };

                    dbcon.Sections.InsertOnSubmit(newSection);
                    dbcon.SubmitChanges();
                };

                assignStatusLabel.Text = "Successful assignment!";
                RefreshRecords();
            }
            catch (Exception ex)
            {
                assignStatusLabel.Text = ex.Message;
            }
        }
    }
}