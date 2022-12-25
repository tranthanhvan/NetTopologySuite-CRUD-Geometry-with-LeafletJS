using GIS_Technolory.Entities;
using GIS_Technolory.Helpers;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;

namespace GIS_Technolory.Controllers
{
    public class PolygonController : Controller
    {
        private readonly IPolygonService _PolygonService;

        public PolygonController(IPolygonService PolygonService)
        {
            _PolygonService = PolygonService;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] PolygonModel uploadRecord)
        {
            var response = new Response<Polygon>();
            try
            {
                var linearRing = new NetTopologySuite.Geometries.LinearRing(uploadRecord.LatLongs.Select(m => new NetTopologySuite.Geometries.Coordinate
                {
                    X = m.lng,
                    Y = m.lat
                }).ToArray());
                response.Data = await _PolygonService.Create(new Polygon()
                {
                    ID = Guid.NewGuid().ToString(),
                    Name = uploadRecord.Name,
                    Color = uploadRecord.Color,
                    WeightBorder = uploadRecord.WeightBorder,
                    Opacity = uploadRecord.Opacity,
                    FillColor = uploadRecord.FillColor,
                    FillOpacity = uploadRecord.FillOpacity,
                    Location = new NetTopologySuite.Geometries.Polygon(linearRing) { SRID = 4326 }
                });
                response.Success = response.Data != null;
                response.Message = "Create Polygon is successful";
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        [HttpPost]
        public async Task<IActionResult> UpdateInfor([FromBody] PolygonModel uploadRecord)
        {
            var response = new Response<object>();
            try
            {
                Polygon Polygon = await _PolygonService.Get(uploadRecord.ID);
                if (Polygon is null)
                {
                    response.Success = false;
                    response.Message = "Target is not found in databases";
                }
                else
                {
                    Polygon.Name = uploadRecord.Name;
                    Polygon.Color = uploadRecord.Color;
                    Polygon.WeightBorder = uploadRecord.WeightBorder;
                    Polygon.Opacity = uploadRecord.Opacity;
                    Polygon.FillColor = uploadRecord.FillColor;
                    Polygon.FillOpacity = uploadRecord.FillOpacity;
                    response.Data = await _PolygonService.Update(Polygon);
                    response.Success = response.Data != null;
                    response.Message = "Update infor Polygon is successful";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        [HttpPost]
        public async Task<IActionResult> UpdateLocation([FromBody] PolygonModel uploadRecord)
        {
            var response = new Response<Polygon>();
            try
            {
                Polygon Polygon = await _PolygonService.Get(uploadRecord.ID);
                if (Polygon is null)
                {
                    response.Success = false;
                    response.Message = "Polygon is not found in databases";
                }
                else
                {
                    var linearRing = new NetTopologySuite.Geometries.LinearRing(uploadRecord.LatLongs.Select(m => new NetTopologySuite.Geometries.Coordinate
                    {
                        X = m.lng,
                        Y = m.lat
                    }).ToArray());
                    Polygon.Location = new NetTopologySuite.Geometries.Polygon(linearRing) { SRID = 4326 };
                    response.Data = await _PolygonService.Update(Polygon);
                    response.Success = response.Data != null;
                    if (response.Data.IsRectangle)
                        response.Message = "Update Location Polygon Rectangle is successful";
                    else
                        response.Message = "Update Location Polygon is successful";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        public async Task<IActionResult> DeletePolygon(string id)
        {
            var response = new Response<Polygon>();
            try
            {
                var polygon = await _PolygonService.Get(id);
                if (polygon is null)
                {
                    response.Success = false;
                    response.Message = "Polygon is not found in databases";
                }
                else
                {
                    response.Data = polygon;
                    response.Success = await _PolygonService.Delete(id);
                    if (polygon.IsRectangle)
                        response.Message = "Delete Polygon reactangle is successful";
                    else
                        response.Message = "Delete Polygon is successful";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        [HttpPost]
        public async Task<IActionResult> GetPolygon([FromBody] PolygonModel input)
        {
            var response = new Response<string>();
            try
            {
                input.LatLongs.Add(input.LatLongs.FirstOrDefault());
                var coordinates = input.LatLongs.Select(m => new NetTopologySuite.Geometries.Coordinate
                {
                    X = m.lng,
                    Y = m.lat
                }).ToArray();

                var Polygon = await _PolygonService.Get(input.ID);
                PolygonModel modelResult;

                if (Polygon is null)
                {
                    var linearRing = new NetTopologySuite.Geometries.LinearRing(coordinates);
                    var tempPlg = new Polygon()
                    {
                        Location = new NetTopologySuite.Geometries.Polygon(linearRing) { SRID = 4326 }
                    };
                    modelResult = new PolygonModel()
                    {
                        ID = string.Empty,
                        Color = input.Color,
                        WeightBorder = input.WeightBorder,
                        Opacity = input.Opacity,
                        FillColor = input.FillColor,
                        FillOpacity = input.FillOpacity,
                        LatLongs = tempPlg.LatLngs,
                        IsRectangle = tempPlg.IsRectangle,
                        LengthDisplay = tempPlg.LengthDisplay,
                        AreaDisplay = tempPlg.AreaDisplay
                    };

                    if (!modelResult.IsValid)
                    {
                        response.Success = false;
                        response.Message = "Polygon need at least 3 points";
                        return Ok(response);
                    }

                }
                else
                {
                    modelResult = new PolygonModel()
                    {
                        ID = Polygon.ID,
                        Name = Polygon.Name,
                        Color = Polygon.Color,
                        WeightBorder = Polygon.WeightBorder,
                        Opacity = Polygon.Opacity,
                        FillColor = Polygon.FillColor,
                        LatLongs = Polygon.LatLngs,
                        FillOpacity = Polygon.FillOpacity,
                        LengthDisplay = Polygon.LengthDisplay,
                        AreaDisplay = Polygon.AreaDisplay,
                        IsRectangle = Polygon.IsRectangle,
                    };
                }
                response.Data = await this.RenderViewAsync("_DetailPolygon", modelResult, true);
                response.Success = !string.IsNullOrEmpty(response.Data);
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
