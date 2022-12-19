using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GIS_Technolory.Entities;
using GIS_Technolory.Serivces;
using GIS_Technolory.Helpers;

namespace GIS_Technolory.Controllers
{
    public class TypeMarkerController : Controller
    {
        private readonly ITypeMarkerService _typeMarkerService;

        public TypeMarkerController(ITypeMarkerService typeMarkerService)
        {
            _typeMarkerService = typeMarkerService;
        }

        // GET: TypeMarkers
        public async Task<IActionResult> Index()
        {
              return View(await _typeMarkerService.GetList());
        }

        // GET: TypeMarkers/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var typeMarker = await _typeMarkerService.Get(id);
            if (typeMarker == null)
            {
                return NotFound();
            }

            return View(typeMarker);
        }

        // GET: TypeMarkers/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: TypeMarkers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Name,MapName,Icon")] TypeMarker typeMarker)
        {
            if (ModelState.IsValid)
            {
                typeMarker.ID = Guid.NewGuid().ToString();
                typeMarker.MapName = Extendsions.CreateRandomLayerName(8);
                await _typeMarkerService.Create(typeMarker);
                return RedirectToAction(nameof(Index));
            }
            return View(typeMarker);
        }

        // GET: TypeMarkers/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var typeMarker = await _typeMarkerService.Get(id);
            if (typeMarker == null)
            {
                return NotFound();
            }
            return View(typeMarker);
        }

        // POST: TypeMarkers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("ID,Name,MapName,Icon")] TypeMarker typeMarker)
        {
            if (id != typeMarker.ID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    await _typeMarkerService.Update(typeMarker);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TypeMarkerExists(typeMarker.ID))
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
            return View(typeMarker);
        }

        // GET: TypeMarkers/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var typeMarker = await _typeMarkerService.Get(id);
            if (typeMarker == null)
            {
                return NotFound();
            }

            return View(typeMarker);
        }

        // POST: TypeMarkers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var typeMarker = await _typeMarkerService.Get(id);
            if (typeMarker == null)
            {
                return Problem("Entity get model  is null.");
            }

            await _typeMarkerService.Delete(id);
            return RedirectToAction(nameof(Index));
        }

        private bool TypeMarkerExists(string id)
        {
            return _typeMarkerService.Get(id).Result != null;
        }
    }
}
