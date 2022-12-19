using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GIS_Technolory.DBAccess;
using GIS_Technolory.Entities;

namespace GIS_Technolory.Controllers
{
    public class TypePolylinesController : Controller
    {
        private readonly GISContext _context;

        public TypePolylinesController(GISContext context)
        {
            _context = context;
        }

        // GET: TypePolylines
        public async Task<IActionResult> Index()
        {
              return View(await _context.TypePolylines.ToListAsync());
        }

        // GET: TypePolylines/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.TypePolylines == null)
            {
                return NotFound();
            }

            var typePolyline = await _context.TypePolylines
                .FirstOrDefaultAsync(m => m.ID == id);
            if (typePolyline == null)
            {
                return NotFound();
            }

            return View(typePolyline);
        }

        // GET: TypePolylines/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: TypePolylines/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ID,Name,MapName,Icon,ColorLine,WeightLine")] TypePolyline typePolyline)
        {
            if (ModelState.IsValid)
            {
                _context.Add(typePolyline);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(typePolyline);
        }

        // GET: TypePolylines/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.TypePolylines == null)
            {
                return NotFound();
            }

            var typePolyline = await _context.TypePolylines.FindAsync(id);
            if (typePolyline == null)
            {
                return NotFound();
            }
            return View(typePolyline);
        }

        // POST: TypePolylines/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("ID,Name,MapName,Icon,ColorLine,WeightLine")] TypePolyline typePolyline)
        {
            if (id != typePolyline.ID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(typePolyline);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TypePolylineExists(typePolyline.ID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(typePolyline);
        }

        // GET: TypePolylines/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.TypePolylines == null)
            {
                return NotFound();
            }

            var typePolyline = await _context.TypePolylines
                .FirstOrDefaultAsync(m => m.ID == id);
            if (typePolyline == null)
            {
                return NotFound();
            }

            return View(typePolyline);
        }

        // POST: TypePolylines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.TypePolylines == null)
            {
                return Problem("Entity set 'GISContext.TypePolylines'  is null.");
            }
            var typePolyline = await _context.TypePolylines.FindAsync(id);
            if (typePolyline != null)
            {
                _context.TypePolylines.Remove(typePolyline);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TypePolylineExists(string id)
        {
          return _context.TypePolylines.Any(e => e.ID == id);
        }
    }
}
