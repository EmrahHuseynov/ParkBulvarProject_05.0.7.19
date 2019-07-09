using Microsoft.EntityFrameworkCore.Migrations;

namespace ParkBulvarProject.Migrations
{
    public partial class initial_v2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Link",
                table: "homeSliderItems",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Link",
                table: "homeSliderItems");
        }
    }
}
