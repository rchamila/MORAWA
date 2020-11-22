using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MUAWA.Common.BusinessObjects
{
    public class Album
    {
        public int AlbumId { get; set; }
        public string Title { get; set; }
        public string ImageURLs { get; set; }
        public DateTime AlbumDate { get; set; }
        public string Description { get; set; }
        public string Test { get; set;}
    }
}
