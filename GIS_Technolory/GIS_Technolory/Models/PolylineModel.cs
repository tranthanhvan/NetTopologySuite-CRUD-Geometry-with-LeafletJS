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

        #region Infor type
        public string TypeName { get; set; }

        public string MapName { get; set; }

        public string ColorLine { get; set; }

        public int WeightLine { get; set; }
        #endregion

        public virtual List<PolylineLatLongModel> LatLongs { get; set; }

        public virtual List<LatLongModel> OnlyLatLongs
        {
            get => LatLongs.Select(x => new LatLongModel() { lat = x.Latitude, lng = x.Longitude }).ToList();
        }
    } 

    public class PolylineLatLongModel
    {
        public string ID { get; set; }

        public double Latitude { get; set; }

        public double Longitude { get; set; }

        public int Order { get; set; }
    }
}
