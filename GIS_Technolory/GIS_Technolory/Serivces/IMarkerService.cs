using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;
using Azure.Core;
using System.Security.AccessControl;

namespace GIS_Technolory.Serivces
{
    public interface IMarkerService
    {
        Task<Marker> Create(Marker uploadRecord);

        Task<Marker> Update(Marker uploadRecord);

        Task<bool> Delete(string id);

        Task<IEnumerable<Marker>> GetList(string name = null);

        Task<Marker> Get(string id);
    }

    public class MarkerService : BaseService, IMarkerService
    {
        public async Task<Marker> Create(Marker uploadRecord)
        {
            string typeName = string.Empty;
            typeName = _Context.TypeMarkers.FirstOrDefault(x => x.ID.Equals(uploadRecord.TypeID)).Name;
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
                                              <div class='swal2-actions'>
                                                  <button onclick='EditFromMap(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='Delete(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";
            EntityEntry<Marker> record = await _Context.AddAsync(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }

        public async Task<bool> Delete(string id)
        {
            Marker target = await _Context.Markers.FirstOrDefaultAsync(x => x.ID.Equals(id));
            if (target is null)
                return false;
            else
            {
                _Context.Markers.Remove(target);
                int result = await _Context.SaveChangesAsync();
                return result != 0;
            }
        }

        public async Task<Marker> Get(string id)
        {
            return await _Context.Markers.Include(x=>x.Type).FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<Marker>> GetList(string name = null)
        {
            if(string.IsNullOrEmpty(name))
                return await _Context.Markers.Include(x => x.Type).ToListAsync();
            else
            {
                string search = name.Trim().ToLower();
                return await _Context.Markers.Include(x=>x.Type).Where(x => x.Name.Contains(search)).ToListAsync();
            }
        }

        public async Task<Marker> Update(Marker uploadRecord)
        {
            string typeName = string.Empty;
            typeName = _Context.TypeMarkers.FirstOrDefault(x => x.ID.Equals(uploadRecord.TypeID)).Name;
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
                                              <div class='swal2-actions'>
                                                  <button onclick='EditFromMap(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='Delete(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";

            EntityEntry<Marker> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}
