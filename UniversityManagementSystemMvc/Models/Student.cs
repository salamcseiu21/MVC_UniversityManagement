using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMvc.Models
{
    public class Student
    {
        public int  Id { get; set; }
        [Required(ErrorMessage = "Name is required!")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Registration No is required!")]
        [MaxLength(4)]
        [DisplayName("Registration No")]
        public string RegNo { get; set; }
        [Required(ErrorMessage = "Student address is required!")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Phone number is required!")]
        [DisplayName("Mobile")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "Email address is required!")]
        [DisplayName("E-mail Address")]
        public string Email { get; set; }
        public int DepartmentId { set; get; }

    }
}