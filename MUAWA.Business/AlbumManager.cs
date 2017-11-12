using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MUAWA.DataAccess;
using MUAWA.Common.BusinessObjects;

namespace MUAWA.Business
{
    public class AlbumManager
    {
        /// <summary>
        /// Get total album count to use in pagination
        /// </summary>
        /// <returns>total album count</returns>
        public int GetAlbumCount()
        {
            GalleryDataAccess dataAccess = new GalleryDataAccess();
            return dataAccess.GetAlbumCount();
        }

        /// <summary>
        /// Get the album list according to the given page id and page size
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public List<Album> GetAlbums(int pageSize, int pageIndex)
        {
            GalleryDataAccess dataAccess = new GalleryDataAccess();
            return dataAccess.GetAlbums(pageSize, pageIndex);
        }

          /// <summary>
        /// Get album
        /// </summary>
        /// <param name="id">album id</param>
        /// <returns>album</returns>
        public Album GetAlbum(int id)
        {
            GalleryDataAccess dataAccess = new GalleryDataAccess();
            return dataAccess.GetAlbum(id);
        }

        /// <summary>
        /// Search Albums
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public List<Album> SearchAlbums(string searchKey)
        {
            GalleryDataAccess dataAccess = new GalleryDataAccess();
            return dataAccess.SearchAlbums(searchKey);
        }
    }
}
