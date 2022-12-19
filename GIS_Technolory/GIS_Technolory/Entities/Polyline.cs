using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GIS_Technolory.Entities
{
    public class Polyline
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [MaxLength(250)]
        [Required]
        public string Name { get; set; }
        [MaxLength(30)]
        public string CablineLength { get; set; }
        [MaxLength(50)]
        public string TypeID { get; set; }
        public string PopupContent { get; set; }
        [MaxLength(150)]
        public string CentralLatlng { get; set; }

        public virtual List<PolylineLatLong> LatLongs { get; set; }

        [ForeignKey("TypeID")]
        public virtual TypePolyline Type { get; set; }
    }
}
