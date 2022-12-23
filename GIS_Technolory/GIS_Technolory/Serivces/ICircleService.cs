using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;

namespace GIS_Technolory.Serivces
{
    public interface ICircleService
    {
        Task<Circle> Create(Circle uploadRecord);

        Task<Circle> Update(Circle uploadRecord);

        Task<bool> Delete(string id);

        Task<IEnumerable<Circle>> GetList(string name = null);

        Task<Circle> Get(string id);
    }

    public class CircleService : BaseService, ICircleService
    {
        public async Task<Circle> Create(Circle uploadRecord)
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
                                                      <span class='sp-pup-tittle-lf'>Radius</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Radius}</span>
                                                  </div>
                                               </div>
                                                <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Area</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Area}</span>
                                                  </div>
                                               </div>
                                              <div class='swal2-actions'>
                                                  <button onclick='EditCircle(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='DeleteCircle(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";
            EntityEntry<Circle> record = await _Context.AddAsync(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }

        public async Task<bool> Delete(string id)
        {
            Circle target = await _Context.Circles.FirstOrDefaultAsync(x => x.ID.Equals(id));
            if (target is null)
                return false;
            else
            {
                _Context.Circles.Remove(target);
                int result = await _Context.SaveChangesAsync();
                return result != 0;
            }
        }

        public async Task<Circle> Get(string id)
        {
            return await _Context.Circles.FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<Circle>> GetList(string name = null)
        {
            if (string.IsNullOrEmpty(name))
                return await _Context.Circles.ToListAsync();
            else
            {
                string search = name.Trim().ToLower();
                return await _Context.Circles.Where(x => x.Name.Contains(search)).ToListAsync();
            }
        }

        public async Task<Circle> Update(Circle uploadRecord)
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
                                                      <span class='sp-pup-tittle-lf'>Radius</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Radius}</span>
                                                  </div>
                                               </div>
                                                <div class='row row_padding'>
                                                  <div class='col-3 popup-title-lf'>
                                                      <span class='sp-pup-tittle-lf'>Area</span>
                                                  </div>
                                                  <div class='col-9 css_bg_view'>
                                                      <span>{uploadRecord.Area}</span>
                                                  </div>
                                               </div>
                                              <div class='swal2-actions'>
                                                  <button onclick='EditCircle(`{uploadRecord.ID}`)' class='swal2-confirm swal2-styled act-popup-leaflet'>Edit info</button>&nbsp;
                                                  <button onclick='DeleteCircle(`{uploadRecord.ID}`)' class='swal2-deny swal2-styled'>Delete</button>
                                              </div>
                                            </div>
                                          ";

            EntityEntry<Circle> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}
