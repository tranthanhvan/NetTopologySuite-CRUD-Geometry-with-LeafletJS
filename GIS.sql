USE [GIS]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/31/2022 11:53:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Circles]    Script Date: 12/31/2022 11:53:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Circles](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Location] [geography] NOT NULL,
	[PopupContent] [nvarchar](max) NULL,
	[ColorCircle] [nvarchar](10) NULL,
	[WeightBorder] [int] NOT NULL,
	[Opacity] [real] NOT NULL,
	[Radius] [float] NOT NULL,
	[FillColor] [nvarchar](10) NULL,
	[FillOpacity] [real] NOT NULL,
 CONSTRAINT [PK_Circles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markers]    Script Date: 12/31/2022 11:53:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markers](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[PopupContent] [nvarchar](max) NULL,
	[TypeID] [nvarchar](50) NOT NULL,
	[Location] [geography] NOT NULL,
 CONSTRAINT [PK_Markers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Polygons]    Script Date: 12/31/2022 11:53:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Polygons](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[PopupContent] [nvarchar](max) NULL,
	[Color] [nvarchar](10) NULL,
	[WeightBorder] [int] NOT NULL,
	[Opacity] [real] NOT NULL,
	[Location] [geography] NULL,
	[FillColor] [nvarchar](10) NULL,
	[FillOpacity] [real] NOT NULL,
 CONSTRAINT [PK_Polygons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Polylines]    Script Date: 12/31/2022 11:53:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Polylines](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CablineLength] [nvarchar](30) NULL,
	[TypeID] [nvarchar](50) NULL,
	[PopupContent] [nvarchar](max) NULL,
	[Location] [geography] NULL,
 CONSTRAINT [PK_Polylines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMarkers]    Script Date: 12/31/2022 11:53:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMarkers](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MapName] [nvarchar](100) NOT NULL,
	[Icon] [nvarchar](250) NULL,
 CONSTRAINT [PK_TypeMarkers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePolylines]    Script Date: 12/31/2022 11:53:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePolylines](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MapName] [nvarchar](100) NOT NULL,
	[Icon] [nvarchar](250) NULL,
	[ColorLine] [nvarchar](30) NULL,
	[WeightLine] [int] NOT NULL,
 CONSTRAINT [PK_TypePolylines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221219131828_Init_Project', N'7.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221221142948_UpdateEntities', N'7.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221224132809_AddCircleAndPolygon', N'7.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221228131520_Update_Polyline', N'7.0.1')
GO
INSERT [dbo].[Circles] ([ID], [Name], [Location], [PopupContent], [ColorCircle], [WeightBorder], [Opacity], [Radius], [FillColor], [FillOpacity]) VALUES (N'0079c9dc-e61b-45a0-908a-b97d166441c7', N'TT Kim bài', 0xE6100000010C551678994BDA34400100000830715A40, N'<div style=''width : 300px''>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Name</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>TT Kim bài</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Type</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Radius</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>814.17m</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Perimeter</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>5.12km</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Area</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>2.08km²</span>
                                    </div>
                                </div>
                                             <div class=''swal2-actions''>
                                                 <button onclick=''EditCircle(`0079c9dc-e61b-45a0-908a-b97d166441c7`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                 <button onclick=''DeleteCircle(`0079c9dc-e61b-45a0-908a-b97d166441c7`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                             </div>
                                           </div>', N'#ab61f5', 2, 0.5, 814.16808441746537, N'#abb8ff', 0.5)
INSERT [dbo].[Circles] ([ID], [Name], [Location], [PopupContent], [ColorCircle], [WeightBorder], [Opacity], [Radius], [FillColor], [FillOpacity]) VALUES (N'45ecd091-9fe0-4532-96af-5ce3e21b13ab', N'vong xuyen con rong', 0xE6100000010C76E0BA44FCF73440000000A43A705A40, N'<div style=''width : 300px''>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Name</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>vong xuyen con rong</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Type</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Radius</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>110.68m</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Perimeter</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>695.45m</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Area</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>38487.31m²</span>
                                    </div>
                                </div>
                                             <div class=''swal2-actions''>
                                                 <button onclick=''EditCircle(`45ecd091-9fe0-4532-96af-5ce3e21b13ab`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                 <button onclick=''DeleteCircle(`45ecd091-9fe0-4532-96af-5ce3e21b13ab`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                             </div>
                                           </div>', N'#2c4bf9', 2, 0.5, 110.683744112683, N'#abb8ff', 0.5)
INSERT [dbo].[Circles] ([ID], [Name], [Location], [PopupContent], [ColorCircle], [WeightBorder], [Opacity], [Radius], [FillColor], [FillOpacity]) VALUES (N'620ab6f4-0276-4801-a97a-88eb86dfa1f8', N'circle marker', 0xE6100000010CE58C5EE6F9FF344001000020EB705A40, N'<div style=''width : 300px''>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Name</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>circle marker</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Type</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle Marker</span>
                                                </div>
                                             </div>
                                             
                                             <div class=''swal2-actions''>
                                                 <button onclick=''EditCircle(`620ab6f4-0276-4801-a97a-88eb86dfa1f8`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                 <button onclick=''DeleteCircle(`620ab6f4-0276-4801-a97a-88eb86dfa1f8`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                             </div>
                                           </div>', N'#12f32c', 2, 0.5, 0, N'#6e7ab9', 0.5)
INSERT [dbo].[Circles] ([ID], [Name], [Location], [PopupContent], [ColorCircle], [WeightBorder], [Opacity], [Radius], [FillColor], [FillOpacity]) VALUES (N'6e47aa4e-de1d-4dfe-b5aa-5ca4fa312874', N'Phu do village', 0xE6100000010C50C2F96D970235400100005C09715A40, N'<div style=''width : 300px''>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Name</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Phu do village</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Type</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Radius</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>454.76m</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Perimeter</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>2.86km</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Area</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>649688.80m²</span>
                                    </div>
                                </div>
                                             <div class=''swal2-actions''>
                                                 <button onclick=''EditCircle(`6e47aa4e-de1d-4dfe-b5aa-5ca4fa312874`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                 <button onclick=''DeleteCircle(`6e47aa4e-de1d-4dfe-b5aa-5ca4fa312874`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                             </div>
                                           </div>', N'#2c4bf9', 2, 0.5, 454.75528348327128, N'#abb8ff', 0.5)
INSERT [dbo].[Circles] ([ID], [Name], [Location], [PopupContent], [ColorCircle], [WeightBorder], [Opacity], [Radius], [FillColor], [FillOpacity]) VALUES (N'933d7398-da75-48ef-a9bb-aa3fb1030f01', N'KDT Van khe', 0xE6100000010C5EF9DFEA41F9344000000014CA705A40, N'<div style=''width : 300px''>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Name</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>KDT Van khe</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Type</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Radius</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>323.81m</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Perimeter</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>2.03km</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Area</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>329399.24m²</span>
                                    </div>
                                </div>
                                             <div class=''swal2-actions''>
                                                 <button onclick=''EditCircle(`933d7398-da75-48ef-a9bb-aa3fb1030f01`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                 <button onclick=''DeleteCircle(`933d7398-da75-48ef-a9bb-aa3fb1030f01`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                             </div>
                                           </div>', N'#2c4bf9', 2, 0.5, 323.80709667599467, N'#99f3ff', 0.5)
INSERT [dbo].[Circles] ([ID], [Name], [Location], [PopupContent], [ColorCircle], [WeightBorder], [Opacity], [Radius], [FillColor], [FillOpacity]) VALUES (N'aabeafb7-124e-4f5d-983c-42c8427dc568', N'Cam phu', 0xE6100000010FDC29BF930D0335400100001843D55A40000000000000F8FF000000000000F8FF, N'<div style=''width : 300px''>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Name</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Cam phu</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Type</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Radius</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>1.21km</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Perimeter</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>7.63km</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Area</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>4.63km²</span>
                                    </div>
                                </div>
                                             <div class=''swal2-actions''>
                                                 <button onclick=''EditCircle(`aabeafb7-124e-4f5d-983c-42c8427dc568`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                 <button onclick=''DeleteCircle(`aabeafb7-124e-4f5d-983c-42c8427dc568`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                             </div>
                                           </div>', N'#2c4bf9', 2, 0.5, 1214.4328749149138, N'#cdeece', 0.5)
INSERT [dbo].[Circles] ([ID], [Name], [Location], [PopupContent], [ColorCircle], [WeightBorder], [Opacity], [Radius], [FillColor], [FillOpacity]) VALUES (N'd8390520-18ef-4bf7-92c7-e5888a9a7d67', N'Circle', 0xE6100000010F2C7037DFD0F63440010000BCDC6A5A40000000000000F8FF000000000000F8FF, N'<div style=''width : 300px''>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Name</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                                <div class=''col-3 popup-title-lf''>
                                                    <span class=''sp-pup-tittle-lf''>Type</span>
                                                </div>
                                                <div class=''col-9 css_bg_view''>
                                                    <span>Circle</span>
                                                </div>
                                             </div>
                                             <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Radius</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>347.72m</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Perimeter</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>2.18km</span>
                                    </div>
                                </div>
                                <div class=''row row_padding''>
                                    <div class=''col-3 popup-title-lf''>
                                        <span class=''sp-pup-tittle-lf''>Area</span>
                                    </div>
                                    <div class=''col-9 css_bg_view''>
                                        <span>379848.87m²</span>
                                    </div>
                                </div>
                                             <div class=''swal2-actions''>
                                                 <button onclick=''EditCircle(`d8390520-18ef-4bf7-92c7-e5888a9a7d67`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                 <button onclick=''DeleteCircle(`d8390520-18ef-4bf7-92c7-e5888a9a7d67`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                             </div>
                                           </div>', N'#e2fd1c', 2, 0.5, 347.72065041546853, N'#b9a2a2', 0.5)
GO
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'054f3103-ee79-4be7-a329-c94c008a0e22', N'My Company', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>My Company</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker-Off</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`054f3103-ee79-4be7-a329-c94c008a0e22`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`054f3103-ee79-4be7-a329-c94c008a0e22`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'd7e1abdd-a8d5-44ef-a51b-667443f86c77', 0xE6100000010C7403BB388607354001000040756C5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'0ae54653-4453-4731-b3ff-436ad03e01c9', N'ha vi', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ha vi</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`0ae54653-4453-4731-b3ff-436ad03e01c9`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`0ae54653-4453-4731-b3ff-436ad03e01c9`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CE6BE8569AE01354001004066FA715A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'0fad8708-fe8b-4f64-91d2-874f15dd9c25', N'ho cau dong quan', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ho cau dong quan</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Earth</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`0fad8708-fe8b-4f64-91d2-874f15dd9c25`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`0fad8708-fe8b-4f64-91d2-874f15dd9c25`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'96f7ba4d-aac5-4579-914f-145c846f5aa5', 0xE6100000010CB9269EF677FA344001004041726A5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'11795140-8df8-436b-96b8-e76515dae62a', N'hihihi', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>hihihi</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`11795140-8df8-436b-96b8-e76515dae62a`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`11795140-8df8-436b-96b8-e76515dae62a`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CD4247B3C9708354000000000F4695A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'12ceb2c6-c905-42d1-94ff-0a777007e35a', N'gh', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>gh</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`12ceb2c6-c905-42d1-94ff-0a777007e35a`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`12ceb2c6-c905-42d1-94ff-0a777007e35a`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C9D19F91D5C0935400100008E02735A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'1acf327d-378a-4ff8-968a-1dab20bd9164', N'than duong huy company', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>than duong huy company</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`1acf327d-378a-4ff8-968a-1dab20bd9164`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`1acf327d-378a-4ff8-968a-1dab20bd9164`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C2CFEEDA1B5013540000000ADD1CF5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'1b513c51-5de6-4618-b70a-2161c0d64fb5', N'ga vanh dai', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ga vanh dai</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Earth</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`1b513c51-5de6-4618-b70a-2161c0d64fb5`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`1b513c51-5de6-4618-b70a-2161c0d64fb5`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'96f7ba4d-aac5-4579-914f-145c846f5aa5', 0xE6100000010C3193823CCDFD34400100009096735A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'1d6874b5-c9ab-4bae-aab8-819d9b9bde77', N'Markr 1', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Markr 1</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`1d6874b5-c9ab-4bae-aab8-819d9b9bde77`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`1d6874b5-c9ab-4bae-aab8-819d9b9bde77`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C912CCF4515F93440010000802A595A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'264cc180-62e9-4ca8-a232-2f0527803fc3', N'thuy khue', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>thuy khue</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`264cc180-62e9-4ca8-a232-2f0527803fc3`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`264cc180-62e9-4ca8-a232-2f0527803fc3`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C784544FD460B354000000060A7745A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'3839a0e1-f480-4b81-9bbb-b8da696d7548', N'fdghd', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>fdghd</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`3839a0e1-f480-4b81-9bbb-b8da696d7548`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`3839a0e1-f480-4b81-9bbb-b8da696d7548`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C5941F570C9083540010000FAF0725A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'38cade44-f9a4-45a9-a3b2-19197ee47ccd', N'UBND Xa Xuan Duong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>UBND Xa Xuan Duong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`38cade44-f9a4-45a9-a3b2-19197ee47ccd`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`38cade44-f9a4-45a9-a3b2-19197ee47ccd`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010F32F7579039CD3440010040DAA66F5A40000000000000F8FF000000000000F8FF)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'3ba584ca-7c84-42a8-acae-84d3f0fd1c8a', N'House Hung Dm', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>House Hung Dm</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>DM Hùng (CEO)</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`3ba584ca-7c84-42a8-acae-84d3f0fd1c8a`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`3ba584ca-7c84-42a8-acae-84d3f0fd1c8a`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'19b91ece-3bb6-4734-933e-3130aca61bf0', 0xE6100000010C4F47464DC9C4344000008035CB735A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'3cec773a-8d82-44eb-bb4f-a805624f95a9', N'NN Bảo an', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>NN Bảo an</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`3cec773a-8d82-44eb-bb4f-a805624f95a9`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`3cec773a-8d82-44eb-bb4f-a805624f95a9`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CA6F7AD34C0DE3440010000B813745A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'4f4ad378-fb59-4260-a205-1ae6d5e6886b', N'Chùa Đăng', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Chùa Đăng</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Superman</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`4f4ad378-fb59-4260-a205-1ae6d5e6886b`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`4f4ad378-fb59-4260-a205-1ae6d5e6886b`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'467872e6-d468-40f0-b477-0ce6858547ee', 0xE6100000010C1D3FE7D79BC5344002004065EE6F5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'5959d603-c0fb-4fff-9d4a-8aee81f029b2', N'diem cam trai song boi', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>diem cam trai song boi</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`5959d603-c0fb-4fff-9d4a-8aee81f029b2`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`5959d603-c0fb-4fff-9d4a-8aee81f029b2`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CEB2AA47CEDD63440010000801F555A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'5da387b0-f5a9-4ec2-ac9e-30e29e15f7e1', N'mien dong thanh minh', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>mien dong thanh minh</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Earth</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`5da387b0-f5a9-4ec2-ac9e-30e29e15f7e1`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`5da387b0-f5a9-4ec2-ac9e-30e29e15f7e1`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'96f7ba4d-aac5-4579-914f-145c846f5aa5', 0xE6100000010CF148C3CF99F53440010000EE406B5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'5e200e52-d0be-471b-86fe-635cef97ce33', N'Vòng xuyến CP', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Vòng xuyến CP</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`5e200e52-d0be-471b-86fe-635cef97ce33`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`5e200e52-d0be-471b-86fe-635cef97ce33`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CA8CCCB6D6D01354001008075C2D25A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'662027bc-f248-4473-85fa-a9fd3fc10fa1', N'hahaha', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>hahaha</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`662027bc-f248-4473-85fa-a9fd3fc10fa1`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`662027bc-f248-4473-85fa-a9fd3fc10fa1`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CD83527175703354001000040F3755A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'6dea16ea-933b-40e2-8720-08e7a1d5d7ac', N'Hùng ĐM', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Hùng ĐM</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Superman</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`6dea16ea-933b-40e2-8720-08e7a1d5d7ac`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`6dea16ea-933b-40e2-8720-08e7a1d5d7ac`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'467872e6-d468-40f0-b477-0ce6858547ee', 0xE6100000010CB1B305184CF93440010040FEE2695A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'769f023f-c04c-47c5-9be0-c30ad808b7ab', N'Cho la ca', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Cho la ca</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker-Off</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`769f023f-c04c-47c5-9be0-c30ad808b7ab`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`769f023f-c04c-47c5-9be0-c30ad808b7ab`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'd7e1abdd-a8d5-44ef-a51b-667443f86c77', 0xE6100000010C87B82A210CFA34400100008C9E6F5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'778036ae-e794-464a-8943-746ab4c94b6f', N'nha nghi ngoc anh ', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>nha nghi ngoc anh </span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`778036ae-e794-464a-8943-746ab4c94b6f`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`778036ae-e794-464a-8943-746ab4c94b6f`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CCE286290FDFA34400100406AB26A5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'77c3ea4e-c1e2-4c33-b561-423cc18cceea', N'vuon thu thien duong bao son', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>vuon thu thien duong bao son</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`77c3ea4e-c1e2-4c33-b561-423cc18cceea`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`77c3ea4e-c1e2-4c33-b561-423cc18cceea`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CF89CFD1BD7FF3440010000CFC56E5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'7d451917-b3ec-41a8-b5fb-e26abcea25f4', N'Cho phuong yen', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Cho phuong yen</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`7d451917-b3ec-41a8-b5fb-e26abcea25f4`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`7d451917-b3ec-41a8-b5fb-e26abcea25f4`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CEA82F3A5C6FC344001000080F1645A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'81192e2e-9dec-46a2-aa74-489a7c0377d7', N'hai san ngu vuong hai duong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>hai san ngu vuong hai duong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`81192e2e-9dec-46a2-aa74-489a7c0377d7`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`81192e2e-9dec-46a2-aa74-489a7c0377d7`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CE916EAF5FFF03440000080639A945A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'92eb9a6f-ef80-44e9-9bdb-5624dbf166e2', N'tap hoa dung quynh', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>tap hoa dung quynh</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`92eb9a6f-ef80-44e9-9bdb-5624dbf166e2`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`92eb9a6f-ef80-44e9-9bdb-5624dbf166e2`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CBAD5AA47CFFA344001008008A76A5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'99715fcc-d9cd-453a-bc38-963815b86bb0', N'hehehe', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>hehehe</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`99715fcc-d9cd-453a-bc38-963815b86bb0`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`99715fcc-d9cd-453a-bc38-963815b86bb0`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C505880DDF4FA344001008025996A5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'a5e1622b-9234-472b-a423-c37632af03a4', N'dm hung2', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>dm hung2</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>DM Hùng (CEO)</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`a5e1622b-9234-472b-a423-c37632af03a4`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`a5e1622b-9234-472b-a423-c37632af03a4`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'19b91ece-3bb6-4734-933e-3130aca61bf0', 0xE6100000010C40AC1A4D06F2344000000080C7615A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'a833a3ba-8361-4e77-b140-b72aea63d7ed', N'vinh yen', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>vinh yen</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`a833a3ba-8361-4e77-b140-b72aea63d7ed`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`a833a3ba-8361-4e77-b140-b72aea63d7ed`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C7B6BB7C4F94F3540010000A0FC665A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'ab932802-7437-4575-ad8d-a93c09014e9c', N'Ngã tư tổng hợp', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Ngã tư tổng hợp</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`ab932802-7437-4575-ad8d-a93c09014e9c`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`ab932802-7437-4575-ad8d-a93c09014e9c`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C6273CAACA70235400100C090A3D25A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'af6369a1-cba3-487b-9169-8b2876ebee30', N'ben xe bus', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ben xe bus</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`af6369a1-cba3-487b-9169-8b2876ebee30`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`af6369a1-cba3-487b-9169-8b2876ebee30`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CE37302FCB0FC34400100009BBF6C5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'b6243aa4-2f39-4c3f-a8b7-16db88d3aef5', N'cay xang an phu', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>cay xang an phu</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`b6243aa4-2f39-4c3f-a8b7-16db88d3aef5`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`b6243aa4-2f39-4c3f-a8b7-16db88d3aef5`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C1D50711E83A0344000000010F16B5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'bd72eb92-67c5-4828-8dc3-ba91904f3d26', N'Truong thpt Maya', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Truong thpt Maya</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`bd72eb92-67c5-4828-8dc3-ba91904f3d26`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`bd72eb92-67c5-4828-8dc3-ba91904f3d26`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CAC784106D8F5344000008018C15E5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'c18d9681-2783-43df-91fc-2e74b28a3d41', N'UBND Xa cao duong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>UBND Xa cao duong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`c18d9681-2783-43df-91fc-2e74b28a3d41`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`c18d9681-2783-43df-91fc-2e74b28a3d41`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C7A89942A3FD034400200C0C08A705A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'c3e9ec8e-90a3-432c-a89d-e7ea0eb59641', N'ngoc ha', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ngoc ha</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`c3e9ec8e-90a3-432c-a89d-e7ea0eb59641`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`c3e9ec8e-90a3-432c-a89d-e7ea0eb59641`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C96606DBEF109354001000078E9745A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'c41a39a5-28d3-43f2-9dbf-66e16ad2f129', N'UBND xa tuy lai', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>UBND xa tuy lai</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`c41a39a5-28d3-43f2-9dbf-66e16ad2f129`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`c41a39a5-28d3-43f2-9dbf-66e16ad2f129`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CFC43F3A2F1C53440010080D8B76B5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'c440c2e8-69fc-4ca5-8035-6c61b35404b8', N'Tx Son tay', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Tx Son tay</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`c440c2e8-69fc-4ca5-8035-6c61b35404b8`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`c440c2e8-69fc-4ca5-8035-6c61b35404b8`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CBD61447DF2203540000000805F605A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'ca57cf73-b17c-4cdf-834d-677d51c2ec46', N'quynh chi ca fe', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>quynh chi ca fe</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`ca57cf73-b17c-4cdf-834d-677d51c2ec46`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`ca57cf73-b17c-4cdf-834d-677d51c2ec46`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C5C339D51E2FA3440000000FDAA6A5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'cd798698-6465-452b-8d2c-eba97cd9ab3f', N'Superman', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Superman</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Airplane</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`cd798698-6465-452b-8d2c-eba97cd9ab3f`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`cd798698-6465-452b-8d2c-eba97cd9ab3f`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'd089f45a-256c-4307-808a-7a25ecc1a10b', 0xE6100000010CD3C0DD2515E334400100000051675A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'd1d2756d-0d2e-471c-85e9-9e3c030c5deb', N'cay bidv thien duong bao son', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>cay bidv thien duong bao son</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`d1d2756d-0d2e-471c-85e9-9e3c030c5deb`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`d1d2756d-0d2e-471c-85e9-9e3c030c5deb`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010CB29CA930A7FF34400100000AF46E5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'd2cf022b-8fad-4700-b855-2894fdbfde9d', N'cao dang fpt polytechnick', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>cao dang fpt polytechnick</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`d2cf022b-8fad-4700-b855-2894fdbfde9d`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`d2cf022b-8fad-4700-b855-2894fdbfde9d`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C3B445B98C60935400100C0CCCA6F5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'd40cd57f-d65f-4ad9-bbd1-4e45adc25a8e', N'xuong noi that', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>xuong noi that</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`d40cd57f-d65f-4ad9-bbd1-4e45adc25a8e`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`d40cd57f-d65f-4ad9-bbd1-4e45adc25a8e`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010FE21FEE2AEDE834400100C049EA695A40000000000000F8FF000000000000F8FF)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'd5f88f3e-20ce-4bb1-ba69-31ea5d2ed01d', N'hehe', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>hehe</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Airplane</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`d5f88f3e-20ce-4bb1-ba69-31ea5d2ed01d`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`d5f88f3e-20ce-4bb1-ba69-31ea5d2ed01d`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'd089f45a-256c-4307-808a-7a25ecc1a10b', 0xE6100000010F3F4EEEE525FA344001008057496A5A40000000000000F8FF000000000000F8FF)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'eb9f5df1-6253-45dc-851b-bc6bdd4f2b71', N'Xe bus TH', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Xe bus TH</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Marker</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`eb9f5df1-6253-45dc-851b-bc6bdd4f2b71`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`eb9f5df1-6253-45dc-851b-bc6bdd4f2b71`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'0bd5e367-9727-462f-b231-1ce64378a673', 0xE6100000010C4600FBED4AEF34400100402022725A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'fb05f612-44c1-4cd1-b131-ceb7f4e46b63', N'GMS2', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>GMS2</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Earth</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`fb05f612-44c1-4cd1-b131-ceb7f4e46b63`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`fb05f612-44c1-4cd1-b131-ceb7f4e46b63`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'96f7ba4d-aac5-4579-914f-145c846f5aa5', 0xE6100000010C896522417EE3344001000000106C5A40)
INSERT [dbo].[Markers] ([ID], [Name], [PopupContent], [TypeID], [Location]) VALUES (N'fb19bd19-017e-49f6-a279-456a61f41466', N'My house HN', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>My house HN</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>House</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditFromMap(`fb19bd19-017e-49f6-a279-456a61f41466`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''Delete(`fb19bd19-017e-49f6-a279-456a61f41466`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'29cea33d-5dbc-49c5-85bb-4c1b5fd9733b', 0xE6100000010CB37043EADDEE34400100C041AD725A40)
GO
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'02098a4c-a37d-496b-afb2-17f38e3355ab', N'My House', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>My House</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>43.58m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>98.35m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`02098a4c-a37d-496b-afb2-17f38e3355ab`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`02098a4c-a37d-496b-afb2-17f38e3355ab`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010406000000ADA04F249E0335400100808690D55A40F2AD392C9C0335400100806791D55A4027AD6EEEA00335400100C0CC91D55A40C2E19F5CA50335400100C02692D55A40C6FAA82EA60335400100002491D55A40ADA04F249E0335400100808690D55A4001000000020000000001000000FFFFFFFF0000000003, N'#fd1212', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'04d5f416-273c-4fd3-8c5a-d4a42c77742f', N'Nghia trang liet si', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Nghia trang liet si</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>154.48m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1469.01m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`04d5f416-273c-4fd3-8c5a-d4a42c77742f`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`04d5f416-273c-4fd3-8c5a-d4a42c77742f`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010405000000B989ACC1FECF344001000094B3705A40920CCB02EDCF3440000080ADB0705A400390332EE1CF34400100C02BB6705A40285B42CAF0CF34400100008EB9705A40B989ACC1FECF344001000094B3705A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'0f1b00ff-7e36-431a-a6d7-1af1887e41a6', N'Thanh Ha Lake', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Thanh Ha Lake</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>59</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1.93km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>94721.07m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`0f1b00ff-7e36-431a-a6d7-1af1887e41a6`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`0f1b00ff-7e36-431a-a6d7-1af1887e41a6`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001043C000000B6AA2F6862EF34400100401938725A40B840DD045BEF3440000080A034725A40C1AC462752EF34400000006E32725A40EEBECDF149EF34400000001432725A402D43456841EF34400100004F33725A405D0517D73AEF34400100C03235725A40BE89DA8639EF34400100809D37725A404FD6081840EF34400100C0B33B725A40ED5D54BC41EF3440010040F43E725A400E54983643EF34400100404845725A40552DCD5C44EF3440010040124E725A406F46DCB044EF34400100805255725A40213A89E242EF34400100807C58725A401CD13CA93BEF3440010080A65B725A406D1E51FD30EF34400200405D5D725A402087793A21EF3440010040E45D725A40293854D30FEF3440010000AC5D725A408C664055F9EE34400100C0275E725A4014FCB2CBE5EE3440010080495E725A4013B63C55CDEE3440010080FD5E725A4069E89B0CB4EE34400100802A5F725A40EDE4BE73A4EE34400100803860725A40E1C5D08694EE34400100C07E61725A402A071FEA85EE34400100C03262725A40CFD80DEA6FEE34400100406861725A40AE89317B60EE34400200C0E95F725A40DA083EF955EE3440010080B15F725A4063360B274AEE3440010080BF60725A40711C019244EE3440010040B163725A400278C24143EE34400100C09766725A404BCBC4AC48EE3440010080B669725A401877557756EE3440000080C16D725A40495DFD2A6AEE34400100C0D474725A403C120FC07AEE3440010040207C725A4080AF07D78AEE34400100005884725A40F5755A51A2EE34400100C0738A725A401AC0246CBCEE34400100403B8E725A40B9FD1DADCCEE34400100005D8E725A408035A8A1CFEE34400100C07E8E725A4030DC3001E3EE3440010080658D725A409C461E18F3EE34400200406B8B725A40915DD173FCEE34400200C08488725A40E362886400EF34400100C07984725A40F7D0757BFAEE3440010000C67F725A40F1C19423F0EE34400100800C7D725A405ACE0EC4E7EE34400100C0A477725A40EE13B760EBEE34400000007B70725A401F7798B8F5EE3440010040A86C725A40C07128D703EF34400100C0486A725A4044407AA510EF34400100407E69725A40C2EC6D102CEF3440000000086B725A400F42357F3BEF34400100C0A26A725A40C691C65C4FEF34400200407068725A40580DA1B459EF34400100C0D564725A4021FADC9960EF3440020040B75D725A4070E7A70865EF34400100009655725A402AFBD40466EF3440010000FC49725A40FE63A0DE64EF34400200C0BB42725A404F4E73E263EF34400100C0F139725A40B6AA2F6862EF34400100401938725A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'19407c81-5cd8-47db-b672-ada1241483dc', N'Van quan lake', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Van quan lake</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>8</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>637.43m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>25527.18m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`19407c81-5cd8-47db-b672-ada1241483dc`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`19407c81-5cd8-47db-b672-ada1241483dc`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000104090000004E80FD7C0AFA34400000806FA1725A407E99D2A7FFF934400100003AA2725A405E21B1F5EBF934400100002CA1725A40A2020DFC93F934400100003CAF725A40D6DB55AAA8F9344001000014B9725A40E4B367C2CDF9344001000079BD725A404A781F84DDF93440010000E4BB725A405ECCF20F26FA344001000012AC725A404E80FD7C0AFA34400000806FA1725A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'1ff11bc2-510e-42ac-acc1-8fc068e761bf', N'Ho nam thuong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Ho nam thuong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>122</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>2.43km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>141898.00m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`1ff11bc2-510e-42ac-acc1-8fc068e761bf`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`1ff11bc2-510e-42ac-acc1-8fc068e761bf`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001047B000000B29E0BA00CA23440010000FA94655A40625800AA09A234400100800294655A406050695C07A234400100802193655A40C3C7231204A234400100404393655A40C895B5A7FDA13440010040E992655A40254E46C3E8A134400100806A95655A40841D358FEBA134400000801E96655A405B858017E9A13440010000BC96655A403DC2A27FE3A13440010000CA97655A404DDAF245DBA134400100C09F98655A404B44067BCBA134400000003299655A40BCA7C9E9C3A13440010040E398655A40354A0101BDA13440010040F199655A409950A0CAB3A134400200C0F998655A40D944E31790A134400000009293655A40275DB8F78CA134400200408191655A40F2B70A3986A134400100009590655A4032C65C7A7FA13440010080548D655A40C1E0A8BC6BA134400100C08F8A655A4087C058F766A134400100000689655A40B42A8C0E60A134400200C0FA88655A40794A513654A134400100004487655A404AE207EC50A13440010080B784655A4045CB924350A134400000008582655A40EE27251651A134400100807F80655A4001BDFFAE49A134400100008E79655A40CBD4FEEC43A13440010080C675655A400B6AEE343BA134400100407273655A40B5EDA61F28A134400100C07A72655A409E5C373023A13440010040BE72655A40669D1FBF1EA134400200C02072655A4033B9975E15A13440000000A571655A40E3CE3C1E0FA134400200C09971655A40A0E24787FCA03440010000E072655A40F1503791F9A034400100C08873655A408E9CE3CBF4A034400100404573655A401628DB47E9A034400000800474655A402646377FE5A03440010000CF74655A40EC14CE0AE2A03440010080F375655A4080DC184CDBA03440010000B075655A4029D7CC01D8A034400100004874655A4099A17483D7A034400100008672655A405E5FF65FD5A03440010040B071655A4083F7D835D5A03440010040A270655A401D1F0B0FD4A034400100C0236F655A407E443DE8D2A034400100006D6D655A405E5FF65FD5A034400100005F6C655A40AC0EB852D9A03440010040896B655A40A3CF6496DEA034400100C0EB6A655A40EB3482C0DEA03440010080A569655A40BA9CE1B0D6A034400100801068655A40FB2E31B4D5A034400100C03A67655A4051F50806CAA03440010080AB63655A408F725809C9A034400100C04E62655A40ECA07EAECAA03440010080735F655A4009485550CDA03440010040E45B655A409709FDD1CCA03440010040F559655A40FC48935DC9A034400100C01C58655A4021CCE519C4A034400000803057655A400A48B3F0B6A034400200403358655A40981C706587A034400000003E60655A40353E254677A034400200C05966655A4047B7137B67A03440010040D26D655A40FE134F8863A03440010040FC70655A40B2C34ECF67A034400100008375655A40C8C64D5D70A034400100401279655A404A24C34C75A034400100008E79655A40AE63E87F7FA03440010080DF7A655A407CADA13E86A034400100006C7D655A40E4702ADD89A03440010080C882655A40BA2F841486A034400100006386655A40F7D8F8038BA034400100C0518C655A402BDE4FC98FA03440010080438F655A409B6143DC96A034400100C0A88F655A4066D5025DA3A034400100C07892655A4083149DF1A9A034400100C0D292655A40BA9CE1B0D6A034400200405491655A40303E22E2FAA034400100007691655A40D96BF3CA01A134400100408F92655A40D72B5F010BA134400200C02C93655A40D20C5D0A15A134400100804899655A4001BD074E1AA134400100807599655A4077CD29FC25A13440010040869B655A4046201E8A2EA134400200C04D9F655A4074A9199338A1344001008004A1655A405D1ED10A3BA13440010000EEA0655A409DFF1A553EA13440010080DA9D655A40818BE1C243A134400100401B9D655A40EAA5BDDF47A13440010000A89B655A408618A9B454A134400200C0079A655A401C3FD55863A13440010080299A655A40D2BE7C5E6EA134400100C0319D655A406667AFF972A13440010040FC9D655A40F5A8D12280A13440010040649F655A40AADCF5C781A13440010040F9A0655A40B5E2E7D17EA1344001004042A3655A40EE87AEBB78A1344001004050A4655A4099AC408E79A134400100C090A7655A4001370EF374A134400200C033AA655A40CCDFE94D73A134400100807CB0655A406B25839B75A1344001000047B1655A4034E0E0567DA134400100407FB1655A40E856FB0489A1344001008030B1655A40754E998F92A1344002004014B3655A40C5623D959DA13440010040A9B4655A406FE2BCF5A6A13440010080E1B4655A40B242ADC0B6A134400100C0DEB3655A40C1FC41D0BEA134400100C0B1B3655A4060B82D5EC7A134400100C0DEB3655A40FDED6374CDA13440010080B4B4655A40AFD7B039D2A134400100802DB4655A40627EB276D9A1344001004071B0655A40A65DACFBD7A134400100C011AE655A40AFD7B039D2A1344001004058AB655A4088FD261FDAA134400100C071A8655A40627EB276D9A1344001008096A5655A40229EE64FD8A13440010000BEA3655A40B5FAE78CDFA13440010080A7A3655A40E0A09D41E9A1344001000029A2655A40DAB692C5F4A134400100C03F9E655A40E936A436F9A13440010040FF9A655A4028D70C26FEA13440000000D898655A40B29E0BA00CA23440010000FA94655A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'2a665f6e-1a5b-444f-af9d-207f218f9cfd', N'Nghia trang Thon dao nguyen', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Nghia trang Thon dao nguyen</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>426.51m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>9513.70m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`2a665f6e-1a5b-444f-af9d-207f218f9cfd`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`2a665f6e-1a5b-444f-af9d-207f218f9cfd`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001070600000047D8A111EFFF3440010080291B6C5A408730449BCCFF3440010080341F6C5A405ECF898BD0FF344001000094216C5A403C4CB69CE1FF34400100803B366C5A4067E8475B070035400100004A2F6C5A4047D8A111EFFF3440010080291B6C5A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'2b324e08-a9ae-473c-844c-a8be8febe71e', N'Royal city', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Royal city</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>11</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1.55km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>128768.76m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`2b324e08-a9ae-473c-844c-a8be8febe71e`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`2b324e08-a9ae-473c-844c-a8be8febe71e`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040C00000024A77D1C570135400100003230745A401344F0DA3C0135400100007C22745A4091F767BB440135400000002A29745A4042EF3B0A31013540010000C01A745A4007CB3894CE0035400000000A0D745A40D819360E70003540010000AC1F745A4059583B7815003540010000462B745A408CB0F41D6C003540010000A652745A409DCCFE21AB0035400100001A48745A40CEEB04480C013540010000E83D745A400CD727BA2F0135400000001E35745A4024A77D1C570135400100003230745A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'31ca9722-b9a4-41aa-95a8-28927e93ce08', N'dsgfsg', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>dsgfsg</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>3</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>280.23m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>3637.48m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`31ca9722-b9a4-41aa-95a8-28927e93ce08`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`31ca9722-b9a4-41aa-95a8-28927e93ce08`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040400000041B07C6B800435400100007C4F745A403B04C22153043540010000B543745A4094DF9A314F0435400000009851745A4041B07C6B800435400100007C4F745A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'468b8478-8836-4a52-86b9-b72543bacd66', N'KCN Luong son', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>KCN Luong son</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>3.57km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>810816.05m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`468b8478-8836-4a52-86b9-b72543bacd66`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`468b8478-8836-4a52-86b9-b72543bacd66`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040600000021CA7EE40FE334400100007847625A4005BE9FDD03E23440010000D89B625A401638442A33E234400000008002635A40893927E406E43440010000580C635A40D10F6ED9DCE334400100007874625A4021CA7EE40FE334400100007847625A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'4fe966c0-cc1e-4d72-9ceb-4253b5ffaa33', N'Svd Vuon cam', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Svd Vuon cam</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>310.65m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5625.60m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`4fe966c0-cc1e-4d72-9ceb-4253b5ffaa33`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`4fe966c0-cc1e-4d72-9ceb-4253b5ffaa33`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010405000000D689A3F60A02354001000006DCD55A40DE1276AE070235400000002AE5D55A40318D9419420235400100000BE6D55A406A3BA6694302354001000014DDD55A40D689A3F60A02354001000006DCD55A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'57cfd34c-1e3c-4a2c-ab23-2cbc54baae1a', N'Trung van lake', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Trung van lake</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>17</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>670.64m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>20314.82m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`57cfd34c-1e3c-4a2c-ab23-2cbc54baae1a`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`57cfd34c-1e3c-4a2c-ab23-2cbc54baae1a`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000104120000002AB089A51CFD34400100008110725A4024D4C3C813FD34400100806416725A40781AA5FB06FD34400100003D18725A40B97D7686F9FC34400000006D15725A40CF7F2C3EF6FC34400100009D12725A409855C87CE6FC34400100009D12725A4027E3E8A3DCFC34400100002F17725A40EF00EC51C6FC3440000080F31D725A402DC7E4D4BAFC34400100001D29725A409E768905EFFC34400100005230725A40E7E27DDAF9FC3440010000CB2F725A4033A287AB05FD34400100807127725A40D0A5D84709FD34400100001522725A404F1665011BFD3440010000CF1C725A40F8D1313224FD34400100003D18725A400EAA295B2FFD34400100005F14725A40251F398624FD3440000000CD0F725A402AB089A51CFD34400100008110725A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'59807712-d4cd-496b-a163-b45a65a69161', N'Van con school', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Van con school</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>6</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>196.13m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>2324.35m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`59807712-d4cd-496b-a163-b45a65a69161`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`59807712-d4cd-496b-a163-b45a65a69161`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010407000000F551DF26E9FE34400100406F166B5A404BD0C261DAFE344000000072176B5A40D8499B1ECBFE3440010000BB196B5A401D3ECEBECDFE3440010080171F6B5A40BAF09F93D8FE34400100007A1E6B5A40ADBBBECDF4FE3440020040D41A6B5A40F551DF26E9FE34400100406F166B5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'5ad619cf-0a14-4330-82aa-fa5bf302bac4', N'ho dieu hoa', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ho dieu hoa</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>40</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1.58km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>100764.97m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`5ad619cf-0a14-4330-82aa-fa5bf302bac4`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`5ad619cf-0a14-4330-82aa-fa5bf302bac4`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001072900000037042C1E350D35400000009E7B715A402DC67B06260D3540010000AF79715A409581E156120D35400100006E7E715A40A884FF6E0C0D35400100007685715A409B674EAFFC0C3540010000628A715A40C680ABA7E90C3540010000328D715A404F9CC10FE50C3540010000CD88715A4075707827F40C35400100004985715A40FDE447FFFD0C3540010000F281715A4014017277F50C3540010000AC7C715A400A2ECE6FE20C3540010000D67F715A4000E7FC97D80C3540010000C284715A40714009F8D50C3540010000358A715A407CC01E60D10C35400100003D91715A40422A8510BB0C35400100002699715A408BF0BC98AE0C35400100005BA0715A40C5D0F0C8A20C3540010000C3A1715A401CC123F9960C3540010000A1A5715A40C2C0DC60A70C3540010000ACA9715A409B9F18B0D20C354001000090A7715A40DC709897ED0C3540010000DCA6715A40B3FF192F070D3540010000D9A9715A40D7A1C696170D354001000000B0715A40998328C6350D354001000081B6715A40F6E3A40D4E0D354001000027B6715A409572285D640D354001000046B5715A408078FF946B0D3540010000D0B2715A408C4E1D55660D35400000006BAE715A40B97BF0346E0D354001000006AA715A40EACFCAC4740D354001000063A7715A40219A7EE4810D354001000055A6715A400E0639B48D0D3540010000AFA6715A400E82F283990D3540010000B2A3715A4027F4C6BBA00D354001000001A0715A40630AB303A40D3540000000EB97715A400CAAE67B9B0D35400100001091715A406153FE8B970D3540010000058D715A402E0AA1FC7B0D3540010000EC87715A4054AE0A9D690D35400000000B87715A402CF53A15610D35400100003080715A4037042C1E350D35400000009E7B715A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000020000000001000000FFFFFFFF0000000003, N'#ee9191', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'5d80c967-9567-4121-ace7-cb88d4bd3bed', N'Vườn quốc gia cúc phương', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Vườn quốc gia cúc phương</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>23</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>64.20km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>203.03km²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`5d80c967-9567-4121-ace7-cb88d4bd3bed`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`5d80c967-9567-4121-ace7-cb88d4bd3bed`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#fd1212', 4, 0.5, 0xE610000001041800000013F42D16596334400100002046615A40797D4B86226034400100004035615A4042BB9A93C45B34400100002054625A400F86165D96553440010000C078615A4067B5ED6A77513440010000E0A2625A40024C7356854C3440010000A0C4625A40E0E0DBFC0E493440010000E00A645A40C6E8A70B51483440010000A067655A40DD249EE36847344001000020E6665A4068BAEDC77343344001000020F4675A404BFDF77C76423440010000401E695A40B294CD6CF243344001000040A5695A406C945579AB3E344001000080EB6A5A40F776A1D16E3D3440010000A07D6D5A404BFDF77C76423440010000A0E56E5A40DA88EED52648344000000040DD6D5A407308D5766D4D3440000000C0B86C5A4051015A04F651344001000060836B5A405814857CF45934400100006094695A401BA6115CC861344001000040E3675A40E3F5552D6E63344000000080D2655A40FE232EE6166434400100008089635A40D36EB4556865344000000020CD615A4013F42D16596334400100002046615A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'5df7d56f-b48e-43df-a346-b6e8c9f6085b', N'Ha noi university', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Ha noi university</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>10</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>576.90m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>23518.60m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`5df7d56f-b48e-43df-a346-b6e8c9f6085b`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`5df7d56f-b48e-43df-a346-b6e8c9f6085b`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040B0000001D029E9B34FD3440000000AAD7725A401ED705BD16FD34400100001AE0725A40218313E80BFD344001008038E7725A40CB26B52013FD344000008024EC725A408F25DA4120FD344001008059F3725A4057AC5A243DFD34400000800AF7725A40D00E0FA75CFD344001000043F3725A405993AE817BFD34400100807EEC725A40AD0A75106DFD34400100007CE7725A40E46DCEB259FD3440010000E2DB725A401D029E9B34FD3440000000AAD7725A4001000000020000000001000000FFFFFFFF0000000003, N'#c7a3a3', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'5ecef19d-4e54-467c-a16f-fd55c16048f1', N'Svd 2', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Svd 2</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>219.56m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>2075.58m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`5ecef19d-4e54-467c-a16f-fd55c16048f1`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`5ecef19d-4e54-467c-a16f-fd55c16048f1`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000104060000008E10F7942FFA3440010040B5676A5A4016DACEBF24FA34400100801A686A5A40F1D6D71325FA3440010040DC6D6A5A4024C00D0C27FA344001004003746A5A401D9C0CC239FA34400100C0DB756A5A408E10F7942FFA3440010040B5676A5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'7072500c-5e20-4757-870e-e75460a5bdf1', N'Tram y te xa cao duong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Tram y te xa cao duong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>131.67m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1070.37m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`7072500c-5e20-4757-870e-e75460a5bdf1`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`7072500c-5e20-4757-870e-e75460a5bdf1`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010406000000C5F7B07513D0344002004021AA705A402695EA3519D0344001008021A6705A40FA175B0210D0344001008070A2705A409F6D80E400D0344002004008A5705A40BC65BF4509D0344001000027A8705A40C5F7B07513D0344002004021AA705A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'70d1d72f-9e13-408f-a1f8-c7e648fddd64', N'Than tho lake', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Than tho lake</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Rectangle</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>738.24m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>33432.80m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`70d1d72f-9e13-408f-a1f8-c7e648fddd64`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`70d1d72f-9e13-408f-a1f8-c7e648fddd64`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040500000077EA1AE530FA34400100008D8B725A4077EA1AE530FA344001000099AC725A40CE5F00C78EFA344001000099AC725A40CE5F00C78EFA34400100008D8B725A4077EA1AE530FA34400100008D8B725A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'719e8a18-f23b-4a46-a8ab-5febdd67812b', N'viet huong quan', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>viet huong quan</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>45.73m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>115.76m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`719e8a18-f23b-4a46-a8ab-5febdd67812b`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`719e8a18-f23b-4a46-a8ab-5febdd67812b`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000104050000001FEFDC8957FC34400100404ECA5F5A40DA2B55CB51FC34400100C026CC5F5A40740BBA0F56FC3440010040F1CC5F5A40958A26A85AFC3440010080E0CA5F5A401FEFDC8957FC34400100404ECA5F5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'74d53b02-ff55-41a2-a816-f3f64940d267', N'Svd TP Hai duong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Svd TP Hai duong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>20</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>486.19m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>14161.60m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`74d53b02-ff55-41a2-a816-f3f64940d267`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`74d53b02-ff55-41a2-a816-f3f64940d267`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010415000000D86256A02FF034400200C0800F955A40241DD3AB2CF034400100802C0D955A406850F685FFEF34400200C046FE945A40029895A4F7EF34400100802DFD945A40919218DAF4EF34400200C0BFFD945A406837AA63F2EF344001000044FD945A40F689CBB7E7EF34400200C0CDFE945A405C9ADF76E2EF34400100C0BC00955A4065CAFFCAD7EF34400100807302955A4067385D2ED4EF34400100008705955A40CA006C82D4EF34400100C0B606955A406116475401F034400000005915955A40BEDBADA003F034400100004B14955A409587A0CA0EF03440010040F916955A40E01DD4AF15F034400100C0B516955A409035495018F034400100C0E216955A400BFB917225F03440010080DA13955A408E127CF424F034400100003D13955A40B47491312BF034400200408611955A4031EFB5032CF03440010080750F955A40D86256A02FF034400200C0800F955A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'77cebb9e-884e-47a4-9d5e-3db0f5eb3e76', N'Hunre school', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Hunre school</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>11</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>544.78m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>18794.47m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`77cebb9e-884e-47a4-9d5e-3db0f5eb3e76`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`77cebb9e-884e-47a4-9d5e-3db0f5eb3e76`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040C00000015AB074F190C35400100801FC6705A401631413F080C3540000000EDC3705A40B8727227F90B3540010000D1C1705A400674C7EBDD0B354001008063BE705A403B7A17B0C20B3540010080A1BC705A40C82C28C8BC0B35400100008BBC705A4028C840ECB30B354001000085C2705A4007D23688B70B35400100805DC4705A40E0535560AC0B3540010000F2CD705A4031C6EA1BD20B354001000057D2705A4064385DB7FF0B354001008097D5705A4015AB074F190C35400100801FC6705A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'7ffa3e94-0f6d-4317-a986-53fca12a4455', N'ho tinh tam', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ho tinh tam</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>12</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>160.21m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1986.42m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`7ffa3e94-0f6d-4317-a986-53fca12a4455`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`7ffa3e94-0f6d-4317-a986-53fca12a4455`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040D00000049881D1683FF3440010080A2BD6E5A40060BA35B7CFF3440010080C1BC6E5A404E4119CF74FF34400100C026BD6E5A400D21A13E6EFF344000008029BE6E5A40D2EF5EA26AFF344001008018C06E5A40DBF767206BFF344001004083C26E5A40C034CB8A70FF344000008050C46E5A40792A709179FF34400100C0E2C46E5A40628C1AEC82FF34400100C0D4C36E5A40C8076E8487FF344001008061C26E5A40A5E67F8088FF344001004094C06E5A401C225FB286FF3440000080DDBE6E5A4049881D1683FF3440010080A2BD6E5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'80e86472-8a23-445c-a37e-71a40aa7b17f', N'hehe', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>hehe</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>539.80m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>16302.59m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`80e86472-8a23-445c-a37e-71a40aa7b17f`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`80e86472-8a23-445c-a37e-71a40aa7b17f`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010405000000284B6160980435400100004A72745A40C9867AD665043540010000A175745A404569CB9F88043540010000CF92745A40BA4C9D2DBA043540000080A587745A40284B6160980435400100004A72745A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'840c6850-2b79-4866-bf3d-af43a8438e13', N'ho cao son', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ho cao son</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>6</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>944.16m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>53233.63m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`840c6850-2b79-4866-bf3d-af43a8438e13`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`840c6850-2b79-4866-bf3d-af43a8438e13`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010407000000CF8D29019E003540010000ABFCD35A40A43BECDF10003540000000DBF9D35A40356B09BF03003540010000420BD45A407A4C3CEEF7FF3440010000E210D45A403F2F856DEDFF3440010000F818D45A403F539E78950035400100008A1DD45A40CF8D29019E003540010000ABFCD35A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'84e35fd6-36d1-42fe-a2c6-848c467e999f', N'dap me', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>dap me</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>36</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>800.59m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>28615.84m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`84e35fd6-36d1-42fe-a2c6-848c467e999f`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`84e35fd6-36d1-42fe-a2c6-848c467e999f`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010425000000A427B37936FA344001000020C55A5A402CDFA1762CFA34400200C0E7C45A5A405ECCF20F26FA34400100005EC35A5A40F1F223831EFA3440010080C3BF5A5A407C9215AA14FA344001008088BE5A5A405DF499E006FA34400100804DBD5A5A40DDA2EF72F7F9344001000023C25A5A407701B026F5F93440010080D9C75A5A40C4794ABBFAF9344000000052CF5A5A40DDA2EF72F7F9344001008057D15A5A40B5D74236F1F9344000008019D35A5A40D2707AFDE9F9344001008027D45A5A404237D614E4F93440000000D3D55A5A404A781F84DDF93440000000D3D55A5A40C287A83FD9F93440010080F7D65A5A40BE1D564BD6F934400100000BDA5A5A405A9A6824E0F9344001008021DA5A5A407BDB03B9E5F934400000805FD85A5A40EDC995F9EAF934400100002AD95A5A409E888282F3F934400100000BDA5A5A402BA18BD6F3F93440010080C4DC5A5A407402FA95EEF93440000080FFDD5A5A405E21B1F5EBF9344001000021E25A5A40B5D74236F1F9344001000002E35A5A402BA18BD6F3F9344001000021E25A5A40602B9CAFFDF93440010000F4E15A5A409E9E63E804FA3440010000F4E15A5A40A22C971110FA344000000013E15A5A402986030214FA3440000080D2DD5A5A4074E9DBE21BFA3440010080F1DC5A5A4077EA1AE530FA3440010000F7DE5A5A409534AA2536FA344001000035DD5A5A40E65A953348FA344001000081DC5A5A40781CB2B452FA344001008002DB5A5A4071B5634559FA3440010000C2D75A5A40B64C339744FA3440010000EDCA5A5A40A427B37936FA344001000020C55A5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'8bc3d1ef-7548-483b-8af2-fdb6dd82744c', N'ho cao son 2', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ho cao son 2</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>10</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>909.43m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>45336.28m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`8bc3d1ef-7548-483b-8af2-fdb6dd82744c`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`8bc3d1ef-7548-483b-8af2-fdb6dd82744c`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040B0000005ACDA65F86003540010000C0E7D35A40B9E12F277F00354001000066E7D35A40A42CB32D6800354001000039E7D35A40866815166E003540010000DBCCD35A4057A5919F0B003540010000AECCD35A40370CFE160300354001000016CED35A4083ACF26E020035400000004DE2D35A40B8832BB7050035400100005DF0D35A40D148CAE70E00354001000079F2D35A40D5FA656F8200354001000000F3D35A405ACDA65F86003540010000C0E7D35A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'9dcf5585-5365-4c20-a312-72ddaef030e8', N'ho ', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ho </span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Rectangle</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>126.56m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>802.92m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`9dcf5585-5365-4c20-a312-72ddaef030e8`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`9dcf5585-5365-4c20-a312-72ddaef030e8`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010405000000E2C97C3579FD3440010080C7D86A5A40E2C97C3579FD34400200408CDB6A5A40F3C9C11F94FD34400200408CDB6A5A40F3C9C11F94FD3440010080C7D86A5A40E2C97C3579FD3440010080C7D86A5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'a0387cb0-b256-44af-9d56-29f0b34c1447', N'nghia trang nhan dan ha dong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>nghia trang nhan dan ha dong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>9</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>882.01m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>36937.08m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`a0387cb0-b256-44af-9d56-29f0b34c1447`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`a0387cb0-b256-44af-9d56-29f0b34c1447`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#f50083', 4, 0.5, 0xE610000001040A00000070025BF72EFB344001000006F6705A404D369E9731FB34400100005EE9705A402D99EE6FE5FA344001000042E7705A40029F76D7E0FA34400100000AE3705A40D1FF3137DEFA344001000089DC705A4043963F8E87FA34400100005FD9705A4040661E3473FA344000000067E0705A4018F7BC1C79FA3440010000B8E9705A409663231790FA344000000028F2705A4070025BF72EFB344001000006F6705A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'ba06c196-9b5e-4812-8084-e74b049d9138', N'gfdgfdg', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>gfdgfdg</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>3</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>429.18m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>8546.73m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`ba06c196-9b5e-4812-8084-e74b049d9138`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`ba06c196-9b5e-4812-8084-e74b049d9138`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010404000000F19591C5EA033540010000EC57745A400AE4B32AA70335400100008C5D745A4084B25985E5033540010000D46F745A40F19591C5EA033540010000EC57745A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'bb894770-9d8e-43ad-82dd-e5bee07f09c2', N'Ho tay', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Ho tay</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>202</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>17.47km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5.33km²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`bb894770-9d8e-43ad-82dd-e5bee07f09c2`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`bb894770-9d8e-43ad-82dd-e5bee07f09c2`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000107CB0000001F64CE7106143540010000E063745A401B57DAB2F61335400100008F5A745A40219FE4F3E61335400000003857745A40CCD72417B5133540010000BD4A745A40D62C2858A51335400100004F4F745A4042BDE80A7A1335400100004748745A4059CA0E8647133540010000D352745A409F20B4063D1335400100004F4F745A409E6E5CAA00133540010000DB59745A4092C0D4CAF8123540000000DE56745A40094E88CEB91235400000004B62745A40254CA1C7A6123540010000B95D745A40E33DA5A2711235400100009B4E745A402F45D45A6E1235400100004748745A406288D4C8911235400100006C41745A40D4BB000DD4123540000000CA2E745A40BCAA61A8991235400100003E24745A40BE735CCC521235400100001A1B745A40C44162A8081235400100003F14745A405E88137BD5113540010000750B745A406CC87694BA113540010000A508745A40272C8F3E91113540000000FDFB735A40B98379315611354001000011F7735A4035D5A5EB2811354000000036F0735A40F159301D08113540010000C0ED735A40800D5F86EE1035400100000CED735A40205A89EFD4103540010000E5E6735A406F01C211A310354000000042E4735A401125C67B7410354000000015E4735A40BA9E31BE3A1035400100001EDB735A408BCA437F201035400000005CD9735A40C4988B2ACD0F35400100006DD7735A40E68EB653AE0F354001000076CE735A40C2992DDCA10F35400100005FD6735A40FF4E80C57D0F3540010000B9D6735A40E42D6B2E640F3540000000A8D8735A40C1445926660F354001000081D2735A4091BBB46F3F0F354001000041C7735A40883256E5900E35400100008DC6735A405553B56D840E3540010000CAD4735A403FB466CE6C0E35400100001EDB735A4085756EB7480E3540010000FFDB735A40B2D7A6D7400E354001000012E7735A40C44C8117460E35400000000FEA735A405F9236802C0E35400100007FF2735A40E883DBCAC60D35400000001CFB735A400E82F283990D35400100003203745A40CBEF8D447F0D3540010000F701745A401C6558E8C40C3540010000F314745A403883A830B30C3540010000DC1C745A40DEB215419A0C3540000000631D745A4059ACA9D1760C3540010000F521745A40B51FD9016B0C35400100000E27745A4015214ED24C0C35400000000323745A40745BBFFA2D0C3540010000BA20745A404B322A230F0C35400100007C22745A400BCD013CCA0B3540010000082D745A4068954244B30B35400100002132745A40C116E244740B35400100006854745A4071C3129D5E0B35400100002E70745A40906D017D660B3540010000147B745A4042B265ED350B354001000052A6745A40CD31633D370B354001000076AF745A409F8F975D1A0B35400100004BBC745A4078568635240B3540010000FBCF745A409F8F975D1A0B3540010000F5D5745A406783AD3D0D0B35400100008AD7745A40CDBFEDEDE10A3540010000C2DB745A40C48C0EAEC70A354001000016E2745A40CA240946CC0A354000000007F1745A40DCF6F2FDDD0A35400100003CF8745A4078C1F9BDD80A35400100002203755A40DC6E96051B0B3540010000341E755A40A4449E6D160B3540010000E521755A40E63E38E54C0B35400100000331755A40FAAC75652D0B3540010000DF54755A40788A495D440B35400100007F5A755A40DED94AB5430B3540010000B75E755A40FAAC75652D0B3540000000E968755A40693A55753E0B35400000004369755A40BDE35C853A0B35400100007B6D755A406E966FAD300B35400100001B73755A4066726495360B3540010000E27E755A40E22D823BF40B3540010000F886755A402242B1EA310C3540010000A093755A402152B8F22F0C3540010000DC84755A40A0177FB23F0C3540010000DC84755A403D6414EA5B0C3540010000958F755A402FA307325F0C3540010000B69B755A402FA307325F0C35400100000D9F755A40D58489B17E0C354000000091A2755A40271EB7E8AF0C354000000004A8755A4060404028CA0C354001000012A9755A40F12DE72FDD0C35400100001DAD755A404E1092E7EE0C3540010000A7AA755A403E73D74E140D3540010000F9A3755A408310860E240D3540010000599E755A404D7013B6390D3540010000109C755A40B5791A66380D35400100001F8D755A40DCDAC87D470D35400100003388755A40F6E3A40D4E0D3540010000E27E755A40B97BF0346E0D35400100004D7D755A40CBEF8D447F0D35400100006268755A404C1E3E0BB70D35400100008D5B755A406408E281ED0D35400100008257755A40C8DC25B9090E35400100002857755A400CCDFDA00F0E3540000000035E755A40C8DC25B9090E3540010000DE64755A4018825681020E35400100008C6B755A40E0FFA059F70D3540010000B371755A4079730442E80D35400100000D72755A402F3AA1FACF0D3540000000047B755A40630AB303A40D3540010000207D755A401412B4B4780D3540010000DF81755A40DDEA7634830D3540010000228A755A4007DE76DBAD0D3540010000B281755A4018F6EE89EB0D35400100001579755A409D4C2A11090E3540010000BE75755A40FF612DD02D0E35400000000A75755A405B669205890E3540010000C76C755A40446F0F159A0E35400100005467755A407B4965ED8E0E3540010000F25F755A40F0CE355E730E35400100000061755A4069799D27420E35400100002767755A40C718E8A7370E3540010000B461755A405E210D68320E3540000000DC57755A40B2AA7F00220E3540010000F55C755A405085C328180E3540010000E75B755A4039CFDEF7380E35400100007D4D755A40F2B38AC7440E35400100007546755A40A9A0C7AE5F0E3540000000CF46755A4082401DA6760E3540010000A840755A405B669205890E35400000002F41755A40F0CE355E730E35400100009148755A408932000D9C0E3540010000F142755A40D2CD7A43CD0E35400000005C41755A40581A809BCC0E3540010000A336755A408B503073D60E35400100001F33755A40A14CAF32E60E3540000000092B755A4032B18A4BCB0E3540010000F91C755A40144595FBC90E3540010000E314755A4088D15D0AF00E3540010000FD09755A406A0D6BE90C0F3540010000460C755A40C8743958300F3540010000F412755A40ABDA1C7F500F35400100009F1C755A40248892CD7B0F3540000000092B755A40A820DB7C8F0F35400100003838755A4016123A8CA00F35400100000B38755A406A1DC970FA0F35400100002F14755A400C4C7822CF0F3540010000A606755A40E39F65F49B0F354000000074FC745A40CA247186630F354000000007F1745A40A12EFBD9FB0E35400100006ED5745A408A8075EBCD0E35400100000CCE745A408A094285930E35400000004CAC745A40C4A7F71E590E3540000000129B745A407836BE8F3D0E3540010000049A745A405581D588150E3540010000FC92745A40C6AA7941FD0D3540000000B98A745A4027DDFB91E90D35400000008C8A745A4092B46C2ED80D3540010000FA85745A407AEC7086D70D35400100C05C81745A403D9715A2E50D3540010000E47D745A4013816C39FF0D3540010000DC76745A406D05C880170E35400100000170745A405DF81A70300E35400100001D72745A404D55142F550E35400100004A72745A402526D37D800E35400100003C71745A402036947AE90E3540010000DD66745A400FA1ACF65C0F3540000000515C745A40B2C85BB5810F3540010000E360745A40B9DF1AD4A30F35400000009167745A40E3B4CFB3AB0F35400100006971745A40C7294BBAD30F35400100005D7D745A400179D42B731035400100000977745A40BFA1BAB9A3103540010000E38D745A406FAE2F80C6103540000000999B745A4033A4FA0DF7103540010000A1A2745A40021F0ABEF5103540010000BB97745A405FF19047D41035400100008A7D745A40ED8F72E7D61035400100002876745A409AA7838C161135400100000D64745A402C12361B321135400100007565745A40C4040E63351135400100008E6A745A404C81EB014D1135400100004775745A4090167B886A113540000000EC84745A40B5F11D1786113540010000FC92745A40993511C5AE1135400100003794745A4017037C9BCD113540010000EAA4745A4056AC1489FB113540000000ACA6745A40D3CE3156311235400100007D99745A40E3CC8A844F1235400100000A94745A4067466ADB631235400100003794745A400B16DE2091123540000000FF8F745A402596B477A5123540010000DE83745A40FC5B9CABEB1235400100005576745A40C9CD101F37133540010000CF65745A4033837DB5501335400100005369745A401EB594098F133540010000F75B745A40D2BFE306B91335400100006F6B745A40333CED34D71335400100000D64745A4043CCAD52F91335400100003767745A401F64CE7106143540010000E063745A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'c2677f7e-4a00-4306-80c6-b16be223d2bf', N'ho', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ho</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>6</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>316.13m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4955.30m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`c2677f7e-4a00-4306-80c6-b16be223d2bf`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`c2677f7e-4a00-4306-80c6-b16be223d2bf`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000104070000007E98979409FC34400000802A25615A40C091E72FEDFB34400100004125615A40FD8C0A2BF9FB34400100C0D737615A40AC7AA3120AFC34400100807237615A40CEC9E6DC0CFC3440010080BE36615A401A29C3620BFC34400100009B25615A407E98979409FC34400000802A25615A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'c423cbca-5430-4cf8-9087-c84e618d62db', N'fdgdf', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>fdgdf</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>395.77m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>8284.75m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`c423cbca-5430-4cf8-9087-c84e618d62db`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`c423cbca-5430-4cf8-9087-c84e618d62db`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000104060000001800E0D4A5043540010000B7AA745A408E299C9C9E043540010080719D745A4015CBFD4A73043540010000779F745A40A06DFA8B8D043540010080E0B5745A40BF85A8EC9F04354001008002B2745A401800E0D4A5043540010000B7AA745A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'c7a8f7df-418f-44f9-94b6-4c15008fd2cd', N'vqs', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>vqs</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>9</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>469.78m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>14426.57m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`c7a8f7df-418f-44f9-94b6-4c15008fd2cd`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`c7a8f7df-418f-44f9-94b6-4c15008fd2cd`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#f40b0b', 4, 0.5, 0xE610000001070A0000004A95BC0EA20435400100C08DC8745A40E2409FF09E0435400100C0F8C6745A407347A41A6A043540010080B8BF745A407A535A8E6204354001008012C0745A4056E307305A0435400200C0CEC3745A409A1C28B54304354001008003CF745A40245B82BB4C043540010000AFD0745A4058E48AE58104354001004076D8745A40E23DB0BEA00435400100402BC9745A404A95BC0EA20435400100C08DC8745A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000020000000001000000FFFFFFFF0000000003, N'#38ff60', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'c82c821d-29b2-4a13-a81d-8c7a862133ab', N'SVD My Dinh', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>SVD My Dinh</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>11</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>2.71km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>383081.24m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`c82c821d-29b2-4a13-a81d-8c7a862133ab`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`c82c821d-29b2-4a13-a81d-8c7a862133ab`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001070C000000F3AA967A63063540010000EFD0705A40BA71D56C93053540010000EAC6705A4089582C0803053540010000D9C8705A40ABE735C02B0435400100005DCC705A40FD1B6A34CF0335400000004EDB705A40BFEEA781500435400100004B0B715A408E562AE3770435400100009A07715A402D0377AC9A0435400100002C0C715A40A7953C89220535400100005F06715A407D6383EC88053540010000E606715A40904CA6A818063540010000D20B715A40F3AA967A63063540010000EFD0705A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000020000000001000000FFFFFFFF0000000003, N'#e6000b', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'cb5b3467-4125-4ff5-8c09-aa3d9a4aaacf', N'san van dong Ha Nam', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>san van dong Ha Nam</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>10</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>788.03m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>42054.17m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`cb5b3467-4125-4ff5-8c09-aa3d9a4aaacf`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`cb5b3467-4125-4ff5-8c09-aa3d9a4aaacf`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040B0000002858C8907A89344001000088E3795A400EFB2376FD88344001000077E5795A40CD4F648FF5883440010000EDE7795A402B3FA431F888344000000038F7795A40C2E243C7FE883440000000E6FD795A4053297305068934400100005C007A5A40A36495DB7D893440010000A8FF795A4029E1C8068B89344000000092F7795A405F3958AF8B89344001000095F4795A403C88395E8A8934400000007FEC795A402858C8907A89344001000088E3795A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'ccb3d52a-0276-4d10-9ac6-e83be770ca10', N'test', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>test</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Rectangle</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4.82km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1.09km²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`ccb3d52a-0276-4d10-9ac6-e83be770ca10`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`ccb3d52a-0276-4d10-9ac6-e83be770ca10`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010405000000D3B088F13CFF3440A24E97ABA86C5A40D3B088F13CFF3440A24E976FC56D5A40BB78B7699F003540A24E976FC56D5A40BB78B7699F003540A24E97ABA86C5A40D3B088F13CFF3440A24E97ABA86C5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'dce7333b-f5d4-4684-afdf-4ab7f9c132b1', N'Ho co dung', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Ho co dung</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>60</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1.82km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>158131.43m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`dce7333b-f5d4-4684-afdf-4ab7f9c132b1`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`dce7333b-f5d4-4684-afdf-4ab7f9c132b1`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001043D000000BCB251FC76F73440010000AFF65D5A4001B9FD5B74F7344001000047F55D5A40F036C9B772F7344001008022F45D5A4011D6A28669F73440010000FEF25D5A40A7A7DD685BF7344001008071F05D5A40E9E9E50334F7344001008066EC5D5A405C9A1BC72DF734400100007DEC5D5A40AE4FE64124F734400000002EF05D5A40F1C750A91FF73440000000B5F05D5A40A937F0C2EDF63440010080F8F05D5A40AD22013BCFF63440010000E5ED5D5A40FADD1C56C8F634400100005EED5D5A404FD799F7B4F63440010000C6EE5D5A404C9DC3D9A6F63440000080A1ED5D5A40E229139E8AF634400100007AEF5D5A40BBF48EAD86F63440010000C3F15D5A40AC5CB412AEF63440010000EAF75D5A40EED10BB3B0F6344001008068F95D5A408AC96FAC9CF63440010000DE035E5A407DFF0CB899F63440000000AE065E5A40514605D791F634400100009D085E5A401DDD625D85F6344001000051095E5A4069115A7C7DF63440010000B90A5E5A40FAC10C307BF63440010000E30D5E5A40815CF8FA72F63440010080AD0E5E5A4071DB509B75F6344001000080165E5A40C03A86CC7EF63440010080D1175E5A4078C9416184F63440010080EA1C5E5A4023E52D2C7CF6344001008079245E5A408F84DE6C81F634400000801C275E5A40B1353FEE8BF63440010080FD275E5A40C8F422609AF6344001008076275E5A40B90661E5A3F63440010080A3275E5A40ECE3005FB0F63440010080FD275E5A40F21DE1D0BEF63440010080462A5E5A40AE9F7969C3F63440010080242E5E5A403DD7AE7BD4F6344000000062345E5A408BB6870CDBF6344001008078345E5A405F1E6BF1E1F6344000008089325E5A408908ACE9E3F6344001000084305E5A40F9A6084CF6F63440000000762F5E5A403ACDEA30FDF63440010000D02F5E5A409E23B76D03F73440010000B1305E5A405256CEF60BF734400100806D305E5A40F70E9A3312F734400100002A305E5A40015290C019F7344001008013305E5A40069F856C19F7344001008010335E5A400D79648F10F73440010000B9375E5A4027E20FD015F73440010000C7385E5A40A9A2FBCA2CF73440010000D8365E5A40E30DA60B32F7344001000013385E5A403DAF386646F73440010080FF345E5A40F6E436474EF7344000000043355E5A40F8D7B53752F73440010000AE335E5A40302A47B15EF73440010080E62F5E5A4049AC7F6B70F73440010000DD135E5A40D416C5987AF7344001008040035E5A409BC98DDE68F73440010000C5FE5D5A407DAE638E67F7344001000003FD5D5A4077B3A9BB71F7344001008079F75D5A40BCB251FC76F73440010000AFF65D5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'e0c5e64e-5a7f-40e4-8d66-fc0878ebd348', N'rectangl2 2', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>rectangl2 2</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Rectangle</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1.20km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>70237.89m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`e0c5e64e-5a7f-40e4-8d66-fc0878ebd348`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`e0c5e64e-5a7f-40e4-8d66-fc0878ebd348`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010405000000B4E2710C6FEF3440010000DEF46C5A40B4E2710C6FEF3440010000C6396D5A40366A359DCDEF3440010000C6396D5A40366A359DCDEF3440010000DEF46C5A40B4E2710C6FEF3440010000DEF46C5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'e5331695-0c2c-497c-9d6e-94a299c406b5', N'Nghia trang liet si xa xuyen duong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Nghia trang liet si xa xuyen duong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>4</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>133.93m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1102.27m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`e5331695-0c2c-497c-9d6e-94a299c406b5`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`e5331695-0c2c-497c-9d6e-94a299c406b5`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010705000000EF43116A5BCD34400100C0349F6F5A4098C7463048CD34400100005CA16F5A404EEEF0C24ECD3440010080D7A56F5A40BCDC64A163CD34400100001EA36F5A40EF43116A5BCD34400100C0349F6F5A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'e592068a-8144-4c69-8450-cf3a81ae1a52', N'rectangle', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>rectangle</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>6</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>3.12km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>282615.64m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`e592068a-8144-4c69-8450-cf3a81ae1a52`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`e592068a-8144-4c69-8450-cf3a81ae1a52`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010407000000488F21A91E013540010000F063735A405C2753E0900035400000006C33735A4051A5683092003540010000B8B9735A401A7872E9230135400100004A91735A40683AD062C501354001000026B5735A402CFEEDA1B50135400100005838735A40488F21A91E013540010000F063735A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'ea43e937-b164-4e6a-8540-8da6e7734d0b', N'ba sao hospital', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ba sao hospital</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>8</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>2.69km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>471999.05m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`ea43e937-b164-4e6a-8540-8da6e7734d0b`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`ea43e937-b164-4e6a-8540-8da6e7734d0b`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE61000000104090000006CA4FCA3998A3440010000E69B725A40AE5EBE2EE9893440010000BEA5725A40503D807B16893440010000E4BB725A401EBADD26C68834400000005ED8725A409B41C2E7D98834400100006C06735A4071E5C301978A3440010000EEFC725A406344C548EB8A344001000036E2725A40475A1016FB8A34400100004ECA725A406CA4FCA3998A3440010000E69B725A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'f5ad067e-3625-4b07-bbe2-0797c1b6fde4', N'ao ', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>ao </span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>13</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>417.84m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>9538.26m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`f5ad067e-3625-4b07-bbe2-0797c1b6fde4`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`f5ad067e-3625-4b07-bbe2-0797c1b6fde4`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040E000000239C8AB6F8F8344001000093426A5A4054A994B5CDF834400200C0BC496A5A40F7E036D3DBF83440010040194F6A5A40B1554B2EE5F83440010040DE4D6A5A40D583A222E8F83440010080244F6A5A40A6F5EFC2EAF8344001008032506A5A4066E1B5CAE8F8344001004016526A5A4059C3D7F0E9F834400100C094536A5A40AAB9A288F9F834400100C0AD586A5A4008C641F3FEF8344001000040596A5A406252B5E302F934400100C0CC576A5A405E67253A18F934400200409D526A5A40DB0072DA1AF93440000000684F6A5A40239C8AB6F8F8344001000093426A5A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'f6160391-fad3-46ff-94ae-c89fbf1f9e55', N'Le hong phong school', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Le hong phong school</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>12</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>470.40m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>11903.67m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`f6160391-fad3-46ff-94ae-c89fbf1f9e55`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`f6160391-fad3-46ff-94ae-c89fbf1f9e55`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040D0000008D3513F3D5023540010000D864D55A40BB2B9E98CC0235400100806467D55A4057BAD7D7BC023540010080E270D55A402B825257B2023540010040CB7CD55A4069C71170C1023540010000747DD55A40495DF028D30235400100806B7ED55A405EBA29C1D70235400100408D7ED55A404EA95EB2F00235400100002581D55A4073814E62EF023540010080337AD55A40DAF11B48EB0235400100C07471D55A40BD2EE3AFE6023540010080046DD55A40B195BC91E30235400000002167D55A408D3513F3D5023540010000D864D55A4001000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'fcc3f766-2e7d-448b-a610-463f32731e7b', N'dfgdg123', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>dfgdg123</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>7</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>5.30km</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>1.75km²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`fcc3f766-2e7d-448b-a610-463f32731e7b`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`fcc3f766-2e7d-448b-a610-463f32731e7b`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE6100000010708000000C07B5B95BA16354000000008E2645A409D1CCDD03016354000000068DC645A40711866FF9D1435400100009419655A405A1E61915D15354001000028DF655A4048CCA9630D163540000000B416665A402D1A5E285017354001000070F1655A402D1A5E2850173540010000E0EB645A40C07B5B95BA16354000000008E2645A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000020000000001000000FFFFFFFF0000000003, N'#000000', 0.2)
INSERT [dbo].[Polygons] ([ID], [Name], [PopupContent], [Color], [WeightBorder], [Opacity], [Location], [FillColor], [FillOpacity]) VALUES (N'fedb1070-f19f-44a5-a45c-adcb7bb4aa4b', N'Aeon mall Ha dong', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Aeon mall Ha dong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polygon</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Points</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>13</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>978.76m</span>
                                                  </div>
                                               </div>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Area</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>41684.78m²</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolygon(`fedb1070-f19f-44a5-a45c-adcb7bb4aa4b`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolygon(`fedb1070-f19f-44a5-a45c-adcb7bb4aa4b`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', N'#3388ff', 4, 0.5, 0xE610000001040E000000EBBF3DD9A5FD3440010000A827705A40F141822B91FD3440000000B718705A4028E59FAA86FD3440010000E20B705A406BDB0AF573FD34400100008E05705A4016F85D4360FD34400100006402705A40D86B19303AFD3440010000E6F86F5A401A280C940BFD3440010000C4FC6F5A40338CAEA9F0FC3440010080F301705A40D3A84C0B03FD34400000004A0D705A40CB89AC4335FD34400100005511705A40D2BFD9894EFD34400000007113705A4076A47A9361FD34400100001C1D705A40D31B199D74FD3440000080D72C705A40EBBF3DD9A5FD3440010000A827705A4001000000020000000001000000FFFFFFFF0000000003, N'#705c5c', 0.2)
GO
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'091e7cf4-f420-4000-95f4-ddf56676ffa8', N'Polyline black', N'17.06 km', N'fb80cd68-b29a-4552-9790-0486ab3e8da9', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline black</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Black</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>17.06 km</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`091e7cf4-f420-4000-95f4-ddf56676ffa8`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`091e7cf4-f420-4000-95f4-ddf56676ffa8`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE6100000010404000000BB6971D853D234400100008010645A40F54457516FD6344001000040C4685A408F6A8E9196D13440010000A0806A5A4098A311E013D83440010000808E6D5A4001000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'0b9e50c9-ed23-41b6-acdf-f01017c8c185', N'hehehe', N'10.98 km', N'a8b962c9-0d55-4022-ae0b-d79e5274a315', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>hehehe</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Blue</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>10.98 km</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`0b9e50c9-ed23-41b6-acdf-f01017c8c185`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`0b9e50c9-ed23-41b6-acdf-f01017c8c185`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE61000000104040000004DD14423BA0F3540010000C0BB695A40BBF1B03D2A093540000000E07A6C5A408878C33BDF0B354000000080156E5A404782AC2C8E05354001000000866E5A4001000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'1a1e800b-93d2-4fad-99b7-9491a63e9ba4', N'muon 1', N'200 m', N'a8b962c9-0d55-4022-ae0b-d79e5274a315', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>muon 1</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Blue</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>200 m</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`1a1e800b-93d2-4fad-99b7-9491a63e9ba4`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`1a1e800b-93d2-4fad-99b7-9491a63e9ba4`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE6100000010404000000A1AA867335FA344072C1E58B626A5A40C046A0CA3FFA344071C12563786A5A400CDB0C603AFA344071C125AC7A6A5A40D94A636D21FA344073C1259E796A5A4001000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'1a44b703-e3f5-4dfe-bbba-98afa181437e', N'Duong di lam', N'13.43 km', N'c77ac462-6d96-4e43-bd3e-0e5d7d36430d', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Duong di lam</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Green</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>13.43 km</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`1a44b703-e3f5-4dfe-bbba-98afa181437e`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`1a44b703-e3f5-4dfe-bbba-98afa181437e`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE61000000107500000006E10300104EF34400100000FAF725A403D480FEE1EEF344000008030B3725A407B66CCC73EEF34400100004E9D725A40EB6FB413C5EF344001008093AA725A40697534C3EFEF3440010080FD8B725A4010F6F7306DF034400100804C2E725A403DDC0D5A70F23440000000154F725A4077909381D9F33440010000EC68725A40B57F94F7E6F33440010080B36C725A40E04E1D0AF8F33440000000086B725A4013DB9952FBF334400100803266725A4002861725F1F334400100803860725A40C134BF4EFCF334400100009C22725A40C70AB8DF02F43440000000A609725A405054976D61F43440010080700A725A406DC448DF7AF434400100C0E30B725A401046235FB1F434400100005F14725A405131BA8EE6F434400100C0F01C725A40E037D88DFCF43440000080991D725A40432E911C91F534400000004015725A40B3509619D3F53440010080D211725A408BB39B32F8F534400000802C12725A407426E92427F634400100005C17725A401DD70F166CF63440010000A21C725A4018125498F8F63440000080C61D725A40F6043BA436F73440010000A816725A401C43838A68F734400100807514725A402256F9689CF734400100806416725A4063486E85C0F734400100007012725A4049792C77EFF734400100001108725A4099AB186120F834400100809BFD715A40F5DF11CB30F8344000000039FE715A40055208A5A6F834400100000217725A4011745069CBF83440010000181F725A408195C05726F93440010000A30C725A40EDBF63057CF93440010000E2FA715A4050398F9498F9344001008036F9715A40A1AC801DA1F9344001008077F4715A4051ED6E5E3DFA3440010080AAEE715A407EBA663C9CFA344000000086ED715A40E6BC4B33DFFA3440010000E9E4715A4033F27FB6FEFA344001000068DE715A4084D06B9F2FFB34400100809BD0715A40152DCB9B5BFB34400100005ECA715A40376BB9D48DFB34400100007ACC715A40F9324ACBFBFB3440010080C2D6715A402D9CBEE435FC3440010080CDDA715A40AA36E3B32CFC3440010080A8E1715A4011D2D2DEF6FB3440010080F0F3715A402F434AA21BFC34400100807CFE715A406C0E254E9CFC3440000000ECE1715A404D8B5C3ECBFC3440010080FDD7715A4089CC56EF5FFD3440010080890F725A40AF7CDA36B9FD3440010080F22D725A4000F250CBBEFD3440010080D62B725A40E15B0FBC97FD3440010080121D725A405AADAE950CFE3440010080EEE6715A4093CB447F52FE3440010000DAF3715A4087C2D6D9A6FE34400100005203725A406E432638FAFE3440000000A6DC715A40DF3DEC5872FF3440010080BBEC715A404D650370D7FF3440010000A4FC715A4070D7BF363B003540010080F70A725A40991D0476AB003540010080A511725A4080297D4E35013540010000D219725A40703B4CD453013540010000FF19725A40637FF4D7920135400000001315725A40226C9F41F8013540010080B7FF715A409C12104A4B0235400100803F1D725A40CCAE56ABB20235400100003241725A404D970327FE023540010080F25A725A400A54A3470B033540010080DE5F725A40509F79EAA10335400100006D42725A40FFD67BD8D00335400100802852725A408AC8A274D40335400100004A56725A40E3262C41E10335400100008557725A4016FACED83A043540010080A778725A40079353277C0435400000007693725A40A7F424F2C8043540010000D183725A40DD5B1568000535400000005C9E725A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'474e064e-432d-43df-b833-9854a9854eef', N'cau bai chay ngang song cua luc', N'569 m', N'a8b962c9-0d55-4022-ae0b-d79e5274a315', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>cau bai chay ngang song cua luc</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Blue</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>569 m</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`474e064e-432d-43df-b833-9854a9854eef`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`474e064e-432d-43df-b833-9854a9854eef`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE61000000114711DE84409F634400100006C0FC45A403C5C649388F534400000006462C45A40)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'49acccc1-9caf-4ea0-8a1a-f74916c0e326', N'chieu dai song hong', N'637 m', N'a8b962c9-0d55-4022-ae0b-d79e5274a315', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>chieu dai song hong</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Blue</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>637 m</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`49acccc1-9caf-4ea0-8a1a-f74916c0e326`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`49acccc1-9caf-4ea0-8a1a-f74916c0e326`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE61000000114DC48A0A8BC103540010000F060765A4034DCDD5239113540010000DCBF765A40)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'a918a855-d715-4115-b3ba-1972412beaa5', N'duong quang hanh', N'706 m', N'a8b962c9-0d55-4022-ae0b-d79e5274a315', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>duong quang hanh</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Blue</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>706 m</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`a918a855-d715-4115-b3ba-1972412beaa5`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`a918a855-d715-4115-b3ba-1972412beaa5`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE61000000104030000002A0AB46AC30135400100006557CE5A4068894866040235400000009491CE5A40C4B64DD93C023540010000EBC1CE5A4001000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'ac6bf2ce-b3f7-45bc-a537-dbf762ec3271', N'duong di hoc ngay xua', N'640 m', N'fb80cd68-b29a-4552-9790-0486ab3e8da9', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>duong di hoc ngay xua</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Black</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>640 m</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`ac6bf2ce-b3f7-45bc-a537-dbf762ec3271`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`ac6bf2ce-b3f7-45bc-a537-dbf762ec3271`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE610000001070B0000006BB3F9940D0D35400100805CD4705A40A49C5DC42B0D35400100C0C6DE705A4092265A6C2C0D354001008023E0705A407F1B3EF7FF0C35400100002CDF705A40E25C4FE0C60C354000008007DE705A404269C9F16E0C3540010080EBDB705A401E472980560C354001004086DB705A40404C9E2A370C35400200C0EED4705A408BD9DFCA240C35400100000BD3705A40F63F30550D0C354001008024D0705A40E48E1489150C354001004079CA705A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'ace09769-a061-4707-85a9-47f90b77343e', N'tuan chau street', N'2.34 km', N'fb80cd68-b29a-4552-9790-0486ab3e8da9', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>tuan chau street</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Black</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>2.34 km</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`ace09769-a061-4707-85a9-47f90b77343e`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`ace09769-a061-4707-85a9-47f90b77343e`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE610000001040500000006C74B0315F53440000000380CBF5A40A5369BB3A6F4344001000034F2BE5A40E050F8285DF4344000000090D2BE5A407C49A9DBDAF034400000008C3FBF5A40CF8F8C78C8F03440000000605CBF5A4001000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'b76072fd-2c5f-4668-97a8-6d72c9d3c631', N'street', N'491 m', N'c01c6ef0-1fa3-402b-8bf4-7260dca94b4c', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>street</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Orange</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>491 m</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`b76072fd-2c5f-4668-97a8-6d72c9d3c631`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`b76072fd-2c5f-4668-97a8-6d72c9d3c631`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE61000000104090000005E9B29B5AD04354001008077C4745A40106BF7A27204354001008059E2745A40086262606304354000000054E0745A40106BF7A27204354000008046D7745A40ABA76D866404354001008084D5745A40440EE911570435400100804EDE745A40421291354E043540010000FDDC745A40B942FD703F0435400100008CE4745A404FA5785032043540010080FFE1745A4001000000010000000001000000FFFFFFFF0000000002)
INSERT [dbo].[Polylines] ([ID], [Name], [CablineLength], [TypeID], [PopupContent], [Location]) VALUES (N'e8f56f32-79f7-4936-95ab-9202782017d1', N'duong di hoc them thoi cap 3 ok', N'8.87 km', N'a8b962c9-0d55-4022-ae0b-d79e5274a315', N'<div style=''width : 280px''>
                                              <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Name</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>duong di hoc them thoi cap 3 ok</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Type</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>Polyline Blue</span>
                                                  </div>
                                               </div>
                                               <div class=''row row_padding''>
                                                  <div class=''col-3 popup-title-lf''>
                                                      <span class=''sp-pup-tittle-lf''>Length</span>
                                                  </div>
                                                  <div class=''col-9 css_bg_view''>
                                                      <span>8.87 km</span>
                                                  </div>
                                               </div>
                                              <div class=''swal2-actions''>
                                                  <button onclick=''EditPolyline(`e8f56f32-79f7-4936-95ab-9202782017d1`)'' class=''swal2-confirm swal2-styled act-popup-leaflet''>Edit info</button>&nbsp;
                                                  <button onclick=''DeletePolyline(`e8f56f32-79f7-4936-95ab-9202782017d1`)'' class=''swal2-deny swal2-styled''>Delete</button>
                                              </div>
                                            </div>
                                          ', 0xE610000001074E00000013B22E309B0335400100400291D55A40C75F1089AF033540010040147FD55A40D5C0444BB4033540020040C375D55A4034E99C55BC033540010040E86ED55A405FB51838990335400100C07D68D55A401B91DC287D033540000080215FD55A408307E35567033540020040EF58D55A4013BD30E9570335400100006352D55A4016E071D7310335400100805549D55A40ACF1BFE822033540010040FB4CD55A40297983A7080335400100808456D55A40F7AEC20FE40235400100004660D55A406C77F47CD3023540000080EE64D55A40C6D14F5CC60235400100805369D55A4057B2A193B80235400100409972D55A40881D617DB3023540000080E77AD55A4072FA8218A20235400100401C86D55A405A86F51997023540010000578BD55A40BF55CB20800235400200C0838FD55A4010B91658720235400100402D84D55A4013DF6D8B650235400100001A7DD55A40E8121B1C4C0235400100C03970D55A40ABDB75EE2C023540000000AE61D55A40C221EC36100235400000808753D55A4061F46CA5F40135400100002347D55A40436E5393CE0135400100C0A73ED55A4012FE81869C013540010080D235D55A4016CB389563013540010000D62AD55A40F8859378150135400100006A0FD55A405C3B48A5DF00354001000071F9D45A404EE0F9A3CA00354001000083E7D45A406EA1D56CD80035400100009AB2D45A40DD5B9BE5E4003540000000A37CD45A404196FA36FB0035400100002636D45A406CD66AD8120135400000007BFFD35A40EBCD35F91F01354000000000C6D35A40CCDA9A89260135400000001287D35A406842B4EA380135400100008C49D35A40F70E60356601354001000042FDD25A40A99B16BF83013540010000B0CBD25A40BEF9FBF081013540010040C1C5D25A40A80770D18901354001008059C0D25A409DDE62649A0135400100807EB9D25A403AA3244BCB0135400100C0F7B4D25A406DCFA9FF1D023540010080A6AFD25A403E78DC708102354001008090A7D25A4071A97C9AA102354001008093A4D25A40B88CCCD6A70235400100C0ACA5D25A405865F4F4AA0235400100006FA3D25A40A259B3DEA5023540010080B5A0D25A407973B508A6023540010080F78BD25A40E34CF2CAAA0235400200C06E7AD25A400CD12A39AF0235400100C0E35FD25A40130C9143B7023540010080D148D25A4036A76A7EC80235400100C05B42D25A40A1DD2F3FD8023540010080E840D25A40989F19F5FF0235400100C0423DD25A4092EEDE33100335400100808639D25A40EFCBC790230335400100408430D25A4082210BCE3E0335400100409024D25A403E97F5D2520335400100400A14D25A40721B77FB5D0335400100803206D25A40720179255E033540010080D3FBD15A40A66CCD604F0335400100403CF1D15A40B7E494CB34033540010000B3E7D15A4096FAD8B50F0335400100805CDCD15A40C27148E4EE0235400100C0BCD2D15A40C38B283EC30235400100C06EC6D15A409ABDA6E2A4023540010000FCBCD15A4018FEFDC19702354001000005B4D15A40D7ADB1D991023540010080B4A2D15A406D26F66883023540010000DD90D15A407D9B9D27690235400100003377D15A400DB6FAE7230235400100800075D15A40C5FE9EA20A023540010000EA74D15A40ABD08C5209023540010040D378D15A40F585715A070235400100808F7CD15A408A0534EC02023540010000007DD15A40000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF000000000000F8FF01000000010000000001000000FFFFFFFF0000000002)
GO
INSERT [dbo].[TypeMarkers] ([ID], [Name], [MapName], [Icon]) VALUES (N'0bd5e367-9727-462f-b231-1ce64378a673', N'Marker', N'AOTQWWJH', N'/Image/2022/12/20/icons8-place-marker-41.png')
INSERT [dbo].[TypeMarkers] ([ID], [Name], [MapName], [Icon]) VALUES (N'19b91ece-3bb6-4734-933e-3130aca61bf0', N'DM Hùng (CEO)', N'PHMPDJXI', N'/Image/2022/12/22/rsz_321273958_698502518341517_3736942363347610916_n.jpg')
INSERT [dbo].[TypeMarkers] ([ID], [Name], [MapName], [Icon]) VALUES (N'29cea33d-5dbc-49c5-85bb-4c1b5fd9733b', N'House', N'PVOAMRNT', N'/Image/2022/12/29/icons8-house-41.png')
INSERT [dbo].[TypeMarkers] ([ID], [Name], [MapName], [Icon]) VALUES (N'467872e6-d468-40f0-b477-0ce6858547ee', N'Superman', N'BRKRJTNK', N'/Image/2022/12/20/icons8-man-superhero-41.png')
INSERT [dbo].[TypeMarkers] ([ID], [Name], [MapName], [Icon]) VALUES (N'96f7ba4d-aac5-4579-914f-145c846f5aa5', N'Earth', N'WIYHRVSM', N'\Image\2022\12\19\icons8-internet-4121000421.PNG')
INSERT [dbo].[TypeMarkers] ([ID], [Name], [MapName], [Icon]) VALUES (N'd089f45a-256c-4307-808a-7a25ecc1a10b', N'Airplane', N'XKIJFLOO', N'\Image\2022\12\19\icons8-airport-4121382293.PNG')
INSERT [dbo].[TypeMarkers] ([ID], [Name], [MapName], [Icon]) VALUES (N'd7e1abdd-a8d5-44ef-a51b-667443f86c77', N'Marker-Off', N'BJXMDLTU', N'/Image/2022/12/20/icons8-marker-off-41.png')
GO
INSERT [dbo].[TypePolylines] ([ID], [Name], [MapName], [Icon], [ColorLine], [WeightLine]) VALUES (N'a8b962c9-0d55-4022-ae0b-d79e5274a315', N'Polyline Blue', N'RMKARRTN', N'/Image/2022/12/20/icons8-polyline-41 (2).png', N'#448bfd', 4)
INSERT [dbo].[TypePolylines] ([ID], [Name], [MapName], [Icon], [ColorLine], [WeightLine]) VALUES (N'c01c6ef0-1fa3-402b-8bf4-7260dca94b4c', N'Polyline Orange', N'EJXIBZUO', N'/Image/2022/12/20/icons8-polyline-41 (3).png', N'#ff8c2e', 5)
INSERT [dbo].[TypePolylines] ([ID], [Name], [MapName], [Icon], [ColorLine], [WeightLine]) VALUES (N'c77ac462-6d96-4e43-bd3e-0e5d7d36430d', N'Polyline Green', N'PHGSRQHA', N'/Image/2022/12/20/icons8-polyline-41 (1).png', N'#26df3b', 3)
INSERT [dbo].[TypePolylines] ([ID], [Name], [MapName], [Icon], [ColorLine], [WeightLine]) VALUES (N'fb80cd68-b29a-4552-9790-0486ab3e8da9', N'Polyline Black', N'JPPTMTSK', N'/Image/2022/12/20/icons8-polyline-41.png', N'#1a1919', 5)
GO
ALTER TABLE [dbo].[Markers] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Markers]  WITH CHECK ADD  CONSTRAINT [FK_Markers_TypeMarkers_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[TypeMarkers] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Markers] CHECK CONSTRAINT [FK_Markers_TypeMarkers_TypeID]
GO
ALTER TABLE [dbo].[Polylines]  WITH CHECK ADD  CONSTRAINT [FK_Polylines_TypePolylines_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[TypePolylines] ([ID])
GO
ALTER TABLE [dbo].[Polylines] CHECK CONSTRAINT [FK_Polylines_TypePolylines_TypeID]
GO
