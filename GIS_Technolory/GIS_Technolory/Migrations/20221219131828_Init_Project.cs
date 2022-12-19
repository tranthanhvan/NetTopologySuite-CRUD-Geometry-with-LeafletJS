using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GISTechnolory.Migrations
{
    /// <inheritdoc />
    public partial class InitProject : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "TypeMarkers",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    MapName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Icon = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TypeMarkers", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "TypePolylines",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    MapName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Icon = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    ColorLine = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    WeightLine = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TypePolylines", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "Markers",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    Long = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
                    Lat = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
                    PopupContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TypeID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Markers", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Markers_TypeMarkers_TypeID",
                        column: x => x.TypeID,
                        principalTable: "TypeMarkers",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Polylines",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    CablineLength = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    TypeID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    PopupContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CentralLatlng = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Polylines", x => x.ID);
                    table.ForeignKey(
                        name: "FK_Polylines_TypePolylines_TypeID",
                        column: x => x.TypeID,
                        principalTable: "TypePolylines",
                        principalColumn: "ID");
                });

            migrationBuilder.CreateTable(
                name: "PolylineLatLongs",
                columns: table => new
                {
                    ID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Latitude = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
                    Longitude = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
                    Order = table.Column<int>(type: "int", nullable: false),
                    PolylineID = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
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
                name: "IX_Markers_TypeID",
                table: "Markers",
                column: "TypeID");

            migrationBuilder.CreateIndex(
                name: "IX_PolylineLatLongs_PolylineID",
                table: "PolylineLatLongs",
                column: "PolylineID");

            migrationBuilder.CreateIndex(
                name: "IX_Polylines_TypeID",
                table: "Polylines",
                column: "TypeID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Markers");

            migrationBuilder.DropTable(
                name: "PolylineLatLongs");

            migrationBuilder.DropTable(
                name: "TypeMarkers");

            migrationBuilder.DropTable(
                name: "Polylines");

            migrationBuilder.DropTable(
                name: "TypePolylines");
        }
    }
}
