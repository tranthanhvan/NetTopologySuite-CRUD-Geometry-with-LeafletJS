using GIS_Technolory.Entities;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;

namespace GIS_Technolory.Controllers
{
    public class PolylineController : Controller
    {
        private readonly IPolylineService _polylineService;

        public PolylineController(IPolylineService polylineService)
        {
            _polylineService = polylineService;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] PolylineModel uploadRecord)
        {
            var response = new Response<Polyline>();
            try
            {
                string id = Guid.NewGuid().ToString();
                response.Data = await _polylineService.Create(new Polyline()
                {
                    ID = id,
                    Name = uploadRecord.Name,
                    CablineLength = uploadRecord.CablineLength,
                    CentralLatlng = uploadRecord.CentralLatlng,
                    TypeID = uploadRecord.TypeID,
                    LatLongs = uploadRecord.LatLongs.Select(x=> new PolylineLatLong()
                    {
                        ID = Guid.NewGuid().ToString(),
                        Longitude = x.Longitude,
                        Latitude = x.Latitude,
                        Order = x.Order,
                        PolylineID = id
                    }).ToList()
                });
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
        public async Task<IActionResult> Update([FromBody] PolylineModel uploadRecord)
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
                    polyline.Name = uploadRecord?.Name;
                    polyline.TypeID = uploadRecord.TypeID;
                    response.Data = await _polylineService.Update(polyline);
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
    }
}
