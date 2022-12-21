using GIS_Technolory.Entities;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;

namespace GIS_Technolory.Controllers
{
    public class GeoController : Controller
    {
        private readonly IMarkerService _markerService;
        private readonly IPolylineService _polylineService;
        private readonly ITypeMarkerService _typeMarkerService;
        private readonly ITypePolylineService _typePolylineService;

        public GeoController(IMarkerService markerService, IPolylineService polylineService, ITypeMarkerService typeMarkerService, ITypePolylineService typePolylineService)
        {
            _markerService = markerService;
            _polylineService = polylineService;
            _typeMarkerService = typeMarkerService;
            _typePolylineService = typePolylineService;
        }

        [HttpGet]
        public async Task<IActionResult> GetGeoData()
        {
            var response = new Response<object>();
            try
            {
                #region Type Maps
                IEnumerable<TypeMarker> typeMarkers = await _typeMarkerService.GetList();
                IEnumerable<TypePolyline> typePolylines = await _typePolylineService.GetList();
                dynamic typeSelect = typeMarkers.Select(x => new
                {
                    Name = x.Name,
                    MapName = x.MapName
                }).ToList();
                typeSelect.AddRange(typePolylines.Select(x => new
                {
                    Name = x.Name,
                    MapName = x.MapName
                }));
                #endregion Type Maps

                IEnumerable<Marker> markers = await _markerService.GetList();
                IEnumerable<Polyline> polylines = await _polylineService.GetList();

                response.Success = true;
                response.Data = new
                {
                    TypeMaps = typeSelect,
                    Markers = markers.Select(x => new MarkerModel() {
                        ID = x.ID,
                        Name = x.Name,
                        Long = x.Longitude,
                        Lat = x.Latitude,
                        PopupContent = x.PopupContent,
                        MapName = x.Type.MapName,
                        IconType= x.Type.Icon
                    })
                };
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }
    }
}
