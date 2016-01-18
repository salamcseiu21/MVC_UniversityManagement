using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMvc.Models
{
    public class StudentViewModel
    {
        public int Id { get; set; }
       
        public string Name { get; set; }
       
        public string RegNo { get; set; }
       
        public string Address { get; set; }
    
        public string Phone { get; set; }
     
        public string Email { get; set; }
        public string DepartmentName { set; get; }
    }
}