using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;

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
            uploadRecord.PopupContent = "<b>Name : " + uploadRecord.Name + "</b><br>"
                                      + "<b>Type : " + typeName + "</b><br>";

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
            return await _Context.Polylines.FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<Polyline>> GetList(string name = null)
        {
            if (string.IsNullOrEmpty(name))
                return await _Context.Polylines.ToListAsync();
            else
            {
                string search = name.Trim().ToLower();
                return await _Context.Polylines.Include(x => x.Type).Include(x=>x.LatLongs).Where(x => x.Name.Contains(search)).ToListAsync();
            }
        }

        public async Task<Polyline> Update(Polyline uploadRecord)
        {
            string typeName = string.Empty;
            typeName = _Context.TypePolylines.FirstOrDefault(x => x.ID.Equals(uploadRecord.TypeID)).Name;
            uploadRecord.PopupContent = "<b>Name : " + uploadRecord.Name + "</b><br>"
                                      + "<b>Type : " + typeName + "</b><br>";

            EntityEntry<Polyline> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}
