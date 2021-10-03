using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;

namespace shivani_ajax_
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string insertUser(string name, string username, string email)
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                string sql = "insert into login(name,username,email)values('" + name + "','" + username + "','" + email + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                int status = cmd.ExecuteNonQuery();
                if (status > 0)
                {
                    return "success";
                }
                else
                {
                    return "fail";
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }


        [WebMethod]
        public string updateuser(string name, string username, string email, string id)
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                string sql = "update login set name='" + name + "',username='" + username + "',email='" + email + "' where id= '" + id + "' ";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                int status = cmd.ExecuteNonQuery();
                if (status > 0)
                {
                    return "success";
                }
                else
                {
                    return "fail";
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }


        [WebMethod]
        public string Deleteuser(string id)
        {
            try                          
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                string sql = "delete from login where  id= '" + id + "' ";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                int status = cmd.ExecuteNonQuery();
                if (status > 0)
                {
                    return "success";
                }
                else
                {
                    return "fail";
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }
    }

   
}

