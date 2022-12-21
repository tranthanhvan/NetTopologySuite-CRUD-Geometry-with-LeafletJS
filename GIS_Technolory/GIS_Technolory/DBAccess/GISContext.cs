using GIS_Technolory.Entities;
using GIS_Technolory.Serivces;
using Microsoft.EntityFrameworkCore;

namespace GIS_Technolory.DBAccess
{
    public class GISContext : DbContext
    {
        public GISContext()
        {

        }
        public GISContext(DbContextOptions<GISContext> options): base(options)
        {
            Database.Migrate();
        }

        public DbSet<Marker> Markers { get; set; }
        public DbSet<TypeMarker> TypeMarkers { get; set; }
        public DbSet<Polyline> Polylines { get; set; }
        public DbSet<TypePolyline> TypePolylines { get; set; }
        public DbSet<PolylineLatLong> PolylineLatLongs { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options) => options.UseSqlServer(ConnectionService.connstring, x => x.UseNetTopologySuite()).LogTo(Console.WriteLine, LogLevel.Information);
    }
}
