using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMvc.DAL;
using UniversityManagementSystemMvc.Models;

namespace UniversityManagementSystemMvc.Controllers
{
    public class StudentController : Controller
    {
        //
        // GET: /Student/
        [HttpGet]
        public ActionResult Index()
          {
            StudentGateway studentGateway = new StudentGateway();
            List<StudentViewModel> studentViewModels = studentGateway.GetAll.ToList();
            return View(studentViewModels);
        }

     
        //
        // GET: /Student/Create
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }

        //
        // POST: /Student/Create
        [HttpPost]
        public ActionResult Create(Student student)
        {
            try
            {
                StudentGateway studentGateway=new StudentGateway();
                studentGateway.Insert(student);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Student/Edit/5
        [HttpGet]
        public ActionResult Edit(int id)
        {
            StudentGateway studentGateway=new StudentGateway();
            Student student = studentGateway.GetAllStudents.Single(st => st.Id == id);
            return View(student);
        }

        //
        // POST: /Student/Edit/5
        [HttpPost]
        public ActionResult Edit(Student student)
        {
            try
            {
                StudentGateway studentGateway=new StudentGateway();
                studentGateway.Update(student);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Student/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            StudentGateway studentGateway=new StudentGateway();
            Student student = studentGateway.GetAllStudents.Single(st => st.Id == id);
            return View(student);
        }

        //
        // POST: /Student/Delete/5
        [HttpPost]
        public ActionResult Delete(Student student)
        {
            try
            {
               StudentGateway studentGateway=new StudentGateway();
                studentGateway.Delete(student.Id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpGet]

        public ActionResult Details(int id)
        {
            StudentGateway studentGateway = new StudentGateway();
            Student student = studentGateway.GetAllStudents.Single(st => st.Id == id);
            return View(student);
        }

    }
}
