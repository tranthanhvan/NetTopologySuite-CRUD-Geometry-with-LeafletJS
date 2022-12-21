namespace GIS_Technolory.Models
{
    public class MarkerModel
    {
        public string ID { get; set; }

        public string Name { get; set; }

        public double Long { get; set; }

        public double Lat { get; set; }

        public string PopupContent { get; set; }

        public string TypeID { get; set; }
        public string TypeName { get; set; }
        public string MapName { get; set; }

        public string IconType { get; set; }
    }
}
