USE [master]
GO
/****** Object:  Database [BookShop]    Script Date: 7/23/2021 3:09:14 PM ******/
CREATE DATABASE [BookShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookShop] SET RECOVERY FULL 
GO
ALTER DATABASE [BookShop] SET  MULTI_USER 
GO
ALTER DATABASE [BookShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookShop', N'ON'
GO
USE [BookShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](30) NULL,
	[Fullname] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Image] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[RoleId] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Username] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[CreateDate] [date] NULL,
	[Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[CreateDate] [date] NULL,
	[Image] [varchar](50) NULL,
	[Available] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[Category] [int] NULL,
 CONSTRAINT [PK__Products__3214EC07D60E7C91] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/23/2021 3:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image]) VALUES (N'khoa', N'123', N'Phạm Hoàng Khoa', NULL, N'khoa.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image]) VALUES (N'tuna', N'123', N'Phạm Minh Tuấn', N'tuanpham150801@gmail.com', N'tuan.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image]) VALUES (N'valne', N'123', N'Lê Văn Cường', N'cuongg121101@gmail.com', N'cuong.jpg')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Truyện tranh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Tâm lí')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [CreateDate], [Image], [Available], [Description], [Category]) VALUES (1, N'Đắc Nhân Tâm', 399, 20, CAST(N'2021-07-01' AS Date), N'dnt.jpg', 1, N'Truyện tranh ', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Quantity], [CreateDate], [Image], [Available], [Description], [Category]) VALUES (2, N'Bí Quyết Đơn Giản Hoá Cuộc Sống', 299, 10, CAST(N'2021-04-01' AS Date), N'spf.jpg', 1, N'Tâm li', 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'ADMIN', N'Adminastrator')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'GUEST', N'Guest')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'USER', N'User')
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK__Authoriti__RoleI__15502E78] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK__Authoriti__RoleI__15502E78]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK__Authoriti__Usern__145C0A3F] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK__Authoriti__Usern__145C0A3F]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK__Favorites__Produ__239E4DCF] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK__Favorites__Produ__239E4DCF]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__1FCDBCEB] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__1FCDBCEB]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__20C1E124] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__20C1E124]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__1CF15040] FOREIGN KEY([Category])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__1CF15040]
GO
USE [master]
GO
ALTER DATABASE [BookShop] SET  READ_WRITE 
GO
