using GIS_Technolory.Models;
using NetTopologySuite.Geometries;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GIS_Technolory.Entities
{
    public class Polyline
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [MaxLength(250)]
        [Required]
        public string Name { get; set; }
        [MaxLength(30)]
        public string CablineLength { get; set; }
        [MaxLength(50)]
        public string TypeID { get; set; }
        public string PopupContent { get; set; }

        [NotMapped]
        public List<LatLongModel> LatLongs => Location.Coordinates.Select(x => new LatLongModel() { lat = x.Y, lng = x.X }).ToList();

        [NotMapped]
        public double Latitude => Location.Centroid.Y;

        [NotMapped]
        public double Longitude => Location.Centroid.X;

        [ForeignKey("TypeID")]
        public virtual TypePolyline Type { get; set; }

        public LineString Location { get; set; }
    }
}
