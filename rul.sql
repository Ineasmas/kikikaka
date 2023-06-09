USE [master]
GO
/****** Object:  Database [20.102k-04-autoservice-rul]    Script Date: 18.03.2023 15:11:28 ******/
CREATE DATABASE [20.102k-04-autoservice-rul]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'20.102k-04-autoservice-rul', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\20.102k-04-autoservice-rul.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'20.102k-04-autoservice-rul_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\20.102k-04-autoservice-rul_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [20.102k-04-autoservice-rul].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET ARITHABORT OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET  DISABLE_BROKER 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET  MULTI_USER 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET DB_CHAINING OFF 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET QUERY_STORE = OFF
GO
USE [20.102k-04-autoservice-rul]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 18.03.2023 15:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ClientFullName] [nvarchar](max) NULL,
	[ReceiptCode] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF13DE6A63] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 18.03.2023 15:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 18.03.2023 15:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[ID] [int] NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.03.2023 15:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductImage] [nvarchar](max) NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[MaxDiscountAmount] [tinyint] NOT NULL,
	[Supplier] [nvarchar](50) NOT NULL,
	[CountinPack] [int] NULL,
	[MinCount] [int] NULL,
 CONSTRAINT [PK__Product__2EA7DCD529AB3197] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 18.03.2023 15:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18.03.2023 15:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(50,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCACE0CEA145] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (1, N'Новый ', CAST(N'2022-05-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'', 211)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (2, N'Завершен', CAST(N'2022-05-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Никитин Артур Алексеевич', 212)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (3, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), 5, CAST(N'2022-05-05T00:00:00.000' AS DateTime), N'', 213)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (4, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), 6, CAST(N'2022-05-06T00:00:00.000' AS DateTime), N'', 214)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (5, N'Завершен', CAST(N'2022-05-13T00:00:00.000' AS DateTime), 7, CAST(N'2022-05-07T00:00:00.000' AS DateTime), N'Киселев Максим Сергеевич', 215)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (6, N'Новый ', CAST(N'2022-05-14T00:00:00.000' AS DateTime), 10, CAST(N'2022-05-08T00:00:00.000' AS DateTime), N'Борисов Тимур Егорович', 216)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (7, N'Новый ', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 11, CAST(N'2022-05-09T00:00:00.000' AS DateTime), N'Климов Арсений Тимурович', 217)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (8, N'Новый ', CAST(N'2022-05-16T00:00:00.000' AS DateTime), 20, CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'', 218)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (9, N'Завершен', CAST(N'2022-05-17T00:00:00.000' AS DateTime), 30, CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'', 219)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [ClientFullName], [ReceiptCode]) VALUES (10, N'Новый ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 33, CAST(N'2022-05-12T00:00:00.000' AS DateTime), N'', 220)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (1, N'D374E4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (1, N'Z472R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (2, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (2, N'K830R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (3, N'K849L6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (3, N'O393R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (4, N'S983R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (4, N'Z469T7', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (5, N'F938T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (5, N'S037R9', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (6, N'D799T6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (6, N'E679R3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (7, N'P023T2', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (7, N'V892T6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (8, N'K702L6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (8, N'S625T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (9, N'L802Y5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (9, N'P307T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (10, N'B702T6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (10, N'M562Y7', 1)
GO
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (1, N'344288, г. Вологда, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (2, N'614164, г.Вологда,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (3, N'394242, г. Вологда, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (4, N'660540, г. Вологда, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (5, N'125837, г. Вологда, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (6, N'125703, г. Вологда, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (7, N'625283, г. Вологда, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (8, N'614611, г. Вологда, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (9, N'454311, г.Вологда, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (10, N'660007, г.Вологда, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (11, N'603036, г. Вологда, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (12, N'450983, г.Вологда, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (13, N'394782, г. Вологда, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (14, N'603002, г. Вологда, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (15, N'450558, г. Вологда, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (16, N'394060, г.Вологда, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (17, N'410661, г. Вологда, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (18, N'625590, г. Вологда, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (19, N'625683, г. Вологда, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (20, N'400562, г. Вологда, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (21, N'614510, г. Вологда, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (22, N'410542, г. Вологда, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (23, N'620839, г. Вологда, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (24, N'443890, г. Вологда, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (25, N'603379, г. Вологда, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (26, N'603721, г. Вологда, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (27, N'410172, г. Вологда, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (28, N'420151, г. Вологда, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (29, N'125061, г. Вологда, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (30, N'630370, г. Вологда, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (31, N'614753, г. Вологда, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (32, N'426030, г. Вологда, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (33, N'450375, г. Вологда ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (34, N'625560, г. Вологда, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (35, N'630201, г. Вологда, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (36, N'190949, г. Вологда, ул. Мичурина, 26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'A782R4', N'Аккумулятор', N'Аккумулятор автомобильный BIG FIGHTER 55р', N'Автозапчасти', N'A782R4.jpg', N'BIG FIGHTER', CAST(4500.0000 AS Decimal(19, 4)), 2, 24, N'', N'шт.', 30, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'B702T6', N'Домкрат', N'Домкрат ALCA 436000', N'Автосервис', N'', N'ALCA', CAST(2700.0000 AS Decimal(19, 4)), 2, 3, N'', N'шт.', 10, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'D374E4', N'Съемник подшипников', N'Съемник AIRLINE AT-GP2-05', N'Съемники подшипников', N'D374E4.jpeg', N'AIRLINE', CAST(1400.0000 AS Decimal(19, 4)), 3, 2, N'', N'шт.', 20, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'D799T6', N'Съемник подшипников', N'Съемник для подшипников JTC 9000', N'Съемники подшипников', N'', N'JTC', CAST(1800.0000 AS Decimal(19, 4)), 2, 6, N'', N'шт.', 25, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'E679R3', N'Автошампунь', N'Автошампунь GRASS 800026 Active Foam Truck', N'Автосервис', N'', N'GRASS', CAST(4000.0000 AS Decimal(19, 4)), 4, 14, N'', N'шт.', 15, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'E932T8', N'Полироль', N'Полироль GRASS 125101 Black Brilliance', N'Автосервис', N'', N'GRASS', CAST(2100.0000 AS Decimal(19, 4)), 3, 23, N'', N'шт.', 25, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'F026R4', N'Антифриз', N'Антифриз сине-зеленый MOBIL ANTIFREEZE EXTRA', N'Автосервис', N'', N'MOBIL', CAST(530.0000 AS Decimal(19, 4)), 2, 13, N'', N'шт.', 15, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'F938T5', N'Антифриз', N'Антифриз красный TCL LLC01212', N'Автосервис', N'', N'TCL', CAST(1200.0000 AS Decimal(19, 4)), 4, 34, N'', N'шт.', 15, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'H572T6', N'Парктроник', N'Парктроник AIRLINE APS-8L-02', N'Автозапчасти', N'', N'AIRLINE', CAST(2900.0000 AS Decimal(19, 4)), 5, 12, N'', N'шт.', 15, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'K702L6', N'Ключ', N'Ключ JONNESWAY W233032 (30 / 32 мм)', N'Ручные инструменты', N'', N'JONNESWAY', CAST(1600.0000 AS Decimal(19, 4)), 3, 9, N'', N'шт.', 15, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'K830R4', N'Колпак для колеса', N'Колпак для колеса AIRLINE Супер Астра R16 серебристый 2шт', N'Автозапчасти', N'K830R4.jpg', N'AIRLINE', CAST(915.0000 AS Decimal(19, 4)), 3, 14, N'', N'уп.', 20, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'K849L6', N'Набор ключей', N'Набор ключей накидных STV 00-00010990 6шт.', N'Ручные инструменты', N'K849L6.jpeg', N'STV', CAST(780.0000 AS Decimal(19, 4)), 2, 23, N'', N'уп.', 15, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'L802Y5', N'Лопата', N'Лопата саперная AIRLINE AB-S-03', N'Аксессуары', N'', N'AIRLINE', CAST(870.0000 AS Decimal(19, 4)), 4, 23, N'', N'шт.', 5, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'M562Y7', N'Мультиметр', N'Мультиметр JTC 1227A автомобильный', N'Аксессуары', N'', N'JTC', CAST(14200.0000 AS Decimal(19, 4)), 3, 12, N'', N'шт.', 5, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'O393R4', N'Отвертка', N'Отвертка JONNESWAY D04P2100', N'Ручные инструменты', N'O393R4.jpeg', N'JONNESWAY', CAST(460.0000 AS Decimal(19, 4)), 3, 14, N'', N'шт.', 15, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'P023T2', N'Провода прикуривания', N'Провода прикуривания в сумке SMART CABLE 700 4,5м', N'Автозапчасти', N'', N'SMART', CAST(3400.0000 AS Decimal(19, 4)), 2, 6, N'', N'шт.', 20, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'P307T5', N'Провода прикуривания', N'Провода прикуривания в сумке EXPERT 400А 2,5м', N'Автозапчасти', N'', N'EXPERT', CAST(700.0000 AS Decimal(19, 4)), 4, 2, N'', N'шт.', 10, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'P439R4', N'Пассатижи', N'Пассатижи HAMMER Flex 601-050 160 мм (6 дюймов)', N'Аксессуары', N'', N'HAMMER', CAST(310.0000 AS Decimal(19, 4)), 3, 34, N'', N'шт.', 5, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'S021R4', N'Адаптер для щеток', N'Адаптер для щеток стеклоочистителя ALCA Top Lock A/C блистер 2 шт', N'Автозапчасти', N'', N'ALCA', CAST(200.0000 AS Decimal(19, 4)), 2, 13, N'', N'уп.', 3, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'S037R9', N'Щетка', N'Щётка AIRLINE AB-H-03', N'Аксессуары', N'S037R9.jpeg', N'AIRLINE', CAST(740.0000 AS Decimal(19, 4)), 2, 26, N'', N'шт.', 25, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'S625T5', N'Щетка', N'щетка стеклоочистителя ALCA Start 16"/40см каркасная', N'Автозапчасти', N'', N'ALCA', CAST(249.0000 AS Decimal(19, 4)), 3, 12, N'', N'шт.', 20, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'S826R4', N'Щетка', N'Щетка стеклоочистителя ALCA Super flat 19"/48см бескаркасная', N'Автозапчасти', N'', N'ALCA', CAST(530.0000 AS Decimal(19, 4)), 4, 28, N'', N'шт.', 2, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'S983R4', N'Щетка', N'Щетка с/о BOSCH ECO 65C 650мм каркасная', N'Автозапчасти', N'S983R4.jpg', N'BOSCH', CAST(500.0000 AS Decimal(19, 4)), 4, 8, N'', N'шт.', 15, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'T589T6', N'Термометр', N'Термометр ALCA 577000', N'Аксессуары', N'', N'ALCA', CAST(1400.0000 AS Decimal(19, 4)), 2, 3, N'', N'шт.', 10, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'V892T6', N'Свеча зажигания', N'Свеча зажигания CHAMPION IGP F7RTC', N'Автозапчасти', N'', N'CHAMPION', CAST(130.0000 AS Decimal(19, 4)), 3, 21, N'', N'шт.', 5, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'Z326T9', N'Зарядное устройство', N'Устройство зарядное EXPERT ЗУ-300 6/12В 3,8А', N'Зарядные устройства', N'', N'EXPERT', CAST(2400.0000 AS Decimal(19, 4)), 3, 14, N'', N'шт.', 15, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'Z374R3', N'Зарядное устройство', N'Зарядное устройство AIRLINE ACH-15A-08', N'Зарядные устройства', N'Z374R3.jpeg', N'AIRLINE', CAST(4600.0000 AS Decimal(19, 4)), 2, 14, N'', N'шт.', 25, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'Z469T7', N'Устройство пуско-зарядное', N'Устройство пуско-зарядное AIRLINE 12В 8000мАч 350А', N'Зарядные устройства', N'Z469T7.jpg', N'AIRLINE', CAST(4000.0000 AS Decimal(19, 4)), 2, 4, N'', N'шт.', 25, N'Максидом', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'Z472R4', N'Зарядное устройство', N'Зарядное устройство KOLNER KBCН 4', N'Зарядные устройства', N'Z472R4.jpeg', N'KOLNER', CAST(1250.0000 AS Decimal(19, 4)), 4, 6, N'', N'шт.', 30, N'220-volt', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountinPack], [MinCount]) VALUES (N'Z782T5', N'Зажим', N'Зажим AIRLINE SA-400-P', N'Зарядные устройства', N'', N'AIRLINE', CAST(290.0000 AS Decimal(19, 4)), 5, 6, N'', N'уп.', 25, N'220-volt', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Лихачёв ', N'Онисим', N'Гордеевич', N'loginDErfg2018', N'5ovb1N', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Рожков ', N'Тихон', N'Владиславович', N'loginDEymi2018', N'nR0+pI', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Павлов ', N'Максим', N'Фёдорович', N'loginDEnbi2018', N'Ed*JQP', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Шилов ', N'Матвей', N'Альбертович', N'loginDEhvg2018', N'SaHv6w', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Шаров ', N'Федосей', N'Юрьевич', N'loginDEmbg2018', N'Fou{d3', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Медведева ', N'Пелагея', N'Мартыновна', N'loginDEubq2018', N'{jzW2v', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Медведев ', N'Григорий', N'Агафонович', N'loginDEosl2018', N'O3O}we', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Соколова ', N'Марфа', N'Всеволодовна', N'loginDErog2018', N'&W4Wtq', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Петухова ', N'Василиса', N'Еремеевна', N'loginDEsku2018', N'fUldqr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Беспалова ', N'Галина', N'Дмитрьевна', N'loginDEatu2018', N'}nGbhZ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Андреева ', N'Александра', N'Владиславовна', N'loginDEhks2018', N'XV|+W4', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Селезнёв ', N'Федот', N'Валентинович', N'loginDEzbl2018', N'ih4xKJ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Вишняков ', N'Сергей', N'Иванович', N'loginDEoxa2018', N'mL+97r', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Зимин ', N'Василий', N'Русланович', N'loginDEssm2018', N'oBrTGr', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Фадеева ', N'Регина', N'Онисимовна', N'loginDEzxw2018', N'pX&AsH', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Артемьев ', N'Варлам', N'Альбертович', N'loginDEkzo2018', N'n3es*S', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Щербаков ', N'Лукий', N'Онисимович', N'loginDEdaq2018', N'dWsvBS', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Горбунов ', N'Матвей', N'Сергеевич', N'loginDEnjd2018', N'0&3HHn', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Зиновьева ', N'Варвара', N'Антоновна', N'loginDEluw2018', N'S3wj{I', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Фролов ', N'Юрий', N'Варламович', N'loginDEole2018', N'p+kvb6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Ларионова ', N'Василиса', N'Владимировна', N'loginDEebl2018', N'#ИМЯ?', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Силин ', N'Вячеслав', N'Валерьевич', N'loginDEfug2018', N'z|6cXV', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Герасимова ', N'Феврония', N'Валерьяновна', N'loginDEgfx2018', N'GFSZAB', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Пономарёва ', N'Вера', N'Руслановна', N'loginDEtww2018', N'4icZTg', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Медведьев ', N'Руслан', N'Богданович', N'loginDElyc2018', N'#ИМЯ?', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Владимиров ', N'Геласий', N'Пантелеймонович', N'loginDEcbd2018', N'GwG*p6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Корнилов ', N'Иван', N'Игоревич', N'loginDEcay2018', N'ehtG*H', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Иван ', N'Вячеславовна', N'', N'loginDEmel2018', N'8zmoSV', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Ермакова ', N'Зинаида', N'Данииловна', N'loginDEhqk2018', N'KBc4A+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Пахомова ', N'Элеонора', N'Григорьевна', N'loginDEkny2018', N'v2+4Ro', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Гущина ', N'Вера', N'Ефимовна', N'loginDEmda2018', N'sG+NF0', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Полякова ', N'Антонина', N'Андреевна', N'loginDEhhf2018', N'd+GS5y', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Зуева ', N'Марина', N'Ильяовна', N'loginDEilc2018', N'eyRufZ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Агафонов ', N'Агафон', N'Максимович', N'loginDEwfv2018', N'ZSUiGT', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Архипов ', N'Агафон', N'Игоревич', N'loginDEozn2018', N'nndP3Q', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Лапина ', N'Иванна', N'Аристарховна', N'loginDEbtr2018', N'FdZrI3', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Маслова ', N'Мария', N'Аристарховна', N'loginDEcuf2018', N'aOdzYf', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Русаков ', N'Василий', N'Куприянович', N'loginDEtye2018', N'MEJjQt', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Николаева ', N'Евдокия', N'Пётровна', N'loginDEncq2018', N'GgG3m0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Прохоров ', N'Олег', N'Брониславович', N'loginDEtmt2018', N'}FOh*}', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Зайцев ', N'Макар', N'Владленович', N'loginDEyqb2018', N'xLmuQq', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Жданов ', N'Сергей', N'Гордеевич', N'loginDExld2018', N'a8Vjkx', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Нестеров ', N'Авдей', N'Митрофанович', N'loginDEnig2018', N'Cm00D0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Григорьева ', N'Глафира', N'Антоновна', N'loginDEmly2018', N'IZJ7O|', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Зыков ', N'Геласий', N'Лаврентьевич', N'loginDElom2018', N'Yg}k84', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Александрова ', N'Марфа', N'Протасьевна', N'loginDEvoa2018', N'RdGikC', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Мухин ', N'Донат', N'Ростиславович', N'loginDEwmq2018', N'ds4KAb', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Костин ', N'Геласий', N'Германнович', N'loginDEdba2018', N'D7xF6u', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Лазарев ', N'Протасий', N'Игоревич', N'loginDEnsr2018', N'VZKTog', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Пестов ', N'Богдан', N'Германнович', N'loginDEqsc2018', N'UU|FkZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__267ABA7A] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [20.102k-04-autoservice-rul] SET  READ_WRITE 
GO
