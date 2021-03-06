USE [master]
GO
/****** Object:  Database [MobileWorldPlus]    Script Date: 6/2/2020 5:16:01 PM ******/
CREATE DATABASE [MobileWorldPlus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobileWorldPlus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MobileWorldPlus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MobileWorldPlus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MobileWorldPlus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MobileWorldPlus] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobileWorldPlus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobileWorldPlus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MobileWorldPlus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobileWorldPlus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobileWorldPlus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MobileWorldPlus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobileWorldPlus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MobileWorldPlus] SET  MULTI_USER 
GO
ALTER DATABASE [MobileWorldPlus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobileWorldPlus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobileWorldPlus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobileWorldPlus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MobileWorldPlus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MobileWorldPlus] SET QUERY_STORE = OFF
GO
USE [MobileWorldPlus]
GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[catalogid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[unit] [int] NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__Baskets__048C0F37AFDAEBC1] PRIMARY KEY CLUSTERED 
(
	[catalogid] ASC,
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [decimal](18, 2) NULL,
	[unit] [int] NULL,
	[catalogid] [int] NOT NULL,
	[pictureuri] [nvarchar](max) NULL,
	[name] [nvarchar](255) NULL,
	[status] [int] NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[userid] [int] NOT NULL,
	[shiptoaddress] [nvarchar](255) NULL,
	[notebuy] [nvarchar](255) NULL,
	[phone] [nvarchar](12) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK__Bills__3213E83F565D9F21] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogBrands]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogBrands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand] [nvarchar](100) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[pictureurl] [nvarchar](100) NULL,
 CONSTRAINT [PK__CatalogB__3213E83F9BE06555] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogs]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[pictureuri] [nvarchar](255) NULL,
	[price] [decimal](18, 2) NULL,
	[description] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[catalogtypeid] [int] NOT NULL,
	[catalogbrandid] [int] NOT NULL,
	[quantity] [int] NULL,
	[metatitle] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__Catalogs__3213E83FB0FCD413] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogTypes]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](100) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__CatalogT__3213E83F57A5E6DD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Histories]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Histories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[inputprice] [decimal](18, 2) NULL,
	[unit] [int] NULL,
	[catalogid] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__Historie__3213E83FEA4222C2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageBill]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageBill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countChoDuyet] [int] NULL,
	[countDaHuy] [int] NULL,
	[updateChoDuyetAt] [datetimeoffset](7) NULL,
	[updateDaHuyAt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_MessageBill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[billid] [int] NOT NULL,
	[userid] [int] NULL,
	[title] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[status] [int] NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__Notifica__6D9D238B67EB2971] PRIMARY KEY CLUSTERED 
