using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ParkBulvarProject.Migrations
{
    public partial class initial_v1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "aboutUsPages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Image = table.Column<string>(maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_aboutUsPages", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "admnConfig",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Username = table.Column<string>(maxLength: 255, nullable: true),
                    Password = table.Column<string>(maxLength: 255, nullable: true),
                    Role = table.Column<string>(maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_admnConfig", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "followers",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Email = table.Column<string>(maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_followers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "galleryImages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Image = table.Column<string>(maxLength: 255, nullable: true),
                    Queue = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_galleryImages", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "generalInfos",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Phone = table.Column<string>(maxLength: 30, nullable: true),
                    WorkHours = table.Column<string>(maxLength: 30, nullable: true),
                    HowToGo = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_generalInfos", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "homeSliderItems",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Image = table.Column<string>(nullable: true),
                    Queue = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_homeSliderItems", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "languages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Name = table.Column<string>(maxLength: 255, nullable: true),
                    Code = table.Column<string>(maxLength: 20, nullable: true),
                    Queue = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_languages", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "metaTags",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    TagName = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_metaTags", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "news",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    TitleImage = table.Column<string>(maxLength: 255, nullable: true),
                    dateTime = table.Column<DateTime>(nullable: false),
                    Queue = table.Column<int>(nullable: false),
                    Type = table.Column<byte>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_news", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "newsPages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Image = table.Column<string>(maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_newsPages", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "seoDescriptions",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Word = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_seoDescriptions", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "seoKeyWords",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Word = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_seoKeyWords", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "shopCategories",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    CoverImage = table.Column<string>(maxLength: 255, nullable: true),
                    Logo = table.Column<string>(nullable: true),
                    Queue = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_shopCategories", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "shops",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Image = table.Column<string>(maxLength: 255, nullable: true),
                    Logo = table.Column<string>(maxLength: 255, nullable: true),
                    Queue = table.Column<int>(nullable: false),
                    day1 = table.Column<string>(maxLength: 30, nullable: true),
                    day2 = table.Column<string>(maxLength: 30, nullable: true),
                    day3 = table.Column<string>(maxLength: 30, nullable: true),
                    day4 = table.Column<string>(maxLength: 30, nullable: true),
                    day5 = table.Column<string>(maxLength: 30, nullable: true),
                    day6 = table.Column<string>(maxLength: 30, nullable: true),
                    day7 = table.Column<string>(maxLength: 30, nullable: true),
                    Number = table.Column<string>(maxLength: 30, nullable: true),
                    Floor = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_shops", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "socialLinks",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Link = table.Column<string>(nullable: true),
                    Icon = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_socialLinks", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "aboutUsPageDictionaries",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Title = table.Column<string>(nullable: true),
                    Text = table.Column<string>(nullable: true),
                    AboutUspageId = table.Column<int>(nullable: false),
                    LanguageId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_aboutUsPageDictionaries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_aboutUsPageDictionaries_aboutUsPages_AboutUspageId",
                        column: x => x.AboutUspageId,
                        principalTable: "aboutUsPages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_aboutUsPageDictionaries_languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "languages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "newsDictionaries",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Title = table.Column<string>(nullable: true),
                    Text = table.Column<string>(nullable: true),
                    LanguageId = table.Column<int>(nullable: false),
                    NewsId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_newsDictionaries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_newsDictionaries_languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "languages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_newsDictionaries_news_NewsId",
                        column: x => x.NewsId,
                        principalTable: "news",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "newsImages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Image = table.Column<string>(maxLength: 255, nullable: true),
                    NewsId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_newsImages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_newsImages_news_NewsId",
                        column: x => x.NewsId,
                        principalTable: "news",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "newsPageDictionaries",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Title = table.Column<string>(nullable: true),
                    Text = table.Column<string>(nullable: true),
                    NewsPageId = table.Column<int>(nullable: false),
                    LanguageId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_newsPageDictionaries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_newsPageDictionaries_languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "languages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_newsPageDictionaries_newsPages_NewsPageId",
                        column: x => x.NewsPageId,
                        principalTable: "newsPages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "shopCategoryDictionaries",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Name = table.Column<string>(nullable: true),
                    ShopCategoryId = table.Column<int>(nullable: false),
                    LanguageId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_shopCategoryDictionaries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_shopCategoryDictionaries_languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "languages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_shopCategoryDictionaries_shopCategories_ShopCategoryId",
                        column: x => x.ShopCategoryId,
                        principalTable: "shopCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "subShopCategories",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Queue = table.Column<int>(nullable: false),
                    ShopCategoryId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_subShopCategories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_subShopCategories_shopCategories_ShopCategoryId",
                        column: x => x.ShopCategoryId,
                        principalTable: "shopCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "compaigns",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Image = table.Column<string>(maxLength: 255, nullable: true),
                    Type = table.Column<byte>(nullable: false),
                    IsCompleted = table.Column<byte>(nullable: false),
                    Queue = table.Column<int>(nullable: false),
                    ShopId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_compaigns", x => x.Id);
                    table.ForeignKey(
                        name: "FK_compaigns_shops_ShopId",
                        column: x => x.ShopId,
                        principalTable: "shops",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "shopDictionaries",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Name = table.Column<string>(maxLength: 255, nullable: true),
                    AboutText = table.Column<string>(nullable: true),
                    WorkHours = table.Column<string>(nullable: true),
                    ShopId = table.Column<int>(nullable: false),
                    LanguageId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_shopDictionaries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_shopDictionaries_languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "languages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_shopDictionaries_shops_ShopId",
                        column: x => x.ShopId,
                        principalTable: "shops",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ShopToCategories",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    ShopId = table.Column<int>(nullable: false),
                    ShopCategoryId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopToCategories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ShopToCategories_shopCategories_ShopCategoryId",
                        column: x => x.ShopCategoryId,
                        principalTable: "shopCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ShopToCategories_shops_ShopId",
                        column: x => x.ShopId,
                        principalTable: "shops",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ShopToSubCategories",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    ShopId = table.Column<int>(nullable: false),
                    SubShopCategoryId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShopToSubCategories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ShopToSubCategories_shops_ShopId",
                        column: x => x.ShopId,
                        principalTable: "shops",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ShopToSubCategories_subShopCategories_SubShopCategoryId",
                        column: x => x.SubShopCategoryId,
                        principalTable: "subShopCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "subShopCategoryDictionaries",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Name = table.Column<string>(maxLength: 255, nullable: true),
                    SubShopCategoryId = table.Column<int>(nullable: false),
                    LanguageId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_subShopCategoryDictionaries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_subShopCategoryDictionaries_languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "languages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_suategoryId",
                        column: x => x.SubShopCategoryId,
                        principalTable: "subShopCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "compaignDictionaries",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    Name = table.Column<string>(maxLength: 255, nullable: true),
                    Duration = table.Column<string>(maxLength: 255, nullable: true),
                    LanguageId = table.Column<int>(nullable: false),
                    CompaignId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_compaignDictionaries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_compaignDictionaries_compaigns_CompaignId",
                        column: x => x.CompaignId,
                        principalTable: "compaigns",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_compaignDictionaries_languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "languages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_aboutUsPageDictionaries_AboutUspageId",
                table: "aboutUsPageDictionaries",
                column: "AboutUspageId");

            migrationBuilder.CreateIndex(
                name: "IX_aboutUsPageDictionaries_LanguageId",
                table: "aboutUsPageDictionaries",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_compaignDictionaries_CompaignId",
                table: "compaignDictionaries",
                column: "CompaignId");

            migrationBuilder.CreateIndex(
                name: "IX_compaignDictionaries_LanguageId",
                table: "compaignDictionaries",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_compaigns_ShopId",
                table: "compaigns",
                column: "ShopId");

            migrationBuilder.CreateIndex(
                name: "IX_newsDictionaries_LanguageId",
                table: "newsDictionaries",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_newsDictionaries_NewsId",
                table: "newsDictionaries",
                column: "NewsId");

            migrationBuilder.CreateIndex(
                name: "IX_newsImages_NewsId",
                table: "newsImages",
                column: "NewsId");

            migrationBuilder.CreateIndex(
                name: "IX_newsPageDictionaries_LanguageId",
                table: "newsPageDictionaries",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_newsPageDictionaries_NewsPageId",
                table: "newsPageDictionaries",
                column: "NewsPageId");

            migrationBuilder.CreateIndex(
                name: "IX_shopCategoryDictionaries_LanguageId",
                table: "shopCategoryDictionaries",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_shopCategoryDictionaries_ShopCategoryId",
                table: "shopCategoryDictionaries",
                column: "ShopCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_shopDictionaries_LanguageId",
                table: "shopDictionaries",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_shopDictionaries_ShopId",
                table: "shopDictionaries",
                column: "ShopId");

            migrationBuilder.CreateIndex(
                name: "IX_ShopToCategories_ShopCategoryId",
                table: "ShopToCategories",
                column: "ShopCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_ShopToCategories_ShopId",
                table: "ShopToCategories",
                column: "ShopId");

            migrationBuilder.CreateIndex(
                name: "IX_ShopToSubCategories_ShopId",
                table: "ShopToSubCategories",
                column: "ShopId");

            migrationBuilder.CreateIndex(
                name: "IX_ShopToSubCategories_SubShopCategoryId",
                table: "ShopToSubCategories",
                column: "SubShopCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_subShopCategories_ShopCategoryId",
                table: "subShopCategories",
                column: "ShopCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_subShopCategoryDictionaries_LanguageId",
                table: "subShopCategoryDictionaries",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_subShopCategoryDictionaries_SubShopCategoryId",
                table: "subShopCategoryDictionaries",
                column: "SubShopCategoryId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "aboutUsPageDictionaries");

            migrationBuilder.DropTable(
                name: "admnConfig");

            migrationBuilder.DropTable(
                name: "compaignDictionaries");

            migrationBuilder.DropTable(
                name: "followers");

            migrationBuilder.DropTable(
                name: "galleryImages");

            migrationBuilder.DropTable(
                name: "generalInfos");

            migrationBuilder.DropTable(
                name: "homeSliderItems");

            migrationBuilder.DropTable(
                name: "metaTags");

            migrationBuilder.DropTable(
                name: "newsDictionaries");

            migrationBuilder.DropTable(
                name: "newsImages");

            migrationBuilder.DropTable(
                name: "newsPageDictionaries");

            migrationBuilder.DropTable(
                name: "seoDescriptions");

            migrationBuilder.DropTable(
                name: "seoKeyWords");

            migrationBuilder.DropTable(
                name: "shopCategoryDictionaries");

            migrationBuilder.DropTable(
                name: "shopDictionaries");

            migrationBuilder.DropTable(
                name: "ShopToCategories");

            migrationBuilder.DropTable(
                name: "ShopToSubCategories");

            migrationBuilder.DropTable(
                name: "socialLinks");

            migrationBuilder.DropTable(
                name: "subShopCategoryDictionaries");

            migrationBuilder.DropTable(
                name: "aboutUsPages");

            migrationBuilder.DropTable(
                name: "compaigns");

            migrationBuilder.DropTable(
                name: "news");

            migrationBuilder.DropTable(
                name: "newsPages");

            migrationBuilder.DropTable(
                name: "languages");

            migrationBuilder.DropTable(
                name: "subShopCategories");

            migrationBuilder.DropTable(
                name: "shops");

            migrationBuilder.DropTable(
                name: "shopCategories");
        }
    }
}
