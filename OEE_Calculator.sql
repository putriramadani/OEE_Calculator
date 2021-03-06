USE [master]
GO
/****** Object:  Database [OEE_Calculator]    Script Date: 15/08/2021 20:53:05 ******/
CREATE DATABASE [OEE_Calculator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OEE_Calculator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OEE_Calculator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OEE_Calculator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OEE_Calculator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OEE_Calculator] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OEE_Calculator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OEE_Calculator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OEE_Calculator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OEE_Calculator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OEE_Calculator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OEE_Calculator] SET ARITHABORT OFF 
GO
ALTER DATABASE [OEE_Calculator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OEE_Calculator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OEE_Calculator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OEE_Calculator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OEE_Calculator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OEE_Calculator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OEE_Calculator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OEE_Calculator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OEE_Calculator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OEE_Calculator] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OEE_Calculator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OEE_Calculator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OEE_Calculator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OEE_Calculator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OEE_Calculator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OEE_Calculator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OEE_Calculator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OEE_Calculator] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OEE_Calculator] SET  MULTI_USER 
GO
ALTER DATABASE [OEE_Calculator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OEE_Calculator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OEE_Calculator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OEE_Calculator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OEE_Calculator] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OEE_Calculator] SET QUERY_STORE = OFF
GO
USE [OEE_Calculator]
GO
/****** Object:  Table [dbo].[departemen]    Script Date: 15/08/2021 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departemen](
	[id_departemen] [int] IDENTITY(1,1) NOT NULL,
	[nama_departemen] [varchar](50) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_departemen] PRIMARY KEY CLUSTERED 
(
	[id_departemen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_breakdown]    Script Date: 15/08/2021 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_breakdown](
	[id_detil] [int] IDENTITY(1,1) NOT NULL,
	[id_perhitunganOEE] [int] NOT NULL,
	[breakdown] [int] NOT NULL,
	[waktu] [time](0) NOT NULL,
 CONSTRAINT [PK_detail_breakdown] PRIMARY KEY CLUSTERED 
(
	[id_detil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[karyawan]    Script Date: 15/08/2021 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[karyawan](
	[NIK] [varchar](50) NOT NULL,
	[password] [varchar](20) NULL,
	[id_departemen] [int] NULL,
	[nama_karyawan] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[alamat] [varchar](max) NULL,
	[telepon] [varchar](20) NULL,
	[foto] [varchar](200) NULL,
	[tanggal_lahir] [date] NULL,
	[role] [int] NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_pengguna] PRIMARY KEY CLUSTERED 
(
	[NIK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[line_produksi]    Script Date: 15/08/2021 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[line_produksi](
	[id_line] [int] IDENTITY(1,1) NOT NULL,
	[nama_line] [varchar](50) NOT NULL,
	[deskripsi] [varchar](200) NULL,
	[status] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_line_produksi] PRIMARY KEY CLUSTERED 
(
	[id_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mesin]    Script Date: 15/08/2021 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mesin](
	[no_mesin] [int] IDENTITY(1,1) NOT NULL,
	[id_departemen] [int] NULL,
	[nama_mesin] [varchar](50) NULL,
	[line] [int] NOT NULL,
	[status] [int] NULL,
	[tahun_mesin] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
	[modiby] [varchar](50) NULL,
	[modidate] [datetime] NULL,
 CONSTRAINT [PK_Mesin] PRIMARY KEY CLUSTERED 
(
	[no_mesin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perhitungan_OEE]    Script Date: 15/08/2021 20:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perhitungan_OEE](
	[id_perhitunganOEE] [int] IDENTITY(1,1) NOT NULL,
	[no_mesin] [int] NULL,
	[operator] [varchar](50) NULL,
	[tanggal] [datetime] NULL,
	[shift] [int] NULL,
	[cycle_time] [int] NULL,
	[panjang_shift] [int] NULL,
	[waktu_break_pendek] [int] NULL,
	[waktu_break_makan] [int] NULL,
	[downtime_setup] [int] NULL,
	[downtime_breakdown] [int] NULL,
	[total_produksi_shift] [int] NULL,
	[total_produksi_reject] [int] NULL,
	[performance] [int] NULL,
	[availbility] [int] NULL,
	[quality] [int] NULL,
	[OEE] [int] NULL,
	[creaby] [varchar](50) NULL,
	[creadate] [datetime] NULL,
 CONSTRAINT [PK_perhitungan_OEE] PRIMARY KEY CLUSTERED 
(
	[id_perhitunganOEE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[departemen] ON 

INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1, N'LOGISTIK', 1, NULL, NULL, N'1', CAST(N'2019-05-13T08:05:39.237' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (2, N'SERVICE', 1, NULL, NULL, N'3', CAST(N'2019-07-14T20:43:44.283' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (45, N'MAINTENANCE', 1, N'3', CAST(N'2019-07-14T20:41:15.260' AS DateTime), NULL, NULL)
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (201, N'STAMPING 2', 1, N'1', CAST(N'2019-05-13T08:34:58.920' AS DateTime), N'3', CAST(N'2019-07-30T19:51:53.553' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1450, N'WELDING', 1, N'1', CAST(N'2019-05-13T08:20:29.160' AS DateTime), N'3', CAST(N'2019-07-14T20:42:59.390' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14022, N'PRESS', 0, N'1', CAST(N'2019-05-12T21:42:36.437' AS DateTime), N'3', CAST(N'2021-07-19T08:10:19.347' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14046, N'ASSEMBLY', 1, N'1', CAST(N'2019-05-12T21:28:28.003' AS DateTime), N'3', CAST(N'2019-07-14T20:42:31.080' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14047, N'PRODUCTION CONTROL', 1, N'3', CAST(N'2019-07-30T19:52:23.783' AS DateTime), NULL, NULL)
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14048, N'WELDING', 0, N'Admin', CAST(N'2021-07-19T08:10:26.667' AS DateTime), N'Admin', CAST(N'2021-07-19T08:10:40.457' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14049, N'WELDING 2', 1, N'Admin', CAST(N'2021-07-19T08:26:52.570' AS DateTime), N'Admin', CAST(N'2021-07-19T08:26:52.570' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14050, N'PRESS', 0, N'Admin', CAST(N'2021-07-19T08:51:13.003' AS DateTime), N'Admin', CAST(N'2021-07-19T08:51:49.260' AS DateTime))
INSERT [dbo].[departemen] ([id_departemen], [nama_departemen], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (14051, N'TEST 2', 0, N'Admin', CAST(N'2021-08-04T19:05:53.093' AS DateTime), N'Admin 2', CAST(N'2021-08-04T19:06:12.813' AS DateTime))
SET IDENTITY_INSERT [dbo].[departemen] OFF
SET IDENTITY_INSERT [dbo].[detail_breakdown] ON 

INSERT [dbo].[detail_breakdown] ([id_detil], [id_perhitunganOEE], [breakdown], [waktu]) VALUES (3, 21, 2, CAST(N'21:14:58' AS Time))
INSERT [dbo].[detail_breakdown] ([id_detil], [id_perhitunganOEE], [breakdown], [waktu]) VALUES (4, 21, 3, CAST(N'21:15:08' AS Time))
INSERT [dbo].[detail_breakdown] ([id_detil], [id_perhitunganOEE], [breakdown], [waktu]) VALUES (5, 23, 5, CAST(N'21:22:39' AS Time))
INSERT [dbo].[detail_breakdown] ([id_detil], [id_perhitunganOEE], [breakdown], [waktu]) VALUES (6, 23, 2, CAST(N'21:22:39' AS Time))
INSERT [dbo].[detail_breakdown] ([id_detil], [id_perhitunganOEE], [breakdown], [waktu]) VALUES (7, 23, 3, CAST(N'21:22:39' AS Time))
INSERT [dbo].[detail_breakdown] ([id_detil], [id_perhitunganOEE], [breakdown], [waktu]) VALUES (8, 24, 2, CAST(N'09:00:00' AS Time))
INSERT [dbo].[detail_breakdown] ([id_detil], [id_perhitunganOEE], [breakdown], [waktu]) VALUES (9, 24, 5, CAST(N'14:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[detail_breakdown] OFF
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'1', N'1234', 2, N'kiki', N'kiki@gmail.com', N'Jakarta Utara', N'089123123123', N'a', CAST(N'2019-05-13' AS Date), 1, 1, N'1', CAST(N'2019-05-12T13:51:09.913' AS DateTime), N'1', CAST(N'2021-08-13T16:33:06.417' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'16740', N'1234', 1, N'puram', N'puram@gmail.com', N'jakarta', N'082323232323', NULL, CAST(N'2021-08-13' AS Date), 2, 1, N'1', CAST(N'2021-08-13T16:34:47.777' AS DateTime), N'Admin', CAST(N'2021-08-13T23:41:27.473' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'16741', N'1234', 1, N'habibie', N'habibie@gmail.com', N'habibie', N'082323232322', NULL, CAST(N'2021-08-09' AS Date), 1, 1, N'Admin', CAST(N'2021-08-13T18:57:12.587' AS DateTime), N'Admin', CAST(N'2021-08-13T18:57:12.587' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'2', N'admin', 1, N'Nindy Okta', N'Nindy@gmail.com', N'Madiun', N'081217146328', N'a', CAST(N'2019-04-17' AS Date), 2, 1, N'1', CAST(N'2019-05-12T13:51:09.913' AS DateTime), N'1', CAST(N'2019-05-13T08:17:03.837' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'25', N'admi ', 2, N'Salsabila', N'salsa@gmail.com', N'Jakarta', N'087475878453', N'a', CAST(N'2019-07-29' AS Date), 1, 1, N'3', CAST(N'2019-07-14T20:10:55.913' AS DateTime), N'3', CAST(N'2019-07-29T20:07:59.757' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'3', N'admin', 1, N'Cantika', N'can@gmail.com', N'Jakarta Utara', N'081235456789', N'a', CAST(N'2019-05-25' AS Date), 2, 1, N'1', CAST(N'2019-05-12T15:12:53.327' AS DateTime), N'1', CAST(N'2019-05-25T13:44:52.430' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'4', N'admin', 1, N'Nindy O Novianti', N'Nindy@gmail.com', N'Jakarta', N'081217146328', N'a', CAST(N'2019-05-12' AS Date), 1, 1, N'1', CAST(N'2019-05-12T17:58:11.957' AS DateTime), N'1', CAST(N'2019-05-12T17:58:46.127' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'5', N'ADMIN', 1, N'Hafis S', N'hafis@gmail.com', N'Jakarta Utara', N'081217146328', N'a', CAST(N'2019-05-13' AS Date), 1, 1, N'1', CAST(N'2019-05-13T08:12:30.180' AS DateTime), NULL, NULL)
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'51414', N'12345', 201, N'Rizkiyah', N'riski@gmail.com', N'Bekasi', N'087475874123', N'a', CAST(N'2019-07-30' AS Date), 2, 0, N'3', CAST(N'2019-07-30T19:48:19.840' AS DateTime), N'3', CAST(N'2021-08-13T16:33:20.087' AS DateTime))
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'6', N'admin', 14046, N'Hafis Syakur', N'hafis@gmail.com', N'Jakarta Utara', N'081217146328', N'a', CAST(N'2019-05-13' AS Date), 2, 1, N'1', CAST(N'2019-05-13T08:26:41.703' AS DateTime), NULL, NULL)
INSERT [dbo].[karyawan] ([NIK], [password], [id_departemen], [nama_karyawan], [email], [alamat], [telepon], [foto], [tanggal_lahir], [role], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (N'7', N'123aa', 1, N'Paijo', N'paijo@gmail.com', N'Jakarta Utara', N'023154648498', N'a', CAST(N'2019-05-25' AS Date), 2, 1, N'1', CAST(N'2019-05-25T13:54:53.323' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[line_produksi] ON 

INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1, N'Press', N'Mencetak partsppp', 1, NULL, NULL, N'Admin 2', CAST(N'2021-08-04T22:35:56.650' AS DateTime))
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (2, N'Assembly', N'Memasang part', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (3, N'Welding', N'Las part', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (4, N'Painting', N'Line Pengecatan Part', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (5, N'Painting 2', N'Line Pengecatan 2', 1, N'3', CAST(N'2019-07-29T20:36:03.340' AS DateTime), N'3', CAST(N'2019-07-29T20:37:26.097' AS DateTime))
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1005, N'Assembly 2', N'Line perakitan 2', 1, N'3', CAST(N'2019-07-30T19:50:57.620' AS DateTime), N'3', CAST(N'2019-07-30T19:51:16.833' AS DateTime))
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1006, N'Welding 2', N'Las part ', 0, N'Admin', CAST(N'2021-07-19T08:09:35.157' AS DateTime), N'Admin', CAST(N'2021-07-19T08:09:44.987' AS DateTime))
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1007, N'Welding 2', N'Las part 2', 1, N'Admin', CAST(N'2021-07-19T08:27:18.277' AS DateTime), N'Admin', CAST(N'2021-07-19T08:27:18.277' AS DateTime))
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1008, N'PRESS 3', N'Press alat 2', 0, N'Admin', CAST(N'2021-07-19T08:52:39.327' AS DateTime), N'Admin', CAST(N'2021-07-19T08:53:03.573' AS DateTime))
INSERT [dbo].[line_produksi] ([id_line], [nama_line], [deskripsi], [status], [creaby], [creadate], [modiby], [modidate]) VALUES (1009, N'Welding 4', N'Line Welding 3', 1, N'Admin', CAST(N'2021-08-04T20:13:24.747' AS DateTime), N'Admin 2', CAST(N'2021-08-04T20:17:20.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[line_produksi] OFF
SET IDENTITY_INSERT [dbo].[mesin] ON 

INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (1, 45, N'Mesin Welding', 2, 1, 2017, N'nindy', CAST(N'2019-07-13T16:48:23.477' AS DateTime), N'Admin', CAST(N'2021-07-19T08:21:13.557' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (2, 1, N'Bubut', 2, 1, 2019, N'nindy', CAST(N'2019-07-13T16:48:23.477' AS DateTime), NULL, NULL)
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (4, 1, N'KIKIR', 3, 1, 2019, N'3', CAST(N'2019-07-13T16:48:23.477' AS DateTime), N'3', CAST(N'2019-07-14T20:39:44.773' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (123, 1, N'Press', 1, 1, 2019, N'nindy', CAST(N'2019-07-13T16:48:23.477' AS DateTime), NULL, NULL)
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (124, 2, N'CAT OTOMATIS', 4, 1, 2018, N'3', CAST(N'2019-07-30T19:50:02.430' AS DateTime), N'3', CAST(N'2019-07-30T00:00:00.000' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (125, 2, N'mesin2', 2, 0, 2010, N'Admin', CAST(N'2021-07-18T14:24:25.713' AS DateTime), N'Admin', CAST(N'2021-07-19T08:11:48.727' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (126, 2, N'Bubut', 3, 0, 2019, N'Admin', CAST(N'2021-07-18T15:04:33.537' AS DateTime), N'Admin', CAST(N'2021-07-18T15:09:09.177' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (127, 201, N'jkhb', 2, 0, 2020, N'Admin', CAST(N'2021-07-18T15:15:43.957' AS DateTime), N'Admin', CAST(N'2021-07-19T08:11:45.817' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (128, 2, N'Bubut', 2, 0, 2010, N'Admin', CAST(N'2021-07-19T08:07:55.790' AS DateTime), N'Admin', CAST(N'2021-07-19T08:11:43.310' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (129, 2, N'Bubut 2', 3, 1, 2020, N'Admin', CAST(N'2021-07-19T08:12:02.593' AS DateTime), N'Admin', CAST(N'2021-07-19T08:12:15.250' AS DateTime))
INSERT [dbo].[mesin] ([no_mesin], [id_departemen], [nama_mesin], [line], [status], [tahun_mesin], [creaby], [creadate], [modiby], [modidate]) VALUES (130, 14046, N'Mesin SPRAY', 4, 0, 2019, N'Admin', CAST(N'2021-07-19T08:53:39.627' AS DateTime), N'Admin', CAST(N'2021-07-19T08:54:03.943' AS DateTime))
SET IDENTITY_INSERT [dbo].[mesin] OFF
SET IDENTITY_INSERT [dbo].[perhitungan_OEE] ON 

INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (8, 123, N'1', CAST(N'2019-06-22T00:00:00.000' AS DateTime), 1, 1, 480, 10, 45, 5, 5, 400, 5, 95, 97, 98, 91, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (9, 123, N'1', CAST(N'2019-06-22T20:20:04.000' AS DateTime), 2, 1, 480, 10, 45, 5, 5, 400, 5, 95, 97, 98, 91, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (10, 123, N'1', CAST(N'2019-06-22T20:20:04.000' AS DateTime), 3, 1, 480, 10, 45, 5, 5, 400, 5, 95, 97, 98, 91, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (11, 2, N'1', CAST(N'2019-06-22T20:20:04.000' AS DateTime), 1, 1, 480, 10, 45, 5, 5, 400, 5, 95, 97, 98, 91, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (12, 2, N'1', CAST(N'2019-06-22T20:20:04.000' AS DateTime), 2, 1, 480, 10, 45, 5, 5, 400, 5, 95, 97, 98, 91, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (13, 2, N'1', CAST(N'2019-06-22T20:20:04.000' AS DateTime), 3, 1, 480, 10, 45, 5, 5, 400, 5, 95, 97, 98, 91, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (14, 1, N'1', CAST(N'2019-06-22T20:20:04.000' AS DateTime), 2, 1, 480, 10, 45, 5, 5, 400, 5, 95, 97, 98, 93, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (15, 1, N'1', CAST(N'2019-07-14T20:20:41.997' AS DateTime), 2, 1, 480, 5, 45, 10, 10, 400, 2, 97, 95, 99, 92, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (16, 123, N'2', CAST(N'2019-07-27T21:06:00.533' AS DateTime), 2, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (17, 1, N'2', CAST(N'2019-07-27T21:10:41.423' AS DateTime), 2, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (18, 1, N'2', CAST(N'2019-07-27T21:10:41.423' AS DateTime), 2, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (19, 1, N'1', CAST(N'2019-07-27T21:12:12.113' AS DateTime), 2, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (20, 1, N'1', CAST(N'2019-07-27T21:12:12.113' AS DateTime), 2, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (21, 1, N'1', CAST(N'2019-07-27T21:14:27.470' AS DateTime), 1, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (22, 2, N'1', CAST(N'2019-07-27T21:14:27.470' AS DateTime), 1, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (23, 123, N'2', CAST(N'2019-07-27T21:22:38.850' AS DateTime), 1, 1, 480, 30, 45, 0, 0, 400, 5, 100, 97, 98, 96, NULL, NULL)
INSERT [dbo].[perhitungan_OEE] ([id_perhitunganOEE], [no_mesin], [operator], [tanggal], [shift], [cycle_time], [panjang_shift], [waktu_break_pendek], [waktu_break_makan], [downtime_setup], [downtime_breakdown], [total_produksi_shift], [total_produksi_reject], [performance], [availbility], [quality], [OEE], [creaby], [creadate]) VALUES (24, 124, N'2', CAST(N'2019-07-30T20:01:18.623' AS DateTime), 2, 1, 480, 15, 45, 0, 0, 400, 5, 95, 98, 98, 92, NULL, NULL)
SET IDENTITY_INSERT [dbo].[perhitungan_OEE] OFF
ALTER TABLE [dbo].[detail_breakdown]  WITH CHECK ADD  CONSTRAINT [FK_detail_breakdown_perhitungan_OEE] FOREIGN KEY([id_perhitunganOEE])
REFERENCES [dbo].[perhitungan_OEE] ([id_perhitunganOEE])
GO
ALTER TABLE [dbo].[detail_breakdown] CHECK CONSTRAINT [FK_detail_breakdown_perhitungan_OEE]
GO
ALTER TABLE [dbo].[karyawan]  WITH CHECK ADD  CONSTRAINT [FK_pengguna_departemen] FOREIGN KEY([id_departemen])
REFERENCES [dbo].[departemen] ([id_departemen])
GO
ALTER TABLE [dbo].[karyawan] CHECK CONSTRAINT [FK_pengguna_departemen]
GO
ALTER TABLE [dbo].[mesin]  WITH CHECK ADD  CONSTRAINT [FK_mesin_departemen] FOREIGN KEY([id_departemen])
REFERENCES [dbo].[departemen] ([id_departemen])
GO
ALTER TABLE [dbo].[mesin] CHECK CONSTRAINT [FK_mesin_departemen]
GO
ALTER TABLE [dbo].[mesin]  WITH CHECK ADD  CONSTRAINT [FK_mesin_line_produksi] FOREIGN KEY([line])
REFERENCES [dbo].[line_produksi] ([id_line])
GO
ALTER TABLE [dbo].[mesin] CHECK CONSTRAINT [FK_mesin_line_produksi]
GO
ALTER TABLE [dbo].[perhitungan_OEE]  WITH CHECK ADD  CONSTRAINT [FK_perhitungan_OEE_karyawan] FOREIGN KEY([operator])
REFERENCES [dbo].[karyawan] ([NIK])
GO
ALTER TABLE [dbo].[perhitungan_OEE] CHECK CONSTRAINT [FK_perhitungan_OEE_karyawan]
GO
ALTER TABLE [dbo].[perhitungan_OEE]  WITH CHECK ADD  CONSTRAINT [FK_perhitungan_OEE_mesin] FOREIGN KEY([no_mesin])
REFERENCES [dbo].[mesin] ([no_mesin])
GO
ALTER TABLE [dbo].[perhitungan_OEE] CHECK CONSTRAINT [FK_perhitungan_OEE_mesin]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_departemen]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_departemen]
AS
begin
select id_departemen, nama_departemen from departemen
end

GO
/****** Object:  StoredProcedure [dbo].[sp_get_line]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_line]
AS
begin
select id_line, nama_line from line_produksi
end

GO
/****** Object:  StoredProcedure [dbo].[sp_get_maxIdPerhitungan]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_maxIdPerhitungan]
AS
begin
SELECT MAX(id_perhitunganOEE) as id_perhitunganOEE FROM perhitungan_OEE
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getAutentik]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getAutentik]
@NIK varchar(20)
AS
SELECT
	NIK
	,nama_karyawan
	,email
	,alamat
	,telepon
	,role
	,password
	,status
	,creaby
	,creadate
	,modiby
	,modidate
	FROM karyawan
where NIK = @NIK and status='Aktif'
GO
/****** Object:  StoredProcedure [dbo].[sp_search_departemen]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_search_departemen]
	@kata_kunci nvarchar (50)
as
begin
	select * from  departemen
	where id_departemen like '%'+@kata_kunci+'%' or nama_departemen like '%'+@kata_kunci+'%' end
GO
/****** Object:  StoredProcedure [dbo].[sp_search_karyawan]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_search_karyawan]
	@kata_kunci nvarchar (50)
as
begin
	select * from karyawan k join departemen d on k.id_departemen = d.id_departemen
	where k.NIK like '%'+@kata_kunci+'%' or k.nama_karyawan like '%'+@kata_kunci+'%' or d.nama_departemen like '%'+@kata_kunci+'%' or k.email like '%'+@kata_kunci+'%' or
	k.alamat like '%'+@kata_kunci+'%' or k.telepon like '%'+@kata_kunci+'%' or k.role like '%'+@kata_kunci+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_search_line]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_search_line]
@kata_kunci nvarchar (50)

AS
BEGIN
	select * from line_produksi
	where nama_line like '%'+@kata_kunci+'%' or deskripsi like '%'+@kata_kunci+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_search_mesin]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_search_mesin]
	@kata_kunci nvarchar (50)
as
begin
	select * from mesin k join departemen d on k.id_departemen = d.id_departemen join line_produksi l on k.line = l.id_line
	where k.nama_mesin like '%'+@kata_kunci+'%' or k.no_mesin like '%'+@kata_kunci+'%' or d.nama_departemen like '%'+@kata_kunci+'%' or k.tahun_mesin like '%'+@kata_kunci+'%' or l.nama_line like '%'+@kata_kunci+'%' end
GO
/****** Object:  StoredProcedure [dbo].[spCariDepartmentbyID]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCariDepartmentbyID]
@id_departemen int
AS
BEGIN
	SELECT
	id_departemen,
	nama_departemen
	FROM departemen
	WHERE id_departemen = @id_departemen
	END
GO
/****** Object:  StoredProcedure [dbo].[spCariDepartmentByNama]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[spCariDepartmentByNama]
@nama_departemen varchar(50)
AS
BEGIN
	SELECT
	id_departemen,
	nama_departemen
	FROM departemen
	WHERE nama_departemen = @nama_departemen
END

GO
/****** Object:  StoredProcedure [dbo].[spCariKaryawanbyNIK]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCariKaryawanbyNIK]
@NIK varchar(50)
AS
BEGIN
	SELECT
	k.NIK
	,k.nama_karyawan
	,k.email
	,k.alamat
	,k.telepon
	,k.tanggal_lahir
	,k.role
	,k.password
	,k.status
	,k.creaby
	,k.creadate
	,k.modiby
	,k.modidate
	,k.id_departemen
	,d.nama_departemen
	FROM karyawan k JOIN departemen d
	ON k.id_departemen = d.id_departemen
	WHERE k.NIK = @NIK
END

GO
/****** Object:  StoredProcedure [dbo].[spCariLinebyID]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCariLinebyID]
@id_line int
AS
BEGIN
	SELECT
	*
	FROM line_produksi
	where id_line = @id_line
	END
GO
/****** Object:  StoredProcedure [dbo].[spCariMesinbyID]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCariMesinbyID]
@no_mesin varchar(20)
AS
BEGIN
	SELECT
	m.no_mesin
	,m.id_departemen
	,d.nama_departemen
	,l.id_line
	,l.nama_line
	,m.nama_mesin
	,m.status
	,m.tahun_mesin
	,m.creaby
	,m.creadate
	,m.modiby
	,m.modidate
	FROM mesin m
	JOIN departemen d ON m.id_departemen = d.id_departemen JOIN line_produksi l ON m.line = l.id_line
	WHERE no_mesin = @no_mesin
	END
GO
/****** Object:  StoredProcedure [dbo].[spCariNamaLine]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCariNamaLine]
@id_line varchar(50)
AS
BEGIN
	SELECT
	*
	FROM line_produksi
	where id_line = @id_line
	END
GO
/****** Object:  StoredProcedure [dbo].[spDepartemenView]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDepartemenView]
AS
BEGIN
	SELECT
	id_departemen
	,nama_departemen
	,status
	,creaby
	,creadate
	,modiby
	,modidate
	FROM departemen
	END
GO
/****** Object:  StoredProcedure [dbo].[spDepartentUpdate]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDepartentUpdate]
@id_departemen int
,@nama_departemen varchar(50)
,@modiby varchar(50)
,@modidate datetime

AS
UPDATE departemen SET
		nama_departemen = @nama_departemen
		,modiby = @modiby
		,modidate = @modidate
WHERE id_departemen = @id_departemen
GO
/****** Object:  StoredProcedure [dbo].[spDepartmentDelete]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDepartmentDelete]
@id_departemen int,
@status varchar(25),
@modiby varchar(50),
@modidate date
AS
update departemen
set status= @status, modiby= @modiby, modidate = @modidate
WHERE id_departemen = @id_departemen
GO
/****** Object:  StoredProcedure [dbo].[spDepartmentInsert]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDepartmentInsert]
 @nama_departemen varchar(50)
,@creaby varchar(50)
,@creadate datetime

AS
INSERT INTO 
	departemen(
		nama_departemen
		,status
		,creaby
		,creadate
		)
VALUES (
		@nama_departemen
		,'Aktif'
		,@creaby
		,@creadate
		)
GO
/****** Object:  StoredProcedure [dbo].[spDepartmentView]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[spDepartmentView]
AS
BEGIN
	SELECT
	d.id_departemen,
	d.nama_departemen,
	d.status,
	d.creaby,
	d.creadate,
	d.modiby,
	d.modidate
	FROM departemen d
	END
GO
/****** Object:  StoredProcedure [dbo].[spDetilBreakdownInsert]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDetilBreakdownInsert]
@id_perhitunganOEE int
,@breakdown int
,@waktu datetime
AS
INSERT INTO 
	detail_breakdown(
		id_perhitunganOEE
		,breakdown
		,waktu
		)
VALUES (
		@id_perhitunganOEE
		,@breakdown
		,@waktu
		)
GO
/****** Object:  StoredProcedure [dbo].[spKaryawanDelete]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spKaryawanDelete]
@NIK varchar(20),
@status varchar(10),
@modiby varchar(50),
@modidate datetime
AS
BEGIN
	UPDATE karyawan SET status = @status, modiby = @modiby, modidate = @modidate WHERE NIK = @NIK
END
GO
/****** Object:  StoredProcedure [dbo].[spKaryawanInsert]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spKaryawanInsert]
@NIK varchar(50),
@password varchar(20),
@id_departemen int,
@nama_karyawan varchar(50),
@email varchar(20),
@alamat varchar(max),
@telepon varchar(20),
@foto varchar(200),
@tanggal_lahir date,
@role varchar(200),
@status varchar(10),
@creaby varchar(50),
@creadate datetime

AS
BEGIN
	INSERT INTO karyawan 
	(NIK, password, id_departemen, nama_karyawan, email, alamat, telepon, foto, tanggal_lahir, role, status, creaby, creadate)
	VALUES(
	@NIK
	,@password
	,@id_departemen
	,@nama_karyawan
	,@email
	,@alamat
	,@telepon
	,@foto
	,@tanggal_lahir
	,@role
	,@status
	,@creaby
	,@creadate)
END
GO
/****** Object:  StoredProcedure [dbo].[spKaryawanUpdate]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spKaryawanUpdate]
@NIK varchar(50),
@id_departemen int,
@nama_karyawan varchar(50),
@email varchar(20),
@alamat varchar(max),
@telepon varchar(20),
@foto varchar(200),
@tanggal_lahir date,
@role varchar(200),
@status varchar(10),
@modiby varchar(50),
@modidate datetime

AS
BEGIN
	UPDATE karyawan SET
	id_departemen = @id_departemen
	,nama_karyawan = @nama_karyawan
	,email = @email
	,alamat = @alamat
	,telepon = @telepon
	,foto=@foto
	,tanggal_lahir = @tanggal_lahir
	,role = @role
	,status = @status
	,modiby = @modiby
	,modidate = @modidate
	WHERE NIK = @NIK
END

GO
/****** Object:  StoredProcedure [dbo].[spKaryawanView]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spKaryawanView]
AS
BEGIN
	SELECT
	k.NIK
	,k.nama_karyawan
	,k.email
	,k.alamat
	,k.telepon
	,k.tanggal_lahir
	,k.role
	,k.password
	,k.status
	,k.creaby
	,k.creadate
	,k.modiby
	,k.modidate
	,m.nama_departemen
	FROM karyawan k JOIN departemen m
	ON k.id_departemen = m.id_departemen
END
GO
/****** Object:  StoredProcedure [dbo].[spLineDelete]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLineDelete]
@id int,
@status varchar(15)

AS
BEGIN
	UPDATE line_produksi SET
	status = @status
	WHERE id_line = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spLineInsert]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLineInsert]
@Nama varchar(50),
@deskripsi varchar(200),
@status varchar(15),
@creaby varchar(50),
@creadate datetime

AS
BEGIN
	INSERT INTO line_produksi 
	(nama_line, deskripsi, status, creaby, creadate)
	VALUES(
	@Nama,
	@deskripsi
	,@status
	,@creaby
	,@creadate)
END
GO
/****** Object:  StoredProcedure [dbo].[spLineUpdate]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLineUpdate]
@id int,
@Nama varchar(50),
@deskripsi varchar(200),
@status varchar(15),
@modiby varchar(50),
@modidate datetime

AS
BEGIN
	UPDATE line_produksi SET
	nama_line = @Nama,
	deskripsi = @deskripsi
	,status = @status
	,modiby = @modiby
	,modidate = @modidate
	WHERE id_line = @id
END

GO
/****** Object:  StoredProcedure [dbo].[spLineView]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLineView]
AS
BEGIN
	SELECT
	*
	FROM line_produksi
	END
GO
/****** Object:  StoredProcedure [dbo].[spMesinDelete]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMesinDelete]
@no_mesin varchar(20),
@status varchar(25),
@modiby varchar(50),
@modidate date
AS
update mesin
set status= @status, modiby= @modiby, modidate = @modidate
WHERE no_mesin = @no_mesin
GO
/****** Object:  StoredProcedure [dbo].[spMesinInsert]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMesinInsert]
@id_departemen varchar(10)
,@nama_mesin varchar(50)
,@line int
,@tahun_mesin int
,@creaby varchar(50)
,@creadate datetime

AS
INSERT INTO 
	mesin(
		id_departemen
		,nama_mesin
		,line
		,status
		,tahun_mesin
		,creaby
		,creadate
		)
VALUES (
		@id_departemen
		,@nama_mesin
		,@line
		,'Aktif'
		,@tahun_mesin
		,@creaby
		,@creadate
		)
GO
/****** Object:  StoredProcedure [dbo].[spMesinUpdate]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMesinUpdate]
@no_mesin int
,@id_departemen varchar(10)
,@nama_mesin varchar(50)
,@line int
,@tahun_mesin int
,@modiby varchar(50)
,@modidate datetime

AS
UPDATE mesin SET
		id_departemen = @id_departemen
		,nama_mesin = @nama_mesin
		,line = @line
		,tahun_mesin = @tahun_mesin
		,modiby = @modiby
		,modidate = @modidate
WHERE no_mesin = @no_mesin
GO
/****** Object:  StoredProcedure [dbo].[spMesinView]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMesinView]
AS
BEGIN
	SELECT
	m.no_mesin
	,d.nama_departemen
	,m.nama_mesin
	,l.nama_line
	,m.status
	,m.tahun_mesin
	,m.creaby
	,m.creadate
	,m.modiby
	,m.modidate
	FROM mesin m
	JOIN departemen d ON m.id_departemen = d.id_departemen JOIN line_produksi l ON m.line = l.id_line
	END
GO
/****** Object:  StoredProcedure [dbo].[spPerhitunganInsert]    Script Date: 15/08/2021 20:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPerhitunganInsert]
@no_mesin varchar(20),
@operator varchar(50),
@tanggal datetime,
@shift int,
@cycle_time int,
@panjang_shift int,
@waktu_break_pendek int,
@waktu_break_makan int,
@downtime_setup int,
@downtime_breakdown int,
@total_produksi_shift int,
@total_produksi_reject int,
@performance decimal(18,2),
@availability decimal(18,2),
@quality decimal(18,2),
@OEE decimal(18,2)

AS
BEGIN
	INSERT INTO perhitungan_OEE 
	(no_mesin, operator, tanggal, shift, cycle_time, panjang_shift, waktu_break_pendek, waktu_break_makan, 
	downtime_setup, downtime_breakdown, total_produksi_shift, total_produksi_reject, performance, availbility, quality, OEE)
	VALUES(
	@no_mesin
	,@operator
	,@tanggal
	,@shift
	,@cycle_time
	,@panjang_shift
	,@waktu_break_pendek
	,@waktu_break_makan
	,@downtime_setup
	,@downtime_breakdown
	,@total_produksi_shift
	,@total_produksi_reject
	,@performance
	,@availability
	,@quality
	,@OEE)
END
GO
USE [master]
GO
ALTER DATABASE [OEE_Calculator] SET  READ_WRITE 
GO
