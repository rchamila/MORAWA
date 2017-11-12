using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MUAWA.Common.BusinessObjects;
using System.Data.SqlClient;
using System.Data;

namespace MUAWA.DataAccess
{
    public class GalleryDataAccess : BaseDataAccess
    {
        /// <summary>
        /// Get total album count to use in pagination
        /// </summary>
        /// <returns>total album count</returns>
        public int GetAlbumCount()
        {
            int albumCount = 0;

            try
            {

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS Count from dbo.Albums; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            albumCount = (int)reader.GetValue(reader.GetOrdinal("Count"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return albumCount;
        }

        /// <summary>
        /// Get the album list according to the given page id and page size
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public List<Album> GetAlbums(int pageSize, int pageIndex)
        {
            List<Album> albumList = new List<Album>();

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM  (SELECT ROW_NUMBER() OVER(ORDER BY Id desc) as rownum,Id, Title, ImageURLs,Date,Description FROM Albums) as albums WHERE rownum > (@pageNumber * @pageSize) AND rownum <= ((@pageNumber * @pageSize) + @pageSize) ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@pageSize", pageSize);
                cmd.Parameters.AddWithValue("@pageNumber", pageIndex);

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Album album = new Album();
                            album.AlbumId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            album.Title = reader.GetString(reader.GetOrdinal("Title"));
                            album.ImageURLs = reader.GetString(reader.GetOrdinal("ImageURLs"));
                            album.AlbumDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            album.Description = reader.GetString(reader.GetOrdinal("Description"));
                            albumList.Add(album);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return albumList;
        }

        /// <summary>
        /// Get album
        /// </summary>
        /// <param name="id">album id</param>
        /// <returns>album</returns>
        public Album GetAlbum(int id)
        {
            Album album = new Album();

            try
            {
                SqlCommand cmd = new SqlCommand("select * from Albums Where Id = @Id; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Id", id);

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            album.AlbumId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            album.Title = reader.GetString(reader.GetOrdinal("Title"));
                            album.ImageURLs = reader.GetString(reader.GetOrdinal("ImageURLs"));
                            album.AlbumDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            album.Description = reader.GetString(reader.GetOrdinal("Description"));
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return album;
        }

        /// <summary>
        /// Search Albums
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public List<Album> SearchAlbums(string searchKey)
        {
            List<Album> albumList = new List<Album>();

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM  Albums where Title like @SearchKey ORDER BY  Id DESC; SELECT SCOPE_IDENTITY() ", mConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@SearchKey", ("%" + searchKey + "%"));

                using (cmd)
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Album album = new Album();
                            album.AlbumId = (int)reader.GetValue(reader.GetOrdinal("Id"));
                            album.Title = reader.GetString(reader.GetOrdinal("Title"));
                            album.ImageURLs = reader.GetString(reader.GetOrdinal("ImageURLs"));
                            album.AlbumDate = (DateTime)reader.GetValue(reader.GetOrdinal("Date"));
                            album.Description = reader.GetString(reader.GetOrdinal("Description"));
                            albumList.Add(album);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return albumList;
        }
    }
}
