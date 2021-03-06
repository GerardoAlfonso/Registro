USE [master]
GO
/****** Object:  Database [Registro]    Script Date: 22/6/2021 00:10:44 ******/
CREATE DATABASE [Registro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Registro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Registro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Registro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Registro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Registro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Registro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Registro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Registro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Registro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Registro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Registro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Registro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Registro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Registro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Registro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Registro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Registro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Registro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Registro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Registro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Registro] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Registro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Registro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Registro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Registro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Registro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Registro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Registro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Registro] SET RECOVERY FULL 
GO
ALTER DATABASE [Registro] SET  MULTI_USER 
GO
ALTER DATABASE [Registro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Registro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Registro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Registro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Registro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Registro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Registro', N'ON'
GO
ALTER DATABASE [Registro] SET QUERY_STORE = OFF
GO
USE [Registro]
GO
/****** Object:  Table [dbo].[alm_alumno]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alm_alumno](
	[alm_id] [int] NOT NULL,
	[alm_nombre] [varchar](300) NULL,
	[alm_edad] [int] NULL,
	[alm_sexo] [varchar](100) NULL,
	[alm_observacion] [varchar](300) NULL,
	[alm_created_at] [datetime] NULL,
	[alm_updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[alm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grd_grado]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grd_grado](
	[grd_id] [int] NOT NULL,
	[grd_nombre] [varchar](100) NULL,
	[grd_created_at] [datetime] NULL,
	[grd_updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[grd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mat_materia]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mat_materia](
	[mat_id] [int] NOT NULL,
	[mat_nombre] [varchar](100) NULL,
	[mat_created_at] [datetime] NULL,
	[mat_updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[mat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mxg_materiasxgrado]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mxg_materiasxgrado](
	[mxg_id] [int] NOT NULL,
	[mxg_id_grad] [int] NULL,
	[mxg_id_mat] [int] NULL,
	[mxg_created_at] [datetime] NULL,
	[mxg_updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[mxg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mxg_materiasxgrado]  WITH CHECK ADD FOREIGN KEY([mxg_id_grad])
REFERENCES [dbo].[grd_grado] ([grd_id])
GO
ALTER TABLE [dbo].[mxg_materiasxgrado]  WITH CHECK ADD FOREIGN KEY([mxg_id_mat])
REFERENCES [dbo].[mat_materia] ([mat_id])
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_alm]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizar_alm]
	-- Add the parameters for the stored procedure here
	@id int,
	@nombre varchar,
	@edad varchar,
	@sexo varchar,
	@observacion varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update alm_alumno
	set alm_nombre = @nombre, alm_edad = @edad, alm_sexo = @sexo, alm_observacion = @observacion, alm_updated_at = SYSDATETIME()
	where alm_id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_alm]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delete_alm]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM alm_alumno WHERE alm_id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_grd]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_eliminar_grd]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM grd_grado WHERE grd_id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_mat]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_eliminar_mat]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM mat_materia WHERE mat_id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_alm]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertar_alm]
	-- Add the parameters for the stored procedure here
	@alm_id int,
	@nombre varchar (100),
	@edad int,
	@sexo varchar (100),
	@observacion varchar (100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	    -- Insert statements for procedure here
		select * from alm_alumno
	
	insert into alm_alumno (alm_id, alm_nombre, alm_edad,alm_sexo, alm_observacion, alm_created_at, alm_updated_at)
	values (@alm_id, @nombre, @edad, @sexo, @observacion, SYSDATETIME(), SYSDATETIME())


END
GO
/****** Object:  StoredProcedure [dbo].[sp_list_alm]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_list_alm]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from alm_alumno
END
GO
/****** Object:  StoredProcedure [dbo].[sp_list_grado]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_list_grado]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from grd_grado
END
GO
/****** Object:  StoredProcedure [dbo].[sp_list_mat]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_list_mat]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from mat_materia
END
GO
/****** Object:  StoredProcedure [dbo].[sp_list_mxg]    Script Date: 22/6/2021 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_list_mxg]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from mxg_materiasxgrado
END
GO
USE [master]
GO
ALTER DATABASE [Registro] SET  READ_WRITE 
GO
