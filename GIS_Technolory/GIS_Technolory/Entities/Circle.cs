using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using NetTopologySuite.Geometries;

namespace GIS_Technolory.Entities
{
    public class Circle
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

        [MaxLength(10)]
        public string ColorCircle { get; set; }

        public int WeightBorder { get; set; }

        public float Opacity { get; set; }

        public int Radius { get; set; }
    }
}
