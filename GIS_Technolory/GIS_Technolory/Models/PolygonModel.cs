using GIS_Technolory.Constants;
using System.ComponentModel.DataAnnotations.Schema;

namespace GIS_Technolory.Models
{
    public class PolygonModel
    {
        public string ID { get; set; }

        public string Name { get; set; }

        public string PopupContent { get; set; }

        public string Color { get; set; }

        public int WeightBorder { get; set; }

        public float Opacity { get; set; }

        public bool IsRectangle { get; set; }

        public int NumPoints
        {
            get => LatLongs.Count;
        }

        public string LengthDisplay { get; set; }

        public string AreaDisplay { get; set; }

        public string FillColor { get; set; }

        public float FillOpacity { get; set; }

        public List<LatLongModel> LatLongs { get; set; }

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

        public bool IsValid
        {
            get => LatLongs != null && LatLongs.Distinct().Count() >= 3;
        }
    }
}
