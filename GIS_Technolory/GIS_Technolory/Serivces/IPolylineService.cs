using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;
using System.Security.AccessControl;

namespace GIS_Technolory.Serivces
{
    public interface IPolylineService
    {
        Task<Polyline> Create(Polyline uploadRecord);

        Task<Polyline> Update(Polyline uploadRecord);

        Task<bool> Delete(string id);

        Task<IEnumerable<Polyline>> GetList(string name = null);

        Task<Polyline> Get(string id);
    }

    public class PolylineService : BaseService, IPolylineService
    {
        public async Task<Polyline> Create(Polyline uploadRecord)
        {
            string typeName = string.Empty;
            typeName = _Context.TypePolylines.FirstOrDefault(x => x.ID.Equals(uploadRecord.TypeID)).Name;
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
                                                      <span>{typeName}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Length</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.CablineLength}</span>
                                                  </div>
                                               </div>
                                              <div class='swal2-actions'>
                                                  <button onclick='EditPolyline(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='DeletePolyline(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";


            EntityEntry<Polyline> record = await _Context.AddAsync(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result > 0)
                return record.Entity;
            else
                return null;
        }

        public async Task<bool> Delete(string id)
        {
            Polyline target = await _Context.Polylines.FirstOrDefaultAsync(x => x.ID.Equals(id));
            if (target is null)
                return false;
            else
            {
                _Context.Polylines.Remove(target);
                int result = await _Context.SaveChangesAsync();
                return result != 0;
            }
        }

        public async Task<Polyline> Get(string id)
        {
            return await _Context.Polylines.Include(x=>x.Type).FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<Polyline>> GetList(string name = null)
        {
            if (string.IsNullOrEmpty(name))
                return await _Context.Polylines.Include(x => x.Type).ToListAsync();
            else
            {
                string search = name.Trim().ToLower();
                return await _Context.Polylines.Include(x => x.Type).Where(x => x.Name.ToLower().Contains(search)).ToListAsync();
            }
        }

        public async Task<Polyline> Update(Polyline uploadRecord)
        {
            string typeName = string.Empty;
            typeName = _Context.TypePolylines.FirstOrDefault(x => x.ID.Equals(uploadRecord.TypeID)).Name;
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
                                                      <span>{typeName}</span>
                                                  </div>
                                               </div>
                                               <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Length</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.CablineLength}</span>
                                                  </div>
                                               </div>
                                              <div class='swal2-actions'>
                                                  <button onclick='EditPolyline(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='DeletePolyline(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";

            EntityEntry<Polyline> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}
