using System.ComponentModel.DataAnnotations;

namespace GIS_Technolory.Entities
{
    public class TypeMarker
    {
        [Key]
        [MaxLength(50)]
        public string ID { get; set; }
        [MaxLength(250)]
        [Required]
        public string Name { get; set; }
        [Required]
        [MaxLength(100)]
        public string MapName { get; set; }
        [MaxLength(250)]
        public string Icon { get; set; }
    }
}
