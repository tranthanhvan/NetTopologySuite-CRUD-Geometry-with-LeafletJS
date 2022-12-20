using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;

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
            uploadRecord.PopupContent = "<b>Name : " + uploadRecord.Name + "</b><br>"
                                      + "<b>Type : " + typeName + "</b><br>"
                                      + "<b>Latitude : " + uploadRecord.Lat + ", Longitude : " + uploadRecord.Long + "</b></br>";

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
            return await _Context.Markers.FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<Marker>> GetList(string name = null)
        {
            if(string.IsNullOrEmpty(name))
                return await _Context.Markers.ToListAsync();
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
            uploadRecord.PopupContent = "<b>Name : " + uploadRecord.Name + "</b><br>"
                                      + "<b>Type : " + typeName + "</b><br>"
                                      + "<b>Latitude : " + uploadRecord.Lat + ", Longitude : " + uploadRecord.Long + "</b></br>";

            EntityEntry<Marker> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}
