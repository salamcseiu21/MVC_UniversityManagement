using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMvc.Models;

namespace UniversityManagementSystemMvc.DAL
{
    public class StudentGateway:DBGateway
    {
        public IEnumerable<StudentViewModel> GetAll
        {
            get
            {

                CommandObj.CommandText = "spGetStudentInformationWithDepartment";
                CommandObj.CommandType = CommandType.StoredProcedure;
                List<StudentViewModel> studentViewModels=new List<StudentViewModel>();
                ConnectionObj.Open();

                SqlDataReader reader = CommandObj.ExecuteReader();
                while (reader.Read())
                {
                    StudentViewModel studentViewModel=new StudentViewModel();
                    studentViewModel.Id = Convert.ToInt32(reader["Id"].ToString());
                    studentViewModel.Name = reader["Name"].ToString();
                    studentViewModel.RegNo = reader["RegNo"].ToString();
                    studentViewModel.Address = reader["Address"].ToString();
                    studentViewModel.Phone = reader["Phone"].ToString();
                    studentViewModel.Email = reader["Email"].ToString();
                    studentViewModel.DepartmentName = reader["Department"].ToString();
                    studentViewModels.Add(studentViewModel);
                }
                reader.Close();
                ConnectionObj.Close();
                CommandObj.Dispose();
                return studentViewModels;
            }
        }

        public IEnumerable<Student> GetAllStudents
        {
            get
            {

                CommandObj.CommandText = "SELECT * FROM t_Students";
                List<Student> students = new List<Student>();
                ConnectionObj.Open();

                SqlDataReader reader = CommandObj.ExecuteReader();
                while (reader.Read())
                {
                    Student student = new Student();
                    student.Id = Convert.ToInt32(reader["Id"].ToString());
                    student.Name = reader["Name"].ToString();
                    student.RegNo = reader["RegNo"].ToString();
                    student.Address = reader["Address"].ToString();
                    student.Phone = reader["Phone"].ToString();
                    student.Email = reader["Email"].ToString();
                    students.Add(student);
                }
                reader.Close();
                ConnectionObj.Close();
                CommandObj.Dispose();
                return students;
            }
        }


        public void Insert(Student aStudent)
        {
            CommandObj.CommandText = "spAddStudent";
            CommandObj.CommandType = CommandType.StoredProcedure;
            CommandObj.Parameters.Clear();
            CommandObj.Parameters.AddWithValue("@Name", aStudent.Name);
            CommandObj.Parameters.AddWithValue("@RegNo", aStudent.RegNo);
            CommandObj.Parameters.AddWithValue("@Address", aStudent.Address);
            CommandObj.Parameters.AddWithValue("@Phone", aStudent.Phone);
            CommandObj.Parameters.AddWithValue("@Email", aStudent.Email);
            
             ConnectionObj.Open();
            CommandObj.ExecuteNonQuery();
            CommandObj.Dispose();
            ConnectionObj.Close();

        }

        public void Update(Student aStudent)
        {
            CommandObj.CommandText = "spUpdateStudentInformation";
            CommandObj.CommandType = CommandType.StoredProcedure;
            CommandObj.Parameters.Clear();
            CommandObj.Parameters.AddWithValue("@StudentId", aStudent.Id);
            CommandObj.Parameters.AddWithValue("@Name", aStudent.Name);
            CommandObj.Parameters.AddWithValue("@RegNo", aStudent.RegNo);
            CommandObj.Parameters.AddWithValue("@Address", aStudent.Address);
            CommandObj.Parameters.AddWithValue("@Phone", aStudent.Phone);
            CommandObj.Parameters.AddWithValue("@Email", aStudent.Email);
            ConnectionObj.Open();
            CommandObj.ExecuteNonQuery();
            CommandObj.Dispose();
            ConnectionObj.Close();
        }

        public void Delete(int studentId)
        {
            CommandObj.CommandText = "stDeleteStudentInforamtion";
            CommandObj.CommandType = CommandType.StoredProcedure;
            CommandObj.Parameters.Clear();
            CommandObj.Parameters.AddWithValue("@StudentId ", studentId);
            ConnectionObj.Open();
            CommandObj.ExecuteNonQuery();
            CommandObj.Dispose();
            ConnectionObj.Close();

        }
    }
}