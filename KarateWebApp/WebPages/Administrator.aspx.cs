using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KarateWebApp.WebPages
{
    public partial class Administrator : System.Web.UI.Page
    {
        private string connectionString = ConnectionStringHolder.connectionString;

        private void RefreshRecords()
        {
            using (var dbcon = new KarateDBDataContext(connectionString))
            {
                var members =
                    from member in dbcon.Members
                    select new
                    {
                        FirstName = member.MemberFirstName,
                        LastName = member.MemberLastName,
                        PhoneNumber = member.MemberPhoneNumber,
                        DateJoined = member.MemberDateJoined
                    };

                memberGridView.DataSource = members;
                memberGridView.DataBind();

                var instructors =
                    from instructor in dbcon.Instructors
                    select new
                    {
                        FirstName = instructor.InstructorFirstName,
                        LastName = instructor.InstructorLastName,
                    };

                instructorGridView.DataSource = instructors;
                instructorGridView.DataBind();
            };
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}