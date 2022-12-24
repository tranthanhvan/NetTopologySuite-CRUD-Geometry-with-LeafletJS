using Microsoft.EntityFrameworkCore.Migrations;
using NetTopologySuite.Geometries;

#nullable disable

namespace GISTechnolory.Migrations
{
    /// <inheritdoc />
    public partial class AddCircleAndPolygon : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Circles",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    Location = table.Column<Point>(type: "geography", nullable: false),
                    PopupContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ColorCircle = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
                    WeightBorder = table.Column<int>(type: "int", nullable: false),
                    Opacity = table.Column<float>(type: "real", nullable: false),
                    Radius = table.Column<double>(type: "float", nullable: false),
                    FillColor = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
                    FillOpacity = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Circles", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "Polygons",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    PopupContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Color = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
                    WeightBorder = table.Column<int>(type: "int", nullable: false),
                    Opacity = table.Column<float>(type: "real", nullable: false),
                    Location = table.Column<Polygon>(type: "geography", nullable: true),
                    FillColor = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
                    FillOpacity = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Polygons", x => x.ID);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Circles");

            migrationBuilder.DropTable(
                name: "Polygons");
        }
    }
}
