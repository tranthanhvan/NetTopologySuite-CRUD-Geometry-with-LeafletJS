using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace GIS_Technolory.Serivces
{
    public interface ITypeMarkerService
    {
        Task<TypeMarker> Create(TypeMarker uploadRecord);

        Task<TypeMarker> Update(TypeMarker uploadRecord);

        Task<bool> Delete(string id);

        Task<IEnumerable<TypeMarker>> GetList();

        Task<TypeMarker> Get(string id);
    }

    public class TypeMarkerService : BaseService, ITypeMarkerService
    {
        public async Task<TypeMarker> Create(TypeMarker uploadRecord)
        {
            EntityEntry<TypeMarker> record = await _Context.AddAsync(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }

        public async Task<bool> Delete(string id)
        {
            TypeMarker target = await _Context.TypeMarkers.FirstOrDefaultAsync(x => x.ID.Equals(id));
            if(target is null)
                return false;
            else
            {
                _Context.TypeMarkers.Remove(target);
                int result = await _Context.SaveChangesAsync();
                return result != 0;
            }  
        }

        public async Task<TypeMarker> Get(string id)
        {
            return await _Context.TypeMarkers.FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<TypeMarker>> GetList()
        {
            return await _Context.TypeMarkers.ToListAsync();
        }

        public async Task<TypeMarker> Update(TypeMarker uploadRecord)
        {
            EntityEntry<TypeMarker> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}
