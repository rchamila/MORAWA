using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MUAWA.Common.BusinessObjects;
using System.Data.SqlClient;
using System.Data;

namespace MUAWA.DataAccess
{
    public class ContactUsDataAccess : BaseDataAccess
    {
        /// <summary>
        /// Insert contact us data db
        /// </summary>
        /// <param name="contactUs">contact us details</param>
        /// <returns>generated contact us id</returns>
        public int InsertContactUsDetails(Contact contactUs)
        {
            int id = -1;

            try
            {
                SqlCommand cmd = new SqlCommand("Insert INTO Contact_Us(Subject, Message, Name, Email, Date) VALUES (@Subject, @Message, @Name,@Email, @Date); SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;//specify the data to be inserted into the table
                cmd.Parameters.AddWithValue("@Subject", contactUs.Subject);
                cmd.Parameters.AddWithValue("@Message", contactUs.Message);
                cmd.Parameters.AddWithValue("@Name", contactUs.Name);
                cmd.Parameters.AddWithValue("@Email", contactUs.Email);
                cmd.Parameters.AddWithValue("@Date", (DateTime)contactUs.Date);

                using (mConnection)
                {
                    id = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return id;
        }
    }
}
