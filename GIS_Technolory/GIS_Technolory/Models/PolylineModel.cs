namespace GIS_Technolory.Models
{
    public class PolylineModel
    {
        public string ID { get; set; }

        public string Name { get; set; }

        public string CablineLength { get; set; }

        public string TypeID { get; set; }

        public string PopupContent { get; set; }

        #region Infor type
        public string TypeName { get; set; }

        public string MapName { get; set; }

        public string ColorLine { get; set; }

        public int WeightLine { get; set; }
        #endregion

        public virtual List<LatLongModel> LatLongs { get; set; }
    } 
}
