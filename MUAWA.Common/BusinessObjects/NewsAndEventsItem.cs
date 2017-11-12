using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MUAWA.Common.BusinessObjects
{
    public class NewsAndEventsItem
    {
        public int NewsId { get; set; }
        public string Title { get; set; }
        public string NewsBody { get; set; }
        public DateTime NewsDate { get; set; }
    }
}
