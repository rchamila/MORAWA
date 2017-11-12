using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MUAWA.DataAccess
{
    public class BaseDataAccess
    {
        public SqlConnection mConnection;

        public BaseDataAccess()
        {
            mConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);

            if (mConnection.State != ConnectionState.Open)
            {
                try
                {
                    mConnection.Open();
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }                
            }
        }

    }
}
