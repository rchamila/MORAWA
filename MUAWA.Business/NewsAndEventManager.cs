using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MUAWA.DataAccess;
using MUAWA.Common.BusinessObjects;

namespace MUAWA.Business
{
    public class NewsAndEventManager
    {
        /// <summary>
        /// Get total news count to use in pagination
        /// </summary>
        /// <returns>total news count</returns>
        public int GetNewsCount()
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.GetNewsCount();
        }

        /// <summary>
        /// Get News Headiles according to the provided page size and page index
        /// </summary>
        /// <param name="pageSize">required page size</param>
        /// <param name="pageIndex">required page index</param>
        /// <returns>News list related to required page</returns>
        public List<NewsAndEventsItem> GetNewsHeadline(int pageSize, int pageIndex)
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.GetNewsHeadlines(pageSize, pageIndex);
        }

         /// <summary>
        /// Get Events Headiles according to the provided page size and page index
        /// </summary>
        /// <param name="pageSize">required page size</param>
        /// <param name="pageIndex">required page index</param>
        /// <returns>Events list related to required page</returns>
        public List<NewsAndEventsItem> GetEventsHeadlines(int pageSize, int pageIndex)
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.GetEventsHeadlines(pageSize, pageIndex);
        }

        /// <summary>
        /// Get News Letters according to the provided page size and page index
        /// </summary>
        /// <param name="pageSize">required page size</param>
        /// <param name="pageIndex">required page index</param>
        /// <returns>News letters list related to required page</returns>
        public List<NewsLetter> GetNewsLetters(int pageSize, int pageIndex)
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.GetNewsLetters(pageSize, pageIndex);
        }

        /// <summary>
        /// Get news or event details
        /// </summary>
        /// <param name="id">News or Event id</param>
        /// <returns>News or Event details</returns>
        public NewsAndEventsItem GetNewsOrEventDetails(int id)
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.GetNewsOrEventDetails(id);
        }

        /// <summary>
        /// Search News Headlines
        /// </summary>
        /// <param name="SearchKey"></param>
        /// <returns></returns>
        public List<NewsAndEventsItem> SearchNewsHeadlines(string searchKey)
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.SearchNewsHeadlines(searchKey);
        }

        /// <summary>
        /// Search Events
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public List<NewsAndEventsItem> SearchEventsHeadlines(string searchKey)
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.SearchEventsHeadlines(searchKey);
        }

        /// <summary>
        /// Search news letters title
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public List<NewsLetter> SearchNewsLetters(string searchKey)
        {
            NewsAndEventsDataAccess dataAccess = new NewsAndEventsDataAccess();
            return dataAccess.SearchNewsLetters(searchKey);
        }
    }
}
