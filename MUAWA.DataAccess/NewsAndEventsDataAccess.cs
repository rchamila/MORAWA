using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using MUAWA.Common.BusinessObjects;

namespace MUAWA.DataAccess
{
    public class NewsAndEventsDataAccess : BaseDataAccess
    {
        /// <summary>
        /// Get total news count to use in pagination
        /// </summary>
        /// <returns>total news count</returns>
        public int GetNewsCount()
        {            
            int newsCount = 0;

            try
            {

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS Count from dbo.News_And_Events WHERE Type = 1; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            newsCount = (int)reader.GetValue(reader.GetOrdinal("Count"));               
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newsCount;
        }

        /// <summary>
        /// Get News Headiles according to the provided page size and page index
        /// </summary>
        /// <param name="pageSize">required page size</param>
        /// <param name="pageIndex">required page index</param>
        /// <returns>News list related to required page</returns>
        public List<NewsAndEventsItem> GetNewsHeadlines(int pageSize, int pageIndex)
        {
            List<NewsAndEventsItem> newsList =  new List<NewsAndEventsItem>();

            try
            {                 
                SqlCommand cmd = new SqlCommand("SELECT * FROM  (SELECT ROW_NUMBER() OVER(ORDER BY Id desc) as rownum,Id, Title, Date,Type FROM News_And_Events where Type = 1) as news WHERE rownum > (@pageNumber * @pageSize) AND rownum <= ((@pageNumber * @pageSize) + @pageSize) ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@pageSize", pageSize);
                cmd.Parameters.AddWithValue("@pageNumber", pageIndex);

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            NewsAndEventsItem news = new NewsAndEventsItem();
                            news.NewsId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            news.Title = reader.GetString(reader.GetOrdinal("Title"));
                            news.NewsDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            newsList.Add(news);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newsList;
        }

        /// <summary>
        /// Get Events Headiles according to the provided page size and page index
        /// </summary>
        /// <param name="pageSize">required page size</param>
        /// <param name="pageIndex">required page index</param>
        /// <returns>Events list related to required page</returns>
        public List<NewsAndEventsItem> GetEventsHeadlines(int pageSize, int pageIndex)
        {
            List<NewsAndEventsItem> eventsList = new List<NewsAndEventsItem>();

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM  (SELECT ROW_NUMBER() OVER(ORDER BY Id desc) as rownum,Id, Title, Date,Type FROM News_And_Events where Type = 2) as news WHERE rownum > (@pageNumber * @pageSize) AND rownum <= ((@pageNumber * @pageSize) + @pageSize) ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@pageSize", pageSize);
                cmd.Parameters.AddWithValue("@pageNumber", pageIndex);

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            NewsAndEventsItem news = new NewsAndEventsItem();
                            news.NewsId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            news.Title = reader.GetString(reader.GetOrdinal("Title"));
                            news.NewsDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            eventsList.Add(news);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return eventsList;
        }

        /// <summary>
        /// Get News Letters according to the provided page size and page index
        /// </summary>
        /// <param name="pageSize">required page size</param>
        /// <param name="pageIndex">required page index</param>
        /// <returns>News letters list related to required page</returns>
        public List<NewsLetter> GetNewsLetters(int pageSize, int pageIndex)
        {
            List<NewsLetter> newsLettersList = new List<NewsLetter>();

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM  (SELECT ROW_NUMBER() OVER(ORDER BY Id desc) as rownum,Id, Title, Date,FileName FROM News_Letters) as letters WHERE rownum > (@pageNumber * @pageSize) AND rownum <= ((@pageNumber * @pageSize) + @pageSize) ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@pageSize", pageSize);
                cmd.Parameters.AddWithValue("@pageNumber", pageIndex);

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            NewsLetter newsLetter = new NewsLetter();
                            newsLetter.Id = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            newsLetter.Title = reader.GetString(reader.GetOrdinal("Title"));
                            newsLetter.FileName = reader.GetString(reader.GetOrdinal("FileName"));
                            newsLetter.Date = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            newsLettersList.Add(newsLetter);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newsLettersList;
        }

        /// <summary>
        /// Get news or event details
        /// </summary>
        /// <param name="id">News or Event id</param>
        /// <returns>News or Event details</returns>
        public NewsAndEventsItem GetNewsOrEventDetails(int id)
        {
            NewsAndEventsItem newsAndEvent = new NewsAndEventsItem();

            try
            {
                SqlCommand cmd = new SqlCommand("select t2.Id,t2.Date,t1.NewsAndEventBody,t2.Title from (select * from dbo.News_And_Event_Details where Id = @Id) t1 INNER JOIN (select * from dbo.News_And_Events where Id = @Id)  t2 ON t1.Id = t2.Id; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Id", id);

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {                            
                            newsAndEvent.NewsId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            newsAndEvent.Title = reader.GetString(reader.GetOrdinal("Title"));
                            newsAndEvent.NewsBody = reader.GetString(reader.GetOrdinal("NewsAndEventBody"));
                            newsAndEvent.NewsDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newsAndEvent;
        }

        /// <summary>
        /// Search News Headlines
        /// </summary>
        /// <param name="SearchKey"></param>
        /// <returns></returns>
        public List<NewsAndEventsItem> SearchNewsHeadlines(string searchKey)
        {
            List<NewsAndEventsItem> newsList = new List<NewsAndEventsItem>();

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM News_And_Events where Type = 1 AND Title like  @SearchKey  ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@SearchKey", ("%" + searchKey + "%"));

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            NewsAndEventsItem news = new NewsAndEventsItem();
                            news.NewsId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            news.Title = reader.GetString(reader.GetOrdinal("Title"));
                            news.NewsDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            newsList.Add(news);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newsList;
        }

        /// <summary>
        /// Search Events
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public List<NewsAndEventsItem> SearchEventsHeadlines(string searchKey)
        {
            List<NewsAndEventsItem> eventsList = new List<NewsAndEventsItem>();

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM News_And_Events where Type = 2 AND Title like @SearchKey  ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@SearchKey", ("%" + searchKey + "%"));

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            NewsAndEventsItem news = new NewsAndEventsItem();
                            news.NewsId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            news.Title = reader.GetString(reader.GetOrdinal("Title"));
                            news.NewsDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            eventsList.Add(news);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return eventsList;
        }

        /// <summary>
        /// Search news letters title
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public List<NewsLetter> SearchNewsLetters(string searchKey)
        {
            List<NewsLetter> newsLettersList = new List<NewsLetter>();

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM News_Letters where Title like @SearchKey ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@SearchKey", ("%" + searchKey + "%"));

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            NewsLetter newsLetter = new NewsLetter();
                            newsLetter.Id = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            newsLetter.Title = reader.GetString(reader.GetOrdinal("Title"));
                            newsLetter.FileName = reader.GetString(reader.GetOrdinal("FileName"));
                            newsLetter.Date = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            newsLettersList.Add(newsLetter);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newsLettersList;
        }
    }
}
