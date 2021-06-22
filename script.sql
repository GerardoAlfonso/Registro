USE [Registro]
GO
/****** Object:  Table [dbo].[alm_alumno]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  Table [dbo].[grd_grado]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  Table [dbo].[mat_materia]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  Table [dbo].[mxg_materiasxgrado]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_delete_alm]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_eliminar_grd]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_eliminar_mat]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_list_alm]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_list_grado]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_list_mat]    Script Date: 21/6/2021 21:17:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_list_mxg]    Script Date: 21/6/2021 21:17:48 ******/
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
