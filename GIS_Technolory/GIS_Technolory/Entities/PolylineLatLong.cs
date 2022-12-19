using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace GIS_Technolory.Entities
{
    public class PolylineLatLong
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [Required]
        [Column(TypeName = "decimal(18, 0)")]
        public decimal Latitude { get; set; }
        [Required]
        [Column(TypeName = "decimal(18, 0)")]
        public decimal Longitude { get; set; }
        public int Order { get; set; }

        [Required]
        [MaxLength(50)]
        public string PolylineID { get; set; }
        [ForeignKey("PolylineID")]
        public virtual Polyline Polyline { get; set; }
    }
}
