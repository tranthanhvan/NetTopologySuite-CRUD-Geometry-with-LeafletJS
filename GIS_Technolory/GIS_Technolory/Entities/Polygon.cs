using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GIS_Technolory.Entities
{
    public class Polygon
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [MaxLength(250)]
        [Required]
        public string Name { get; set; }
        public string PopupContent { get; set; }

        [NotMapped]
        public bool IsRectangle
        {
            get => Location.IsRectangle;
        }

        /// <summary>
        ///  Returns the count of this 
        /// </summary>
        [NotMapped]
        public int NumPoints
        {
            get => Location.NumPoints;
        }

        /// <summary>
        /// Returns the perimeter of this
        /// </summary>
        [NotMapped]
        public double Length
        {
            get => Location.Length;
        }

        [NotMapped]
        /// <summary>
        /// Returns the area of this 
        /// </summary>
        public double Area
        {
            get => Location.Area;
        }

        [MaxLength(10)]
        public string Color { get; set; }

        public int WeightBorder { get; set; }

        public float Opacity { get; set; }

        public NetTopologySuite.Geometries.Polygon Location { get; set; }

        /// <summary>
        /// Color inside Circle
        /// </summary>
        [MaxLength(10)]
        public string FillColor { get; set; }

        public float FillOpacity { get; set; }
    }
}
