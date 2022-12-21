using Microsoft.EntityFrameworkCore.Migrations;
using NetTopologySuite.Geometries;

#nullable disable

namespace GISTechnolory.Migrations
{
    /// <inheritdoc />
    public partial class UpdateEntities : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Latitude",
                table: "PolylineLatLongs");

            migrationBuilder.DropColumn(
                name: "Longitude",
                table: "PolylineLatLongs");

            migrationBuilder.DropColumn(
                name: "Lat",
                table: "Markers");

            migrationBuilder.DropColumn(
                name: "Long",
                table: "Markers");

            migrationBuilder.AddColumn<Point>(
                name: "Location",
                table: "PolylineLatLongs",
                type: "geography",
                nullable: false);

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Markers",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(250)",
                oldMaxLength: 250,
                oldNullable: true);

            migrationBuilder.AddColumn<Point>(
                name: "Location",
                table: "Markers",
                type: "geography",
                nullable: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Location",
                table: "PolylineLatLongs");

            migrationBuilder.DropColumn(
                name: "Location",
                table: "Markers");

            migrationBuilder.AddColumn<decimal>(
                name: "Latitude",
                table: "PolylineLatLongs",
                type: "decimal(18,0)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "Longitude",
                table: "PolylineLatLongs",
                type: "decimal(18,0)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Markers",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(250)",
                oldMaxLength: 250);

            migrationBuilder.AddColumn<decimal>(
                name: "Lat",
                table: "Markers",
                type: "decimal(18,0)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "Long",
                table: "Markers",
                type: "decimal(18,0)",
                nullable: false,
                defaultValue: 0m);
        }
    }
}