(
	[billid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
 CONSTRAINT [PK__Roles__3213E83FE9B93F2C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cpu] [nvarchar](100) NULL,
	[ram] [nvarchar](100) NULL,
	[screen] [nvarchar](100) NULL,
	[os] [nvarchar](100) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[catalogid] [int] NOT NULL,
 CONSTRAINT [PK__Specific__3213E83FF1C3E27C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecificationsLaptops]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationsLaptops](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cardscreen] [nvarchar](100) NULL,
	[connector] [nvarchar](100) NULL,
	[harddrive] [nvarchar](100) NULL,
	[design] [nvarchar](100) NULL,
	[size] [nvarchar](100) NULL,
	[release] [nvarchar](100) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[catalogid] [int] NOT NULL,
 CONSTRAINT [PK__Specific__3213E83F7184A9C8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecificationsMobiles]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationsMobiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[backcamera] [nvarchar](100) NULL,
	[frontcamera] [nvarchar](100) NULL,
	[internalmemory] [nvarchar](100) NULL,
	[memorystick] [nvarchar](100) NULL,
	[sim] [nvarchar](100) NULL,
	[batery] [nvarchar](100) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[catalogid] [int] NOT NULL,
 CONSTRAINT [PK__Specific__3213E83F9E44D28F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[roleid] [int] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK__UserRole__A12350D7D5800AB7] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC,
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/2/2020 5:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[phonenumber] [nvarchar](15) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](150) NULL,
	[createdby] [nvarchar](255) NULL,
	[modifiedby] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NULL,
	[updatedAt] [datetimeoffset](7) NULL,
	[gender] [int] NULL,
	[avatar] [nvarchar](255) NULL,
 CONSTRAINT [PK__Users__3213E83F248FB393] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (14, 34, 1, CAST(N'2020-05-03T17:28:28.7598430+07:00' AS DateTimeOffset), CAST(N'2020-05-03T17:28:28.7598430+07:00' AS DateTimeOffset))
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (15, 16, 1, CAST(N'2020-05-03T16:48:39.6798262+07:00' AS DateTimeOffset), CAST(N'2020-05-03T16:48:39.6808275+07:00' AS DateTimeOffset))
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (15, 17, 4, CAST(N'2020-04-29T07:44:59.8650000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T07:44:59.8650000+00:00' AS DateTimeOffset))
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (16, 17, 4, CAST(N'2020-04-29T07:16:00.8740000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T07:16:00.8740000+00:00' AS DateTimeOffset))
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (30, 16, 2, CAST(N'2020-05-02T09:14:39.9880383+07:00' AS DateTimeOffset), CAST(N'2020-05-02T11:32:14.2464419+07:00' AS DateTimeOffset))
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (30, 34, 1, CAST(N'2020-05-03T17:06:23.1402005+07:00' AS DateTimeOffset), CAST(N'2020-05-03T17:06:23.1402005+07:00' AS DateTimeOffset))
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (36, 16, 1, CAST(N'2020-05-02T09:27:36.0863114+07:00' AS DateTimeOffset), CAST(N'2020-05-02T09:27:45.1610498+07:00' AS DateTimeOffset))
INSERT [dbo].[Baskets] ([catalogid], [userid], [unit], [createdAt], [updatedAt]) VALUES (36, 34, 1, CAST(N'2020-05-03T17:06:35.8789462+07:00' AS DateTimeOffset), CAST(N'2020-05-03T17:06:35.8789462+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (38, CAST(21160000.00 AS Decimal(18, 2)), 4, 1, N'https://cdn.tgdd.vn/Products/Images/42/218662/oppo-a31-2020-128gb-den-400x460-2-400x460.png', N'Điện thoại OPPO A31', 2, CAST(N'2020-04-21T07:16:20.0860000+00:00' AS DateTimeOffset), CAST(N'2020-04-28T08:17:42.4380000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (39, CAST(42440000.00 AS Decimal(18, 2)), 4, 2, N'https://cdn.tgdd.vn/Products/Images/44/207798/lenovo-ideapad-s145-15iwl-i3-8145u-4gb-256gb-mx110-18-600x600.jpg', N'Laptop Lenovo Ideapad S145 15IWL', -1, CAST(N'2020-04-21T07:16:20.1280000+00:00' AS DateTimeOffset), CAST(N'2020-04-28T08:18:52.6230000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (41, CAST(53960000.00 AS Decimal(18, 2)), 4, 4, N'https://cdn.tgdd.vn/Products/Images/42/213590/xiaomi-mi-note-10-pro-black-400x460.png', N'Điện thoại Xiaomi Mi Note 10 Pro', 1, CAST(N'2020-04-21T07:16:30.1540000+00:00' AS DateTimeOffset), CAST(N'2020-04-21T07:16:30.1540000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (42, CAST(31920000.00 AS Decimal(18, 2)), 8, 5, N'https://cdn.tgdd.vn/Products/Images/42/167535/xiaomi-redmi-note-7-400x460.png', N'Điện thoại Xiaomi Redmi Note 7', 1, CAST(N'2020-04-21T07:16:30.2100000+00:00' AS DateTimeOffset), CAST(N'2020-04-21T07:16:30.2100000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (43, CAST(49520000.00 AS Decimal(18, 2)), 8, 6, N'https://cdn.tgdd.vn/Products/Images/42/214418/xiaomi-redmi-note-8-pro-6gb-128gb-white-400x460.png', N'Điện thoại Xiaomi Redmi Note 8 Pro', 1, CAST(N'2020-04-24T09:16:57.9340000+00:00' AS DateTimeOffset), CAST(N'2020-04-24T09:16:57.9340000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (44, CAST(29960000.00 AS Decimal(18, 2)), 4, 7, N'https://cdn.tgdd.vn/Products/Images/42/198394/xiaomi-mi-9-se-400x460.png', N'Điện thoại Xiaomi Mi 9 SE', 1, CAST(N'2020-04-24T10:58:03.1800000+00:00' AS DateTimeOffset), CAST(N'2020-04-24T10:58:03.1800000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (45, CAST(31960000.00 AS Decimal(18, 2)), 4, 8, N'https://cdn.tgdd.vn/Products/Images/42/209800/oppo-reno2-f-white-400x460-400x460.png', N'Điện thoại OPPO Reno2 F', 0, CAST(N'2020-04-24T11:03:25.8970000+00:00' AS DateTimeOffset), CAST(N'2020-04-24T11:03:25.8970000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (46, CAST(95960000.00 AS Decimal(18, 2)), 4, 9, N'https://cdn.tgdd.vn/Products/Images/42/198150/oppo-find-x2-xanh-400x460-1-400x460.png', N'Điện thoại OPPO Find X2', 0, CAST(N'2020-04-24T11:03:25.9580000+00:00' AS DateTimeOffset), CAST(N'2020-04-24T11:03:25.9580000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (47, CAST(179450000.00 AS Decimal(18, 2)), 5, 12, N'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-400x460.png', N'Điện thoại iPhone 11 Pro Max', -1, CAST(N'2020-04-29T07:16:19.8570000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T07:36:21.8600000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (48, CAST(59560000.00 AS Decimal(18, 2)), 4, 15, N'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-1-400x460.png', N'Điện thoại iPhone 8 Plus', 2, CAST(N'2020-04-29T07:16:19.9020000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T07:39:44.5990000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (49, CAST(115960000.00 AS Decimal(18, 2)), 4, 13, N'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-400x460.png', N'Điện thoại iPhone Xs Max', 2, CAST(N'2020-04-29T07:45:51.4270000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T07:48:55.9370000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (50, CAST(91560000.00 AS Decimal(18, 2)), 4, 14, N'https://cdn.tgdd.vn/Products/Images/42/210644/iphone-11-128gb-green-400x460.png', N'Điện thoại iPhone 11', 2, CAST(N'2020-04-29T07:45:51.5650000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T07:49:07.0960000+00:00' AS DateTimeOffset), 17, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (51, CAST(5290000.00 AS Decimal(18, 2)), 8, 1, N'https://cdn.tgdd.vn/Products/Images/42/218662/oppo-a31-2020-128gb-den-400x460-2-400x460.png', N'Điện thoại OPPO A31 (6GB/128GB)', -1, CAST(N'2020-04-30T15:30:34.4260000+00:00' AS DateTimeOffset), CAST(N'2020-04-30T15:32:32.4280000+00:00' AS DateTimeOffset), 16, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (52, CAST(10610000.00 AS Decimal(18, 2)), 8, 2, N'https://cdn.tgdd.vn/Products/Images/44/207798/lenovo-ideapad-s145-15iwl-i3-8145u-4gb-256gb-mx110-18-600x600.jpg', N'Laptop Lenovo Ideapad S145 15IWL', 0, CAST(N'2020-04-30T15:30:34.5560000+00:00' AS DateTimeOffset), CAST(N'2020-04-30T15:30:34.5560000+00:00' AS DateTimeOffset), 16, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (53, CAST(5990000.00 AS Decimal(18, 2)), 8, 3, N'https://cdn.tgdd.vn/Products/Images/42/214924/xiaomi-redmi-note-9s-400x460-400x460.png', N'Điện thoại Xiaomi Redmi Note 9S', 1, CAST(N'2020-04-30T15:30:34.5980000+00:00' AS DateTimeOffset), CAST(N'2020-04-30T15:30:34.5980000+00:00' AS DateTimeOffset), 16, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (70, CAST(26490000.00 AS Decimal(18, 2)), 1, 31, N'https://cdn.tgdd.vn/Products/Images/44/136214/dell-inspiron-7373-i5-8250u-8gb-256gb-win10-office-450-600x600.jpg', N'Laptop Dell Inspiron 7373', 2, CAST(N'2020-05-24T17:55:39.8576012+07:00' AS DateTimeOffset), CAST(N'2020-05-24T17:55:39.8576012+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0856688518', N'Quan Chua')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (71, CAST(20180000.00 AS Decimal(18, 2)), 2, 36, N'https://cdn.tgdd.vn/Products/Images/42/210246/samsung-galaxy-a71-blue-400x460-400x460-1-400x460.png', N'Điện thoại Samsung Galaxy A71', -1, CAST(N'2020-05-24T17:55:39.9015764+07:00' AS DateTimeOffset), CAST(N'2020-05-24T17:55:39.9015764+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0856688518', N'Quan Chua')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (72, CAST(5290000.00 AS Decimal(18, 2)), 1, 1, N'https://cdn.tgdd.vn/Products/Images/42/218662/oppo-a31-2020-128gb-den-400x460-2-400x460.png', N'Điện thoại OPPO A31', -1, CAST(N'2020-05-24T23:09:57.4254668+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:09:57.4254668+07:00' AS DateTimeOffset), 59, N'ha noi', NULL, N'0929829789', N'letuan99utc')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (73, CAST(22990000.00 AS Decimal(18, 2)), 1, 30, N'https://cdn.tgdd.vn/Products/Images/42/191276/samsung-galaxy-note-10-silver-400x460.png', N'Điện thoại Samsung Galaxy Note 10', -1, CAST(N'2020-05-24T23:35:18.1717707+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:35:18.1717707+07:00' AS DateTimeOffset), 59, N'ha noi', NULL, N'0929829789', N'Quan Chua')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (74, CAST(5290000.00 AS Decimal(18, 2)), 1, 1, N'https://cdn.tgdd.vn/Products/Images/42/218662/oppo-a31-2020-128gb-den-400x460-2-400x460.png', N'Điện thoại OPPO A31', 2, CAST(N'2020-05-24T23:36:37.2387662+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:36:37.2387662+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0929829789', N'tuandz')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (75, CAST(71780000.00 AS Decimal(18, 2)), 2, 12, N'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-400x460.png', N'Điện thoại iPhone 11 Pro Max', 2, CAST(N'2020-05-24T23:41:07.2551097+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:41:07.2551097+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0929829789', N'letuan99utc')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (76, CAST(10610000.00 AS Decimal(18, 2)), 1, 2, N'https://cdn.tgdd.vn/Products/Images/44/207798/lenovo-ideapad-s145-15iwl-i3-8145u-4gb-256gb-mx110-18-600x600.jpg', N'Laptop Lenovo Ideapad S145 15IWL', 0, CAST(N'2020-05-24T23:41:07.2601050+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:41:07.2601050+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0929829789', N'letuan99utc')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (77, CAST(22990000.00 AS Decimal(18, 2)), 1, 30, N'https://cdn.tgdd.vn/Products/Images/42/191276/samsung-galaxy-note-10-silver-400x460.png', N'Điện thoại Samsung Galaxy Note 10', 0, CAST(N'2020-05-25T10:41:31.9846165+07:00' AS DateTimeOffset), CAST(N'2020-05-25T10:41:31.9856156+07:00' AS DateTimeOffset), 59, N'nam dinh', NULL, N'0988789889', N'le huy tuan')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (78, CAST(26490000.00 AS Decimal(18, 2)), 1, 31, N'https://cdn.tgdd.vn/Products/Images/44/136214/dell-inspiron-7373-i5-8250u-8gb-256gb-win10-office-450-600x600.jpg', N'Laptop Dell Inspiron 7373', 0, CAST(N'2020-05-25T10:41:31.9996070+07:00' AS DateTimeOffset), CAST(N'2020-05-25T10:41:31.9996070+07:00' AS DateTimeOffset), 59, N'nam dinh', NULL, N'0988789889', N'le huy tuan')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (79, CAST(22990000.00 AS Decimal(18, 2)), 1, 30, N'https://cdn.tgdd.vn/Products/Images/42/191276/samsung-galaxy-note-10-silver-400x460.png', N'Điện thoại Samsung Galaxy Note 10', 0, CAST(N'2020-05-25T14:30:44.9410621+07:00' AS DateTimeOffset), CAST(N'2020-05-25T14:30:44.9410621+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0856688518', N'quanchua')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (80, CAST(52980000.00 AS Decimal(18, 2)), 2, 31, N'https://cdn.tgdd.vn/Products/Images/44/136214/dell-inspiron-7373-i5-8250u-8gb-256gb-win10-office-450-600x600.jpg', N'Laptop Dell Inspiron 7373', 0, CAST(N'2020-05-25T14:30:44.9440603+07:00' AS DateTimeOffset), CAST(N'2020-05-25T14:30:44.9440603+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0856688518', N'quanchua')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (81, CAST(52980000.00 AS Decimal(18, 2)), 2, 31, N'https://cdn.tgdd.vn/Products/Images/44/136214/dell-inspiron-7373-i5-8250u-8gb-256gb-win10-office-450-600x600.jpg', N'Laptop Dell Inspiron 7373', 1, CAST(N'2020-05-25T14:35:38.8153049+07:00' AS DateTimeOffset), CAST(N'2020-05-25T14:35:38.8153049+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0856688518', N'quanchua')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (82, CAST(30270000.00 AS Decimal(18, 2)), 3, 36, N'https://cdn.tgdd.vn/Products/Images/42/210246/samsung-galaxy-a71-blue-400x460-400x460-1-400x460.png', N'Điện thoại Samsung Galaxy A71', -1, CAST(N'2020-05-25T14:35:38.8223012+07:00' AS DateTimeOffset), CAST(N'2020-05-25T14:35:38.8223012+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0856688518', N'quanchua')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (83, CAST(56990000.00 AS Decimal(18, 2)), 1, 47, N'https://cdn.tgdd.vn/Products/Images/44/215941/macbook-pro-16-201926-macbookprotouch16inch-1-600x600.jpg', N'Laptop Macbook Pro Touch 16 inch 2019', -1, CAST(N'2020-05-25T14:58:32.7822391+07:00' AS DateTimeOffset), CAST(N'2020-05-25T14:58:32.7822391+07:00' AS DateTimeOffset), 59, N'ha noi', NULL, N'0929829789', N'tuanlh99')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (84, CAST(22990000.00 AS Decimal(18, 2)), 1, 30, N'https://cdn.tgdd.vn/Products/Images/42/191276/samsung-galaxy-note-10-silver-400x460.png', N'Điện thoại Samsung Galaxy Note 10', 0, CAST(N'2020-05-27T09:32:55.9884890+07:00' AS DateTimeOffset), CAST(N'2020-05-27T09:32:55.9914872+07:00' AS DateTimeOffset), 59, N'nam dinh', NULL, N'0988789889', N'le huy tuan')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (85, CAST(10090000.00 AS Decimal(18, 2)), 1, 36, N'https://cdn.tgdd.vn/Products/Images/42/210246/samsung-galaxy-a71-blue-400x460-400x460-1-400x460.png', N'Điện thoại Samsung Galaxy A71', -1, CAST(N'2020-05-27T09:33:07.0492229+07:00' AS DateTimeOffset), CAST(N'2020-05-27T09:33:07.0492229+07:00' AS DateTimeOffset), 59, N'nam dinh', NULL, N'0988789889', N'le huy tuan')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (86, CAST(22890000.00 AS Decimal(18, 2)), 1, 14, N'https://cdn.tgdd.vn/Products/Images/42/210644/iphone-11-128gb-green-400x460.png', N'Điện thoại iPhone 11', 2, CAST(N'2020-05-27T12:46:24.1585067+07:00' AS DateTimeOffset), CAST(N'2020-05-27T12:46:24.1585067+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0856688518', N'letuan99utc')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (87, CAST(22890000.00 AS Decimal(18, 2)), 1, 14, N'https://cdn.tgdd.vn/Products/Images/42/210644/iphone-11-128gb-green-400x460.png', N'Điện thoại iPhone 11', 0, CAST(N'2020-05-27T12:54:26.9908386+07:00' AS DateTimeOffset), CAST(N'2020-05-27T12:54:26.9908386+07:00' AS DateTimeOffset), 59, N'ha noi', NULL, N'0929829789', N'letuan99utc')
INSERT [dbo].[Bills] ([id], [price], [unit], [catalogid], [pictureuri], [name], [status], [createdAt], [updatedAt], [userid], [shiptoaddress], [notebuy], [phone], [username]) VALUES (88, CAST(10090000.00 AS Decimal(18, 2)), 1, 36, N'https://cdn.tgdd.vn/Products/Images/42/210246/samsung-galaxy-a71-blue-400x460-400x460-1-400x460.png', N'Điện thoại Samsung Galaxy A71', 0, CAST(N'2020-05-28T15:22:01.5291740+07:00' AS DateTimeOffset), CAST(N'2020-05-28T15:22:01.5291740+07:00' AS DateTimeOffset), 59, N'Nam Dinh', NULL, N'0929829789', N'Quan Chua')
SET IDENTITY_INSERT [dbo].[Bills] OFF
SET IDENTITY_INSERT [dbo].[CatalogBrands] ON 

INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (1, N'OPPO', CAST(N'2020-04-06T10:41:03.0100000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T10:41:03.0100000+00:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/OPPO42-b_9.png')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (2, N'LENOVO', CAST(N'2020-04-06T10:41:03.0100000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T10:41:03.0100000+00:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/Lenovo44-b_36.jpg')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (3, N'SAMSUNG', CAST(N'2020-04-06T12:37:42.6720000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T12:39:41.7620000+00:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/Samsung42-b_25.jpg')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (4, N'DELL', CAST(N'2020-04-06T12:40:03.6770000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T12:40:03.6770000+00:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/Dell44-b_34.jpg')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (5, N'XIAOMI', CAST(N'2020-04-06T12:40:11.0280000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T12:40:11.0280000+00:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/Xiaomi42-b_45.jpg')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (6, N'IPHONE', CAST(N'2020-04-06T12:40:35.0060000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T12:40:35.0060000+00:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/iPhone-(Apple)42-b_16.jpg')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (7, N'ASUS', CAST(N'2020-04-06T12:40:52.7010000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T12:40:52.7010000+00:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/Asus44-b_35.jpg')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (18, N'HP', CAST(N'2020-05-15T16:53:01.3829190+07:00' AS DateTimeOffset), CAST(N'2020-05-15T16:53:01.3829190+07:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/HP-Compaq44-b_36.jpg')
INSERT [dbo].[CatalogBrands] ([id], [brand], [createdAt], [updatedAt], [pictureurl]) VALUES (19, N'MACBOOK', CAST(N'2020-05-15T16:53:06.9121515+07:00' AS DateTimeOffset), CAST(N'2020-05-15T16:53:06.9121515+07:00' AS DateTimeOffset), N'https://cdn.tgdd.vn/Brand/1/Macbook44-b_41.png')
SET IDENTITY_INSERT [dbo].[CatalogBrands] OFF
SET IDENTITY_INSERT [dbo].[Catalogs] ON 

INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (1, N'Điện thoại OPPO A31', N'https://cdn.tgdd.vn/Products/Images/42/218662/oppo-a31-2020-128gb-den-400x460-2-400x460.png', CAST(5290000.00 AS Decimal(18, 2)), N'OPPO A31 2020 (6GB/128GB) - Smartphone gây ấn tượng với bộ 3 camera sau trứ danh OPPO, hiệu năng tốt kết hợp nhiều nâng cấp đáng kể về thiết kế trên giá thành phải chăng phù hợp với đại đa số người dùng.', N'OPPO A31 2020 (6GB/128GB) - Smartphone gây ấn tượng với bộ 3 camera sau trứ danh OPPO, hiệu năng tốt kết hợp nhiều nâng cấp đáng kể về thiết kế trên giá thành phải chăng phù hợp với đại đa số người dùng.', CAST(N'2020-04-24T21:27:42.4217139+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:20:51.6630442+07:00' AS DateTimeOffset), 1, 1, 17, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (2, N'Laptop Lenovo Ideapad S145 15IWL', N'https://cdn.tgdd.vn/Products/Images/44/207798/lenovo-ideapad-s145-15iwl-i3-8145u-4gb-256gb-mx110-18-600x600.jpg', CAST(10610000.00 AS Decimal(18, 2)), N'Lenovo Ideapad S145 15IWL i3 (81MV00SXVN) là mẫu laptop văn phòng nhỏ gọn, thiết kế đẹp với viền màn hình siêu mỏng. Máy đảm nhận tốt hầu hết các tác vụ văn phòng, thiết kế đồ họa nhờ cấu hình khá và card đồ họa rời MX110.', N'Lenovo Ideapad S145 15IWL i3 (81MV00SXVN) là mẫu laptop văn phòng nhỏ gọn, thiết kế đẹp với viền màn hình siêu mỏng. Máy đảm nhận tốt hầu hết các tác vụ văn phòng, thiết kế đồ họa nhờ cấu hình khá và card đồ họa rời MX110. Thiết kế gọn gàng, dễ mang theo. Lenovo Ideapad S145 có kích thước gọn gàng, máy nặng chỉ 1.73 kg. Viền màn hình mỏng giúp thân máy nhỏ hơn, dễ dàng bỏ vào balo đi học, đi làm.', CAST(N'2020-04-06T11:04:32.6460000+00:00' AS DateTimeOffset), CAST(N'2020-05-15T12:06:24.4001570+07:00' AS DateTimeOffset), 2, 2, 29, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (3, N'Điện thoại Xiaomi Redmi Note 9S', N'https://cdn.tgdd.vn/Products/Images/42/214924/xiaomi-redmi-note-9s-400x460-400x460.png', CAST(5990000.00 AS Decimal(18, 2)), N'Redmi Note 9s vừa được hãng Xiaomi công bố vào ngày 12/3. Model này còn có tên gọi khác là Redmi Note 9 Pro đã ra mắt gần đây tại Ấn Độ. Bộ sưu tập Redmi Note trứ danh của hãng nay lại có thêm sự lựa chọn mới với nhiều nâng cấp ấn tượng so với thế hệ trước.', N'Khác với màn hình giọt nước trên người anh tiền nhiệm Redmi Note 8, Redmi Note 9s có thiết kế màn hình đục lỗ với camera trước đặt trong màn hình tương tự như trên hầu hết các máy flagship hiện nay. Máy được trang bị màn hình IPS LCD với kích thước 6.67 inch, độ phân giải Full HD+ và tỉ lệ màn hình 20:9, cho hình ảnh hiển thị rõ nét và rộng rãi. Cạnh dưới của Redmi Note 9s gồm có cổng USB-C, dải loa, mic thoại và jack tai nghe 3.5 mm. Trong khi đó, cạnh phải sẽ là nơi đặt nút nguồn tích hợp cả cảm biến vân tay và cụm phím tăng giảm âm lượng. Máy có 3 phiên bản màu: Aurora Blue, Glacier White và Interstellar Black, được cài đặt sẵn Android 10 cùng phiên bản MIUI 11 mới nhất khi xuất xưởng.', CAST(N'2020-04-06T13:29:38.9220000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T12:15:13.6979987+07:00' AS DateTimeOffset), 1, 5, 30, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (4, N'Điện thoại Xiaomi Mi Note 10 Pro', N'https://cdn.tgdd.vn/Products/Images/42/213590/xiaomi-mi-note-10-pro-black-400x460.png', CAST(13490000.00 AS Decimal(18, 2)), N'Siêu phẩm tầm trung Xiaomi Mi Note 10 Pro, chiếc smartphone đầu tiên sở hữu ống kính độ phân giải 108 MP cùng hệ thống 5 camera độc đáo, công nghệ sạc siêu nhanh 30W đi kèm nhiều tính năng nổi trội khác.', N'Xiaomi giữ nguyên phong cách thiết kế tương tự thế hệ trước, nhưng bù lại các đường nét hoàn thiện tỉ mỉ và có phần cao cấp hơn. Đáng tiếc là máy cũng chưa trang bị khả năng tính năng chống nước, bụi. Máy khá dày nhưng mặt lưng và mặt trước đều được vuốt cong 3D ở 2 cạnh bên nên phần kim loại khung máy còn lại khá ít, cho cảm giác máy mỏng hơn thực tế, cầm nắm thoải mái hơn. Thiết kế độc đáo với dãy camera cực dài ở được xếp liên tiếp về bên trái của máy và dưới cùng là logo Xiaomi.', CAST(N'2020-04-06T13:57:01.6950000+00:00' AS DateTimeOffset), CAST(N'2020-04-28T13:10:24.2947253+07:00' AS DateTimeOffset), 1, 5, 30, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (5, N'Điện thoại Xiaomi Redmi Note 7', N'https://cdn.tgdd.vn/Products/Images/42/167535/xiaomi-redmi-note-7-400x460.png', CAST(3990000.00 AS Decimal(18, 2)), N'Xiaomi Redmi Note 7 4GB/64GB là chiếc smartphone giá rẻ mới được giới thiệu vào đầu năm 2019 với nhiều trang bị đáng giá như thiết kế notch giọt nước hay camera lên tới 48 MP.', N'Redmi Note 7 xứng đáng là một trong những chiếc smartphone có hiệu năng tốt, với điểm Antutu đo được khoảng 137586. Nhờ được cung cấp sức mạnh bởi con chip Snapdragon 660 cùng RAM 4 GB, máy chiến mượt mà các dòng game hiện này với cấu hình tầm trung hoặc cao (tuỳ game) như Liên Quân, PUBG,...', CAST(N'2020-04-24T21:29:11.0726290+07:00' AS DateTimeOffset), CAST(N'2020-04-27T11:05:13.5655201+07:00' AS DateTimeOffset), 1, 5, 50, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (6, N'Điện thoại Xiaomi Redmi Note 8 Pro', N'https://cdn.tgdd.vn/Products/Images/42/214418/xiaomi-redmi-note-8-pro-6gb-128gb-white-400x460.png', CAST(6190000.00 AS Decimal(18, 2)), N'Là phiên bản nâng cấp của chiếc Xiaomi Redmi Note 7 Pro đã "làm mưa làm gió" trên thị trường trước đó, chiếc Xiaomi Redmi Note 8 Pro (6GB/128GB) sẽ là sự lựa chọn hàng đầu dành cho người dùng quan tâm nhiều về hiệu năng và camera của một chiếc máy tầm trung.', N'Từ trước tới nay nhắc tới Xiaomi thì người dùng sẽ liên tưởng ngay tới những chiếc máy có hiệu năng cao và mức giá hấp dẫn và chiếc Xiaomi Redmi Note 8 Pro này cũng không phải là ngoại lệ. Đây là chiếc smartphone đầu tiên trên thế giới được tích hợp bộ xử lý Helio G90T của MediaTek (con chip tối ưu hóa cho việc chơi game) với 8 nhân tốc độ 2.0 Ghz. Con chip này sở hữu một công cụ dự đoán mạng thông minh, đảm bảo tốc độ đường truyền mạng luôn trong tình trạng kết nối tốt nhất nhờ khả năng kết nối đồng thời tới hai mạng WiFi.', CAST(N'2020-04-06T14:05:55.5580000+00:00' AS DateTimeOffset), CAST(N'2020-04-24T23:22:38.9189168+07:00' AS DateTimeOffset), 1, 5, 50, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (7, N'Điện thoại Xiaomi Mi 9 SE', N'https://cdn.tgdd.vn/Products/Images/42/198394/xiaomi-mi-9-se-400x460.png', CAST(7490000.00 AS Decimal(18, 2)), N'Vẫn như thường lệ thì bên cạnh chiếc flagship Xiaomi Mi 9 cao cấp của mình thì Xiaomi cũng giới thiệu thêm phiên bản rút gọn là chiếc Xiaomi Mi 9 SE. Máy vẫn sở hữu cho mình nhiều trang bị cao cấp tương tự đàn anh.', N'Về ngoại hình thì chiếc smartphone Xiaomi Mi 9 SE khá tương đồng với người anh em cao cấp và bạn sẽ vẫn có một thiết kế mặt lưng với hiệu ứng đổi màu gradient đẹp mắt. Kích thước màn hình trên máy được rút gọn xuống chỉ còn 5.97 inch với viền màn hình được làm cong 2.5D rất hiện đại. Máy vẫn giữ kiểu thiết kế màn hình giọt nước qua đó tăng tỉ lệ màn hình ở mặt trước lên tới 90.47%. Các góc cạnh được bo cong mềm mại cho bạn cầm nắm thoải mái trong thời gian dài.', CAST(N'2020-04-06T14:10:20.5780000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:10:20.5780000+00:00' AS DateTimeOffset), 1, 5, 18, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (8, N'Điện thoại OPPO Reno2 F', N'https://cdn.tgdd.vn/Products/Images/42/209800/oppo-reno2-f-white-400x460-400x460.png', CAST(7990000.00 AS Decimal(18, 2)), N'OPPO Reno2 F là một trong 3 chiếc smartphone thuộc dòng OPPO Reno2 vừa được OPPO giới thiệu với thiết kế thời trang cùng nhiều nâng cấp mạnh mẽ về camera.', N'Cụm camera trên OPPO Reno2 F đã được nâng cấp rõ rệt với camera chính độ phân giải 48 MP cùng ống kính thứ 2 vẫn là 8 MP chụp ảnh góc siêu rộng, một ống kính 2 MP dùng để chụp ảnh chân dung xóa phông và một ống kính 2 MP hỗ trợ chụp ảnh đen trắng. Với bộ 4 camera thì OPPO Reno2 F đáp ứng cho bạn hầu hết các nhu cầu trong sử dụng hằng ngày từ chụp ảnh xóa phông hay chụp phong cảnh trong những chuyến đi chơi xa. Bên cạnh đó với công nghệ AI Camera đi kèm giúp Reno2 F có thể nhận diện được các vật thể khác nhau để có thể điều chỉnh màu sắc, độ tương phản và độ sáng sao cho phù hợp.', CAST(N'2020-04-06T14:16:15.3930000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:16:15.3930000+00:00' AS DateTimeOffset), 1, 1, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (9, N'Điện thoại OPPO Find X2', N'https://cdn.tgdd.vn/Products/Images/42/198150/oppo-find-x2-xanh-400x460-1-400x460.png', CAST(23990000.00 AS Decimal(18, 2)), N'Tiếp nối thành công vang dội của thế hệ Find X, OPPO chính thức ra mắt Find X2 với những đường nét thanh lịch từ thiết kế phần cứng cho đến trải nghiệm phần mềm, hứa hẹn một vẻ đẹp hoàn hảo, một sức mạnh xứng tầm.', N'Find X2 sở hữu màn hình AMOLED Ultra Vision cao cấp với kích thước lên đến 6.7 inch cùng độ phân giải 2K+ cực nét được bảo vệ bằng kính cường lực Corning Gorilla Glass 6 cao cấp. Màn hình này có độ sáng cao, hình ảnh sống động với hơn 1 tỷ màu, cùng công nghệ HDR10+ tiên tiến và nhiều tính năng thông minh khác, hứa hẹn sẽ đem đến một trải nghiệm thị giác tuyệt vời, màn hình Find X2 được Displaymate đánh giá rất cao, nằm trong top những chiếc smartphone có màn hình tốt nhất tính đến thời điểm hiện tại (3/2020). Đặc biệt hơn, màn hình Ultra Vision của Find X2 cung cấp tốc độ làm mới 120 Hz có thể kích hoạt cùng độ phân giải QHD+, cho mọi hình ảnh chuyển động mượt mà, trơn tru nhất. Tốc độ lấy mẫu cảm ứng lên tới 240 Hz đáp ứng ngay lập tức mọi thao tác chạm, vuốt của bạn.', CAST(N'2020-04-06T14:20:10.7420000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:20:10.7420000+00:00' AS DateTimeOffset), 1, 1, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (10, N'Điện thoại OPPO Reno 10x Zoom Edition', N'https://cdn.tgdd.vn/Products/Images/42/201235/oppo-reno-10x-zoom-edition-green-400x460.png', CAST(14690000.00 AS Decimal(18, 2)), N'Những chiếc flagship trong năm 2019 không chỉ có một camera chụp ảnh đẹp, chụp xóa phông ảo diệu mà còn phải "chụp thật xa" và với chiếc OPPO Reno 10x Zoom Edition chính thức gia nhập thị trường "smartphone có camera siêu zoom".', N'Bên cạnh cuộc chạy đua về cấu hình thì camera là điểm nóng của các hãng khi liên tục có những cải tiến mạnh mẽ về camera phone. Sau khi chiếc Huawei P30 Pro ra mắt không lâu với khả năng zoom lên tới 10X hay 50X thì thậm chí chiếc OPPO Reno 10x Zoom Edition còn làm tốt hơn thế. Máy sở hữu cụm 3 camera với độ phân giải camera chính là 48 MP, một camera góc rộng 8 MP F/2.2 và một ống kính tiềm vọng 13 MP khẩu độ F/3.0 với khả năng zoom hybrid 10X. ới OPPO Reno 10x Zoom Edition thì bạn có thể sử dụng máy như một chiếc "kính viễn vọng" khi có thể quan sát được những vật ở rất xa mà mắt thường cũng khó có thể thấy được.', CAST(N'2020-04-06T14:25:36.1180000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:25:36.1180000+00:00' AS DateTimeOffset), 1, 1, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (11, N'Điện thoại OPPO Reno2', N'https://cdn.tgdd.vn/Products/Images/42/209798/oppo-reno-2-pink-400x460.png', CAST(12490000.00 AS Decimal(18, 2)), N'Sau sự thành công của chiếc OPPO Reno với thiết kế mới lạ, camera chất lượng thì mới đây OPPO tiếp tục giới thiệu phiên bản nâng cấp của chiếc smartphone này là chiếc OPPO Reno2.', N'Với OPPO Reno2 thì máy được nâng cấp lên tới 4 camera chính thay vì chỉ 2 camera như thế hệ cũ. Camera chính trên chiếc điện thoại OPPO này sử dụng cảm biến 48 MP Sony IMX586 với khẩu độ f/1.7, được bổ sung tính năng chống rung quang học OIS và siêu chống rung khi quay video. Camera thứ hai là cảm biến góc siêu rộng có độ phân giải 8 MP giúp bạn có thể chụp lại được những hình ảnh ấn tượng hơn. Tiếp đến bạn sẽ có một camera tele với độ phân giải 13 MP hỗ trợ zoom lên 5X giúp bạn có thể chụp được những vật thể từ xa mà không cần phải di chuyển.', CAST(N'2020-04-06T14:33:17.0150000+00:00' AS DateTimeOffset), CAST(N'2020-04-27T15:43:48.0700000+00:00' AS DateTimeOffset), 1, 1, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (12, N'Điện thoại iPhone 11 Pro Max', N'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-400x460.png', CAST(35890000.00 AS Decimal(18, 2)), N'iPhone 11 Pro Max 256GB là chiếc iPhone cao cấp nhất trong bộ 3 iPhone Apple giới thiệu trong năm 2019 và quả thực chiếc smartphone này mang trong mình nhiều trang bị xứng đáng với tên gọi "Pro".', N'Camera là một trong những điểm nâng cấp mạnh mẽ nhất năm nay Apple mang đến cho chiếc iPhone 11 Pro Max. Đó là lần đầu tiên một chiếc iPhone sở hữu tới 3 camera ở mặt sau với 3 tiêu cự khác nhau mà người ta vẫn gọi là "từ nhà tới trường" đáp ứng mọi nhu cầu nhiếp ảnh của người dùng. Ngoài một camera góc rộng và một camera tele vốn dĩ đã xuất hiện từ thời iPhone 7 Plus thì năm nay iPhone 11 Pro Max được trang bị thêm một ống kính góc siêu rộng nữa.', CAST(N'2020-04-06T14:43:36.2810000+00:00' AS DateTimeOffset), CAST(N'2020-04-27T07:49:49.4133570+07:00' AS DateTimeOffset), 1, 6, 18, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (13, N'Điện thoại iPhone Xs Max', N'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-400x460.png', CAST(28990000.00 AS Decimal(18, 2)), N'Sau 1 năm mong chờ, chiếc smartphone cao cấp nhất của Apple đã chính thức ra mắt mang tên iPhone Xs Max 256 GB. Máy các trang bị các tính năng cao cấp nhất từ chip A12 Bionic, dàn loa đa chiều cho tới camera kép tích hợp trí tuệ nhân tạo.', N'iPhone Xs Max được Apple trang bị cho con chip mới toanh hàng đầu của hãng mang tên Apple A12. Chip A12 Bionic được xây dựng trên tiến trình 7nm đầu tiên mà hãng sản xuất với 6 nhân đáp ứng vượt trội trong việc xử lý các tác vụ và khả năng tiết kiệm năng lượng tối ưu. Hơn nữa, chiếc điện thoại iPhone còn có bộ xử lý đồ họa mạnh mẽ được Apple thiết kế riêng giúp hiệu năng được cải thiện rất lớn về mặt đồ họa của máy. Chưa dừng lại ở đó, máy còn được tích hợp trí thông minh nhân tạo giúp phần cứng tối ưu hiệu suất, nhờ đó mà các thao tác của bạn được xử lý một cách nhanh chóng hơn.', CAST(N'2020-04-06T14:50:26.5690000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:50:26.5690000+00:00' AS DateTimeOffset), 1, 6, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (14, N'Điện thoại iPhone 11', N'https://cdn.tgdd.vn/Products/Images/42/210644/iphone-11-128gb-green-400x460.png', CAST(22890000.00 AS Decimal(18, 2)), N'Được xem là phiên bản iPhone "giá rẻ" trong bộ 3 iPhone mới ra mắt nhưng iPhone 11 128GB vẫn sở hữu cho mình rất nhiều ưu điểm mà hiếm có một chiếc smartphone nào khác sở hữu.', N'Năm nay với iPhone 11 thì Apple đã nâng cấp khá nhiều về camera nếu so sánh với chiếc iPhone Xr 128GB năm ngoái. Chúng ta đã có bộ đôi camera kép thay vì camera đơn như trên thế hệ cũ và với một camera góc siêu rộng thì bạn cũng có nhiều hơn những lựa chọn khi chụp hình. Trước đây để lấy được hết kiến trúc của một tòa nhà, để ghi lại hết sự hùng vĩ của một ngọn núi thì không còn cách nào khác là bạn phải di chuyển ra khá xa để chụp.', CAST(N'2020-04-06T14:53:25.9920000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:53:25.9920000+00:00' AS DateTimeOffset), 1, 6, 18, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (15, N'Điện thoại iPhone 8 Plus', N'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-1-400x460.png', CAST(14890000.00 AS Decimal(18, 2)), N'Thừa hưởng những thiết kế đã đạt đến độ chuẩn mực, thế hệ iPhone 8 Plus thay đổi phong cách bóng bẩy hơn và bổ sung hàng loạt tính năng cao cấp cho trải nghiệm sử dụng vô cùng tuyệt vời.', N'Smartphone iPhone 8 Plus giữ nguyên hoàn toàn những đường nét thiết kế đã hoàn thiện từ thế hệ trước nhưng sử dụng phong cách 2 mặt kính cường lực kết hợp bộ khung kim loại. Mặt lưng kính bo cong 2.5D thời thượng, khung kim loại được gia cố cứng cáp, bền bỉ hơn với 7 lớp xử lý màu sơn, hạn chế bong tróc. Thay đổi này đồng thời loại bỏ chi tiết đường anten thừa ở mặt lưng như các thế hệ trước, mang đến vẻ đẹp hoàn hảo hơn.', CAST(N'2020-04-06T14:58:10.3470000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:58:10.3470000+00:00' AS DateTimeOffset), 1, 6, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (16, N'Điện thoại iPhone 7 Plus', N'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-gold-400x460-400x460.png', CAST(10790000.00 AS Decimal(18, 2)), N'Mặc dù giữ nguyên vẻ bề ngoài so với dòng điện thoại iPhone đời trước, bù lại iPhone 7 Plus 32GB lại được trang bị nhiều nâng cấp đáng giá như camera kép đầu tiên cũng như cấu hình mạnh mẽ.', N'iPhone 7 Plus là chiếc iPhone đầu tiên được trang bị camera kép có cùng độ phân giải 12 MP, đem lại khả năng chụp ảnh ở hai tiêu cự khác nhau. Camera chính chụp hình góc rộng, còn camera phụ có tiêu cự phù hợp để chụp chân dung, có tính năng chụp chân dung xóa phông (làm mờ hậu cảnh). Với 1 chạm nhanh chóng bạn có thể chuyển đổi giữa chế độ 1x và zoom 2x, hoặc bạn có thể kéo thanh trượt hay dùng 2 ngón tay đến zoom. Apple đã thêm tính năng zoom kỹ thuật số lên đến 10x. Camera trước nâng cấp độ phân giải 7MP với khẩu độ mở lớn f/2.2 hỗ trợ chụp trong điều kiện thiếu sáng tuyệt vời với công nghệ Retina Flash, Auto HDR.', CAST(N'2020-04-06T15:00:39.6510000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T22:11:51.1095882+07:00' AS DateTimeOffset), 1, 6, 50, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (18, N'Laptop Asus VivoBook A412FA', N'https://cdn.tgdd.vn/Products/Images/44/212373/asus-vivobook-a412f-i3-8145u-4gb-32gb-512gb-win10-600x600.jpg', CAST(13490000.00 AS Decimal(18, 2)), N'Lenovo Ideapad S145 15IWL i3 (81MV00SXVN) là mẫu laptop văn phòng nhỏ gọn, thiết kế đẹp với viền màn hình siêu mỏng. Máy đảm nhận tốt hầu hết các tác vụ văn phòng, thiết kế đồ họa nhờ cấu hình khá và card đồ họa rời MX110.', N'Mỏng nhẹ chỉ 19 mm - 1.5 kg, chỉ xấp xỉ vài quyển sách, ASUS VivoBook A412F phù hợp với giới trẻ, những người cần đem laptop theo thường xuyên. Máy có kiểu dáng trẻ trung, màu sắc sang trọng đẹp mắt. Công nghệ CPU Intel Core i3 thế hệ thứ 8 cho hiệu năng đủ dùng, các ứng dụng như Office365, Photoshop cơ bản đều có thể chạy tốt. RAM 4 GB hỗ trợ đa nhiệm ở mức khá, mở 15 - 20 tab Chrome không sợ giật, đơ máy.', CAST(N'2020-04-11T09:32:37.7240000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T09:32:37.7240000+00:00' AS DateTimeOffset), 2, 7, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (19, N'Laptop Asus VivoBook X509U', N'https://cdn.tgdd.vn/Products/Images/44/207798/lenovo-ideapad-s145-15iwl-i3-8145u-4gb-256gb-mx110-18-600x600.jpg', CAST(10690000.00 AS Decimal(18, 2)), N'Laptop ASUS VivoBook X509U i3 (EJ063T) là mẫu laptop học tập - văn phòng tầm trung. Nếu bạn đang tìm kiếm một chiếc laptop có cấu hình ổn định và mức giá rẻ thì hãy tham khảo những tính năng của chiếc ASUS VivoBook X590U.', N'Laptop văn phòng ASUS VivoBook X509U vận hành bởi CPU Intel Core i3, RAM 4 GB được cài đặt sẵn Windown 10. Cấu hình này chạy được các ứng dụng Office thông dụng như Word, Excel,.. và đa nhiệm ổn, mở khoảng 15 tab Chrome vẫn không đứng máy. Laptop ASUS VivoBook được thiết kế rất hài hòa từ chất liệu nhựa - chắc chắn và dễ dàng cầm nắm. Máy dày 22.9 mm và nặng 1.8 kg, tuy không mỏng nhẹ nhưng cũng không quá nặng để đem theo mỗi ngày. ASUS VivoBook là chiếc laptop 15.6 inch, màn hình có độ phân giải Full HD xuất ra hình ảnh sắc nét, màu sắc sống động đem lại trải nghiệm xem tuyệt vời. Viền màn hình mỏng cho không gian nhìn rộng hơn, ít sao nhãng hơn. Công nghệ chống chói giúp màn hình hiển thị tốt tại nơi có ánh sáng gắt.', CAST(N'2020-04-11T10:11:24.9110000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:11:24.9110000+00:00' AS DateTimeOffset), 2, 7, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (20, N'Laptop Asus VivoBook A412F', N'https://cdn.tgdd.vn/Products/Images/44/218865/asus-vivobook-a412f-i510210u-8gb-32gb-512gb-win10-218865-600x600.jpg', CAST(17490000.00 AS Decimal(18, 2)), N'Với thiết kế nhỏ gọn lý tưởng, Asus VivoBook A412F (EK739T) là mẫu laptop cho công việc và học tập có mức giá hợp lý, phù hợp với những bạn học sinh sinh viên đang tìm kiếm một thiết bị vừa để thiết kế đồ hoạ cơ bản lại còn giải trí chơi game nhẹ nhàng.', N'Viền màn hình mỏng và cân đối cùng với trọng lượng 1.406 kg tạo nên sự sang trọng cho Asus VivoBook A412F. Ưu điểm gọn nhẹ của VivoBook 14 sẽ mang đến cho bạn tâm lí thoải mái khi nghĩ đến việc phải mang laptop trên vai suốt ngày dài. Kích thước 14 inch giúp cho chiếc máy tính này chiếm ít không gian trên bàn làm việc, cất gọn trong ba lô. Thiết kế NanoEdge trên bốn cạnh với viền siêu mỏng 5.7 mm cho ra tỷ lệ hiển thị 87%. Màn hình chống chói, độ phân giải Full HD hiển thị hình ảnh sắc nét, những đoạn phim rõ ràng, sống động.', CAST(N'2020-04-11T10:23:49.3340000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:23:49.3340000+00:00' AS DateTimeOffset), 2, 7, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (21, N'Laptop Asus VivoBook X409U', N'https://cdn.tgdd.vn/Products/Images/44/213862/asus-vivobook-x409u-i3-7020u-4gb-256gb-win10-ek20-1-600x600.jpg', CAST(10790000.00 AS Decimal(18, 2)), N'Laptop Asus VivoBook X409U (EK205T) là chiếc laptop có thiết kế nhỏ gọn, hợp thời trang, màn hình chân thực, sắc nét cùng cấu hình ổn định đáp ứng nhu cầu học tập, làm việc văn phòng.  Đây là một sự lựa chọn dành cho sinh viên nhân viên văn phòng với nhu cầu học tập, văn phòng và giải trí cơ bản.', N'Asus VivoBook X409U (EK205T) sở hữu bộ vi xử lý Intel Core i3 Kabylake 7020U, RAM 4 GB cùng hệ điều hành Windown 10 mang đến khả năng xử lý mượt mà các bộ ứng dụng văn phòng Microsoft Office như soạn thảo văn bản, trình bày bảng tính, trình chiếu,... Laptop sở hữu ổ cứng SSD 256 GB NVMe PCIe mang đến khả năng khởi động máy nhanh khoảng 10 giây, khởi động ứng dụng 3 - 5 giây giúp công việc của bạn hiệu quả hơn. Asus VivoBook X409U (EK205T) có trọng lượng là 1.6 kg và độ dày 23.1 mm giúp bạn có thể mang theo chiếc máy khi đi học hay đi làm.', CAST(N'2020-04-11T10:27:38.5820000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:27:38.5820000+00:00' AS DateTimeOffset), 2, 7, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (26, N'Điện thoại Samsung Galaxy S20 Ultra', N'https://cdn.tgdd.vn/Products/Images/42/217937/samsung-galaxy-s20-ultra-400x460-1-400x460.png', CAST(27490000.00 AS Decimal(18, 2)), N'Samsung Galaxy S20 Ultra siêu phẩm công nghệ hàng đầu của Samsung mới ra mắt với nhiều đột phá công nghệ, màn hình tràn viền không khuyết điểm, hiệu năng đỉnh cao, camera độ phân giải siêu khủng 108 MP cùng khả năng zoom 100X thách thức mọi giới hạn smartphone.', N'Galaxy S20 Ultra được trang bị một màn hình kích thước 6.9 inch sử dụng tấm nền Dynamic AMOLED 2X cho chất lượng hiển thị hình ảnh trung thực, sắc nét đến từng chi tiết. Màn hình trên Galaxy S20 Ultra có tần số quét lên tới 120 Hz cho từng chuyển động trên máy diễn ra siêu mượt, dễ dàng nhận thấy ở cả các thao tác vuốt hàng ngày. Máy cho phép chuyển qua lại giữa chế độ 120 Hz và 60 Hz để tiết kiệm pin khi cần thiết.', CAST(N'2020-04-24T21:34:05.5332780+07:00' AS DateTimeOffset), CAST(N'2020-04-29T01:07:09.1742787+07:00' AS DateTimeOffset), 1, 3, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (27, N'Laptop Dell Vostro 3590', N'https://cdn.tgdd.vn/Products/Images/44/220718/dell-vostro-3590-i7-grmgk2-220718-600x600.jpg', CAST(19990000.00 AS Decimal(18, 2)), N'Laptop Dell Vostro 3590 i7 (GRMGK2) là phiên bản laptop đồ họa kĩ thuật có thiết kế hiện đại, cấu hình khỏe với vi xử lí gen 10 và card đồ họa rời. Đây chính là chiếc laptop đáng cân nhắc đối với dân đồ họa hay sinh viên khối ngành kĩ thuật.', N'Dell Vostro sử dụng CPU Intel Core i7 Comet Lake thế hệ 10 mạnh mẽ, được cải tiến về hiệu năng, sử dụng được các ứng dụng nặng, chơi được các tựa game phổ biến. RAM 8 GB mang lại khả năng xử lí đa nhiệm mượt mà, dễ dàng chuyển đổi giữa các ứng dụng đang mở. Máy còn hỗ trợ 1 khe RAM 16 GB cho người dùng dễ nâng cấp. Ổ cứng SSD 256 GB lưu trữ đủ dùng, tốc độ nhanh chóng. Với ổ cứng SSD này, bạn chỉ mất khoảng 10-15s để khởi động Windows.', CAST(N'2020-04-24T21:29:21.9284564+07:00' AS DateTimeOffset), CAST(N'2020-04-24T21:29:21.9284564+07:00' AS DateTimeOffset), 2, 4, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (28, N'Laptop Dell Inspiron 5584', N'https://cdn.tgdd.vn/Products/Images/44/203744/dell-inspiron-5584-i5-8265u-4gb-1tb-mx130-win10-n-20-1-1-600x600.jpg', CAST(16990000.00 AS Decimal(18, 2)), N'Được trang bị cấu hình khỏe để chạy mượt mà các ứng dụng văn phòng cũng như xử lý tốt đồ họa và chơi game nhẹ nhàng, laptop Dell Inspiron 5584 (N5I5384W) sẽ là một chiếc laptop đáng cân nhắc cho khách hàng là học sinh, sinh viên và nhân viên văn phòng.', N'Với bộ vi xử lý tiết kiệm điện năng Chip Intel Core i5 kết hợp cùng 4 GB RAM mang đến sự mượt mà khi chạy các ứng dụng văn phòng cũng như xử lý tốt các thao tác cơ bản trên Photoshop, Corel,... Đây là chiếc laptop đáng cân nhắc dành cho những bạn sinh viên và dân văn phòng. Lưu trữ không giới hạn trên ổ cứng HDD 1 TB, bạn chẳng cần lo máy tính của mình hết dung lượng nữa.', CAST(N'2020-04-24T14:43:04.0437384+07:00' AS DateTimeOffset), CAST(N'2020-04-24T14:43:04.0437384+07:00' AS DateTimeOffset), 2, 4, 19, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (29, N'Laptop Dell Inspiron 7591', N'https://cdn.tgdd.vn/Products/Images/44/212305/dell-inspiron-7591-i5-9300h-8gb-256gb-4gb-gtx1050-600x600.jpg', CAST(26490000.00 AS Decimal(18, 2)), N'Laptop Dell Inspiron 7591 i5 (N5I5591W) là chiếc laptop đồ họa kỹ thuật có hiệu năng cao gồm chip Core i5 thế hệ thứ 9 mạnh mẽ, card đồ họa rời NVIDIA GeForce GTX 1050 3 GB khủng. Đây là chiếc laptop phù hợp với người dùng mong muốn có một chiếc laptop vừa làm việc hiệu quả, vừa giải trí cực đã với các tựa game hot.', N'Được trang bị công nghệ CPU Intel Core i5 dòng 9300H, RAM 8 GB có thể nâng cấp tối đa lên đến 32 GB sử dụng mượt các ứng dụng văn phòng, kỹ thuật, đồ họa,... Laptop Dell Inspiron 7591 có thiết kế đơn giản, viền màn hình siêu mỏng hiện đại. Dày 20mm và nặng 2 kg, Dell Inspiron không gây nhiều trở ngại cho việc di chuyển.', CAST(N'2020-04-24T21:34:37.4146405+07:00' AS DateTimeOffset), CAST(N'2020-04-24T21:34:37.4146405+07:00' AS DateTimeOffset), 2, 4, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (30, N'Điện thoại Samsung Galaxy Note 10', N'https://cdn.tgdd.vn/Products/Images/42/191276/samsung-galaxy-note-10-silver-400x460.png', CAST(22990000.00 AS Decimal(18, 2)), N'Nếu như từ trước tới nay dòng Galaxy Note của Samsung thường ít được các bạn nữ sử dụng bởi kích thước màn hình khá lớn khiến việc cầm nắm trở nên khó khăn thì Samsung Galaxy Note 10 sẽ là chiếc smartphone nhỏ gọn, phù hợp với cả những bạn có bàn tay nhỏ.', N'Màn hình trên Galaxy Note 10 là đánh dấu sự đổi mới về thiết kế của Samsung. Không giống với cách đục lỗ góc phải trên S10, chiếc Note 10 đưa camera selfie ra chính giữa, kèm theo viền màn hình Infinity-O này cũng được mỏng hơn đáng kể. Máy có kích thước 6.3 inch cùng độ phân giải Full HD+, được trang bị tấm nền Dynamic AMOLED mang lại màu sắc đậm đà và sống động hơn.', CAST(N'2020-04-24T23:50:51.4541748+07:00' AS DateTimeOffset), CAST(N'2020-04-26T19:13:31.6566062+07:00' AS DateTimeOffset), 1, 3, 15, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (31, N'Laptop Dell Inspiron 7373', N'https://cdn.tgdd.vn/Products/Images/44/136214/dell-inspiron-7373-i5-8250u-8gb-256gb-win10-office-450-600x600.jpg', CAST(26490000.00 AS Decimal(18, 2)), N'Dell Inspiron 7373 i5 8250U là mẫu laptop có thiết kế mỏng nhẹ và sang trọng với chất liệu nhôm nguyên khối thuộc phân khúc laptop phù hợp với doanh nhân, máy được trang bị cấu hình khá mạnh cho các nhu cầu làm việc, giải trí.', N'Bộ office 365 được tích hợp sẵn, bạn có thể sử dụng miễn phí 1 năm các ứng dụng văn phòng cần thiết word, excel, powerpoint,... Một bổ sung nhỏ nhưng cần thiết cho công việc hằng ngày của bạn. Không cần phải lo bị lỗi khi mở file bằng các phần mềm crack. Dell Inspiron 7373 có 4 viền bo tròn nhẹ và những đường cắt kim cương sắc cạnh làm tăng vẻ mạnh mẽ và lịch lãm. Máy được thiết kế bằng vật liệu vỏ nhôm nguyên khối, độ mỏng chỉ có 15.2 mm và trọng lượng 1.6 kg, kết hợp khả năng xoay gập 360 độ giúp tăng sự linh động, tiện lợi cho người dùng.', CAST(N'2020-04-24T23:54:47.6356765+07:00' AS DateTimeOffset), CAST(N'2020-05-12T19:39:04.3585488+07:00' AS DateTimeOffset), 2, 4, 10, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (36, N'Điện thoại Samsung Galaxy A71', N'https://cdn.tgdd.vn/Products/Images/42/210246/samsung-galaxy-a71-blue-400x460-400x460-1-400x460.png', CAST(10090000.00 AS Decimal(18, 2)), N'Sau A51, Samsung tiếp tục ra mắt Galaxy A71 là đại diện kế tiếp thuộc thế hệ smartphone Galaxy A 2020. Máy được cải tiến với camera macro siêu cận đột phá, camera chính lên đến 64 MP cùng thiết kế thời thượng và cao cấp.', N'Galaxy A71 sở hữu màn hình tràn viền Infinity-O với rãnh camera được đặt chính giữa tương tự như trên flagship Note 10. Điểm cộng là phần rãnh camera nay đã được làm rất nhỏ, ít gây chú ý, cho trải nghiệm hình ảnh thoải mái và ít bị phân tâm hơn. Kích thước màn hình lên đến 6.7 inch, được "phóng lớn" so với Galaxy A51 (6.5 inch), cho không gian trải nghiệm thoải mái và đã mắt. Tấm nền Super AMOLED độ phân giải Full HD+ mang lại độ tương phản tốt, màu đen sâu và hình ảnh được tái hiện rực rỡ, nịnh mắt hơn.', CAST(N'2020-04-27T16:11:44.4386137+07:00' AS DateTimeOffset), CAST(N'2020-05-12T19:33:14.0290445+07:00' AS DateTimeOffset), 1, 3, 16, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (38, N'Điện thoại OPPO A5s', N'https://cdn.tgdd.vn/Products/Images/42/200330/oppo-a5s-do-400x460-400x460.png', CAST(3290000.00 AS Decimal(18, 2)), N'OPPO A5s là một chiếc máy giá rẻ và vẫn giữ được cho mình những ưu điểm mà người dùng yêu thích của một chiếc smartphone tới từ OPPO.', N'Nhắc đến OPPO là nghĩ ngay về thời trang
Đó là một thiết kế thời trang, nhiều màu sắc nổi bật giúp các bạn trẻ tự tin thể hiện cá tính của mình.', CAST(N'2020-05-12T19:40:24.1928008+07:00' AS DateTimeOffset), CAST(N'2020-05-15T13:43:15.1528979+07:00' AS DateTimeOffset), 1, 1, 18, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (45, N'Laptop HP Pavilion 15 cs3014TU', N'https://cdn.tgdd.vn/Products/Images/44/216085/hp-pavilion-15-cs3014tu-i5-8qp20pa-600x600.jpg', CAST(15590000.00 AS Decimal(18, 2)), N'1', N'1', NULL, CAST(N'2020-05-15T16:54:07.4828298+07:00' AS DateTimeOffset), 2, 18, 15, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (46, N'Laptop Apple MacBook Air 2017', N'https://cdn.tgdd.vn/Products/Images/44/106875/apple-macbook-air-mqd32sa-a-i5-5350u-600x600.jpg', CAST(19990000.00 AS Decimal(18, 2)), N'2', N'2', NULL, CAST(N'2020-05-15T16:55:08.2745818+07:00' AS DateTimeOffset), 2, 19, 20, NULL, 1)
INSERT [dbo].[Catalogs] ([id], [name], [pictureuri], [price], [description], [content], [createdAt], [updatedAt], [catalogtypeid], [catalogbrandid], [quantity], [metatitle], [status]) VALUES (47, N'Laptop Macbook Pro Touch 16 inch 2019', N'https://cdn.tgdd.vn/Products/Images/44/215941/macbook-pro-16-201926-macbookprotouch16inch-1-600x600.jpg', CAST(56990000.00 AS Decimal(18, 2)), N'3', N'3', NULL, CAST(N'2020-05-15T16:56:08.5837235+07:00' AS DateTimeOffset), 2, 19, 10, NULL, 1)
SET IDENTITY_INSERT [dbo].[Catalogs] OFF
SET IDENTITY_INSERT [dbo].[CatalogTypes] ON 

INSERT [dbo].[CatalogTypes] ([id], [type], [createdAt], [updatedAt]) VALUES (1, N'Điện thoại', CAST(N'2020-04-06T10:41:03.0080000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T10:41:03.0080000+00:00' AS DateTimeOffset))
INSERT [dbo].[CatalogTypes] ([id], [type], [createdAt], [updatedAt]) VALUES (2, N'Laptop', CAST(N'2020-04-06T10:41:03.0090000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T10:41:03.0090000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[CatalogTypes] OFF
SET IDENTITY_INSERT [dbo].[Histories] ON 

INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (1, CAST(5025500.00 AS Decimal(18, 2)), 5, 1, CAST(N'2020-05-12T16:06:21.7659746+07:00' AS DateTimeOffset), CAST(N'2020-05-12T16:06:21.7689714+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (2, CAST(5025500.00 AS Decimal(18, 2)), 5, 1, CAST(N'2020-05-12T16:06:59.3974805+07:00' AS DateTimeOffset), CAST(N'2020-05-12T16:06:59.3974805+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (3, CAST(10079500.00 AS Decimal(18, 2)), 10, 2, CAST(N'2020-05-12T19:38:51.8252237+07:00' AS DateTimeOffset), CAST(N'2020-05-12T19:38:51.8272217+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (4, CAST(25165500.00 AS Decimal(18, 2)), 5, 31, CAST(N'2020-05-12T19:39:04.3555508+07:00' AS DateTimeOffset), CAST(N'2020-05-12T19:39:04.3555508+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (5, CAST(10610000.00 AS Decimal(18, 2)), 1, 38, CAST(N'2020-05-12T19:40:24.2147888+07:00' AS DateTimeOffset), CAST(N'2020-05-12T19:40:24.2147888+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (6, CAST(10610000.00 AS Decimal(18, 2)), 9, 38, CAST(N'2020-05-12T19:46:45.9207277+07:00' AS DateTimeOffset), CAST(N'2020-05-12T19:46:45.9207277+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (7, CAST(5500000.00 AS Decimal(18, 2)), 20, 3, CAST(N'2020-05-06T04:23:31.3670000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3670000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (8, CAST(13000000.00 AS Decimal(18, 2)), 20, 4, CAST(N'2020-05-06T04:23:31.3680000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3680000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (9, CAST(3300000.00 AS Decimal(18, 2)), 20, 5, CAST(N'2020-05-06T04:23:31.3680000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3680000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (10, CAST(5500000.00 AS Decimal(18, 2)), 20, 6, CAST(N'2020-05-06T04:23:31.3680000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3680000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (11, CAST(7000000.00 AS Decimal(18, 2)), 20, 7, CAST(N'2020-05-06T04:23:31.3690000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3690000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (12, CAST(7300000.00 AS Decimal(18, 2)), 20, 8, CAST(N'2020-05-06T04:23:31.3700000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3700000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (13, CAST(22500000.00 AS Decimal(18, 2)), 20, 9, CAST(N'2020-05-06T04:23:31.3700000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3700000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (14, CAST(14000000.00 AS Decimal(18, 2)), 20, 10, CAST(N'2020-05-06T04:23:31.3700000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3700000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (15, CAST(30000000.00 AS Decimal(18, 2)), 20, 12, CAST(N'2020-05-06T04:23:31.3710000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3710000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (16, CAST(12000000.00 AS Decimal(18, 2)), 20, 11, CAST(N'2020-05-06T04:23:31.3710000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3710000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (17, CAST(28000000.00 AS Decimal(18, 2)), 20, 13, CAST(N'2020-05-06T04:23:31.3720000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3720000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (18, CAST(21000000.00 AS Decimal(18, 2)), 20, 14, CAST(N'2020-05-06T04:23:31.3720000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3720000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (19, CAST(14000000.00 AS Decimal(18, 2)), 20, 15, CAST(N'2020-05-06T04:23:31.3730000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3730000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (20, CAST(10000000.00 AS Decimal(18, 2)), 20, 16, CAST(N'2020-05-06T04:23:31.3730000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3730000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (21, CAST(10000000.00 AS Decimal(18, 2)), 20, 19, CAST(N'2020-05-06T04:23:31.3740000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3740000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (22, CAST(13000000.00 AS Decimal(18, 2)), 20, 18, CAST(N'2020-05-06T04:23:31.3730000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3730000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (23, CAST(17000000.00 AS Decimal(18, 2)), 20, 20, CAST(N'2020-05-06T04:23:31.3740000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3740000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (24, CAST(9500000.00 AS Decimal(18, 2)), 20, 21, CAST(N'2020-05-06T04:23:31.3750000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:23:31.3750000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (25, CAST(16000000.00 AS Decimal(18, 2)), 20, 28, CAST(N'2020-05-06T04:28:28.4230000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:28:28.4230000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (26, CAST(18000000.00 AS Decimal(18, 2)), 20, 27, CAST(N'2020-05-06T04:28:28.4230000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:28:28.4230000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (27, CAST(26000000.00 AS Decimal(18, 2)), 20, 26, CAST(N'2020-05-06T04:28:28.4230000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:28:28.4230000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (28, CAST(21500000.00 AS Decimal(18, 2)), 20, 30, CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (29, CAST(25000000.00 AS Decimal(18, 2)), 20, 29, CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (30, CAST(9700000.00 AS Decimal(18, 2)), 20, 36, CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (31, CAST(25000000.00 AS Decimal(18, 2)), 20, 31, CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset), CAST(N'2020-05-06T04:28:28.4240000+00:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (32, CAST(5000000.00 AS Decimal(18, 2)), 5, 1, CAST(N'2020-05-06T11:29:39.4754752+07:00' AS DateTimeOffset), CAST(N'2020-05-06T11:29:39.4774731+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (33, CAST(9500000.00 AS Decimal(18, 2)), 30, 2, CAST(N'2020-05-06T11:30:24.9968129+07:00' AS DateTimeOffset), CAST(N'2020-05-06T11:30:24.9968129+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (34, CAST(5500000.00 AS Decimal(18, 2)), 5, 3, CAST(N'2020-05-06T11:31:21.8532710+07:00' AS DateTimeOffset), CAST(N'2020-05-06T11:31:21.8532710+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (35, CAST(13000000.00 AS Decimal(18, 2)), 5, 4, CAST(N'2020-05-06T11:46:10.3772373+07:00' AS DateTimeOffset), CAST(N'2020-05-06T11:46:10.3802406+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (36, CAST(5000000.00 AS Decimal(18, 2)), 5, 1, CAST(N'2020-05-06T11:52:38.5996327+07:00' AS DateTimeOffset), CAST(N'2020-05-06T11:52:38.6036295+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (38, CAST(9700000.00 AS Decimal(18, 2)), 5, 36, CAST(N'2020-05-07T11:10:23.8893616+07:00' AS DateTimeOffset), CAST(N'2020-05-07T11:10:23.8913828+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (45, CAST(15590000.00 AS Decimal(18, 2)), 15, 45, CAST(N'2020-05-15T16:54:07.5148116+07:00' AS DateTimeOffset), CAST(N'2020-05-15T16:54:07.5148116+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (46, CAST(19990000.00 AS Decimal(18, 2)), 20, 46, CAST(N'2020-05-15T16:55:08.2825587+07:00' AS DateTimeOffset), CAST(N'2020-05-15T16:55:08.2825587+07:00' AS DateTimeOffset))
INSERT [dbo].[Histories] ([id], [inputprice], [unit], [catalogid], [createdAt], [updatedAt]) VALUES (47, CAST(56990000.00 AS Decimal(18, 2)), 10, 47, CAST(N'2020-05-15T16:56:08.5927184+07:00' AS DateTimeOffset), CAST(N'2020-05-15T16:56:08.5927184+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Histories] OFF
SET IDENTITY_INSERT [dbo].[MessageBill] ON 

INSERT [dbo].[MessageBill] ([id], [countChoDuyet], [countDaHuy], [updateChoDuyetAt], [updateDaHuyAt]) VALUES (1, 11, 9, CAST(N'2020-05-28T15:22:01.5571581+07:00' AS DateTimeOffset), CAST(N'2020-05-27T09:34:10.3174255+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[MessageBill] OFF
INSERT [dbo].[Notifications] ([billid], [userid], [title], [content], [status], [createdAt], [updatedAt]) VALUES (53, 16, N'Đơn hàng đã được xác nhận.', N'Đơn hàng mã số 53 đã được xác nhận.', 1, CAST(N'2020-05-17T15:53:32.0193742+07:00' AS DateTimeOffset), CAST(N'2020-05-17T15:53:32.0193742+07:00' AS DateTimeOffset))
INSERT [dbo].[Notifications] ([billid], [userid], [title], [content], [status], [createdAt], [updatedAt]) VALUES (71, 59, N'Đơn hàng đã được xác nhận.', N'Đơn hàng mã số 71 đã được xác nhận.', 1, CAST(N'2020-05-24T22:26:18.1930392+07:00' AS DateTimeOffset), CAST(N'2020-05-24T22:26:18.1930392+07:00' AS DateTimeOffset))
INSERT [dbo].[Notifications] ([billid], [userid], [title], [content], [status], [createdAt], [updatedAt]) VALUES (72, 59, N'Đơn hàng đã được xác nhận.', N'Đơn hàng mã số 72 đã được xác nhận.', 1, CAST(N'2020-05-24T23:21:04.0424396+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:21:04.0424396+07:00' AS DateTimeOffset))
INSERT [dbo].[Notifications] ([billid], [userid], [title], [content], [status], [createdAt], [updatedAt]) VALUES (74, 59, N'Đơn hàng đã được xác nhận.', N'Đơn hàng mã số 74 đã được xác nhận.', 1, CAST(N'2020-05-24T23:37:03.6439203+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:37:03.6439203+07:00' AS DateTimeOffset))
INSERT [dbo].[Notifications] ([billid], [userid], [title], [content], [status], [createdAt], [updatedAt]) VALUES (75, 59, N'Đơn hàng đã được xác nhận.', N'Đơn hàng mã số 75 đã được xác nhận.', 1, CAST(N'2020-05-24T23:41:51.3723774+07:00' AS DateTimeOffset), CAST(N'2020-05-24T23:41:51.3723774+07:00' AS DateTimeOffset))
INSERT [dbo].[Notifications] ([billid], [userid], [title], [content], [status], [createdAt], [updatedAt]) VALUES (81, 59, N'Đơn hàng đã được xác nhận.', N'Đơn hàng mã số 81 đã được xác nhận.', 1, CAST(N'2020-05-25T15:05:53.9433323+07:00' AS DateTimeOffset), CAST(N'2020-05-25T15:05:53.9433323+07:00' AS DateTimeOffset))
INSERT [dbo].[Notifications] ([billid], [userid], [title], [content], [status], [createdAt], [updatedAt]) VALUES (86, 59, N'Đơn hàng đã được xác nhận.', N'Đơn hàng mã số 86 đã được xác nhận.', 1, CAST(N'2020-05-27T12:47:47.5322350+07:00' AS DateTimeOffset), CAST(N'2020-05-27T12:47:47.5332384+07:00' AS DateTimeOffset))
INSERT [dbo].[Roles] ([id], [name], [createdAt], [updatedAt]) VALUES (1, N'user', CAST(N'2020-04-06T10:41:03.0060000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T10:41:03.0060000+00:00' AS DateTimeOffset))
INSERT [dbo].[Roles] ([id], [name], [createdAt], [updatedAt]) VALUES (2, N'admin', CAST(N'2020-04-06T10:41:03.0070000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T10:41:03.0070000+00:00' AS DateTimeOffset))
INSERT [dbo].[Roles] ([id], [name], [createdAt], [updatedAt]) VALUES (3, N'super_admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Specifications] ON 

INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (1, N'MediaTek Helio P35 8 nhân', N'6 GB', N'IPS LCD, 6.5", HD+', N'ColorOS 6.1 (Android 9.0)', CAST(N'2020-04-24T21:27:42.4217139+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:20:51.6630442+07:00' AS DateTimeOffset), 1)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (2, N'Intel Core i5 Coffee Lake, 8265U, 1.60 GHz', N'8 GB, DDR4', N'15.6 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-06T11:04:32.6740000+00:00' AS DateTimeOffset), CAST(N'2020-05-12T19:38:51.9061827+07:00' AS DateTimeOffset), 2)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (3, N'Snapdragon 720G 8 nhân', N'6 GB', N'IPS LCD, 6.67", Full HD+', N'Android 10', CAST(N'2020-04-06T13:29:38.9500000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T12:15:13.7009976+07:00' AS DateTimeOffset), 3)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (4, N'Snapdragon 730G 8 nhân', N'8 GB', N'AMOLED, 6.47", Full HD+', N'Android 9.0 (Pie)', CAST(N'2020-04-06T13:57:01.7290000+00:00' AS DateTimeOffset), CAST(N'2020-04-28T13:10:24.2947253+07:00' AS DateTimeOffset), 4)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (5, N'Snapdragon 660 8 nhân', N'4 GB', N'IPS LCD, 6.3", Full HD+', N'Android 9.0 (Pie)', CAST(N'2020-04-24T21:29:11.0726290+07:00' AS DateTimeOffset), CAST(N'2020-04-27T11:05:13.5655201+07:00' AS DateTimeOffset), 5)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (6, N'Mediatek Helio G90T 8 nhân', N'6 GB', N'IPS LCD, 6.53", Full HD+', N'Android 9.0 (Pie)', CAST(N'2020-04-06T14:05:55.5970000+00:00' AS DateTimeOffset), CAST(N'2020-04-24T23:22:38.9219057+07:00' AS DateTimeOffset), 6)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (7, N'Snapdragon 712 8 nhân', N'6 GB', N'Super AMOLED, 5.97", Full HD+', N'Android 9.0 (Pie)', CAST(N'2020-04-06T14:10:20.5890000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:10:20.5890000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (8, N'MediaTek Helio P70 8 nhân', N'8 GB', N'AMOLED, 6.5", Full HD+', N'Android 9.0 (Pie)', CAST(N'2020-04-06T14:16:15.4110000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:16:15.4110000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (9, N'Snapdragon 865 8 nhân', N'12 GB', N'AMOLED, 6.78", Quad HD+ (2K+)', N'Android 10', CAST(N'2020-04-06T14:20:10.7610000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:20:10.7610000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (10, N'Snapdragon 855 8 nhân', N'8 GB', N'AMOLED, 6.6", Full HD+', N'Android 9.0 (Pie)', CAST(N'2020-04-06T14:25:36.1400000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:25:36.1400000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (11, N'Snapdragon 730G 8 nhân', N'8 GB', N'Sunlight AMOLED, 6.55", Full HD+', N'Android 9.0 (Pie)', CAST(N'2020-04-06T14:33:17.0280000+00:00' AS DateTimeOffset), CAST(N'2020-04-27T15:43:48.1860000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (12, N'Apple A13 Bionic 6 nhân', N'4 GB', N'OLED, 6.5", Super Retina XDR', N'iOS 13', CAST(N'2020-04-06T14:43:36.3110000+00:00' AS DateTimeOffset), CAST(N'2020-04-27T07:49:49.4133570+07:00' AS DateTimeOffset), 12)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (13, N'Apple A12 Bionic 6 nhân', N'4 GB', N'OLED, 6.5", Super Retina', N'iOS 12', CAST(N'2020-04-06T14:50:26.5870000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:50:26.5870000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (14, N'Apple A13 Bionic 6 nhân', N'4 GB', N'IPS LCD, 6.1", Liquid Retina', N'iOS 13', CAST(N'2020-04-06T14:53:26.0090000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:53:26.0090000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (15, N'Apple A11 Bionic 6 nhân', N'3 GB', N'LED-backlit IPS LCD, 5.5", Retina HD', N'iOS 12', CAST(N'2020-04-06T14:58:10.3700000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:58:10.3700000+00:00' AS DateTimeOffset), 15)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (16, N'Apple A10 Fusion 4 nhân', N'3 GB', N'LED-backlit IPS LCD, 5.5", Retina HD', N'iOS 12', CAST(N'2020-04-06T15:00:39.6660000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T22:11:51.1095882+07:00' AS DateTimeOffset), 16)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (17, N'Intel Core i3 Coffee Lake, 8145U, 2.10 GHz', N'4 GB, DDR4 (On board +1 khe), 2400 MHz', N'14 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-11T09:32:37.7770000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T09:32:37.7770000+00:00' AS DateTimeOffset), 18)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (18, N'Intel Core i3 Kabylake, 7020U, 2.30 GHz', N'4 GB, DDR4 (On board +1 khe), 2400 MHz', N'15.6 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-11T10:11:24.9350000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:11:24.9350000+00:00' AS DateTimeOffset), 19)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (19, N'Intel Core i5 Comet Lake, 10210U, 1.60 GHz', N'8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz', N'14 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-11T10:23:49.3750000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:23:49.3750000+00:00' AS DateTimeOffset), 20)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (20, N'Intel Core i3 Kabylake, 7020U, 2.30 GHz', N'4 GB, DDR4 (On board +1 khe), 2400 MHz', N'14 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-11T10:27:38.6660000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:27:38.6660000+00:00' AS DateTimeOffset), 21)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (21, N'Exynos 990 8 nhân', N'12 GB', N'Dynamic AMOLED 2X, 6.9", Quad HD+ (2K+)', N'Android 10', CAST(N'2020-04-24T21:34:05.5332780+07:00' AS DateTimeOffset), CAST(N'2020-04-29T01:07:09.1742787+07:00' AS DateTimeOffset), 26)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (22, N'Intel Core i7 Comet Lake, 10510U, 1.80 GHz', N'8 GB, DDR4 (On board +1 khe), 2666 MHz', N'15.6 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-24T21:29:21.9284564+07:00' AS DateTimeOffset), CAST(N'2020-04-24T21:29:21.9284564+07:00' AS DateTimeOffset), 27)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (23, N'Intel Core i5 Coffee Lake, 8265U, 1.60 GHz', N'4 GB, DDR4 (2 khe), 2400 MHz', N'15.6 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-24T14:43:04.1443928+07:00' AS DateTimeOffset), CAST(N'2020-04-24T14:43:04.1443928+07:00' AS DateTimeOffset), 28)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (24, N'Intel Core i5 Coffee Lake, 9300H, 2.40 GHz', N'8 GB, DDR4 (2 khe), 2666 MHz', N'15.6 inch, Full HD (1920 x 1080)', N'Windows 10 Home SL', CAST(N'2020-04-24T21:34:37.4146405+07:00' AS DateTimeOffset), CAST(N'2020-04-24T21:34:37.4146405+07:00' AS DateTimeOffset), 29)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (25, N'Exynos 9825 8 nhân', N'8 GB', N'Dynamic AMOLED, 6.3", Full HD+', N'Android 9.0 (Pie)', NULL, CAST(N'2020-04-26T19:13:31.6566062+07:00' AS DateTimeOffset), 30)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (26, N'Intel Core i5 Kabylake Refresh, 8250U, 1.60 GHz', N'8 GB, DDR4 (On board), 2400 MHz', N'13.3 inch, Full HD (1920 x 1080)', N'Windows 10 + Office 365 1 năm', NULL, CAST(N'2020-05-12T19:39:04.3585488+07:00' AS DateTimeOffset), 31)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (31, N'Snapdragon 730 8 nhân', N'8 GB', N'Super AMOLED, 6.7", Full HD+', N'Android 10', NULL, CAST(N'2020-04-27T16:11:55.0608434+07:00' AS DateTimeOffset), 36)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (32, N'MediaTek Helio P35 8 nhân', N'	3 GB', N'IPS LCD, 6.2", HD+', N'	Android 8.1 (Oreo)', NULL, CAST(N'2020-05-12T19:46:45.9647037+07:00' AS DateTimeOffset), 38)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (39, N'1', N'1', N'1', N'1', NULL, CAST(N'2020-05-15T16:54:07.5148116+07:00' AS DateTimeOffset), 45)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (40, N'2', N'2', N'2', N'2', NULL, CAST(N'2020-05-15T16:55:08.2825587+07:00' AS DateTimeOffset), 46)
INSERT [dbo].[Specifications] ([id], [cpu], [ram], [screen], [os], [createdAt], [updatedAt], [catalogid]) VALUES (41, N'3', N'3', N'3', N'3', NULL, CAST(N'2020-05-15T16:56:08.5927184+07:00' AS DateTimeOffset), 47)
SET IDENTITY_INSERT [dbo].[Specifications] OFF
SET IDENTITY_INSERT [dbo].[SpecificationsLaptops] ON 

INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (1, N'Card đồ họa rời, NVIDIA GeForce MX110, 2GB', N'2 x USB 3.0, HDMI, USB 2.0', N'SSD: 256 GB M.2 SATA3, Hỗ trợ khe cắm HDD SATA', N'Vỏ nhựa, PIN liền', N'Dày 19.9mm, 1.73 kg', N'2019', CAST(N'2020-04-06T11:04:32.6970000+00:00' AS DateTimeOffset), CAST(N'2020-05-12T19:38:52.2000087+07:00' AS DateTimeOffset), 2)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (2, N'Card đồ họa tích hợp, Intel® UHD Graphics 620', N'USB 3.1, HDMI, USB 2.0, USB Type-C', N'Intel Optane 32GB (H10), SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA', N'Vỏ nhựa - nắp lưng bằng kim loại, PIN liền', N'Dày 19 mm, 1.5 kg', N'2019', CAST(N'2020-04-11T09:32:37.8230000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T09:32:37.8230000+00:00' AS DateTimeOffset), 18)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (3, N'Card đồ họa tích hợp, Intel® UHD Graphics 620', N'2 x USB 2.0, USB 3.1, HDMI, USB Type-C', N'HDD: 1 TB SATA3, Hỗ trợ khe cắm SSD M.2 PCIe', N'Vỏ nhựa, PIN liền', N'Dày 22.9 mm, 1.8 kg', N'2019', CAST(N'2020-04-11T10:11:24.9660000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:11:24.9660000+00:00' AS DateTimeOffset), 19)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (4, N'Card đồ họa tích hợp, Intel UHD Graphics', N'USB 3.1, HDMI, USB 2.0, USB Type-C', N'Intel Optane 32GB (H10), SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA', N'Vỏ nhựa, PIN liền', N'Dày 19.5 mm, 1.406 kg', N'2019', CAST(N'2020-04-11T10:23:49.4040000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:23:49.4040000+00:00' AS DateTimeOffset), 20)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (5, N'Card đồ họa tích hợp, Intel® UHD Graphics 620', N'2 x USB 2.0, HDMI, USB 3.0, USB Type-C', N'SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA', N'Vỏ nhựa, PIN liền', N'Dày 23.1 mm, 1.6 kg', N'2019', CAST(N'2020-04-11T10:27:38.6770000+00:00' AS DateTimeOffset), CAST(N'2020-04-11T10:27:38.6770000+00:00' AS DateTimeOffset), 21)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (6, N'Card đồ họa tích hợp, AMD Radeon 610R5, 2GB', N'2 x USB 3.1, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)', N'SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA', N'Vỏ nhựa, PIN liền', N'Dày 19.8 mm, 1.99', N'2019', CAST(N'2020-04-24T21:29:21.9604457+07:00' AS DateTimeOffset), CAST(N'2020-04-24T21:29:21.9604457+07:00' AS DateTimeOffset), 27)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (7, N'Card đồ họa rời, NVIDIA Geforce MX130, 2GB', N'HDMI 1.4, 2 x USB 3.1, LAN (RJ45), USB 2.0, USB Type-C', N'HDD: 1 TB SATA3, Hỗ trợ khe cắm SSD M.2 PCIe', N'Vỏ nhựa, PIN liền', N'Dày 22mm, 1.95 kg', N'2019', CAST(N'2020-04-24T14:43:04.1513850+07:00' AS DateTimeOffset), CAST(N'2020-04-24T14:43:04.1513850+07:00' AS DateTimeOffset), 28)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (8, N'Card đồ họa rời, NVIDIA GeForce GTX 1050, 3GB', N'3 x USB 3.1, HDMI, USB Type-C', N'SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA', N'Vỏ nhựa, PIN liền', N'Dày 20 mm, 2 kg', N'2019', CAST(N'2020-04-24T21:34:37.4296064+07:00' AS DateTimeOffset), CAST(N'2020-04-24T21:34:37.4296064+07:00' AS DateTimeOffset), 29)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (9, N'Card đồ họa tích hợp, Intel® UHD Graphics 620', N'2 x USB 3.0, HDMI, USB Type-C', N'SSD: 256 GB M.2 SATA3', N'Vỏ kim loại, PIN liền', N'Dày 15.2 mm, 1.6 kg', N'2018', NULL, CAST(N'2020-05-12T19:39:04.3715397+07:00' AS DateTimeOffset), 31)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (10, N'1', N'1', N'1', N'1', N'1', N'1', NULL, CAST(N'2020-05-15T16:54:07.5478111+07:00' AS DateTimeOffset), 45)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (11, N'2', N'2', N'2', N'2', N'2', N'2', NULL, CAST(N'2020-05-15T16:55:08.2875545+07:00' AS DateTimeOffset), 46)
INSERT [dbo].[SpecificationsLaptops] ([id], [cardscreen], [connector], [harddrive], [design], [size], [release], [createdAt], [updatedAt], [catalogid]) VALUES (12, N'3', N'3', N'3', N'3', N'3', N'3', NULL, CAST(N'2020-05-15T16:56:08.5987119+07:00' AS DateTimeOffset), 47)
SET IDENTITY_INSERT [dbo].[SpecificationsLaptops] OFF
SET IDENTITY_INSERT [dbo].[SpecificationsMobiles] ON 

INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (1, N'Chính 12 MP & Phụ 2 MP, 2 MP', N'8 MP', N'128 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 Nano SIM, Hỗ trợ 4G', N'4230 mAh', CAST(N'2020-04-24T21:27:42.4337174+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:20:51.8159708+07:00' AS DateTimeOffset), 1)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (2, N'Chính 48 MP & Phụ 8 MP, 5 MP, 2 MP', N'16 MP', N'128 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 Nano SIM, Hỗ trợ 4G', N'5020 mAh, có sạc nhanh', CAST(N'2020-04-06T13:29:38.9720000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T12:15:13.7536383+07:00' AS DateTimeOffset), 3)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (3, N'Chính 108 MP & Phụ 20 MP, 12 MP, 5 MP, 2 MP', N'32 MP', N'256 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 Nano SIM, Hỗ trợ 4G', N'5260 mAh, có sạc nhanh', CAST(N'2020-04-06T13:57:01.7550000+00:00' AS DateTimeOffset), CAST(N'2020-04-28T13:10:24.3087147+07:00' AS DateTimeOffset), 4)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (4, N'Chính 48 MP & Phụ 5 MP', N'13 MP', N'256 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 SIM Nano (SIM 1 chung khe thẻ nhớ), Hỗ trợ 4G', N'4000 mAh, có sạc nhanh', CAST(N'2020-04-24T21:29:11.0766241+07:00' AS DateTimeOffset), CAST(N'2020-04-27T11:05:13.5685216+07:00' AS DateTimeOffset), 5)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (5, N'Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP', N'20 MP', N'128 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', N'4500 mAh, có sạc nhanh', CAST(N'2020-04-06T14:05:55.6150000+00:00' AS DateTimeOffset), CAST(N'2020-04-24T23:22:39.2711078+07:00' AS DateTimeOffset), 6)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (6, N'Chính 48 MP & Phụ 13 MP, 8 MP', N'20 MP', N'64 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', N'3070 mAh, có sạc nhanh', CAST(N'2020-04-06T14:10:20.6180000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:10:20.6180000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (7, N'Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP', N'16 MP', N'128 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 Nano SIM, Hỗ trợ 4G', N'4000 mAh, có sạc nhanh', CAST(N'2020-04-06T14:16:15.4250000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:16:15.4250000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (8, N'Chính 48 MP & Phụ 13 MP, 12 MP', N'32 MP', N'256 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 Nano SIM, Hỗ trợ 5G', N'4200 mAh, có sạc nhanh', CAST(N'2020-04-06T14:20:10.7810000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:20:10.7810000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (9, N'Chính 48 MP & Phụ 13 MP, 8 MP', N'16 MP', N'256 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', N'4065 mAh, có sạc nhanh', CAST(N'2020-04-06T14:25:36.1530000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:25:36.1530000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (10, N'Chính 48 MP & Phụ 13 MP, 8 MP, 2 MP', N'16 MP', N'256 GB', N'MicroSD, hỗ trợ tối đa 256 GB', N'2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', N'4000 mAh, có sạc nhanh', CAST(N'2020-04-06T14:33:17.0400000+00:00' AS DateTimeOffset), CAST(N'2020-04-27T15:43:48.3370000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (11, N'3 camera 12 MP', N'12 MP', N'256 GB', N'', N'1 eSIM & 1 Nano SIM, Hỗ trợ 4G', N'3969 mAh, có sạc nhanh', CAST(N'2020-04-06T14:43:36.3220000+00:00' AS DateTimeOffset), CAST(N'2020-04-27T07:49:49.4153701+07:00' AS DateTimeOffset), 12)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (12, N'Chính 12 MP & Phụ 12 MP', N'7 MP', N'256 GB', N'', N'1 eSIM & 1 Nano SIM, Hỗ trợ 4G', N'3174 mAh, có sạc nhanh', CAST(N'2020-04-06T14:50:26.6000000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:50:26.6000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (13, N'3 camera 12 MP', N'12 MP', N'128 GB', N'', N'1 eSIM & 1 Nano SIM, Hỗ trợ 4G', N'3110 mAh, có sạc nhanh', CAST(N'2020-04-06T14:53:26.0290000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:53:26.0290000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (14, N'Chính 12 MP & Phụ 12 MP', N'7 MP', N'64 GB', N'', N'1 Nano SIM, Hỗ trợ 4G', N'2691 mAh, có sạc nhanh', CAST(N'2020-04-06T14:58:10.3870000+00:00' AS DateTimeOffset), CAST(N'2020-04-06T14:58:10.3870000+00:00' AS DateTimeOffset), 15)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (15, N'Chính 12 MP & Phụ 12 MP', N'7 MP', N'32 GB', N'', N'1 Nano SIM, Hỗ trợ 4G', N'2900', CAST(N'2020-04-06T15:00:39.6830000+00:00' AS DateTimeOffset), CAST(N'2020-04-29T22:11:51.1135899+07:00' AS DateTimeOffset), 16)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (16, N'40 MP', N'Chính 108 MP & phụ 48 MP, 12 MP, TOF 3D', N'128 GB', N'MicroSD, hỗ trợ tối đa 1 TB', N'2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', N'5000 mAh, có sạc nhanh', CAST(N'2020-04-24T21:34:05.5492552+07:00' AS DateTimeOffset), CAST(N'2020-04-29T01:07:09.2142562+07:00' AS DateTimeOffset), 26)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (17, N'10 MP', N'Chính 12 MP & Phụ 12 MP, 16 MP', N'256 GB', N'256 GB', N'2 Nano SIM, Hỗ trợ 4G', N'3500 mAh, có sạc nhanh', NULL, CAST(N'2020-04-26T19:13:31.6616059+07:00' AS DateTimeOffset), 30)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (21, N'32 MP', N'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP', N'128 GB', N'MicroSD, hỗ trợ tối đa 512 GB', N' 2 Nano SIM, Hỗ trợ 4G', N'4500 mAh, có sạc nhanh', NULL, CAST(N'2020-04-27T16:11:55.0698338+07:00' AS DateTimeOffset), 36)
INSERT [dbo].[SpecificationsMobiles] ([id], [backcamera], [frontcamera], [internalmemory], [memorystick], [sim], [batery], [createdAt], [updatedAt], [catalogid]) VALUES (22, N'8 MP', N'Chính 13 MP & Phụ 2 MP', N'	32 GB', N'	MicroSD, hỗ trợ tối đa 256 GB', N' 2 Nano SIM, Hỗ trợ 4G', N'	4230 mAh', NULL, CAST(N'2020-05-12T19:46:46.0306657+07:00' AS DateTimeOffset), 38)
SET IDENTITY_INSERT [dbo].[SpecificationsMobiles] OFF
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T05:31:19.5660000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T05:31:19.5660000+00:00' AS DateTimeOffset), 1, 3)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 1, 5)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 1, 6)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-10T15:18:03.4300000+00:00' AS DateTimeOffset), CAST(N'2020-04-10T15:18:03.4300000+00:00' AS DateTimeOffset), 1, 8)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 1, 9)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-12T14:47:28.1010000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:47:28.1010000+00:00' AS DateTimeOffset), 1, 10)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-12T14:50:44.1080000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:50:44.1080000+00:00' AS DateTimeOffset), 1, 11)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-12T14:52:27.3580000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:52:27.3580000+00:00' AS DateTimeOffset), 1, 12)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-12T14:54:49.0710000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:54:49.0710000+00:00' AS DateTimeOffset), 1, 13)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-12T14:56:08.3590000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:56:08.3590000+00:00' AS DateTimeOffset), 1, 14)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-12T15:02:14.0990000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T15:02:14.0990000+00:00' AS DateTimeOffset), 1, 15)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-12T15:20:29.7340000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T15:20:29.7340000+00:00' AS DateTimeOffset), 1, 16)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-14T10:35:11.4630000+00:00' AS DateTimeOffset), CAST(N'2020-04-14T10:35:11.4630000+00:00' AS DateTimeOffset), 1, 17)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-17T13:58:03.8400000+00:00' AS DateTimeOffset), CAST(N'2020-04-17T13:58:03.8400000+00:00' AS DateTimeOffset), 1, 18)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-18T09:10:17.8660000+00:00' AS DateTimeOffset), CAST(N'2020-04-18T09:10:17.8660000+00:00' AS DateTimeOffset), 1, 19)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-18T09:11:42.8300000+00:00' AS DateTimeOffset), CAST(N'2020-04-18T09:11:42.8300000+00:00' AS DateTimeOffset), 1, 20)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-18T09:12:26.1510000+00:00' AS DateTimeOffset), CAST(N'2020-04-18T09:12:26.1510000+00:00' AS DateTimeOffset), 1, 21)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:44:49.4510000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:44:49.4510000+00:00' AS DateTimeOffset), 1, 25)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 1, 27)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-20T13:00:51.9838505+07:00' AS DateTimeOffset), CAST(N'2020-04-20T13:00:51.9838505+07:00' AS DateTimeOffset), 1, 28)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-20T15:42:53.8589383+07:00' AS DateTimeOffset), CAST(N'2020-04-20T15:42:53.8589383+07:00' AS DateTimeOffset), 1, 29)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-21T17:41:09.8200615+07:00' AS DateTimeOffset), CAST(N'2020-04-21T17:41:09.8200615+07:00' AS DateTimeOffset), 1, 30)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-25T10:23:35.5780000+00:00' AS DateTimeOffset), CAST(N'2020-04-25T10:23:35.5780000+00:00' AS DateTimeOffset), 1, 31)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-27T13:09:54.3420000+00:00' AS DateTimeOffset), CAST(N'2020-04-27T13:09:54.3420000+00:00' AS DateTimeOffset), 1, 32)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-01T15:24:50.9777010+07:00' AS DateTimeOffset), CAST(N'2020-05-01T15:24:50.9777010+07:00' AS DateTimeOffset), 1, 33)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-03T17:05:24.3143488+07:00' AS DateTimeOffset), CAST(N'2020-05-03T17:05:24.3143488+07:00' AS DateTimeOffset), 1, 34)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-03T13:41:00.3710000+00:00' AS DateTimeOffset), CAST(N'2020-05-03T13:41:00.3710000+00:00' AS DateTimeOffset), 1, 35)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-03T13:44:39.9460000+00:00' AS DateTimeOffset), CAST(N'2020-05-03T13:44:39.9460000+00:00' AS DateTimeOffset), 1, 36)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-03T13:51:55.2630000+00:00' AS DateTimeOffset), CAST(N'2020-05-03T13:51:55.2630000+00:00' AS DateTimeOffset), 1, 37)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-04T11:00:07.6001116+07:00' AS DateTimeOffset), CAST(N'2020-05-04T11:00:07.6001116+07:00' AS DateTimeOffset), 1, 38)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-04T11:03:00.4976223+07:00' AS DateTimeOffset), CAST(N'2020-05-04T11:03:00.4976223+07:00' AS DateTimeOffset), 1, 39)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-04T11:07:26.5419407+07:00' AS DateTimeOffset), CAST(N'2020-05-04T11:07:26.5419407+07:00' AS DateTimeOffset), 1, 40)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-04T19:29:29.2850020+07:00' AS DateTimeOffset), CAST(N'2020-05-04T19:29:29.2850020+07:00' AS DateTimeOffset), 1, 41)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-04T19:34:24.7838722+07:00' AS DateTimeOffset), CAST(N'2020-05-04T19:34:24.7838722+07:00' AS DateTimeOffset), 1, 42)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-12T08:25:40.6389057+07:00' AS DateTimeOffset), CAST(N'2020-05-12T08:25:40.6389057+07:00' AS DateTimeOffset), 1, 54)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-15T13:13:55.9708075+07:00' AS DateTimeOffset), CAST(N'2020-05-15T13:13:55.9708075+07:00' AS DateTimeOffset), 1, 55)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-18T08:14:42.2634110+07:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 1, 56)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-05-25T08:35:36.6699475+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:35:36.6699475+07:00' AS DateTimeOffset), 1, 60)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 2, 2)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 2, 59)
INSERT [dbo].[UserRoles] ([createdAt], [updatedAt], [roleid], [userid]) VALUES (CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), CAST(N'2020-04-07T04:46:31.3330000+00:00' AS DateTimeOffset), 3, 1)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (1, N'tuandz', N'$2a$12$7Zbulq5XO2srzXUbzfZ43OKb8MNiVsLG5q9gupxAxJwMH0NzOW2j2', N'tuan le', 1, N'0982131443', N'lehuytuan20399@gmail.com', N'Nam Dinh', NULL, N'tuandz', CAST(N'2020-04-07T04:44:49.3100000+00:00' AS DateTimeOffset), CAST(N'2020-05-18T16:16:46.9951378+07:00' AS DateTimeOffset), 2, N'\Public\Images\1090412827995172.jpg')
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (2, N'admin', N'$2y$12$CiBjJSuEfnPkwjiTNsy6iOw3CvlS2zb9uXh0JTIxWvgyZAPngyGEa', N'admin', 1, N'0963214325', N'lehuytuan20399@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-07T04:46:31.3030000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:35:30.3024898+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (3, N'chieu', N'$2a$12$Z799JFVRAD86qeufb2iTdOFxkJTV1akFu1MPpi.xEleOSqc026tyy', N'chieu', 1, N'0978812344', N'chieudz@gmail.com', N'nghe an', NULL, NULL, CAST(N'2020-04-07T05:31:19.5120000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:35:44.2886533+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (5, N'chieudz', N'$2a$12$ezyvHhjwdy526pFQE8lg5enaXoBBkIc2ZztW30kDNK5F7yYNA5uZa', N'chieudz', 1, N'0962132432', N'chieudz@gmail.com', N'nghe an', NULL, NULL, NULL, CAST(N'2020-05-17T15:35:56.7837561+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (6, N'chieutruong', N'$2a$12$.Neo20p44ENSIKwlIE2vauYZMlayhvTwblPi5wKqu0ZVMZ3HsBfOS', N'chieutruong', 0, N'0982132432', N'chieudz@gmail.com', N'nghe an', NULL, NULL, NULL, CAST(N'2020-05-25T08:21:33.6571777+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (8, N'tuanle2', N'$2a$12$cnoP1xvyQry18abkyyqkGetvI8/xn9JMax4FWlCQnFUTVLOz7YJPa', N'tuandz', 1, N'0962132432', N'qdw@gmail.coom', N'nam dinh', NULL, NULL, CAST(N'2020-04-10T15:18:03.3920000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:37:00.8079335+07:00' AS DateTimeOffset), 2, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (9, N'tuannd', N'$2a$12$dxGNbu0tOEb3L8N6TuKyjeXvGZk8ZBZ1lTlSwP7eFlA8g0mQC.nw.', N'tuan le', 1, N'0948129479', N'tuandz@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-12T14:40:53.4700000+00:00' AS DateTimeOffset), CAST(N'2020-05-25T08:33:15.5627528+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (10, N'tuannd1', N'$2a$12$Hy/TWssC8Fb91Sfb4EhCAe7CD1ddftVdSDHXYQP93kXtZyT68zQza', N'tuan le', 1, NULL, N'tuandz@gmail.com', NULL, NULL, NULL, CAST(N'2020-04-12T14:47:28.0680000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:47:28.0680000+00:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (11, N'tuannd2', N'$2a$12$TqGoQlxZ9s6rj2UByB8bs.0xUQi8uA5rrC7htklbcOXVBdeQ68OlC', N'tuan le', 0, NULL, N'tuandz@gmail.com', NULL, NULL, NULL, CAST(N'2020-04-12T14:50:44.0720000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:50:44.0720000+00:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (12, N'tuanledz', N'$2a$12$dwecSLU9isMcswO44WBoDejuPFwCgyIhRBAE63f97Gs84CoX61v..', N'tuan le', 1, NULL, N'tuandz@gmail.com', NULL, NULL, NULL, CAST(N'2020-04-12T14:52:27.3240000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:52:27.3240000+00:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (13, N'letuan', N'$2a$12$fkmoXq1JXH3ZHEIhD4UvIuMhq9E462gYtsw9hw0oyZ.RZj9FBx2y.', N'tuan le', 1, N'', N'tuandz@gmail.com', N'', NULL, NULL, CAST(N'2020-04-12T14:54:49.0210000+00:00' AS DateTimeOffset), CAST(N'2020-04-21T17:40:51.0106469+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (14, N'letuan1', N'$2a$12$selkBmgfx7YXLW8bzVbAmeblFZMPWlUfjx3V6DyICoZv52HG4sM06', N'tuan le', 0, NULL, N'tuandz@gmail.com', NULL, NULL, NULL, CAST(N'2020-04-12T14:56:08.3030000+00:00' AS DateTimeOffset), CAST(N'2020-04-12T14:56:08.3030000+00:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (15, N'letuan2', N'$2a$12$lua66cV4wX1Ahoi8EyXk3uDZ.W40v4aXFQfj2W4l73krXDmkK67dK', N'letuan2', 1, N'', N'tuandz@gmail.com', N'', NULL, NULL, CAST(N'2020-04-12T15:02:14.0670000+00:00' AS DateTimeOffset), CAST(N'2020-04-20T15:43:31.8177223+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (16, N'huytuan', N'$2a$12$s2RdQk.XcDQBQbsrTEU.reaFBWY4Yis3kenpFPaZQV6QdFxUx4YsO', N'tuan le', 1, N'0988123432', N'tuandz@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-12T15:20:29.6790000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:37:24.5838798+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (17, N'donlyconan', N'$2a$12$M4KIkBAg1L5SnOYL4.dEB.3OewqmwJB63ZDjH32goZLOYd8Z6cG3e', N'donly conan', 1, N'0997056123', N'donlyconan@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-14T10:35:11.4310000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:37:40.5850676+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (18, N'13423716587', N'$2a$12$kLkFMAmZiev0WQZL4nXyS.2/MMQeo8viOS95Wc6IBSKMj5zt27vym', N'Le huy tuan', 0, N'', N'tuandz@gmail.com', N'', NULL, NULL, CAST(N'2020-04-17T13:58:03.7280000+00:00' AS DateTimeOffset), CAST(N'2020-04-20T16:16:45.1089507+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (19, N'tuannd4', N'$2a$12$z1pwNHliRCuQ2Y9trzqLl.fNlwrIhFZ7WQv4vOQOTrFVvADC/IAmu', N'tuan le', 1, NULL, N'tuandz@gmail.com', NULL, NULL, NULL, CAST(N'2020-04-18T09:10:17.8320000+00:00' AS DateTimeOffset), CAST(N'2020-04-18T09:10:17.8320000+00:00' AS DateTimeOffset), 3, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (20, N'tuannd5', N'$2a$12$5pXZoU6Oes/ehYRrv57a6.84NKHB2OL6elQvPpE/AjYAYvH4hlaGy', N'tuan le', 1, NULL, N'tuandz@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-18T09:11:42.8000000+00:00' AS DateTimeOffset), CAST(N'2020-04-18T09:11:42.8000000+00:00' AS DateTimeOffset), 3, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (21, N'tuannd6', N'$2a$12$h1wDSgtRtysYh35V9NNil.zpRWSfStYpFr2ob8yYjcnmLFnpvcVpy', N'tuan le', 1, N'0989218498', N'tuandz@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-18T09:12:26.1190000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:37:57.8582910+07:00' AS DateTimeOffset), 3, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (25, N'tuancute', N'$2a$12$Jy9Zc.LwW/Yy9RsRlGT8deh239HcnKkjy1Qxv6KGE.DGG302yNj4m', N'tuan le', 1, N'', N'', N'', NULL, NULL, CAST(N'2020-04-19T15:42:57.6454765+07:00' AS DateTimeOffset), CAST(N'2020-04-20T16:00:06.6887996+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (27, N'chieucute', N'$2a$12$fuYXQ/ecVekTUkMHVVblSeO.bpGXSWd8LooibkIOGJUWB5AAWI4Pa', N'chieu dz', 1, N'0968324871', N'chieu123@gmail.com', N'nghe an', NULL, NULL, CAST(N'2020-04-19T20:15:09.9548492+07:00' AS DateTimeOffset), CAST(N'2020-05-18T08:23:59.4581572+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (28, N'tuandz2020', N'$2a$12$pNAaQWYWD7EML8W13phGG.Eiz0VYpG9Ivw.6xT6QKWoplrplQtgCu', NULL, 1, N'', N'', NULL, NULL, NULL, CAST(N'2020-04-20T13:00:49.7496865+07:00' AS DateTimeOffset), CAST(N'2020-04-20T13:00:50.3793189+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (29, N'tuancute2020', N'$2a$12$NGu0HEnD6e9q5o4r44/DFOnw1grNgKt17zmyLVg5AtUIWd4UDMlrG', N'', 1, N'', N'', N'', NULL, NULL, CAST(N'2020-04-20T15:42:53.3188347+07:00' AS DateTimeOffset), CAST(N'2020-04-20T15:55:58.3539562+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (30, N'tuandz123', N'$2a$12$2aCpidLESfm92.6RVsIV.eoNEFT22qL79r3A8wra6E0FyToH4A.Ny', N'', 1, N'', N's1trollboy36@gmail.com', N'', NULL, NULL, CAST(N'2020-04-21T17:41:09.2904090+07:00' AS DateTimeOffset), CAST(N'2020-05-03T13:45:11.0740000+00:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (31, N'tuannd123', N'$2a$12$RdPtswXiwdaBR53SghDQuu7kUO3g7Qhn7OadkK6H7BsaLqnGx8fOC', N'tuan le', 1, N'0968218498', N'tuandz@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-25T10:23:35.5330000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:38:12.7850251+07:00' AS DateTimeOffset), 3, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (32, N'tuannd7', N'$2a$12$hUiN7sICLcfNeUAT6ig4rO0H6Dm9H9bIXNBZzqiz3L1nUapz9Z4ru', N'tuan le', 1, N'0957218498', N'tuandz@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-04-27T13:09:54.3150000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:38:37.7140968+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (33, N'tuanle', N'$2a$12$uIv.83opGekpXSrf0iqWr.c/wkhItIGj0Vvt29isArKslsAAMwah2', N'Tuân  Lê', 1, N'', N'tuandz@gmail.com', N'', NULL, NULL, CAST(N'2020-05-01T15:24:50.3244865+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:33:41.8411580+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (34, N'2579641285631280', N'$2a$12$r6yNrDEOSIBqYBEybuK1Tus63DPZrsYyyRFHxNEeGNqMBvdkdrY82', N'Lê Trọng Quân', 1, NULL, N's1trollboy36@gmail.com', NULL, NULL, NULL, CAST(N'2020-05-03T17:05:07.3986759+07:00' AS DateTimeOffset), CAST(N'2020-05-03T17:05:07.4036755+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (35, N'tuannd8', N'$2a$12$sfGDWsx1Bhm5AK5VXuaGTu.oZd6S1RFVaG4OQ5l4RZB0zhK9B44WG', N'tuan le', 1, N'0998218498', N's1trollboy36@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-05-03T13:41:00.3190000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:38:53.4257130+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (36, N'tuannd9', N'$2a$12$CGolJYPUQjbTJp6.j0nTLOMiwlaI0CuKCVU4neOgxvg0IQAMcpAYm', N'tuan le', 1, N'0962218498', N's1trollboy36@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-05-03T13:44:39.9160000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:39:05.0805843+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (37, N'tuannd10', N'$2a$12$GQ3FUSi2NFm5UMVHjX4HquB3fRwBGxZrv.Ct1TSBYFB3BtvPTd0US', N'tuan le', 1, N'0978218498', N's1trollboy36@gmail.com', N'nam dinh', NULL, NULL, CAST(N'2020-05-03T13:51:55.2060000+00:00' AS DateTimeOffset), CAST(N'2020-05-17T15:39:27.8923329+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (38, N'huytuan123', N'$2a$12$wif1yREnApxiSARwYF0RGeTuN9b.3QHiHmGqrGP7zXbeod94BHqP6', N'Tuân  Lê', 1, N'', N's1trollboy36@gmail.com', N'', NULL, NULL, CAST(N'2020-05-04T11:00:06.7791120+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:34:40.6336309+07:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (39, N'huytuan1', N'$2a$12$pEvSGpDoPISbgl6Bvyb.tOzOvRXG1WDMgUwF/5J7FIPGmzZjT3LpG', NULL, 1, NULL, N's1trollboy36@gmail.com', NULL, NULL, NULL, CAST(N'2020-05-04T11:02:59.9192680+07:00' AS DateTimeOffset), CAST(N'2020-05-04T11:45:58.3380000+00:00' AS DateTimeOffset), 1, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (40, N'huytuan2', N'$2a$12$cZY.eUBSJ6SIo6cb68rF9.caRcm7yxMBkNVu0H9O.sULuKozGPZci', NULL, 1, NULL, N's1trollboy36@gmail.com', NULL, NULL, NULL, CAST(N'2020-05-04T11:07:25.8125469+07:00' AS DateTimeOffset), CAST(N'2020-05-04T11:47:44.9710000+00:00' AS DateTimeOffset), 2, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (41, N'huytuan3', N'$2a$12$meS6dDTge6GZqSDiBTmryuu8dBnErr1u3hIQk3SHvxgSzLtG/gThy', NULL, 1, NULL, N's1trollboy36@gmail.coma', NULL, NULL, NULL, CAST(N'2020-05-04T19:29:28.4918716+07:00' AS DateTimeOffset), CAST(N'2020-05-04T19:29:29.0275686+07:00' AS DateTimeOffset), 2, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (42, N'huytuan4', N'$2a$12$t9VWyQIkf9gEZFv268Li2uoxUu9gaw9uDzIhXbSFlLH0Lp8XzsbQ.', NULL, 1, NULL, N's1trollboy36@gmail.com', NULL, NULL, NULL, CAST(N'2020-05-04T19:34:24.1071905+07:00' AS DateTimeOffset), CAST(N'2020-05-04T19:34:24.6848591+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (54, N'quanbong112233', N'$2a$12$bNZFMnxr0Vu0ReZZ.6Wc.OEBXRqlqenjeWgB.0H8QJeEmc9kHIs5.', NULL, 1, N'0929299282', N'quanchua@123.com', N'thanh hoa', NULL, NULL, CAST(N'2020-05-12T08:25:39.8953322+07:00' AS DateTimeOffset), CAST(N'2020-05-17T15:39:42.8664644+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (55, N'quanchua111', N'$2a$12$CinoYBpdyL0PZcJrz8F5juX6zQiMHQWgVZPXBhkZJip3DrGOHKDOq', NULL, 1, NULL, N'quan@gmail.com', N'thanh hoa', NULL, NULL, CAST(N'2020-05-15T13:13:55.4541039+07:00' AS DateTimeOffset), CAST(N'2020-05-15T13:13:55.9588126+07:00' AS DateTimeOffset), 0, NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (56, N'tuanabc', N'$2a$12$Xe7xlmkinm7gHdxHhK.ZyOLNJ4eGk3JqSD/mtG6Xiz3TPuvNhGP8W', N'le huy tuan', 1, N'0987654323', N'lehuytuan20399@gmail.com', N'nam dinh', N'tuanabc', N'tuanabc', CAST(N'2020-05-18T08:14:42.2394260+07:00' AS DateTimeOffset), CAST(N'2020-05-22T10:13:16.6617312+07:00' AS DateTimeOffset), 1, N'\Public\Images\1090412827995172.jpg')
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (59, N'1090412827995172', N'$2a$12$8DiqFHSVR5Wir683D9f66O1G2AsQWTjYgavhNixCY0hcXDvX7Y0F6', N'Tuân  Lê', 1, N'0987654321', N'lehuytuan20399@gmail.com', N'Nam Dinh', NULL, N'Tuân  Lê', CAST(N'2020-05-24T17:41:20.3075523+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:42:33.3552742+07:00' AS DateTimeOffset), 1, N'\Public\Images\1935515(1).jpg')
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [status], [phonenumber], [email], [address], [createdby], [modifiedby], [createdAt], [updatedAt], [gender], [avatar]) VALUES (60, N'quanchuabong', N'$2a$12$isuxXWH9UuQB7Jzcmr0VmuIiYgL64AdZ9Z3zyN936AJXpogge8JWu', N'quan chua bong', 1, N'', N'quanchuabong@gmail.com', N'', NULL, NULL, CAST(N'2020-05-25T08:35:36.0353135+07:00' AS DateTimeOffset), CAST(N'2020-05-25T08:35:36.6039843+07:00' AS DateTimeOffset), 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Catalogs] ADD  CONSTRAINT [DF_Catalogs_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK__Baskets__buyerid__1C873BEC] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK__Baskets__buyerid__1C873BEC]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK__Baskets__catalog__1B9317B3] FOREIGN KEY([catalogid])
REFERENCES [dbo].[Catalogs] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK__Baskets__catalog__1B9317B3]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK__Bills__userid__1F63A897] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK__Bills__userid__1F63A897]
GO
ALTER TABLE [dbo].[Catalogs]  WITH CHECK ADD  CONSTRAINT [FK__Catalogs__catalo__0D7A0286] FOREIGN KEY([catalogtypeid])
REFERENCES [dbo].[CatalogTypes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalogs] CHECK CONSTRAINT [FK__Catalogs__catalo__0D7A0286]
GO
ALTER TABLE [dbo].[Catalogs]  WITH CHECK ADD  CONSTRAINT [FK__Catalogs__catalo__0E6E26BF] FOREIGN KEY([catalogbrandid])
REFERENCES [dbo].[CatalogBrands] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalogs] CHECK CONSTRAINT [FK__Catalogs__catalo__0E6E26BF]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK__Histories__catal__67DE6983] FOREIGN KEY([catalogid])
REFERENCES [dbo].[Catalogs] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK__Histories__catal__67DE6983]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK__Notificat__billi__7AF13DF7] FOREIGN KEY([billid])
REFERENCES [dbo].[Bills] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK__Notificat__billi__7AF13DF7]
GO
ALTER TABLE [dbo].[Specifications]  WITH CHECK ADD  CONSTRAINT [FK__Specifica__catal__114A936A] FOREIGN KEY([catalogid])
REFERENCES [dbo].[Catalogs] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Specifications] CHECK CONSTRAINT [FK__Specifica__catal__114A936A]
GO
ALTER TABLE [dbo].[SpecificationsLaptops]  WITH CHECK ADD  CONSTRAINT [FK__Specifica__catal__14270015] FOREIGN KEY([catalogid])
REFERENCES [dbo].[Catalogs] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SpecificationsLaptops] CHECK CONSTRAINT [FK__Specifica__catal__14270015]
GO
ALTER TABLE [dbo].[SpecificationsMobiles]  WITH CHECK ADD  CONSTRAINT [FK__Specifica__catal__17036CC0] FOREIGN KEY([catalogid])
REFERENCES [dbo].[Catalogs] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SpecificationsMobiles] CHECK CONSTRAINT [FK__Specifica__catal__17036CC0]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__rolei__236943A5] FOREIGN KEY([roleid])
REFERENCES [dbo].[Roles] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK__UserRoles__rolei__236943A5]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__useri__245D67DE] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK__UserRoles__useri__245D67DE]
GO
USE [master]
GO
ALTER DATABASE [MobileWorldPlus] SET  READ_WRITE 
GO
