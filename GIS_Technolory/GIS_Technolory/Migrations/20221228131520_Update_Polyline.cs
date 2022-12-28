using Microsoft.EntityFrameworkCore.Migrations;
using NetTopologySuite.Geometries;

#nullable disable

namespace GISTechnolory.Migrations
{
    /// <inheritdoc />
    public partial class UpdatePolyline : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PolylineLatLongs");

            migrationBuilder.DropColumn(
                name: "CentralLatlng",
                table: "Polylines");

            migrationBuilder.AddColumn<LineString>(
                name: "Location",
                table: "Polylines",
                type: "geography",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Location",
                table: "Polylines");

            migrationBuilder.AddColumn<string>(
                name: "CentralLatlng",
                table: "Polylines",
                type: "nvarchar(150)",
                maxLength: 150,
                nullable: true);

            migrationBuilder.CreateTable(
                name: "PolylineLatLongs",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    PolylineID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Location = table.Column<Point>(type: "geography", nullable: false),
                    Order = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PolylineLatLongs", x => x.ID);
                    table.ForeignKey(
                        name: "FK_PolylineLatLongs_Polylines_PolylineID",
                        column: x => x.PolylineID,
                        principalTable: "Polylines",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PolylineLatLongs_PolylineID",
                table: "PolylineLatLongs",
                column: "PolylineID");
        }
    }
}
