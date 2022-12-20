namespace GIS_Technolory.Models
{
    public class PolylineModel
    {
        public string ID { get; set; }

        public string Name { get; set; }

        public string CablineLength { get; set; }

        public string TypeID { get; set; }

        public string PopupContent { get; set; }

        public string CentralLatlng { get; set; }

        public virtual List<PolylineLatLongModel> LatLongs { get; set; }
    }

    public class PolylineLatLongModel
    {
        public string ID { get; set; }

        public decimal Latitude { get; set; }

        public decimal Longitude { get; set; }

        public int Order { get; set; }
    }
}
