USE [OEE_Calculator]
GO
/****** Object:  Table [dbo].[departemen]    Script Date: 7/29/2021 7:02:44 PM ******/
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
/****** Object:  Table [dbo].[detail_breakdown]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  Table [dbo].[karyawan]    Script Date: 7/29/2021 7:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[karyawan](
	[NIK] [varchar](50) NOT NULL,
	[password] [varchar](20) NULL,
	[id_departemen] [int] NULL,
	[nama_karyawan] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[alamat] [varchar](max) NULL,
	[telepon] [varchar](20) NULL,
	[foto] [varchar](200) NULL,
	[tanggal_lahir] [date] NULL,
	[role] [varchar](10) NULL,
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
/****** Object:  Table [dbo].[line_produksi]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  Table [dbo].[mesin]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  Table [dbo].[perhitungan_OEE]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_departemen]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_line]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_maxIdPerhitungan]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getAutentik]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_search_departemen]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_search_karyawan]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_search_line]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_search_mesin]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCariDepartmentbyID]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCariDepartmentByNama]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCariKaryawanbyNIK]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCariLinebyID]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCariMesinbyID]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCariNamaLine]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDepartemenView]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDepartentUpdate]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDepartmentDelete]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDepartmentInsert]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDepartmentView]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDetilBreakdownInsert]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spKaryawanDelete]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spKaryawanInsert]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spKaryawanUpdate]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spKaryawanView]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spLineDelete]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spLineInsert]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spLineUpdate]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spLineView]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMesinDelete]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMesinInsert]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMesinUpdate]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMesinView]    Script Date: 7/29/2021 7:02:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spPerhitunganInsert]    Script Date: 7/29/2021 7:02:45 PM ******/
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
