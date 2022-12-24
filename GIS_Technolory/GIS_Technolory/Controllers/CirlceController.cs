using GIS_Technolory.Constants;
using GIS_Technolory.Entities;
using GIS_Technolory.Helpers;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;

namespace GIS_Technolory.Controllers
{
    public class CircleController : Controller
    {
        private readonly ICircleService _CircleService;

        public CircleController(ICircleService CircleService)
        {
            _CircleService = CircleService;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CircleModel uploadRecord)
        {
            var response = new Response<Circle>();
            try
            {
                response.Data = await _CircleService.Create(new Circle()
                {
                    ID = Guid.NewGuid().ToString(),
                    Name = uploadRecord.Name,
                    ColorCircle = uploadRecord.ColorCircle,
                    WeightBorder = uploadRecord.WeightBorder,
                    Opacity = uploadRecord.Opacity,
                    Radius = uploadRecord.Radius,
                    FillColor = uploadRecord.FillColor,
                    FillOpacity = uploadRecord.FillOpacity,
                    Location = new NetTopologySuite.Geometries.Point(uploadRecord.Longitude, uploadRecord.Latitude) { SRID = 4326 }
                });
                response.Success = response.Data != null;
                response.Message = "Create Circle is successful";
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        [HttpPost]
        public async Task<IActionResult> UpdateInfor([FromBody] CircleModel uploadRecord)
        {
            var response = new Response<object>();
            try
            {
                Circle circle = await _CircleService.Get(uploadRecord.ID);
                if (circle is null)
                {
                    response.Success = false;
                    response.Message = "Target is not found in databases";
                }
                else
                {
                    circle.Name = uploadRecord.Name;
                    circle.ColorCircle = uploadRecord.ColorCircle;
                    circle.WeightBorder = uploadRecord.WeightBorder;
                    circle.Opacity = uploadRecord.Opacity;
                    circle.FillColor = uploadRecord.FillColor;
                    circle.FillOpacity = uploadRecord.FillOpacity;
                    response.Data = await _CircleService.Update(circle);
                    response.Success = response.Data != null;
                    response.Message = "Update infor Circle is successful";
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
        public async Task<IActionResult> UpdateLocation([FromBody] CircleModel uploadRecord)
        {
            var response = new Response<object>();
            try
            {
                Circle circle = await _CircleService.Get(uploadRecord.ID);

                if (circle is null)
                {
                    response.Success = false;
                    response.Message = "Circle is not found in databases";
                }
                else
                {
                    circle.Location = new NetTopologySuite.Geometries.Point(uploadRecord.Longitude, uploadRecord.Latitude) { SRID = 4326 };
                    if (!circle.IsCircleMarker)
                        circle.Radius = uploadRecord.Radius;

                    response.Data = await _CircleService.Update(circle);
                    response.Success = response.Data != null;
                    response.Message = "Update Location Circle is successful";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message + ex.InnerException;
            }
            return Ok(response);
        }


        public async Task<IActionResult> DeleteCircle(string id)
        {
            var response = new Response<Circle>();
            try
            {
                var Circle = await _CircleService.Get(id);
                if (Circle is null)
                {
                    response.Success = false;
                    response.Message = "Circle is not found in databases";
                }
                else
                {
                    response.Data = Circle;
                    response.Success = await _CircleService.Delete(id);
                    response.Message = "Delete Circle is successful";
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
        public async Task<IActionResult> GetCircle([FromBody] CircleModel input)
        {
            var response = new Response<string>();
            try
            {
                var circle = await _CircleService.Get(input.ID);

                CircleModel modelResult;
                if (circle is null)
                {
                    modelResult = new CircleModel()
                    {
                        Radius = input.Radius,
                        Latitude = input.Latitude,
                        Longitude = input.Longitude,
                        ColorCircle = input.ColorCircle ?? CircleDefaultConst.DefaultColorCircle,
                        WeightBorder = input.WeightBorder == 0 ? CircleDefaultConst.DefaultWeightBorder : input.WeightBorder,
                        Opacity = CircleDefaultConst.DefaultOpacity,
                        FillColor = input.FillColor ?? CircleDefaultConst.DefaultFillColorCircle,
                        FillOpacity = CircleDefaultConst.DefaultFillOpacity
                    };
                }
                else
                {
                    modelResult = new CircleModel()
                    {
                        ID = circle.ID,
                        Name = circle.Name,
                        Radius = circle.Radius,
                        Latitude = circle.Latitude,
                        Longitude = circle.Longitude,
                        ColorCircle = circle.ColorCircle,
                        WeightBorder = circle.WeightBorder,
                        Opacity = circle.Opacity,
                        FillColor = circle.FillColor,
                        FillOpacity = circle.FillOpacity
                    };
                }
                response.Data = await this.RenderViewAsync("_DetailCircle", modelResult, true);
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
