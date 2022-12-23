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

        public int NumPoints { get; set; }

        public double Length { get; set; }

        public double Area { get; set; }
    }
}
