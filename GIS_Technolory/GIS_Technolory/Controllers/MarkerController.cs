using GIS_Technolory.Entities;
using GIS_Technolory.Helpers;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;

namespace GIS_Technolory.Controllers
{
    public class MarkerController : Controller
    {
        private readonly IMarkerService _markerService;
        private readonly ITypeMarkerService _typeMarkerService;

        public MarkerController(IMarkerService markerService, ITypeMarkerService typeMarkerService)
        {
            _markerService = markerService;
            _typeMarkerService = typeMarkerService;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] MarkerModel uploadRecord)
        {
            var response = new Response<Marker>();
            try
            {
                Marker create = await _markerService.Create(new Marker()
                {
                    ID = Guid.NewGuid().ToString(),
                    Name = uploadRecord.Name,
                    Location = new NetTopologySuite.Geometries.Point(uploadRecord.Long, uploadRecord.Lat) { SRID = 4326 },
                    TypeID = uploadRecord.TypeID
                });
                response.Data = await _markerService.Get(create.ID);
                response.Success = response.Data != null;
                response.Message = "Create marker is successful";
            }
            catch(Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        [HttpPost]
        public async Task<IActionResult> Update([FromBody] MarkerModel uploadRecord)
        {
            var response = new Response<object>();
            try
            {
                Marker marker = await _markerService.Get(uploadRecord.ID);
                
                if(marker is null)
                {
                    response.Success = false;
                    response.Message = "Marker is not found in databases";
                }
                else
                {
                    string oldMapName = marker.Type.MapName;
                    marker.Name = uploadRecord?.Name;
                    marker.TypeID = uploadRecord.TypeID;
                    await _markerService.Update(marker);
                    var markerNew = await _markerService.Get(marker.ID);
                    response.Data = new
                    {
                        Marker = markerNew,
                        OldMap = oldMapName
                    };
                    response.Success = response.Data != null;
                    response.Message = "Update marker is successful";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        public async Task<IActionResult> DeleteMarker(string id)
        {
            var response = new Response<Marker>();
            try
            {
                var marker = await _markerService.Get(id);
                if(marker is null)
                {
                    response.Success = false;
                    response.Message = "Marker is not found in databases";
                }
                else
                {
                    response.Data = marker;
                    response.Success = await _markerService.Delete(id);
                    response.Message = "Delete marker is successful";
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
        public async Task<IActionResult> GetMarker([FromBody] MarkerModel input)
        {
            var response = new Response<string>();
            try
            {
                var marker = await _markerService.Get(input.ID);
                var typeMarers = await _typeMarkerService.GetList();

                MarkerFormModel modelResult;
                if (marker is null)
                {
                    modelResult = new MarkerFormModel()
                    {
                        Marker = new MarkerModel()
                        {
                            Lat = input.Lat,
                            Long = input.Long
                        },
                        Types = typeMarers.Select(x => new TypeModel()
                        {
                            ImageUrl = x.Icon,
                            Text = x.Name,
                            Value = x.ID
                        }).ToList()
                    };
                }
                else
                {
                    modelResult = new MarkerFormModel()
                    {
                        Marker = new MarkerModel()
                        {
                            ID = marker.ID,
                            Lat = marker.Latitude,
                            Long = marker.Longitude,
                            Name = marker.Name,
                            TypeID = marker.TypeID
                        },
                        Types = typeMarers.Select(x => new TypeModel()
                        {
                            ImageUrl = x.Icon,
                            Text = x.Name,
                            Value = x.ID
                        }).ToList()
                    };
                }

                response.Data = await this.RenderViewAsync("_DetailMarker", modelResult, true);
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
