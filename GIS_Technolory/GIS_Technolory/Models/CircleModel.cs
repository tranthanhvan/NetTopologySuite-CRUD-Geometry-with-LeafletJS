using GIS_Technolory.Constants;

namespace GIS_Technolory.Models
{
    public class CircleModel
    {
        public string ID { get; set; }

        public string Name { get; set; }

        public double Latitude { get; set; }

        public double Longitude { get; set; }

        public string PopupContent { get; set; }

        public string ColorCircle { get; set; }

        public int WeightBorder { get; set; }

        public float Opacity { get; set; }

        public double Radius { get; set; }

        public string FillColor { get; set; }

        public float FillOpacity { get; set; }

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

        public string Area
        {
            get
            {
                if (double.IsNaN(Radius) || Radius == 0)
                    return string.Empty;
                else
                {
                    double area = Math.PI * Radius * Radius;
                    if (area >= 1000)
                    {
                        double kilometer = area / 1000;
                        return string.Format("{0:0.00}km²", kilometer);
                    }
                    else
                    {
                        return string.Format("{0:0.00}m²", area);
                    }
                }
            }
        }

        public bool IsCircleMarker
        {
            get => double.IsNaN(Radius) || Radius == 0;
        }

        public string MapLayer
        {
            get => IsCircleMarker ? MapLayerCircleConst.CircleMarker : MapLayerCircleConst.Circle;
        }

        public string MapLayerName
        {
            get => IsCircleMarker ? TypeCircleConst.CircleMarker : TypeCircleConst.Circle;
        }
    }
}
