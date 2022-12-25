using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;

namespace GIS_Technolory.Serivces
{
    public interface IPolygonService
    {
        Task<Polygon> Create(Polygon uploadRecord);

        Task<Polygon> Update(Polygon uploadRecord);

        Task<bool> Delete(string id);

        Task<IEnumerable<Polygon>> GetList(string name = null);

        Task<Polygon> Get(string id);
    }

    public class PolygonService : BaseService, IPolygonService
    {
        public async Task<Polygon> Create(Polygon uploadRecord)
        {
            uploadRecord.PopupContent = $@"<div style='width : 280px'>
                                              <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Name</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Name}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Type</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Type}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Number Points</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.NumPoints}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Length</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.LengthDisplay}</span>
                                                  </div>
                                               </div>
                                              <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Area</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.AreaDisplay}</span>
                                                  </div>
                                               </div>
                                              <div class='swal2-actions'>
                                                  <button onclick='EditPolygon(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='DeletePolygon(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";
            EntityEntry<Polygon> record = await _Context.AddAsync(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }

        public async Task<bool> Delete(string id)
        {
            Polygon target = await _Context.Polygons.FirstOrDefaultAsync(x => x.ID.Equals(id));
            if (target is null)
                return false;
            else
            {
                _Context.Polygons.Remove(target);
                int result = await _Context.SaveChangesAsync();
                return result != 0;
            }
        }

        public async Task<Polygon> Get(string id)
        {
            return await _Context.Polygons.FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<Polygon>> GetList(string name = null)
        {
            if (string.IsNullOrEmpty(name))
                return await _Context.Polygons.ToListAsync();
            else
            {
                string search = name.Trim().ToLower();
                return await _Context.Polygons.Where(x => x.Name.Contains(search)).ToListAsync();
            }
        }

        public async Task<Polygon> Update(Polygon uploadRecord)
        {
            uploadRecord.PopupContent = $@"<div style='width : 280px'>
                                              <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Name</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Name}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Type</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Type}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Number Points</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.NumPoints}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Length</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.LengthDisplay}</span>
                                                  </div>
                                               </div>
                                              <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Area</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.AreaDisplay}</span>
                                                  </div>
                                               </div>
                                              <div class='swal2-actions'>
                                                  <button onclick='EditPolygon(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='DeletePolygon(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";
            EntityEntry<Polygon> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}