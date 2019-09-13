using System.Linq;
using System.Web.Http;
using TaskManager.Models;

namespace TaskManager.Controllers
{
    public class StatusController : ApiController
    {
        private DBModel db = new DBModel();

        // GET: api/Status
        public IQueryable<Status> GetStatus()
        {
            return db.Status;
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool StatusExists(int id)
        {
            return db.Status.Count(e => e.Id == id) > 0;
        }
    }
}