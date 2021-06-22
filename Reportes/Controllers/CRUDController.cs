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
        public ActionResult alumnos()
        {
            
            try
            {
                ViewBag.alumnos = db.sp_list_alm();
            }
            catch (Exception ex)
            {

            }
            ViewBag.status = "";
            return View();
        }

        public ActionResult editar_alumno(string id)
        {
            int ID = Convert.ToInt32(id);
            ViewBag.alumno = db.alm_alumno.FirstOrDefault(e => e.alm_id == ID);
            return View();
        }
        public ActionResult editar_alumnoC(string id, string nombre, string edad, string sexo, string observaciones)
        {
            try
            {
                db.sp_actualizar_alm(Convert.ToInt32(id), nombre, edad, sexo, observaciones);
            }
            catch (Exception ex)
            {

            }
            return RedirectToAction("alumnos", "CRUD");
        }
        public ActionResult agregar_alumno(string id, string nombre, string edad, string sexo, string observaciones)
        {
            try
            {
                db.sp_insertar_alm(Convert.ToInt32(id), nombre, Convert.ToInt32(edad), sexo, observaciones);
            }catch (Exception e)
            {
                return RedirectToAction("alumnos", "CRUD");
            }
            return RedirectToAction("alumnos", "CRUD");
        }
        public ActionResult eliminar_alumno(string id)
        {
            try
            {
                db.sp_delete_alm(Convert.ToInt32(id));
            }
            catch (Exception ex)
            {
                return RedirectToAction("alumnos", "CRUD", 2);
            }
            return RedirectToAction("alumnos", "CRUD", 1);
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