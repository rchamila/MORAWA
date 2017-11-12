﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MUAWA.Common.BusinessObjects
{
    public class Contact
    {
        public string Subject { get; set; }
        public string Message { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public DateTime Date { get; set; } 
    }
}
