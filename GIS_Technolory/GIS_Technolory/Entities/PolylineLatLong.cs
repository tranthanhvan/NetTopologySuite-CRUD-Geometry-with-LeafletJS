using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using NetTopologySuite.Geometries;

namespace GIS_Technolory.Entities
{
    public class PolylineLatLong
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [NotMapped]
        public double Latitude { get => Location.Y; }
        [NotMapped]
        public double Longitude { get => Location.X; }

        [Required]
        public Point Location { get; set; }

        public int Order { get; set; }

        [Required]
        [MaxLength(50)]
        public string PolylineID { get; set; }
        [ForeignKey("PolylineID")]
        public virtual Polyline Polyline { get; set; }
    }
}
