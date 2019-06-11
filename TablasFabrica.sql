USE [master]
GO

/****** Object:  Database [Fabrica]    Script Date: 9/6/2019 11:16:54 p. m. ******/
CREATE DATABASE [Fabrica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fabrica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Fabrica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fabrica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Fabrica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [Fabrica] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fabrica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Fabrica] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Fabrica] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Fabrica] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Fabrica] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Fabrica] SET ARITHABORT OFF 
GO

ALTER DATABASE [Fabrica] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Fabrica] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Fabrica] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Fabrica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Fabrica] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Fabrica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Fabrica] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Fabrica] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Fabrica] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Fabrica] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Fabrica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Fabrica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Fabrica] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Fabrica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Fabrica] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Fabrica] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Fabrica] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Fabrica] SET RECOVERY FULL 
GO

ALTER DATABASE [Fabrica] SET  MULTI_USER 
GO

ALTER DATABASE [Fabrica] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Fabrica] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Fabrica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Fabrica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Fabrica] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Fabrica] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Fabrica] SET  READ_WRITE 
GO


USE [Fabrica]
GO

/****** Object:  Table [dbo].[Automovil]    Script Date: 9/6/2019 11:17:33 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
USE [Fabrica]
GO

/****** Object:  Table [dbo].[Caracteristicas]    Script Date: 9/6/2019 11:18:31 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Caracteristicas](
	[idCaracteristica] [int] IDENTITY(1,1) NOT NULL,
	[color] [varchar](20) NOT NULL,
	[marca] [varchar](20) NOT NULL,
	[cantidadPasajeros] [int] NOT NULL,
	[nPuertas] [int] NOT NULL,
 CONSTRAINT [PK_Caracteristicas] PRIMARY KEY CLUSTERED 
(
	[idCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [Fabrica]
GO

/****** Object:  Table [dbo].[Extra]    Script Date: 9/6/2019 11:21:02 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Extra](
	[idExtra] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[precio] [money] NOT NULL,
 CONSTRAINT [PK_Extra] PRIMARY KEY CLUSTERED 
(
	[idExtra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [Fabrica]
GO

/****** Object:  Table [dbo].[Foto]    Script Date: 9/6/2019 11:21:49 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Foto](
	[idFoto] [int] IDENTITY(1,1) NOT NULL,
	[foto] [image] NOT NULL,
 CONSTRAINT [PK_Foto] PRIMARY KEY CLUSTERED 
(
	[idFoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [Fabrica]
GO

/****** Object:  Table [dbo].[TipoAutomovil]    Script Date: 9/6/2019 11:22:25 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoAutomovil](
	[idTipoAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoAutomovil] PRIMARY KEY CLUSTERED 
(
	[idTipoAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [Fabrica]
GO

/****** Object:  Table [dbo].[TipoCombustible]    Script Date: 9/6/2019 11:22:49 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoCombustible](
	[idTipoCombustible] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoCombustible] PRIMARY KEY CLUSTERED 
(
	[idTipoCombustible] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Automovil](
	[idAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idTipoAutomovil] [int] NOT NULL,
	[idTipoCombustible] [int] NOT NULL,
	[placa] [varchar](20) NOT NULL,
	[precioBase] [money] NOT NULL,
	[consignacion] [bit] NOT NULL,
 CONSTRAINT [PK_Automovil] PRIMARY KEY CLUSTERED 
(
	[idAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Automovil]  WITH CHECK ADD  CONSTRAINT [FK_Automovil_TipoAutomovil] FOREIGN KEY([idTipoAutomovil])
REFERENCES [dbo].[TipoAutomovil] ([idTipoAutomovil])
GO

ALTER TABLE [dbo].[Automovil] CHECK CONSTRAINT [FK_Automovil_TipoAutomovil]
GO

ALTER TABLE [dbo].[Automovil]  WITH CHECK ADD  CONSTRAINT [FK_Automovil_TipoCombustible] FOREIGN KEY([idTipoCombustible])
REFERENCES [dbo].[TipoCombustible] ([idTipoCombustible])
GO

ALTER TABLE [dbo].[Automovil] CHECK CONSTRAINT [FK_Automovil_TipoCombustible]
GO

USE [Fabrica]
GO

/****** Object:  Table [dbo].[CaracteristicasxAutomovil]    Script Date: 9/6/2019 11:23:21 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CaracteristicasxAutomovil](
	[idCaracteristicasxAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idCaracteristica] [int] NOT NULL,
	[idAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_CaracteristicasxAutomovil] PRIMARY KEY CLUSTERED 
(
	[idCaracteristicasxAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CaracteristicasxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_CaracteristicasxAutomovil_Automovil] FOREIGN KEY([idAutomovil])
REFERENCES [dbo].[Automovil] ([idAutomovil])
GO

ALTER TABLE [dbo].[CaracteristicasxAutomovil] CHECK CONSTRAINT [FK_CaracteristicasxAutomovil_Automovil]
GO

ALTER TABLE [dbo].[CaracteristicasxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_CaracteristicasxAutomovil_Caracteristicas] FOREIGN KEY([idCaracteristica])
REFERENCES [dbo].[Caracteristicas] ([idCaracteristica])
GO

ALTER TABLE [dbo].[CaracteristicasxAutomovil] CHECK CONSTRAINT [FK_CaracteristicasxAutomovil_Caracteristicas]
GO


USE [Fabrica]
GO

/****** Object:  Table [dbo].[ExtraxAutomovil]    Script Date: 9/6/2019 11:23:39 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExtraxAutomovil](
	[idExtraxAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idExtra] [int] NOT NULL,
	[idAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_ExtraxAutomovil] PRIMARY KEY CLUSTERED 
(
	[idExtraxAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExtraxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_ExtraxAutomovil_Automovil] FOREIGN KEY([idAutomovil])
REFERENCES [dbo].[Automovil] ([idAutomovil])
GO

ALTER TABLE [dbo].[ExtraxAutomovil] CHECK CONSTRAINT [FK_ExtraxAutomovil_Automovil]
GO

ALTER TABLE [dbo].[ExtraxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_ExtraxAutomovil_Extra] FOREIGN KEY([idExtra])
REFERENCES [dbo].[Extra] ([idExtra])
GO

ALTER TABLE [dbo].[ExtraxAutomovil] CHECK CONSTRAINT [FK_ExtraxAutomovil_Extra]
GO

USE [Fabrica]
GO

/****** Object:  Table [dbo].[FotoxAutomovil]    Script Date: 9/6/2019 11:24:57 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FotoxAutomovil](
	[idFotoxAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idFoto] [int] NOT NULL,
	[idAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_FotoxAutomovil] PRIMARY KEY CLUSTERED 
(
	[idFotoxAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FotoxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_FotoxAutomovil_Automovil] FOREIGN KEY([idAutomovil])
REFERENCES [dbo].[Automovil] ([idAutomovil])
GO

ALTER TABLE [dbo].[FotoxAutomovil] CHECK CONSTRAINT [FK_FotoxAutomovil_Automovil]
GO

ALTER TABLE [dbo].[FotoxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_FotoxAutomovil_Foto] FOREIGN KEY([idFoto])
REFERENCES [dbo].[Foto] ([idFoto])
GO

ALTER TABLE [dbo].[FotoxAutomovil] CHECK CONSTRAINT [FK_FotoxAutomovil_Foto]
GO


USE [Fabrica]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 10/6/2019 12:42:11 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido1] [varchar](20) NOT NULL,
	[apellido2] [varchar](20) NOT NULL,
	[cedula] [int] NOT NULL,
	[edad] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [Fabrica]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 9/6/2019 11:25:34 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClienteUbicacion](
	[idClienteUbicacion] [int] IDENTITY(1,1) NOT NULL,
	[ubicacion] [geometry] NOT NULL,
 CONSTRAINT [PK_ClienteUbicacion] PRIMARY KEY CLUSTERED 
(
	[idClienteUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [Fabrica]
GO

/****** Object:  Table [dbo].[Fabrica]    Script Date: 9/6/2019 11:26:03 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fabrica](
	[idFabrica] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](20) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Fabrica] PRIMARY KEY CLUSTERED 
(
	[idFabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [Fabrica]
GO

/****** Object:  Table [dbo].[EmpleadoFabrica]    Script Date: 9/6/2019 11:26:38 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmpleadoFabrica](
	[idEmpleadoFabrica] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[cedula] [int] NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EmpleadoFabrica] PRIMARY KEY CLUSTERED 
(
	[idEmpleadoFabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmpleadoFabrica]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoFabrica_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO

ALTER TABLE [dbo].[EmpleadoFabrica] CHECK CONSTRAINT [FK_EmpleadoFabrica_Fabrica]
GO



USE [Fabrica]
GO

/****** Object:  Table [dbo].[PedidoSucursal1]    Script Date: 10/6/2019 12:43:08 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PedidoSucursal1](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
	[despacho] [bit] NOT NULL,
 CONSTRAINT [PK_PedidoSucursal1] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PedidoSucursal1]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal1_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO

ALTER TABLE [dbo].[PedidoSucursal1] CHECK CONSTRAINT [FK_PedidoSucursal1_Cliente]
GO

ALTER TABLE [dbo].[PedidoSucursal1]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal1_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO

ALTER TABLE [dbo].[PedidoSucursal1] CHECK CONSTRAINT [FK_PedidoSucursal1_Fabrica]
GO



USE [Fabrica]
GO

/****** Object:  Table [dbo].[PedidoSucursal2]    Script Date: 10/6/2019 12:43:57 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PedidoSucursal2](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
	[despacho] [bit] NOT NULL,
 CONSTRAINT [PK_PedidoSucursal2] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PedidoSucursal2]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal2_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO

ALTER TABLE [dbo].[PedidoSucursal2] CHECK CONSTRAINT [FK_PedidoSucursal2_Cliente]
GO

ALTER TABLE [dbo].[PedidoSucursal2]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal2_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO

ALTER TABLE [dbo].[PedidoSucursal2] CHECK CONSTRAINT [FK_PedidoSucursal2_Fabrica]
GO


USE [Fabrica]
GO

/****** Object:  Table [dbo].[PedidoSucursal2]    Script Date: 10/6/2019 12:43:57 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PedidoSucursal3](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
	[despacho] [bit] NOT NULL,
 CONSTRAINT [PK_PedidoSucursal3] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PedidoSucursal3]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal3_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO

ALTER TABLE [dbo].[PedidoSucursal3] CHECK CONSTRAINT [FK_PedidoSucursal3_Cliente]
GO

ALTER TABLE [dbo].[PedidoSucursal3]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal3_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO

ALTER TABLE [dbo].[PedidoSucursal3] CHECK CONSTRAINT [FK_PedidoSucursal3_Fabrica]
GO









