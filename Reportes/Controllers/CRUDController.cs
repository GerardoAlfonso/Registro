using Reportes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Reportes.Controllers
{
    public class CRUDController : Controller
    {
        DataBase db = new DataBase();
        string status;
        public ActionResult alumnos()
        {
            try
            {
                ViewBag.alumnos = db.sp_list_alm();
                status = "success";
            }
            catch (Exception ex)
            {
                status = "fail";
            }

            return View();
        }

        public ActionResult editar_alumno()
        {
            return View();
        }
        public void eliminar_alumno(string id)
        {
            db.sp_delete_alm(Convert.ToInt32(id));
        }

        public ActionResult grado()
        {
            ViewBag.grados = db.sp_list_grado();
            return View();
        }
        public ActionResult editar_grado()
        {
            return View();
        }
        public void eliminar_grado(string id)
        {
            db.sp_eliminar_grd(Convert.ToInt32(id));
        }
        public ActionResult materia()
        {
            return View();
        }
        public ActionResult editar_materia()
        {
            return View();
        }
    }
}