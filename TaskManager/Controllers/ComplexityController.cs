using System.Linq;
using System.Web.Http;
using TaskManager.Models;

namespace TaskManager.Controllers
{
    public class ComplexityController : ApiController
    {
        private DBModel db = new DBModel();

        // GET: api/Complexity
        public IQueryable<Complexity> GetComplexities()
        {
            return db.Complexities;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ComplexityExists(int id)
        {
            return db.Complexities.Count(e => e.Id == id) > 0;
        }
    }
}