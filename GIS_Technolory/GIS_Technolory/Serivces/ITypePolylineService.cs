using GIS_Technolory.Entities;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;

namespace GIS_Technolory.Serivces
{
    public interface ITypePolylineService
    {
        Task<TypePolyline> Create(TypePolyline uploadRecord);

        Task<TypePolyline> Update(TypePolyline uploadRecord);

        Task<bool> Delete(string id);

        Task<IEnumerable<TypePolyline>> GetList();

        Task<TypePolyline> Get(string id);
    }

    public class TypePolylineService : BaseService, ITypePolylineService
    {
        public async Task<TypePolyline> Create(TypePolyline uploadRecord)
        {
            EntityEntry<TypePolyline> record = await _Context.AddAsync(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }

        public async Task<bool> Delete(string id)
        {
            TypePolyline target = await _Context.TypePolylines.FirstOrDefaultAsync(x => x.ID.Equals(id));
            if (target is null)
                return false;
            else
            {
                _Context.TypePolylines.Remove(target);
                int result = await _Context.SaveChangesAsync();
                return result != 0;
            }
        }

        public async Task<TypePolyline> Get(string id)
        {
            return await _Context.TypePolylines.FirstOrDefaultAsync(x => x.ID.Equals(id));
        }

        public async Task<IEnumerable<TypePolyline>> GetList()
        {
            return await _Context.TypePolylines.ToListAsync();
        }

        public async Task<TypePolyline> Update(TypePolyline uploadRecord)
        {
            EntityEntry<TypePolyline> record = _Context.Update(uploadRecord);
            int result = await _Context.SaveChangesAsync();
            if (result == 1)
                return record.Entity;
            else
                return null;
        }
    }
}
