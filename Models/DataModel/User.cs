using LongtermCare.DataModel.Interface;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel
{
    public class User : DataModelObject
    {
        [KeyAttribute]
        public string account { get; set; }
        public string password { get; set; }
    }
}
