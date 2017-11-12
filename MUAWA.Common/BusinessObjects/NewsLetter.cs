using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MUAWA.Common.BusinessObjects
{
    public class NewsLetter
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string FileName { get; set; }
        public DateTime Date { get; set; }
    }
}
