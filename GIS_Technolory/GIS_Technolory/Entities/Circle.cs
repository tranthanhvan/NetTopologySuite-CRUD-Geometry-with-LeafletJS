using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using NetTopologySuite.Geometries;
using GIS_Technolory.Constants;

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

        public double Radius { get; set; } = double.NaN;

        /// <summary>
        /// Color inside Circle
        /// </summary>
        [MaxLength(10)]
        public string FillColor { get; set; }

        public float FillOpacity { get; set; }

        [NotMapped]
        public bool IsCircleMarker
        {
            get => double.IsNaN(Radius) || Radius == 0;
        }

        [NotMapped]
        public string Perimeter
        {
            get
            {
                if (double.IsNaN(Radius) || Radius == 0)
                    return string.Empty;
                else
                {
                    double perimeter= Math.PI * 2 * Radius;
                    if(perimeter >= 1000)
                    {
                        double Kilometer = Radius / 1000;
                        return string.Format("{0:0.00}km", Kilometer);
                    }
                    else
                    {
                        return string.Format("{0:0.00}m", perimeter);
                    }
                    
                }
                
            }
        }

        [NotMapped]
        public string DisplayRadius
        {
            get
            {
                if (double.IsNaN(Radius) || Radius == 0)
                    return string.Empty;
                else if (Radius >= 1000)
                {
                    double Kilometer = Radius / 1000;
                    return string.Format("{0:0.00}km", Kilometer);
                }
                else
                    return string.Format("{0:0.00}m", Radius);
            }
        }

        [NotMapped]
        public string Area
        {
            get
            {
                if (double.IsNaN(Radius) || Radius == 0)
                    return string.Empty;
                else
                {
                    double area = Math.PI * Radius * Radius;
                    if (area >= 1000000)
                    {
                        double kilometer = area / 1000000;
                        return string.Format("{0:0.00}km²", kilometer);
                    }
                    else
                    {
                        return string.Format("{0:0.00}m²", area);
                    }
                }
            }
        }
        [NotMapped]
        public string Type
        {
            get => IsCircleMarker ? TypeCircleConst.CircleMarker : TypeCircleConst.Circle;
        }

        [NotMapped]
        public string MapLayer
        {
            get => IsCircleMarker ? MapLayerCircleConst.CircleMarker : MapLayerCircleConst.Circle;
        }
    }
}
