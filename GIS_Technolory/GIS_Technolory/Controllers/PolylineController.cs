using GIS_Technolory.Entities;
using GIS_Technolory.Helpers;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;

namespace GIS_Technolory.Controllers
{
    public class PolylineController : Controller
    {
        private readonly IPolylineService _polylineService;
        private readonly ITypePolylineService _typePolylineService;

        public PolylineController(IPolylineService polylineService, ITypePolylineService typePolylineService)
        {
            _polylineService = polylineService;
            _typePolylineService = typePolylineService;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] PolylineModel uploadRecord)
        {
            var response = new Response<PolylineModel>();
            try
            {
                uploadRecord.ID = Guid.NewGuid().ToString();
                await _polylineService.Create(new Polyline()
                {
                    ID = uploadRecord.ID,
                    Name = uploadRecord.Name,
                    CablineLength = uploadRecord.CablineLength,
                    CentralLatlng = uploadRecord.CentralLatlng,
                    TypeID = uploadRecord.TypeID,
                    LatLongs = uploadRecord.LatLongs.Select(x=> new PolylineLatLong()
                    {
                        ID = Guid.NewGuid().ToString(),
                        Location = new NetTopologySuite.Geometries.Point(x.Longitude, x.Latitude) { SRID = 4326 },
                        Order = x.Order,
                        PolylineID = uploadRecord.ID
                    }).ToList()
                });
                var model = await _polylineService.Get(uploadRecord.ID);
                uploadRecord.MapName = model.Type.MapName;
                uploadRecord.TypeName = model.Type.Name;
                uploadRecord.WeightLine = model.Type.WeightLine;
                uploadRecord.ColorLine = model.Type.ColorLine;
                uploadRecord.PopupContent = model.PopupContent;

                response.Data = uploadRecord;
                response.Success = response.Data != null;
                response.Message = "Create Polyline is successful";
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateInfor([FromBody] PolylineModel uploadRecord)
        {
            var response = new Response<Polyline>();
            try
            {
                Polyline polyline = await _polylineService.Get(uploadRecord.ID);
                if(polyline is null)
                {
                    response.Success = false;
                    response.Message = "Polyline not found in databases";
                }
                else
                {
                    string oldMapName = polyline.Type.MapName;
                    polyline.Name = uploadRecord?.Name;
                    polyline.TypeID = uploadRecord.TypeID;
                    await _polylineService.Update(polyline);

                    response.Data = await _polylineService.Get(uploadRecord.ID);
                    response.Success = response.Data != null;
                    response.Message = "Update Polyline is successful";
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
        public async Task<IActionResult> GetPolyline([FromBody] PolylineModel input)
        {
            var response = new Response<string>();
            try
            {
                var polyline = await _polylineService.Get(input.ID);
                var typePolinies = await _typePolylineService.GetList();

                PolylineFormModel modelResult;
                if (polyline is null)
                {
                    modelResult = new PolylineFormModel()
                    {
                        Polyline = new PolylineModel()
                        {
                            CablineLength = input.CablineLength,
                            CentralLatlng = input.CentralLatlng,
                            LatLongs = input.LatLongs.Select(x => new PolylineLatLongModel()
                            {
                                ID = string.Empty,
                                Latitude = x.Latitude,
                                Longitude = x.Longitude,
                                Order = x.Order
                            }).ToList()
                        },
                        Types = typePolinies.Select(x => new TypeModel()
                        {
                            ImageUrl = x.Icon,
                            Text = x.Name,
                            Value = x.ID
                        }).ToList()
                    };
                }
                else
                {
                    modelResult = new PolylineFormModel()
                    {
                        Polyline = new PolylineModel()
                        {
                            ID = polyline.ID,
                            Name = polyline.Name,
                            TypeID = polyline.TypeID,
                            CablineLength = polyline.CablineLength,
                            CentralLatlng = polyline.CentralLatlng,
                            LatLongs = polyline.LatLongs.Select(x=> new PolylineLatLongModel()
                            {
                                ID = x.ID,
                                Latitude = x.Latitude,
                                Longitude = x.Longitude,
                                Order = x.Order
                            }).ToList()
                        },
                        Types = typePolinies.Select(x => new TypeModel()
                        {
                            ImageUrl = x.Icon,
                            Text = x.Name,
                            Value = x.ID
                        }).ToList()
                    };
                }

                response.Data = await this.RenderViewAsync("_DetailPolyline", modelResult, true);
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
