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
                response.Data = await _markerService.Create(new Marker()
                {
                    ID = Guid.NewGuid().ToString(),
                    Name = uploadRecord.Name,
                    Long = uploadRecord.Long,
                    Lat = uploadRecord.Lat,
                    TypeID = uploadRecord.TypeID
                });
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
            var response = new Response<Marker>();
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
                    marker.Name = uploadRecord?.Name;
                    marker.TypeID = uploadRecord.TypeID;
                    response.Data = await _markerService.Update(marker);
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
                            Lat = marker.Lat,
                            Long = marker.Long,
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
