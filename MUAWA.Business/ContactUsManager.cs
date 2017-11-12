using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MUAWA.Common.BusinessObjects;
using MUAWA.DataAccess;

namespace MUAWA.Business
{
    public class ContactUsManager
    {
        /// <summary>
        /// Insert contact us data db
        /// </summary>
        /// <param name="contactUs">contact us details</param>
        /// <returns>generated contact us id</returns>
        public int InsertContactUsDetails(Contact contactUs)
        {
            ContactUsDataAccess dataAccess = new ContactUsDataAccess();
            return dataAccess.InsertContactUsDetails(contactUs);
        }
    }
}
