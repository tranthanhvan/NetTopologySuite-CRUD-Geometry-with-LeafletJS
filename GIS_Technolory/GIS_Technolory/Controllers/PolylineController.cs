﻿using GIS_Technolory.Entities;
using GIS_Technolory.Helpers;
using GIS_Technolory.Models;
using GIS_Technolory.Response;
using GIS_Technolory.Serivces;
using Microsoft.AspNetCore.Mvc;
using NetTopologySuite.Geometries;

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
                    TypeID = uploadRecord.TypeID,
                    Location = new LineString(uploadRecord.LatLongs.Select(m => new NetTopologySuite.Geometries.Coordinate
                    {
                        X = m.lng,
                        Y = m.lat
                    }).ToArray())
                    {
                        SRID = 4326
                    }
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
            var response = new Response<object>();
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
                    polyline.Name = uploadRecord.Name;
                    polyline.TypeID = uploadRecord.TypeID;
                    await _polylineService.Update(polyline);

                    polyline = await _polylineService.Get(uploadRecord.ID);

                    response.Data = new
                    {
                        Polyline = new PolylineModel()
                        {
                            ID = polyline.ID,
                            Name = polyline.Name,
                            PopupContent = polyline.PopupContent,
                            CablineLength = polyline.CablineLength,
                            TypeID = polyline.TypeID,
                            TypeName = polyline.Type.Name,
                            MapName = polyline.Type.MapName,
                            ColorLine = polyline.Type.ColorLine,
                            WeightLine = polyline.Type.WeightLine,
                            LatLongs = polyline.LatLongs
                        },
                        OldMapLayer = oldMapName
                    };
                    response.Success = response.Data != null;
                    response.Message = "Update info Polyline is successful";
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
                            LatLongs = input.LatLongs
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
                            LatLongs = polyline.LatLongs
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

        public async Task<IActionResult> DeletePolyline(string id)
        {
            var response = new Response<PolylineModel>();
            try
            {
                var polyline = await _polylineService.Get(id);
                if (polyline is null)
                {
                    response.Success = false;
                    response.Message = "Polyline is not found in databases";
                }
                else
                {
                    response.Data = new PolylineModel()
                    {
                        ID = polyline.ID,
                        Name = polyline.Name,
                        PopupContent = polyline.PopupContent,
                        CablineLength = polyline.CablineLength,
                        TypeID = polyline.TypeID,
                        TypeName = polyline.Type.Name,
                        MapName = polyline.Type.MapName,
                        ColorLine = polyline.Type.ColorLine,
                        WeightLine = polyline.Type.WeightLine,
                        LatLongs = polyline.LatLongs
                    };
                    response.Success = await _polylineService.Delete(id);
                    response.Message = "Delete Polyline is successful";
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
        public async Task<IActionResult> UpdateLocation([FromBody] PolylineModel uploadRecord)
        {
            var response = new Response<PolylineModel>();
            try
            {
                Polyline polyline = await _polylineService.Get(uploadRecord.ID);
                if (polyline is null)
                {
                    response.Success = false;
                    response.Message = "Polyline is not found in databases";
                }
                else
                {
                    if(uploadRecord.LatLongs.Count <= 1)
                    {
                        response.Success = false;
                        response.Message = "Latlong input is invalid (<= 1 couple)";
                    }
                    else
                    {
                        polyline.Location = new LineString(uploadRecord.LatLongs.Select(m => new NetTopologySuite.Geometries.Coordinate
                        {
                            X = m.lng,
                            Y = m.lat
                        }).ToArray())
                        {
                            SRID = 4326
                        };
                        polyline.CablineLength = uploadRecord.CablineLength;
                        await _polylineService.Update(polyline);
                        response.Data = new PolylineModel()
                        {
                            ID = polyline.ID,
                            Name = polyline.Name,
                            PopupContent = polyline.PopupContent,
                            CablineLength = polyline.CablineLength,
                            TypeID = polyline.TypeID,
                            TypeName = polyline.Type.Name,
                            MapName = polyline.Type.MapName,
                            ColorLine = polyline.Type.ColorLine,
                            WeightLine = polyline.Type.WeightLine,
                            LatLongs = polyline.LatLongs
                        };
                        response.Success = true;
                        response.Message = "Update Location polyline is successful";
                        response.Success = true;
                    }
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
