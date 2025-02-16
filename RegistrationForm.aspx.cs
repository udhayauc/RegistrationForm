using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace RegistrationForm
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                if (ValidateUserInfo())  //Revalidate inputs on the server to ensure data integrity.
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    //string hashedPassword = HashPassword(txt_password.Text.Trim());
                    string strInsert = "INSERT INTO tbl_RegistrationForm(First_Name, Last_Name, Email, Password , DOB)" +
                        "values (@first_name,@last_name,@email,@password,@dob)";
                    SqlCommand cmd = new SqlCommand(strInsert, con);
                    cmd.Parameters.AddWithValue("@first_name", txt_firstName.Text);
                    cmd.Parameters.AddWithValue("@last_name", txt_lastName.Text);
                    cmd.Parameters.AddWithValue("@email", txt_emailID.Text);
                    cmd.Parameters.AddWithValue("@password", txt_password.Text);
                    cmd.Parameters.AddWithValue("@dob", txt_dob.Text);

                    int count = cmd.ExecuteNonQuery();
                    if (count > 0)
                    {
                        lblMessage.Text = "Registered successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "Something went wrong while register! Please try again";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Something went wrong!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                con.Close();
            }
        }

        private bool ValidateUserInfo()
        {
            bool isValid = true;
            try
            {
                string firstName = txt_firstName.Text.Trim();
                string lastName = txt_lastName.Text.Trim();
                string email = txt_emailID.Text.Trim();
                string password = txt_password.Text.Trim();
                string dobText = txt_dob.Text.Trim();

                if (string.IsNullOrEmpty(firstName))
                {
                    lblMessage.Text = "First name is required.";
                    isValid = false;
                }

                if (string.IsNullOrEmpty(lastName))
                {
                    lblMessage.Text = "Last name is required.";
                    isValid = false;
                }

                if (string.IsNullOrEmpty(email) || !IsValidEmail(email))
                {
                    lblMessage.Text = "Enter a valid email address.";
                    isValid = false;
                }

                if (string.IsNullOrEmpty(password) || password.Length < 8)
                {
                    lblMessage.Text = "Password must be at least 8 characters long.";
                    isValid = false;
                }

                if (!DateTime.TryParse(dobText, out DateTime dob))
                {
                    lblMessage.Text = "Enter a valid date of birth.";
                    isValid = false;
                }
                else
                {
                    int age = DateTime.Now.Year - dob.Year;
                    if (dob > DateTime.Now.AddYears(-age)) // Adjust for leap years
                    {
                        age--;
                    }

                    if (age < 18)
                    {
                        lblMessage.Text = "You must be at least 18 years old.";
                        isValid = false;
                    }
                }

                return isValid;

            }
            catch (Exception ex)
            {
                isValid = false;
            }
            return isValid;
        }

        private bool IsValidEmail(string email)
        {
            bool isValidEmail = false;
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                isValidEmail = addr.Address == email;
            }
            catch
            {
                isValidEmail = false;
            }
            return isValidEmail;
        }

        // Securely hash passwords before storing them
        private string HashPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }

    }
}