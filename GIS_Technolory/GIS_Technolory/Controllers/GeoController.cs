using GIS_Technolory.Constants;
using GIS_Technolory.Entities;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;
using NuGet.Packaging;

namespace GIS_Technolory.Controllers
{
    public class GeoController : Controller
    {
        private readonly IMarkerService _markerService;
        private readonly IPolylineService _polylineService;
        private readonly ITypeMarkerService _typeMarkerService;
        private readonly ITypePolylineService _typePolylineService;
        private readonly ICircleService _CircleService;
        private readonly IPolygonService _polygonService;

        public GeoController(IMarkerService markerService, 
            IPolylineService polylineService, 
            ITypeMarkerService typeMarkerService, 
            ITypePolylineService typePolylineService, 
            ICircleService CircleService, 
            IPolygonService polygonService)
        {
            _markerService = markerService;
            _polylineService = polylineService;
            _typeMarkerService = typeMarkerService;
            _typePolylineService = typePolylineService;
            _CircleService = CircleService;
            _polygonService = polygonService;
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
                typeSelect.Add(new { Name = TypeCircleConst.Circle, MapName = MapLayerCircleConst.Circle });
                typeSelect.Add(new { Name = TypeCircleConst.CircleMarker, MapName = MapLayerCircleConst.CircleMarker });
                typeSelect.Add(new { Name = TypePolygonConst.Polygon, MapName = MapLayerPolygonConst.Polygon });
                typeSelect.Add(new { Name = TypePolygonConst.Rectangle, MapName = MapLayerPolygonConst.Rectangle });
                #endregion Type Maps

                IEnumerable<Marker> markers = await _markerService.GetList();
                IEnumerable<Polyline> polylines = await _polylineService.GetList();

                IEnumerable<Circle> allCircles = await _CircleService.GetList();
                IEnumerable<CircleModel> allCirlceModel = allCircles.Select(x => new CircleModel()
                {
                    ID = x.ID,
                    Name = x.Name,
                    PopupContent = x.PopupContent,
                    Latitude = x.Latitude,
                    Longitude = x.Longitude,
                    ColorCircle = x.ColorCircle,
                    WeightBorder = x.WeightBorder,
                    Opacity = x.Opacity,
                    Radius = x.Radius,
                    FillColor = x.FillColor,
                    FillOpacity = x.FillOpacity
                });

                IEnumerable<Polygon> allPolygons = await _polygonService.GetList();
                IEnumerable<PolygonModel> allPolygonModel = allPolygons.Select(x => new PolygonModel()
                {
                    ID = x.ID,
                    Name = x.Name,
                    Color = x.Color,
                    PopupContent = x.PopupContent,
                    WeightBorder = x.WeightBorder,
                    Opacity = x.Opacity,
                    FillColor = x.FillColor,
                    FillOpacity = x.FillOpacity,
                    LatLongs = x.LatLngs,
                    IsRectangle = x.IsRectangle,
                    LengthDisplay = x.LengthDisplay,
                    AreaDisplay = x.AreaDisplay
                });

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
                    }),
                    Polylines = polylines.Select(x=> new PolylineModel()
                    {
                        ID = x.ID,
                        Name = x.Name,
                        PopupContent = x.PopupContent,
                        CablineLength = x.CablineLength,
                        TypeID = x.TypeID,
                        TypeName = x.Type.Name,
                        MapName = x.Type.MapName,
                        ColorLine = x.Type.ColorLine,
                        WeightLine = x.Type.WeightLine,
                        LatLongs = x.LatLongs
                    }),
                    Circles = allCirlceModel.Where(x=>!x.IsCircleMarker),
                    CircleMarkers = allCirlceModel.Where(x => x.IsCircleMarker),
                    Polygons = allPolygonModel
                };
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        [HttpGet]
        public async Task<IActionResult> SearchGeoData(string keyWord)
        {
            if (string.IsNullOrEmpty(keyWord))
                return BadRequest();
            var response = new Response<object>();
            try
            {
                var result = new List<GeoSearchModel>();
                IEnumerable<Marker> markers = await _markerService.GetList(keyWord);
                IEnumerable<Polyline> polylines = await _polylineService.GetList(keyWord);
                IEnumerable<Circle> allCircles = await _CircleService.GetList(keyWord);
                IEnumerable<Polygon> allPolygons = await _polygonService.GetList(keyWord);

                result.AddRange(markers.Select(x => new GeoSearchModel()
                {
                    ID = x.ID,
                    Name = x.Name,
                    Icon = x.Type.Icon,
                    Latitude = x.Latitude,
                    Longitude = x.Longitude,
                    MapLayer = x.Type.MapName
                }));

                result.AddRange(allCircles.Select(x => new GeoSearchModel()
                {
                    ID = x.ID,
                    Name = x.Name,
                    Icon = x.IsCircleMarker ? MapIconCircleConst.CircleMarker : MapIconCircleConst.Circle,
                    Latitude = x.Latitude,
                    Longitude = x.Longitude,
                    MapLayer = x.IsCircleMarker ? MapLayerCircleConst.CircleMarker : MapLayerCircleConst.Circle
                }));

                result.AddRange(allPolygons.Select(x => new GeoSearchModel()
                {
                    ID = x.ID,
                    Name = x.Name,
                    Icon = x.IsRectangle ? MapIconPolygonConst.Rectangle : MapIconPolygonConst.Polygon,
                    Latitude = x.Centroid.lat,
                    Longitude = x.Centroid.lng,
                    MapLayer = x.IsRectangle ? MapLayerPolygonConst.Rectangle : MapLayerPolygonConst.Polygon
                }));

                result.AddRange(polylines.Select(x => new GeoSearchModel()
                {
                    ID = x.ID,
                    Name = x.Name,
                    Icon = x.Type.Icon,
                    Latitude = x.Latitude,
                    Longitude = x.Longitude,
                    MapLayer = x.Type.MapName
                }));

                if (!result.Any())
                {
                    response.Data = $"<center style='color :red '>Data is not found with '{keyWord}' key word</center>";
                }
                else
                {
                    string htmlContent = string.Empty;
                    foreach (var item in result)
                    {
                        htmlContent = htmlContent + $"<div class='row item-suggestions' style='color :white ' onclick='fly(`{item.ID}`, {item.Latitude}, {item.Longitude} ,`{item.MapLayer}`)'><img src='" + item.Icon + "' class='icon-suggestion'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + item.Name.ToString() + "</div>";
                    }
                    response.Data = htmlContent;
                }
                response.Success = true;
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
