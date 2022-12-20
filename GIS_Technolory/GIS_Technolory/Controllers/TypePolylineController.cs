using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GIS_Technolory.Entities;
using GIS_Technolory.Serivces;
using GIS_Technolory.Helpers;

namespace GIS_Technolory.Controllers
{
    public class TypePolylineController : Controller
    {
        private readonly ITypePolylineService _typePolylineService;

        public TypePolylineController(ITypePolylineService typePolylineService)
        {
            _typePolylineService = typePolylineService;
        }

        // GET: TypePolylines
        public async Task<IActionResult> Index()
        {
              return View(await _typePolylineService.GetList());
        }

        // GET: TypePolylines/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _typePolylineService == null)
            {
                return NotFound();
            }

            var typePolyline = await _typePolylineService.Get(id);
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
        public async Task<IActionResult> Create([Bind("Name,MapName,Icon,ColorLine,WeightLine")] TypePolyline typePolyline)
        {
            if (ModelState.IsValid)
            {
                typePolyline.ID = Guid.NewGuid().ToString();
                typePolyline.MapName = Extendsions.CreateRandomLayerName(8);
                await _typePolylineService.Create(typePolyline);
                return RedirectToAction(nameof(Index));
            }
            return View(typePolyline);
        }

        // GET: TypePolylines/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _typePolylineService == null)
            {
                return NotFound();
            }

            var typePolyline = await _typePolylineService.Get(id);
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
                    await _typePolylineService.Update(typePolyline);
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
            if (id == null || _typePolylineService == null)
            {
                return NotFound();
            }

            var typePolyline = await _typePolylineService.Get(id);
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
            var typePolyline = await _typePolylineService.Get(id);
            if (typePolyline == null)
            {
                return Problem("Entity get model is null");
            }
            
            await _typePolylineService.Delete(id);
            return RedirectToAction(nameof(Index));
        }

        private bool TypePolylineExists(string id)
        {
            return _typePolylineService.Get(id).Result != null;
        }
    }
}
