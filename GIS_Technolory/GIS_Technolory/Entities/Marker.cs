using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GIS_Technolory.Entities
{
    public class Marker
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [MaxLength(250)]
        public string Name { get; set; }
        [Required]
        [Column(TypeName = "decimal(18, 0)")]
        public decimal Long { get; set; }
        [Required]
        [Column(TypeName = "decimal(18, 0)")]
        public decimal Lat { get; set; }
        public string PopupContent { get; set; }
        [Required]
        [MaxLength(50)]
        public string TypeID { get; set; }
        public virtual TypeMarker Type { get; set; }
    }
}
