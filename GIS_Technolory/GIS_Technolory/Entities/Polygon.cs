using GIS_Technolory.Constants;
using GIS_Technolory.Helpers;
using GIS_Technolory.Models;
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
            get => LatLngs.Count;
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
            get => SphericalUtil.ComputeSignedArea(LatLngs);
        }

        [NotMapped]
        public List<LatLongModel> LatLngs
        {
            get => Location.Coordinates.Distinct().Select(x => new LatLongModel()
            {
                lat = x.CoordinateValue.Y,
                lng = x.CoordinateValue.X
            }).ToList();
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

        [NotMapped]
        public string Type
        {
            get => IsRectangle ? TypePolygonConst.Rectangle : TypePolygonConst.Polygon;
        }

        [NotMapped]
        public string MapLayer
        {
            get => IsRectangle ? MapLayerPolygonConst.Rectangle : MapLayerPolygonConst.Polygon;
        }

        [NotMapped]
        public string AreaDisplay
        {
            get
            {
                if (Area >= 1000000)
                {
                    double kilometer = Area / 1000000;
                    return string.Format("{0:0.00}km²", kilometer);
                }
                else
                {
                    return string.Format("{0:0.00}m²", Area);
                }
            }
        }

        [NotMapped]
        public string LengthDisplay
        {
            get
            {
                if (Length >= 1000)
                {
                    double kilometer = Length / 1000;
                    return string.Format("{0:0.00}km", kilometer);
                }
                else
                {
                    return string.Format("{0:0.00}m", Length);
                }
            }
        }
    }
}
