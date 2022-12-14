USE [master]
GO
/****** Object:  Database [PruebasServientrega]    Script Date: 30/11/2022 12:11:33 a. m. ******/
CREATE DATABASE [PruebasServientrega]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebasServientrega', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebasServientrega.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebasServientrega_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebasServientrega_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PruebasServientrega] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebasServientrega].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebasServientrega] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebasServientrega] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebasServientrega] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebasServientrega] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebasServientrega] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebasServientrega] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebasServientrega] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebasServientrega] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebasServientrega] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebasServientrega] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebasServientrega] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebasServientrega] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebasServientrega] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebasServientrega] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebasServientrega] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PruebasServientrega] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebasServientrega] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebasServientrega] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebasServientrega] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebasServientrega] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebasServientrega] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebasServientrega] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebasServientrega] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebasServientrega] SET  MULTI_USER 
GO
ALTER DATABASE [PruebasServientrega] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebasServientrega] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebasServientrega] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebasServientrega] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebasServientrega] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebasServientrega] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebasServientrega', N'ON'
GO
ALTER DATABASE [PruebasServientrega] SET QUERY_STORE = OFF
GO
USE [PruebasServientrega]
GO
/****** Object:  Table [dbo].[Avion]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avion](
	[IdAvion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Motor] [varchar](50) NOT NULL,
	[Estado] [bit] NULL,
	[FechaRegistro] [smalldatetime] NOT NULL,
	[FechaCompra] [smalldatetime] NOT NULL,
	[FechaSalida] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAvion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[IdCiudad] [int] NOT NULL,
	[NombreCiudad] [varchar](200) NULL,
	[Aeropuerto] [varchar](100) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelos]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelos](
	[IdViaje] [int] IDENTITY(1,1) NOT NULL,
	[NombreVuelo] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
	[IdAvion] [int] NOT NULL,
	[IdCiudad] [int] NOT NULL,
	[IdDestino] [int] NOT NULL,
	[FechaRegistro] [smalldatetime] NULL,
	[FechaSalida] [smalldatetime] NULL,
	[FechaLlegada] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Avion] ON 

INSERT [dbo].[Avion] ([IdAvion], [Nombre], [Descripcion], [Motor], [Estado], [FechaRegistro], [FechaCompra], [FechaSalida]) VALUES (1, N'Airbus 319', N'Linea para pasajeros y carga', N'BFG486', 1, CAST(N'2022-05-02T15:33:00' AS SmallDateTime), CAST(N'2022-05-22T00:00:00' AS SmallDateTime), NULL)
INSERT [dbo].[Avion] ([IdAvion], [Nombre], [Descripcion], [Motor], [Estado], [FechaRegistro], [FechaCompra], [FechaSalida]) VALUES (2, N'Airbus 320', N'Linea para pasajeros y carga', N'BFG487', 1, CAST(N'2022-05-02T15:34:00' AS SmallDateTime), CAST(N'2022-05-22T00:00:00' AS SmallDateTime), NULL)
INSERT [dbo].[Avion] ([IdAvion], [Nombre], [Descripcion], [Motor], [Estado], [FechaRegistro], [FechaCompra], [FechaSalida]) VALUES (3, N'Airbus 321', N'Linea para carga', N'BFG568', 1, CAST(N'2022-05-02T15:34:00' AS SmallDateTime), CAST(N'2022-05-22T00:00:00' AS SmallDateTime), NULL)
INSERT [dbo].[Avion] ([IdAvion], [Nombre], [Descripcion], [Motor], [Estado], [FechaRegistro], [FechaCompra], [FechaSalida]) VALUES (4, N'Boeing 737', N'Linea para pasajeros y carga', N'BFG456', 1, CAST(N'2022-05-02T16:08:00' AS SmallDateTime), CAST(N'2022-05-22T00:00:00' AS SmallDateTime), NULL)
INSERT [dbo].[Avion] ([IdAvion], [Nombre], [Descripcion], [Motor], [Estado], [FechaRegistro], [FechaCompra], [FechaSalida]) VALUES (5, N'Boeing edw', N'Linea para pasajeros y carga', N'BFG456', 1, CAST(N'2022-05-02T16:08:00' AS SmallDateTime), CAST(N'2022-05-22T00:00:00' AS SmallDateTime), CAST(N'2022-05-22T00:00:00' AS SmallDateTime))
INSERT [dbo].[Avion] ([IdAvion], [Nombre], [Descripcion], [Motor], [Estado], [FechaRegistro], [FechaCompra], [FechaSalida]) VALUES (16, N'string', N'string', N'string', 1, CAST(N'2022-11-30T05:08:00' AS SmallDateTime), CAST(N'2022-11-30T05:08:00' AS SmallDateTime), CAST(N'2022-11-30T05:08:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Avion] OFF
GO
INSERT [dbo].[Ciudades] ([IdCiudad], [NombreCiudad], [Aeropuerto], [Estado]) VALUES (1, N'BOGOTA', N'EL DORADO', 1)
INSERT [dbo].[Ciudades] ([IdCiudad], [NombreCiudad], [Aeropuerto], [Estado]) VALUES (2, N'MEDEILLIN', N'MEDELLIN', 1)
INSERT [dbo].[Ciudades] ([IdCiudad], [NombreCiudad], [Aeropuerto], [Estado]) VALUES (3, N'CALI', N'CALI', 1)
INSERT [dbo].[Ciudades] ([IdCiudad], [NombreCiudad], [Aeropuerto], [Estado]) VALUES (4, N'BUCARAMANGA', N'BUCA', 1)
INSERT [dbo].[Ciudades] ([IdCiudad], [NombreCiudad], [Aeropuerto], [Estado]) VALUES (5, N'RIONEGRO', N'RIONEGRO', 1)
INSERT [dbo].[Ciudades] ([IdCiudad], [NombreCiudad], [Aeropuerto], [Estado]) VALUES (6, N'VILLAVICENCIO', N'EL VILLAO', 1)
INSERT [dbo].[Ciudades] ([IdCiudad], [NombreCiudad], [Aeropuerto], [Estado]) VALUES (7, N'CARTAGENA', N'SIMON BOLIVAR', 1)
GO
SET IDENTITY_INSERT [dbo].[Vuelos] ON 

INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (6, N'AAAB1', N'Vuelo 1', 1, 1, 2, CAST(N'2022-05-02T16:28:00' AS SmallDateTime), CAST(N'2022-04-01T10:00:00' AS SmallDateTime), CAST(N'2022-04-01T13:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (7, N'AAAB2', N'Vuelo 2', 1, 1, 3, CAST(N'2022-05-02T16:28:00' AS SmallDateTime), CAST(N'2022-04-02T10:00:00' AS SmallDateTime), CAST(N'2022-04-02T11:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (8, N'AAAB3', N'Vuelo 3', 1, 1, 4, CAST(N'2022-05-02T16:28:00' AS SmallDateTime), CAST(N'2022-04-03T10:00:00' AS SmallDateTime), CAST(N'2022-04-03T12:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (9, N'AAAB4', N'Vuelo 4', 1, 1, 5, CAST(N'2022-05-02T16:28:00' AS SmallDateTime), CAST(N'2022-04-04T10:00:00' AS SmallDateTime), CAST(N'2022-04-04T20:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (10, N'AAAB5', N'Vuelo 5', 1, 1, 6, CAST(N'2022-05-02T16:28:00' AS SmallDateTime), CAST(N'2022-04-05T10:00:00' AS SmallDateTime), CAST(N'2022-04-05T19:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (11, N'AAAB6', N'Vuelo 6', 2, 1, 7, CAST(N'2022-05-02T17:04:00' AS SmallDateTime), CAST(N'2022-04-01T10:00:00' AS SmallDateTime), CAST(N'2022-04-01T15:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (12, N'AAAB7', N'Vuelo 7', 2, 1, 4, CAST(N'2022-05-02T17:04:00' AS SmallDateTime), CAST(N'2022-04-02T10:00:00' AS SmallDateTime), CAST(N'2022-04-02T12:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (13, N'AAAB8', N'Vuelo 8', 2, 1, 5, CAST(N'2022-05-02T17:04:00' AS SmallDateTime), CAST(N'2022-04-03T10:00:00' AS SmallDateTime), CAST(N'2022-04-03T14:00:00' AS SmallDateTime))
INSERT [dbo].[Vuelos] ([IdViaje], [NombreVuelo], [Descripcion], [IdAvion], [IdCiudad], [IdDestino], [FechaRegistro], [FechaSalida], [FechaLlegada]) VALUES (14, N'AAAB9', N'Vuelo 9', 3, 1, 5, CAST(N'2022-05-02T17:16:00' AS SmallDateTime), CAST(N'2022-04-04T10:00:00' AS SmallDateTime), CAST(N'2022-04-04T20:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Vuelos] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_addAvion]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_addAvion] @Nombre varchar(200),@Descripcion varchar(max),@Motor
varchar(50),@Estado bit,@FechaRegistro datetime,@FechaCompra datetime, @FechaSalida datetime
AS
Begin try 
BEGIN TRAN
	INSERT INTO Avion([Nombre], [Descripcion], [Motor], [Estado], [FechaRegistro],[FechaCompra],[FechaSalida]) 
	VALUES (@nombre,@Descripcion, @Motor, @Estado, @FechaRegistro,@FechaCompra,@FechaSalida)
	COMMIT
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_addVuelo]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_addVuelo]  @NombreVuelo varchar(100),@Descripcion varchar(200),@IdAvion int,
		@IdCiudad int,@IdDestino int,@FechaRegistro SMALLdatetime,@FechaSalida SMALLdatetime, @FechaLlegada SMALLdatetime
AS
Begin try 
BEGIN TRAN
	INSERT INTO Vuelos(NombreVuelo, Descripcion,IdAvion,IdCiudad,IdDestino, FechaRegistro,FechaSalida,FechaLlegada) 
	VALUES (@NombreVuelo, @Descripcion, @IdAvion, @IdCiudad, @IdDestino, @FechaRegistro,@FechaSalida,@FechaLlegada)
	COMMIT
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultadeCiudades]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ConsultadeCiudades] 
AS
Begin try 
BEGIN TRAN
	Select IdDestino, COUNT(*) as Numerodevisitas
	From Vuelos
	group by IdDestino
	having count(*)>=0
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAvion]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteAvion] 
	@IdAvion int
AS
Begin try 
BEGIN TRAN
	Delete
	From Avion
	where IdAvion =@IdAvion
	COMMIT
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_getAvion]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getAvion] 
	@IdAvion int
AS
Begin try 
BEGIN TRAN
	Select IdAvion, Nombre, Descripcion, Motor, Estado, FechaRegistro,FechaCompra,FechaSalida
	From Avion
	WHERE (IdAvion= @IdAvion)
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAvionAll]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAvionAll]
AS
Begin try 
BEGIN TRAN
	Select *
	From Avion
	COMMIT
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_GetVuelosAll]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetVuelosAll]
AS
Begin try 
BEGIN TRAN
	Select *
	From Vuelos
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_updateAvion]    Script Date: 30/11/2022 12:11:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_updateAvion] 
	@IdAvion INT,
	@Nombre varchar(200),
	@Descripcion varchar(max),
	@Motor varchar(50),
	@Estado bit,
	@FechaCompra datetime, 
	@FechaSalida datetime
AS
Begin try 
BEGIN TRAN
	UPDATE Avion
	SET
		Nombre = @nombre, 
		Descripcion = @Descripcion, 
		Motor = @Motor, 
		Estado = @Estado, 
		FechaCompra = @FechaCompra,
		FechaSalida = @FechaSalida   
		WHERE IdAvion =@IdAvion
		COMMIT
END TRY
BEGIN CATCH
	PRINT Error_message()
END CATCH
GO
USE [master]
GO
ALTER DATABASE [PruebasServientrega] SET  READ_WRITE 
GO
