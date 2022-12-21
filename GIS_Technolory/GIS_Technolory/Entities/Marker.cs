using Microsoft.EntityFrameworkCore.Metadata.Internal;
using NetTopologySuite.Geometries;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GIS_Technolory.Entities
{
    public class Marker
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [MaxLength(250)]
        [Required]
        public string Name { get; set; }

        [NotMapped]
        public double Latitude { get => Location.Y; }
        [NotMapped]
        public double Longitude { get => Location.X; }

        [Required]
        public Point Location { get; set; }
        public string PopupContent { get; set; }
        [Required]
        [MaxLength(50)]
        public string TypeID { get; set; }
        public virtual TypeMarker Type { get; set; }
    }
}
