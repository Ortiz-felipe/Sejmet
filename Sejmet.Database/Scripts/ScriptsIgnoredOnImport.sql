USE [master]
GO
/****** Object:  Database [SejmetDB]    Script Date: 25/05/2023 10:50:48 ******/
CREATE DATABASE [SejmetDB]
GO
ALTER DATABASE [SejmetDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SejmetDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SejmetDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SejmetDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SejmetDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SejmetDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SejmetDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SejmetDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SejmetDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SejmetDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SejmetDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SejmetDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SejmetDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SejmetDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SejmetDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SejmetDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SejmetDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SejmetDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SejmetDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SejmetDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SejmetDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SejmetDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SejmetDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SejmetDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SejmetDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SejmetDB] SET  MULTI_USER 
GO
ALTER DATABASE [SejmetDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SejmetDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SejmetDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SejmetDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SejmetDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SejmetDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SejmetDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SejmetDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [SejmetDB]
GO
/****** Object:  Table [dbo].[ActiveCompounds]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveCompounds](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[MaxDosage] [int] NOT NULL,
	[TherapeuticEffectID] [int] NOT NULL,
 CONSTRAINT [PK_ActiveCompounds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[ProvinceID] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[DNI] [nvarchar](50) NOT NULL,
	[Birthdate] [datetime2](7) NOT NULL,
	[Age] [int] NOT NULL,
	[HealtcareProviderID] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[CityID] [uniqueidentifier] NOT NULL,
	[ProvinceID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DosageForms]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DosageForms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DosageForms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthcareProviders]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthcareProviders](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_HealthcareProviders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratories]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratories](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Laboratories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[OrderID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [uniqueidentifier] NOT NULL,
	[ProviderID] [uniqueidentifier] NOT NULL,
	[TotalAmount] [decimal](19, 4) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[RecievedDate] [datetime2](7) NOT NULL,
	[TransactionStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [uniqueidentifier] NOT NULL,
	[UPC] [varchar](20) NOT NULL,
	[TradeName] [nvarchar](150) NOT NULL,
	[LaboratoryID] [uniqueidentifier] NOT NULL,
	[ActiveCompoundID] [uniqueidentifier] NOT NULL,
	[DosageFormID] [int] NOT NULL,
	[Price] [decimal](19, 4) NOT NULL,
	[Container] [int] NOT NULL,
	[Dosage] [int] NOT NULL,
	[CurrentStock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[PointOfContact] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[CUIT] [nvarchar](50) NOT NULL,
	[CityID] [uniqueidentifier] NOT NULL,
	[ProvinceID] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleProducts]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleProducts](
	[SaleID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_SaleProducts] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[ID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[TotalAmount] [decimal](19, 4) NOT NULL,
	[SaleDate] [datetime2](7) NOT NULL,
	[TransactionStatusID] [int] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TherapeuticEffects]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapeuticEffects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TherapeuticEffects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionStatuses]    Script Date: 25/05/2023 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'7d32580b-c9b1-421c-9db1-0a29b3225bf0', N'Diclofenac Sodico', 150, 1)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'57a439c7-aa38-411d-84e1-0c10ac98cffe', N'Amoxicilina', 4000, 18)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'd7060fec-ca61-48f8-b52a-14a866e6bc5f', N'Ácido Acetilsalicílico', 4000, 2)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'c7b8ab68-cbbd-4cd0-b108-1cf58c413eb5', N'Furosemida', 2000, 17)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'dedef976-7839-4ae6-b06d-264194949a9e', N'Claritromicina', 1000, 20)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'384e5070-aae8-4b3a-a27c-34746076d0dd', N'Ondansetrón', 32, 4)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'074038f0-e5c2-4685-a734-35f8ce9f14e1', N'Lactulosa', 60, 10)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'98f0a3ca-4532-4685-9c4a-37ab5813ee7d', N'Enalapril', 40, 14)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'5517b64f-c060-4507-be82-48ab78b7eab4', N'Metoclopramida', 30, 4)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'3821d167-5401-4cf5-8311-520ff1330372', N'Ibuprofeno', 2400, 2)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'd6ad61eb-22e9-4f74-8f2f-66468a3114d8', N'Paracetamol', 4000, 3)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'05a23fb0-7442-4844-8cd8-7fc18d62dab2', N'Azitromicina', 1500, 19)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'9ab61a6c-435e-437f-979f-82d795e5329a', N'Loperamida', 16, 7)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'ae6bd89f-c919-46de-a5f9-9ba0692b67a2', N'Hidrocortisona', 500, 13)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'4353baa7-98a7-4684-8a51-9c75c0697097', N'Hidroxido de bismuto + Pectina', 750, 7)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'84a9d779-01ad-47e0-8c5f-a0490fce692b', N'Losartan', 100, 14)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'a8131d08-52b8-496e-acb7-a264dad5e7b6', N'Metronidazol', 500, 16)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'638baecb-e3fe-4a54-b3b4-a4b97601fe31', N'Domperidona', 30, 4)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'85333ee5-0f1c-4dba-bb78-a6ff5c275c3d', N'Bromhexina', 48, 12)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'c411626d-e8d5-4fd9-9585-b437cca48246', N'Simvastatina', 40, 15)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'4b6fe688-5c21-406e-9e66-bb155fff84a0', N'Espironolactona', 400, 17)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'c3f3bbd8-9f17-44b8-8340-be92ed23b4be', N'Ketorolac Trometamina', 90, 3)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'def635ff-51cf-4a88-861d-c75d617e3bb2', N'Loratadina', 10, 11)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'e334746b-440c-49b1-99ba-ccf2d59d0e8f', N'Difenhidramina', 300, 11)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'a6788e07-5886-4db6-8ed6-cf2d68c42b6c', N'Dexametasona', 12, 13)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'7f281f39-4c39-472a-9b79-d04953b9cc8b', N'Hioscina butilbromuro', 80, 8)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'd53ba60d-f09d-4a1a-8d63-d2ae03c85525', N'Cefalexina', 4000, 19)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'4f5c932d-ed69-4321-be5e-d3222be8c7e7', N'Aciclovir', 400, 18)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'88f96bbc-cd27-40b2-a1e9-dd20ca2426bb', N'Simeticona', 480, 6)
GO
INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'e93cf382-0ba3-44bd-a833-fabdd8cd3bf2', N'Clindamicina', 1200, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'897876cf-1fcc-4f2f-85e8-001b05086144', N'Barrio La Lor', 604833, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1c8171b-3926-4b09-ae64-0025d7b1b965', N'Justiniano Posse', 36029, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2dcf1275-fdf8-4265-acd8-002c5bb968d7', N'Km. 8 - Don Bosco', 517392, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'834edbf3-4ffa-4141-8fe4-00341c7d5c01', N'Barrio Santa Rosa', 285016, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61e1f45a-efeb-47af-81b5-00420a615e5e', N'General Villegas', 822702, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ab1f1cd-9db5-4d35-bb2a-004ea60c5db0', N'Arroyo Venado', 641799, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5743947-856d-4dd3-9e51-008608cebe52', N'Estacion Presidente Roca', 858545, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc7a0246-df57-4538-a181-0088e18ac1bd', N'Libertador General San Martin', 73659, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'065ca568-82ee-4f35-8cf1-0090263d3c28', N'San Vicente', 548274, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3e033bc-183b-40fe-bf61-009d39583289', N'Margarita Belen', 936444, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c320b2bc-885f-4bfa-bbe1-009fdfdc0242', N'Nuevo Torino', 205911, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5d65246-9b83-4b5c-b1c7-00b940c8fde8', N'La Ramada', 826735, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2940330b-9fd6-4151-981e-00bb924d768f', N'Villa El Palmar', 999344, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'16692921-d459-480a-9783-00ec0694368c', N'Villa Huidobro', 172413, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a423e929-f487-471c-8a54-00ee8f72b1c3', N'San Genaro', 753257, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b07dd4d-f33d-4bf8-a25d-0103047bb10b', N'Pavon', 335079, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07d65a32-09d6-42f5-9633-011d5d588daf', N'Los Surgentes', 952520, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2df74ae7-ed6a-4963-9355-01506a1cdae0', N'General Rojo', 226155, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e7a7a098-9eda-463f-88e2-017da00c1c7b', N'San Bernardo', 332396, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'84bad91b-041e-480f-b6e4-018da6d55bac', N'Los Overos', 343645, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46873003-99f5-4783-9098-018ebc4ee3aa', N'Las Perdices', 617059, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c80c96b4-1c31-4b87-ba6b-0194edf8fd7f', N'La Candelaria', 412825, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4dcd750f-a0ed-4caa-86b6-019cb5874b3f', N'Barrio Kennedy', 300355, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14da0879-965a-49f9-baa5-01b043950b19', N'Villa Cordoba', 868165, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1612ca51-17c2-425c-bcab-01c5e8b79376', N'Beazley', 285123, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'24b2f36e-c8a7-47fb-96d8-01ca91602869', N'Meson De Fierro', 375282, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'19fbdef9-82e0-45ec-811f-01f72ac6d589', N'Vasquez', 222168, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fbb22114-6fb7-4101-813b-021229c1ace9', N'Palca De Varas', 450315, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4e585cec-a110-448d-ad2c-021791bb9449', N'Pueblo San Jorge', 662920, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'50772b90-135d-4e50-867a-023f05e3e8d7', N'General Daniel Cerri', 7082, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a001328b-647f-48b7-8883-023ff5338bf4', N'Colonia Aborigen', 494229, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'585c5790-27e8-431f-981f-024052f49bcd', N'Bayauca', 652170, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb5cc1a1-86e2-4e78-b3fe-0240c4b08a5a', N'Cienega', 83040, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c8a5b91-0435-41cd-b65a-0241e008342b', N'Villa Fontana', 245087, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0adc3117-5ac3-4e2d-9f08-024420bb851c', N'Ines Indart', 2795, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9f95f421-1e2e-4846-bc67-02616d841bce', N'Lavalle', 768283, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3cb57aab-3b36-4a05-88a6-02769d2d8fa8', N'Campos Salles', 505809, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc2133d4-60ad-481c-b9b4-029938574f4b', N'Garza', 789135, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7478ef3-7b63-421a-998e-029a9fbf4b0f', N'San German', 202152, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'68478d65-1e67-4d0c-a6b5-029ba5102d42', N'Nueva Delicia', 896661, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e5c47fb-190f-41ad-9ddf-02b88ddbe6c8', N'Chavarria', 681350, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'66e38225-aaa8-48d3-9279-02d53f0d903f', N'Cerro Colorado', 613916, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5caa27eb-5cab-4d8b-9a62-02df38306a0a', N'Ancasti', 500922, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6e9290ee-7c4b-4fc7-8d7c-02eed12e4fad', N'Los Talas', 862844, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1278e11e-3dad-4936-9978-02f23e78e8e8', N'Escalada', 466526, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0260ca5f-43a8-4876-a9fa-02ffe6f2a46b', N'San Lorenzo', 530261, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'448cb050-89c9-46f7-99bc-031531018e93', N'Colonia Aurora', 429282, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7555094-c076-4951-bd45-031996b87a21', N'San Pedro De Colalao', 194422, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8c38147-c723-40e8-8c94-032cf40f5e73', N'Capilla De Los Remedios', 972042, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'affd9b8c-21cf-4822-b2a5-0337f6227c50', N'Herrera', 622582, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'03a660e0-b068-4980-ae54-033c697af8d5', N'Balnearia', 602174, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd40a65b8-736f-43e2-936a-03633d080475', N'Rincon De Los Sauces', 780672, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'227801ef-656d-40a0-b971-036e7d450520', N'Pozo Del Mistol', 705626, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8849b3a-bb98-45e7-914c-03804c7de71d', N'Liviara', 952092, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cf6c0db6-d88a-41a6-b5a8-038172c19bcf', N'Olaroz Chico', 181425, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e901d019-07a9-4d78-b8f6-038c74334f8d', N'Graneros', 983369, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2b887d8-c4ad-4052-85c5-0394ccac1a72', N'San Jose', 189344, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4960950c-eda7-4c14-9544-03c60d5acae8', N'General Pinto', 551643, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2991718-bcec-4b09-9066-03cd45628725', N'La Viña', 284192, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a1402c8-f9d3-4540-aac6-03da53235398', N'Pozo De Los Indios', 936647, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fb68430-3b92-4d66-9d93-03e011fced56', N'Catua', 839690, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65d549c2-68c9-459d-86ce-03e217db2f4f', N'Carmen De Areco', 538653, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'24c31a1a-7544-4520-8583-03e52b24b9f8', N'Zenon Pereyra', 344861, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9111f51b-9677-4e31-ad09-03e8c80b7a6e', N'Carnerillo', 419409, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3506274-8084-49a7-8e34-03f581b2889b', N'Puerto Ruiz', 807032, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f9b0058-64cb-450e-a693-0402430ea11f', N'Coneta', 226932, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db953fe6-edeb-40c4-875e-041c2bb13970', N'Providencia', 889154, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4760215e-cf53-43da-b46a-042879da3cab', N'Las Toscas', 354747, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c28f644-833f-4cc6-9e07-04382bffb300', N'Apostoles', 828301, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'695409a0-42ed-4134-a73e-04429cf1b5fa', N'Buena Vista', 239981, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f69349a5-8ff0-4319-adf6-045a7e892fff', N'Mar Del Tuyu', 207361, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04e8cf54-b110-40c8-afcb-047865bc9c98', N'Carrenleufu', 913486, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'91404c39-a107-41e5-b100-047d33a1ab4d', N'Belgrano', 199598, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df6ee163-4fac-4838-9a7c-04a6a1e33362', N'Amboy', 727323, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2095ca32-1a90-4cb7-a5ee-04adf2c1262a', N'Jose Marmol', 18686, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f02c781a-c69c-47ef-a254-04bb5c522a4e', N'Villa Del Curi Leuvu', 135230, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'411199b5-5f3e-47cb-9ce9-04bdaea00326', N'Villa Santa Rosa', 405742, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b1bd2cd-1c9c-42e8-953c-04bf70b5a20f', N'Nahuel Niyeu', 105992, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f00fd499-b42a-43f2-a6f3-04dc123f6689', N'Ingeniero White', 672180, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54bc0d7b-faf1-4964-8674-04ea8b330884', N'El Crispin', 575097, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2826e802-d09b-4741-93dd-0500ccaf52c9', N'San Antonio', 574930, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'664e11e8-aaab-4e21-9280-05132066f328', N'Las Bandurrias', 580745, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a4ad808-02d5-4492-9c54-0523e4b1d618', N'Taquimilan', 659712, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'84680824-7e3c-4957-b645-05302cd66f82', N'Perdriel', 604981, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d512d6c-2a04-4c02-a735-055f680e57f5', N'Villa Centenario', 856813, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c018eff7-34db-4cfd-bdb6-056a98c8c01c', N'Las Caleras', 189195, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a664023-9ede-4d85-bff3-0572648f5371', N'San Vicente', 894835, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2142e3ee-eaca-461c-a0c8-0579f8d24a00', N'Villa General Eugenio Necochea', 872059, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2dfab443-7ac3-47da-a0a2-0590f9bc18e7', N'Anquincila', 379934, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3176612a-3012-4b44-a89c-05a88648319b', N'Villa Dolores', 523521, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eeec40f6-ed79-420e-8601-05b1ccba1e96', N'Taco Pozo', 515141, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'68a0ad32-ffd1-4eb5-a2bf-05b30e081f92', N'Rawson', 785425, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'66355ac7-d5ca-41fe-bbbb-05bf3c68cb28', N'San Antonio', 141680, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'31581bd5-2030-432b-ae50-05c28cca0dcd', N'Nueva Francia', 320352, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd0cbcfb0-d3bd-4c0c-9205-05ec13bcf579', N'Rio Tala', 617, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'186bccf4-1202-4df8-913e-05f51ef644c5', N'Diamante', 381162, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4de64b77-7145-40eb-9c2d-060a2e00330e', N'La Tigra', 242206, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd34a980-cf3b-433a-b3b3-062a5e1ef63c', N'Morteros', 410059, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ad3d7c8-22de-446f-9804-063099d3a747', N'Esquina', 840240, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9265c5cb-9284-4663-98d1-06365ce6789c', N'Coronel Juan Sola', 412125, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd10e64fd-f064-4214-a76a-0687d5541dd8', N'Nicanor Olivera', 935082, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04f07665-5b43-4c47-b8a2-0689ee055ccc', N'James Craik', 119029, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4110d6b-a604-4bcc-a286-0691bc058232', N'Laguna Brava', 81703, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fadaddfe-fd52-4f3c-bbd8-06a4e990c283', N'Peyrano', 693661, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc21583f-9647-4359-9e49-06df88f7191a', N'Del Carril', 278877, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'279a4160-8ea7-46bf-9a4c-06e156325717', N'Basavilbaso', 163758, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5be08518-a1c6-43ce-ad6c-06f1d4216126', N'Colonia Anita', 526475, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'787a2e65-6fcb-4a7a-b651-06f78c4dec15', N'Cusi Cusi', 455879, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a87f4b25-0c66-48d9-806c-06fb966bfc63', N'Bernardo Larroude', 530532, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5fbfc3b8-de8f-421a-adca-07286597d3d2', N'Villa Dominico', 554794, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea1eb09a-dae5-48bf-8d7f-0734718d2356', N'Calilegua', 8570, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'beec354a-ac95-4e65-b9c1-074349badc7f', N'Las Junturas', 764675, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9673e0d1-248b-4ef5-a42b-074bb120dff9', N'La Bajada', 184973, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9129ac23-f8e5-4259-96c3-0758896f8d67', N'Smith', 992626, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a25d682-1b2b-4faf-b82e-0770277026a1', N'Cañada Rosquin', 891730, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'268d6e9a-2605-4de8-9cce-07bedb23fd7a', N'El Rosario', 913657, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9cb1413f-c8a1-4769-9995-07fd9bb7c5d8', N'Firmat', 771804, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1908661e-7398-4038-a124-0804fd46976c', N'Chamical', 788207, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'500d4ff5-72aa-497e-bade-080c98b015e3', N'General Lagos', 51900, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ddd1d14f-05fb-4438-be3c-081379fdc3af', N'Villa Corazon De Maria', 521538, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c54ccaf-a550-4b84-9c06-084c3c051d59', N'Montecarlo', 652509, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b04f61db-143d-4301-8383-085987be9989', N'Esther', 753258, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'01a78eba-8147-4069-b50c-085bfcfdde1c', N'Villa El Tala', 610860, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf9d5c8f-09be-488f-96cf-085e8ba5f12e', N'San Francisco Del Chañar', 319666, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd1df8889-cc64-4a5a-a0be-08672dc14efc', N'Vista Alegre Norte', 367746, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b15f2ca-f10f-462b-be50-08710e1de640', N'Villa Martelli', 53633, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5816016-c8ea-4ca5-850e-087148e02ee7', N'Laguna Larga', 72764, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'846ca692-0a4f-47af-ba4a-087be58fcd45', N'Plaza San Francisco', 94271, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff41e016-5335-4443-85d1-0882208237fc', N'El Pantanillo', 186800, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83ebd179-a1a7-48bd-8a32-08877a5a820b', N'Villaguay', 849829, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f6187f8e-ac14-4ad2-8ed1-08888f7f69ca', N'Malbran', 361990, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d014d8e-f099-47ae-b20d-08b5fdeaefe9', N'Las Cañas', 240196, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e4770ab-c40f-4c8b-8a8c-08b7f7b898e3', N'Colonia Polana', 781658, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64bf6891-f311-4fcc-9ba3-08cd9dc104cc', N'Manantiales', 786593, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'51a06fdb-1149-48c8-b5d9-08d414f45903', N'Obera', 569829, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ca4877a-a784-4537-8c15-08f7c4708b2c', N'San Martin Norte', 449852, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57adc2dd-fa96-4cda-a2d4-08fd7fb201ea', N'Quebracho Ladeado', 314154, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8479a8d1-8a6c-423c-9e1f-0908840f8f3f', N'Monte Hermoso', 790821, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e6eb0bd-00a7-487c-b9e4-091f6565740f', N'Grand Bourg', 33311, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8991fcd-2e94-4b2e-b31f-09237f9fcfb7', N'Villa Sefair (Talacasto)', 960638, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9df2da8e-ee75-4243-a76a-09567ad0b849', N'Godoy Cruz', 264, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a11b0856-4ffe-4af7-9e0f-096efb2ce387', N'Villa Dolores', 113881, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c91527ea-f017-4f77-ac1d-099135327b1d', N'Las Vertientes', 856908, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'845c14e7-13bf-439a-bb0f-0997e848bf25', N'Peninsula Ruca Co', 740512, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d8e65be-3cec-43e5-93ce-099aceb2114f', N'Pozo De Maza', 488735, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10556d54-3050-4291-bbd4-09ad1a75e1e4', N'Monte Ralo', 881280, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60450985-8593-4c53-aaa6-09ad84c15634', N'Hernan Mejia Miraval', 386113, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47768895-83ee-44ad-8b87-09baeb030c2e', N'Animana', 336292, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'08301c77-3e92-4350-8218-09cf57f2c53d', N'Jeppener', 716396, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45641517-76cd-489e-a7a6-09d826db27cf', N'Tamberias', 654483, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6029aecf-6cb5-44e5-b5a9-09f036e210e4', N'Cavanagh', 904368, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'efed143f-85f3-43f3-b3c7-09fceb30f794', N'Lucio V. Lopez', 183881, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ed79d43-1a0c-4f4e-a94b-0a06a9ea61e6', N'Los Cardozos', 557436, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'366b9480-5164-4477-aab8-0a13fc1f3df3', N'La Guardia', 256833, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ef0839e-7413-44ea-8114-0a1bc2a0d0b1', N'Paso Del Sapo', 446957, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd45e6789-61bd-4f57-965c-0a300fe93e6e', N'Melincue', 184099, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a5c71509-6e41-43fd-aca7-0a3683d165c4', N'El Toro', 493040, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ba46182-ed1d-4e66-8000-0a3ada032534', N'Country Club El Rodeo', 801600, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2250d494-7e98-4424-a546-0a8ffa20421f', N'Tesorero', 175426, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd90bead7-2181-48c5-b912-0a99c6e8d762', N'Villa Juan Martin De Pueyrredon', 277517, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'863732ed-e7a8-468c-a332-0aa51bd62b0a', N'Hito 1', 892029, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7f66d3b-97d9-4bc0-9e1b-0aa608f5222d', N'Paraje Chaco Chico', 516974, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3791c6a8-da77-4067-aa02-0aa9af77929d', N'San Jeronimo Del Sauce', 605891, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1f87629-9ccc-48e1-8fb4-0abe2743006d', N'Ayacucho', 534796, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e3074c37-c309-4bca-9d8b-0ac150bf3106', N'Martin De Loyola', 948127, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a0c92ce6-2303-4aaa-9707-0ac1fcbd4761', N'Calchaqui', 629602, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'49a2560f-10b1-45c5-8990-0ac8076f10b5', N'Villa Canto', 419532, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'42500190-dfe8-41ae-8175-0ad1e6c1b5ab', N'Aranguren', 158851, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56e26ea3-f515-42ca-bca2-0ad2308ac200', N'Villa Guillermina', 114205, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5324654d-ef5e-460f-ba5a-0ad9fc5c7c4d', N'Villa Dolores', 534563, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd090c017-7706-498c-8188-0b0fe94cc08e', N'Villa Parque Siquiman', 586629, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6142b2e8-16e0-4f0b-ad8c-0b1522411d3c', N'Colonia Bismarck', 698000, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7f1dd01-0927-48c9-a30f-0b1a0fa3e3d0', N'Punta Del Agua', 490459, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b77f686f-b59c-4522-ac7b-0b1b5bc6c879', N'Barrio San Jose Iii', 443030, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d2875b4-f34f-4059-a57a-0b2d4795a16c', N'Gramilla', 609494, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cf255aa9-bba5-4eb0-a8ae-0b5aa0018ba9', N'Jose De La Quintana', 377968, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70306865-1e90-4092-a9a3-0b669a9a8441', N'Franck', 736695, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5107b096-76c2-4ac4-a3ed-0b6cd50ada84', N'Villa Sarmiento', 529447, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2310c4bb-a36f-4ec8-a6bf-0b837b596938', N'Cañada De Luque', 886533, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c123213-5e19-4544-a13a-0b8d36e35e01', N'Barrios Acapulco Y Veracruz', 698134, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7d42b821-8d29-48bb-b0da-0b8e69c3fee7', N'Chimbas', 513091, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00debf6a-c207-4aec-ae4a-0b8ec6d21b18', N'Los Callejones', 751702, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06d7323d-3280-4cb8-b14c-0bad051e7bdf', N'Abbott', 31345, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'477a7254-ce96-4c03-8b90-0bc272ab94fa', N'Desaguadero', 914630, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4720a47-b517-471b-a62b-0bc76af2b67d', N'Santa Rosa', 415387, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c44d59a8-aed5-44bf-ba9d-0bd35289af88', N'Recalde', 812217, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9ffd10c-3c44-4c59-a508-0be5d884423a', N'Villa Atuel', 973705, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78f6e8d6-54a4-4e48-b624-0bef50c4bef9', N'Paso Del Durazno', 303366, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2835f2f-552b-4526-9226-0c05d897b827', N'La Boca Del Rio', 209521, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'709afcb5-926d-4ae6-b0e0-0c08a7e4446b', N'Koluel Kaike', 923901, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'62e5d521-7f0b-451c-a5ce-0c19f7125970', N'Lucila Del Mar', 13022, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fbeab3e9-e92f-42d6-844a-0c21f754112c', N'Anchorena', 638611, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0776a99-ae86-41ae-b985-0c3d54898c5b', N'Mina Santa Teresita', 536368, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbdc5e19-1269-423f-b2b7-0c3fbf9a9b01', N'Sierra Colorada', 919708, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bad9219e-07a7-454d-833d-0c4305ee7e56', N'Pampa Del Infierno', 657457, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd39f910-49c7-44a8-af4e-0c5592bc76cb', N'Mariano Benitez', 601153, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5503548-9751-4925-9520-0c565d47dcf3', N'Anillaco', 757153, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'231d5559-7170-4e2b-8e05-0c598b122d81', N'Cepeda', 488313, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e08691a-bc62-4020-a732-0c67b46e6659', N'El Cain', 432351, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b1e00a4-5e19-4568-80f4-0c6966dc6384', N'Laprida', 499596, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d355c30-0ccb-4058-9bd2-0c8768c4d4dc', N'La Sarita', 85119, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75f563a7-a1bc-4da1-87b0-0c8a74a3c64e', N'La Gloria', 412301, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22cfee5c-36f0-4aa6-bbc4-0c8cf4a0244a', N'Las Flores', 19778, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'077a38f6-9052-4ed2-9170-0ca981e1bc49', N'San Antonio', 60590, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3cda004f-e28c-4d2c-96ab-0cbdce34e141', N'Santa Maria De Punilla', 271300, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ceee93b0-db4f-4d7a-a1ac-0d0c35c0c237', N'Barrio Las Quintas', 587742, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5da2bf81-556f-43bf-b79b-0d2ba3a91109', N'Santo Tomas', 896575, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b264bef8-9b3e-4bd1-a49d-0d3be62d7049', N'Comunidad Aborigen Bartolome De Las Casas', 93829, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd196962-ce82-48d9-9a1a-0d4f8c5764fe', N'Pozuelos', 277850, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eaed23fc-f629-4dc2-912b-0d52e9d25bff', N'Loma Hermosa', 921769, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1c97f7a-f78b-4db4-a2ea-0d695e7c644c', N'Valcheta', 877568, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa415187-4b9a-4be8-b310-0d9a90878db8', N'Chivilcoy', 320239, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1906337-c9ba-4828-b789-0db898e07f41', N'Claypole', 669765, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b7b57a7-6434-4dae-b138-0dc5cab8ea94', N'Vila', 315808, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56409e21-dc82-4484-a907-0dfe80b8482a', N'Villa San Andres', 476803, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'71b57e33-041e-42f9-a429-0e0dec92ff7e', N'Costasacate', 723424, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79a686c8-6ca2-4356-86f1-0e0e4ecece56', N'Angel Etcheverry', 916631, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd39d219e-92ed-4581-a883-0e133bf3fb27', N'San Severo', 585984, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4fd34471-42b2-4ef5-978b-0e1488d04f67', N'Sagrada Familia', 573373, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8e9e097-d48f-4b10-97d3-0e4dd4b6de6e', N'Mussi', 456049, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8df1100-f02d-4882-b3fa-0e4ed0380272', N'Coyaguaima', 835311, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cbfc1f11-367e-448a-9c9f-0e592806d311', N'Conesa', 461365, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea2ecd29-7b73-4c01-99c0-0e6403cc54bd', N'Aldea San Francisco', 87477, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef79b400-1fc1-4eed-bb2c-0e6ce09d42a5', N'General Pizarro', 113292, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'40f160da-f6f2-441e-9fcb-0e7fa9778600', N'Estacion Puiggari', 706542, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97e37e43-4c78-4c1d-aaf3-0e84f5547422', N'Ciudad Jardin El Libertador', 665212, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c894d4c-d276-4ac8-bb2b-0e880039ef0d', N'Puerto San Antonio Este', 521841, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba7dfa23-7dad-49b5-955f-0ea80a8ccb0d', N'La Llave Nueva', 199269, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc908276-0316-4944-a3d3-0eaa8e889382', N'Sargento Moya', 381937, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c337b704-04df-4309-9bff-0eb4c21db0de', N'Ranchillos', 46508, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6775ab20-9db9-4014-9ac5-0ed5dad3bcb3', N'Villa Grisolia', 953682, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0bcf4bae-4713-42d6-bf2a-0ed87b617101', N'Monte Grande', 560380, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10414727-5db5-4c00-b35c-0f0a58892790', N'Charras', 990803, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4e97d54-c335-433e-a1d6-0f1bee16027c', N'Camet', 689645, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'24f6ac3b-de1d-4f3e-ba7c-0f1dfda8fd10', N'Bahia Bustamante', 888584, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c57a988-f81f-4b67-be87-0f24ec059dad', N'San Luis', 594705, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c330a4ec-b162-4266-b9f3-0f2f209a3553', N'Alvear', 673524, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a7234f4-1945-4433-a239-0f5fe382bc9b', N'General Baldissera', 702287, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc51dd1a-80cf-4270-9338-0f64b8b060db', N'Gobernador Gregores', 904113, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd80db93d-aced-45f4-88c7-0f7146ee044c', N'Santa Cruz', 519392, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f7969e1-a9b5-40e2-9f32-0f93c463cd51', N'La Falda', 800769, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a87edf7a-37a1-416a-8c83-0f9b2089f8c6', N'Santa Trinidad', 197810, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba345fb3-1f14-4e8f-807e-0f9f2b57bffc', N'Yaminue', 589982, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4e1422c7-1b13-459a-8a1f-0fa9da154562', N'Colonia Sere', 220393, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3434ffb0-23a4-4b32-ac96-0fca6555b2a3', N'Las Palmeras', 247228, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8a00af15-fa5c-4555-82c7-0fd90bb6592c', N'San Carlos Centro', 163471, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b45b2253-692a-4a33-ba1e-0fe202839518', N'Viedma', 648818, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90bc29e5-f4bb-4e5b-b68a-0fe5852fc783', N'9 De Julio', 755036, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3dadf4de-ad41-47c4-b4a3-0fe8df0c897d', N'Ambrosetti', 726413, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8403169-b0d7-4bb4-b451-0fee9e83b2fc', N'Las Peñas', 7137, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1be8c960-8ad0-446e-aca0-0ffa44f09ee6', N'Villa Figueroa', 402726, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54609064-31ee-4b65-b550-10038fe6be1b', N'Ringuelet', 409759, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8bf6652-1bed-4603-a1c1-1006084a7768', N'Villa La Bolsa', 644357, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'31de67b2-2b50-4201-a1b9-10083a3f4771', N'Paso De La Patria', 507132, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5d23061-2884-4d1c-bb7d-100e71f138db', N'El Mojon', 687697, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc19d56c-73ba-4d2f-ab11-100ea957cbca', N'Garuhape', 442887, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6a16207-44bd-4038-9254-1010b008a905', N'Barrio Rio Salado', 59472, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'114a86ff-4c0f-4d0f-9b6c-10297e671281', N'Villa Tacu', 533475, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8947a3fc-4ec6-4d91-8b9c-103637f2953e', N'Capitan Montoya', 702188, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dfce3ade-4af4-408c-870f-103de43c58ae', N'Ex Ingenio Esperanza', 61024, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ddab3691-8a1c-4214-b527-1070b55dece6', N'Villa Los Coihues', 54480, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8bea629-61f6-45f2-b49c-1071eb7664c8', N'Villa La Punta', 57166, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b5d4e73-7cb0-4e96-beac-107b909b4d50', N'Churqui Cañada', 958538, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b9e4507c-834a-4995-bec5-1080adba9fd7', N'Tanti', 901505, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df196c55-742a-44e3-a2b2-1084f5e6262d', N'Villa Angelica', 461503, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5235cd7-7ca8-43d9-b724-10890111584e', N'Pearson', 156642, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0487b433-a8fc-4b02-81c0-108a6180664e', N'Helvecia', 62562, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'132033f8-ef86-4177-8883-109388ab2a62', N'Arenas Verdes', 929962, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'118fe07e-ca39-4a7d-9a92-1099a0079ce2', N'Santa Rosa De Rio Primero', 498414, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a7ba799-00c0-4bcc-97f4-10ae29ed523b', N'Lago Puelo', 481200, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2543547-c9e1-4799-8061-10e40f75b80a', N'Cañada Honda', 260055, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'470fe2bb-bfb2-4420-b5b8-10e7039f6e32', N'Itacaruare', 127326, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c20c889-6be1-4f88-9229-10edffe62f22', N'Castellanos', 646557, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2fcbed5d-c46c-4769-8a27-10fda302c358', N'Villada', 215028, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41a4bedb-d03c-4f19-ac50-10fed0fb3557', N'Los Amores', 686468, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87850e86-521b-4b85-9cf8-110086046bdc', N'Hughes', 134010, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'902b8a99-511e-4d0d-ba80-1100c0e28a8c', N'Mattaldi', 490592, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b9ac26fd-6cfc-4444-863c-11015fb32a2a', N'San Jose De La Dormida', 981680, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63863667-4a45-4d79-b37a-1108e9016dad', N'Centinela Del Mar', 500490, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'52047288-b90b-452e-8b50-113ef7fab083', N'Lago Rosario', 660245, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6d6a984-638d-44e8-a8e4-115c2286b665', N'Villa Castelli', 915091, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'baffb688-08d6-4aa6-9134-115f02bea324', N'Gran China', 64057, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9939e17d-6cc9-4d7e-a924-117ad05cfc03', N'Kilometro 115', 403058, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54536a59-b6bd-4682-bd4d-117b35264970', N'Balde Del Rosario', 222644, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c3c36f4-663f-498c-9508-119301239941', N'Estacion Colonia Tirolesa', 54746, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b03ab6b8-52b4-4ffc-9340-11bce95bbf81', N'Las Flores', 330844, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b193903-c6c3-4258-ab1e-11d038acb56e', N'Presidencia De La Plaza', 729911, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c2ce3db-be6a-4f0c-ab94-120341a04c76', N'San Luis Del Palmar', 380414, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a606ba97-2df8-48d6-babf-121d07b1f6fa', N'Henderson', 129829, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9f37caf8-e4b7-41ae-95e8-122b7d6d95b0', N'Barrio Santa Isabel', 102505, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38908065-5a1e-44f1-a13e-12540ac78338', N'Santa Rosa', 707931, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'241b8ffa-75db-4ba3-8d23-125d21580922', N'Embarcacion', 888728, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4bbdca86-a16d-46b5-ae4a-126e1e2f0883', N'Garibaldi', 636113, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20be0e63-177f-48f5-9bb9-1297420ad512', N'Los Baldecitos', 541561, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ba453b5-9606-40c4-a6a0-129973257026', N'Barrio Pinar', 39987, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6bd1ffe7-748d-46c7-99e4-12a2a3a724c0', N'La Gallareta', 298767, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa842025-a968-4269-95c5-12a2f1ca5ef5', N'Ceibas', 465568, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5d6baeb-a5b8-40dd-a43c-12b630b32e07', N'Diaz', 689202, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a75774f-6b6f-4e35-9e7c-12cd35d1fb6f', N'Pergamino', 517871, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ca502ac-8f62-4878-a3fe-12e6647c3303', N'Ingeniero Chanourdie', 101823, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'add175ec-cb77-4e36-9b45-12e9eae2ad80', N'Agronomia', 634163, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c56730a-80fe-4845-a205-12f468a68136', N'Coronel Arnold', 955903, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2e15d63-c911-456a-8686-12f81e509fdf', N'Rueda', 192154, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8f875f5-7502-434c-9df1-13077df74491', N'Etruria', 646341, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6540cdc0-2c07-4279-bfe3-1320ee1e2467', N'Santa Victoria', 361242, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56c12cc2-c41b-4469-bda8-13465043f465', N'Buen Pasto', 142426, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39c3e3f1-7d07-448e-959a-134897630902', N'Stroeder', 455909, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b023daeb-d00a-4bf5-b65d-13701656bdd4', N'Alderetes', 400098, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e39e064-f500-4f7d-9ce8-1375787a9ffa', N'Los Reartes', 17064, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6cee1ec-1082-4bd1-8fb9-137928d52ac5', N'La Vanguardia', 601982, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8cfd554a-340a-4699-818e-137ad09a6fc7', N'Farallon Negro', 757640, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d0e3910-b144-4eb6-996c-1382e9916d68', N'Santuario De Tres Pozos', 874313, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'241800b5-09d7-40a4-9cd2-1391b6614438', N'Costa Azul', 637292, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c9b1dcc6-1b02-476d-8c1d-13c3b6aaedff', N'Rio Gallegos', 138750, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20e678da-210d-429a-ba1c-13c82066d12d', N'Hortensia', 477346, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4459c7b-b121-4bb7-86cb-13dd71984bee', N'Estacion Sol De Mayo', 390323, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bfbe7425-c169-417d-baaf-140066a410af', N'Pueblo Gouin', 245054, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'49cc580f-88c4-46ee-bbf1-141985ae0651', N'Barrio La Barda', 613573, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbeaf5db-71e4-40c7-aeda-1419d138cbe0', N'San Jose', 248115, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b43beed3-c2d3-41d3-83fc-1419da5300e3', N'Chasico', 352780, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fcec8e49-7710-4266-9479-1428a5877943', N'Villa Fontana', 381727, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86d64a32-e398-42ba-9933-143172458703', N'El Salto', 409259, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89a8dfbc-e564-4b6c-9661-1479fab08bb3', N'Olpas', 310890, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3c94873-f478-4d36-83c4-148b63a8c6c3', N'Santa Rosa', 611541, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85542242-99cc-48ce-a796-1495c5d9a2d5', N'Paso De Los Libres', 723207, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'42a3ed27-3552-40c9-8130-149846f72a42', N'Jose Melchor Romero', 881265, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5bda135-6318-42b8-9daa-14a778242a74', N'Barrio Blanco', 184346, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21f8878b-9481-4e60-9d81-14b0a1fd1913', N'Unanue', 510890, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e2538ac-b1e4-4803-84e9-14e31259f060', N'Colonia Cello', 101280, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc896d0d-8a4f-45b6-a043-14ee75f89bc9', N'La Criolla', 946785, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'be7700b6-7348-40a0-b579-14f286069f86', N'Presidencia Roca', 700510, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3a8392bb-3771-4eaa-a8ab-14fcda9d090a', N'Coronel Mollinedo', 726391, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46407afc-646a-46a2-8bcb-152518c6f35a', N'Barrio Rural', 586149, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47c6a046-0c26-41e1-bf7e-152f434c2139', N'Arana', 537291, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e417563-1637-4caa-9ae5-153727583bb9', N'Barrio Gilbert (1° De Mayo)', 435765, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'992cb2c5-6628-4bf6-98d2-153e62489be7', N'Valle Colorado', 419234, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c04a4b66-33bb-455f-bf44-1540fab75d8e', N'Gastre', 937305, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e25fdd73-ffb4-4346-92e7-1545b7796642', N'Aguas Blancas', 951191, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a26036a-0355-4fab-a574-154d04a251fe', N'Averias', 47880, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0435262c-37b4-4204-a67e-154e404fc069', N'Chilecito', 309897, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'504882ef-b8f0-4a2b-ad05-1566099d2b54', N'Capilla Del Monte', 939165, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'605c669f-2825-4bc5-8238-156e9d7d8ba7', N'Colonia Tinco', 429216, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0601edb5-31ad-4cf3-8f4f-15725c87e474', N'La Emilia', 933561, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd1ddc2f-7398-4f6d-adb7-157310ef108b', N'Clodomira', 218205, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c96e7009-63dd-444f-96ba-15994c421473', N'General Piran', 829128, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'49e9ac24-9440-421a-bcfd-15a0ed6ba2c3', N'Country San Isidro', 807077, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb831a79-4a1f-4e11-9045-15b428270f31', N'La Esperanza', 546470, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6434423e-6121-49e6-858e-15b6f60f69a4', N'Alto De Las Juntas', 979974, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9a14038-6692-480c-a63f-15c357d25ad2', N'Barrio Virgen Del Rosario', 923410, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a684f658-3395-4de9-904d-15cc4a211823', N'Villa Libertad', 315146, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87f99a75-bdb4-4b6d-8f17-15d46831bd7f', N'Villa El Salvador', 720879, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d557397-318f-4484-93e8-15d6933221a6', N'San Antonio', 571442, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3cc96112-ad34-4f05-a562-15e75995b668', N'Guatimozin', 676002, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3c4ab7a-96f1-4a7d-86a5-160ab1a1eee3', N'Tolosa', 55624, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'939887b5-e35b-4e51-831b-160e313125a9', N'La Ribera', 257213, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26d21c16-fce2-4b3e-b871-16108df6d09a', N'Segunda Usina', 355926, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2d6791f1-04e5-4304-a32d-16214b654047', N'El Mirasol', 750498, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dfb68798-04f9-4134-8fff-16242ff04581', N'Quiros', 967760, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f46e5250-44fc-4596-b9c6-164549882dc7', N'Villa Santa Rosa', 671156, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7022abda-4be8-4ef5-9a5c-16972e7f9560', N'Barrio Nuevo Garupa', 800349, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1f25c537-6f47-4d4a-a395-16c2e27798ad', N'Ambul', 975767, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea58b4f9-ea00-4afa-90d0-16de16a24944', N'Las Bahamas', 454348, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f96ed95f-54e9-4785-b778-16df6d026b0e', N'Bajo Hondo', 110653, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'256e0a02-a844-440f-b4f4-16e8dbcc7520', N'Barrio Costa Oeste', 467310, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5f70acb-6a43-4b2a-a0f2-16ebcf5ed344', N'Monje', 891670, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'327806be-7f55-4ccb-92ca-16fde78ac0f6', N'Villa Gesell', 868164, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e131e1b-111e-4963-965f-16feda2ebb1d', N'5ta Brigada', 558903, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8fc42a84-58d6-472f-bf41-1702350c3546', N'Barrio Costa Este', 204660, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67f7601b-00f2-494c-a390-17153139c7f4', N'Banda De Lucero', 855748, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8e8e7e0-e4c3-4493-903a-17191853c02d', N'Rio Segundo', 361268, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ddf987be-5888-4065-909b-1721bc86db5b', N'Villa Elisa', 34051, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3555c1d3-f494-495c-8bf9-172a5d8991ff', N'Rosario De Lerma', 880903, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22f4c1b9-e52e-4beb-abae-17311c963ccb', N'Piedritas', 808452, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f0e5b6ad-53c1-437b-befa-1733d0820122', N'La Dormida', 337488, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b16b3b7-911f-403e-8f55-174a06b6af2f', N'Los Cisnes', 833514, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9737be6-2b29-4414-af77-17575f57c943', N'Abramo', 556874, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'025fded1-d061-43bc-8132-175846b529db', N'Banderalo', 871543, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'62f0e2b2-012a-42c6-be40-176384eec6c3', N'Puesto De Castro', 549536, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3cef58d-a723-47a6-84fe-17874a9d9a71', N'Garin', 653811, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e061523-0b98-40a1-834d-178fb08e9da7', N'San Nicolas', 428810, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3b07737-cbc7-4fe3-be90-179af8537f9c', N'Maquinchao', 878483, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'571050c0-6e50-40c6-ba3c-17b11d6bd56c', N'General Guido', 334916, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'563dda01-de64-4ad7-a246-17b4fd3b58f5', N'Villa Parque Santa Ana', 684607, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b12bfb90-4165-42db-844e-17c56f8b9793', N'Avellaneda', 515761, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'325ef3eb-aa18-4e5d-80ab-17ccec962f8c', N'Rosario De La Frontera', 23779, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b56de5d9-83d2-4718-9183-17cdbcc88075', N'Simbol', 553268, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d586854-9ae3-4813-a03a-17d3b71a668f', N'Pueblo General Belgrano', 750895, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abc8d1c8-6fcb-4b88-ae95-17eb8bc9c984', N'El Jagüel', 360226, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'580f091c-e68e-4449-b475-17f6c950ab3b', N'Antaje', 176125, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'28bce371-4d40-41c9-981f-181110d7ee0c', N'Maria Grande', 543186, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c805016-0f0a-40c8-b093-181158660749', N'Casa Grande', 639327, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d15c8a0-76ac-4adc-b2d3-18165419cb1a', N'Los Robles', 257374, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e40a678-5678-4aea-b376-181ec661e222', N'San Martin I', 844665, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8efa7eeb-97d7-4146-8566-182f80c3bd2b', N'Alhuampa', 476337, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90ad1a19-3ef7-4756-be20-1832537786b7', N'Copacabana', 360897, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'807a93af-ae98-4cc6-a2c6-1846eea08cb6', N'Larguia', 772855, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f15c14e7-e356-4421-be8d-18576110668b', N'Las Tunas', 636925, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb9c65c3-fe32-4427-9f6f-185fde7984ca', N'Felipe Yofre', 311508, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a60d4f9a-9ed8-4b0d-ac53-186aa5aaa17a', N'General Pico', 763500, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'675f073b-edf7-45ff-a89d-1883df6e2672', N'8a. Seccion', 340959, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'efbd2f4e-2df1-46b3-bbcc-189ee1679c77', N'General Guemes', 747544, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5069b99b-ea9f-4310-a590-18b0c9f2b359', N'9 De Abril', 359550, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d5ab4bc-577c-465c-9219-18ba68362d06', N'Cuadro Ortega', 397583, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e88cee5-408e-4c66-be49-18c36bce63b7', N'Aicuña', 929360, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e7685d0-c766-46a2-9c97-18c71c3238e8', N'28 De Noviembre', 492664, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47198718-913b-4fc1-b4ad-18e9377d4aff', N'Concordia', 383058, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7143a896-ceab-458c-9a60-18f4d9216854', N'Ibarreta', 16024, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93f9cc44-b997-4790-860e-18fb01cddc92', N'Shaqui', 934046, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea504a95-0dd6-4b44-b822-18fcbef1a0eb', N'Polcos', 946236, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5eb441fa-5f08-4747-b944-1904c3dcb283', N'Dique Florentino Ameghino', 125395, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c96c489-dac9-47e7-84c7-190dd2568d76', N'Santa Clara De Saguier', 149931, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'692082ff-e602-46f2-85a6-1915088d8a16', N'Ingeniero Gustavo Andre', 195476, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99afd220-15e0-48f4-b4f6-1923d5288210', N'Winifreda', 494348, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd297404-f0ee-4ce4-b2df-192ec4b74fb6', N'Barrio Los Pinares', 674511, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ad327e0-857d-4b2f-9fa3-194e239ec636', N'Aldea Santa Maria', 278068, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'359c4d31-a501-4cd2-b262-19690d10ee77', N'Gutemberg', 526238, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'130ea318-8e17-4acf-8681-1978994d4387', N'Ituzaingo Centro', 394552, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2349cd31-a83a-499c-8411-198412eeaae5', N'Wichi', 274935, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98f892b1-a5a2-4eba-9c77-1984d0063478', N'Adolfo Gonzales Chaves', 489010, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4b72dc3-373a-4ad4-a19f-199d42c1bd2d', N'Siete Palmas', 366292, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b911dd13-2de6-4751-8d79-19c6f97072d3', N'Pueblo Independencia', 850031, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe56cc1a-8c55-4cc1-a5b6-19c7ce32d438', N'El Jardin', 30968, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df671183-0ce7-4080-94da-19cb5fe48b6d', N'Victorica', 239781, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca15a898-a585-41b3-9073-19dc8d25923c', N'Villa Espora', 211458, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd883f8fc-6b29-4fe0-abdc-19e6cd01993e', N'Barrio El Treinta', 913018, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e4f53ea-8b19-4ace-89a4-19eee20b335f', N'Lampacito', 519093, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aaaf56b3-397e-4af5-b38a-19ef4719d46e', N'San Roque', 777933, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1069c1c8-1302-4520-9625-1a00af61cea9', N'Chalican', 613230, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a21343ba-56f6-44a1-98fb-1a09fbd5f9a1', N'Papagayos', 791477, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5572856d-fcb9-4efb-b4d6-1a21da9d0053', N'Aldea Santa Maria', 718598, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79a065ba-d512-4332-b491-1a32a9bda871', N'Guayamba', 377180, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3adf23c5-c891-4990-a5a0-1a3ce46b5792', N'El Arenal', 481575, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd009fd72-fd37-4a08-b7af-1a45232e6c1f', N'Tupeli', 88579, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14cb24e4-379e-4854-8b5f-1a456068dca8', N'Villa Krause', 746417, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e76054da-ed61-4faa-bb1c-1a4cdca342e2', N'La Cienega', 135318, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'19326602-4c58-4f5d-bb83-1a4cee6277ec', N'La Rinconada', 45438, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fe00ea8-b393-4e15-9a78-1a5307c3c1d0', N'General Belgrano', 661334, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eea41eee-4464-4430-ad92-1a57667a98b6', N'San Javier', 944439, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c2f627e0-ff94-4dc6-8828-1a5918655df7', N'El Soberbio', 72547, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7b8b94a-9ccd-4799-a63b-1a5bc2671200', N'Matilde', 809402, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cae0fae4-ed33-4ca3-9f9b-1a5e9bf82c5b', N'Gowland', 834310, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e523391-e255-4393-a0e2-1a63a6879a0f', N'Puesto Viejo', 347742, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8ee31d48-1201-426a-8f77-1a6b0d035a88', N'Atocha', 809072, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f196201c-585b-4a48-91d2-1a6d11d40dcc', N'Cinco Saltos', 691607, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9aa07795-7378-477a-b14c-1a7d9536bcfa', N'Atlantida', 384065, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70030529-7fa9-4768-9f60-1a82dabf4fc5', N'Ciudad De San Martin', 409003, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1e13c83-e18d-46d4-914e-1a9377ffb8ec', N'Los Sauces', 264601, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'931091e0-62e5-4d58-9e8a-1a9db7f69755', N'Villa Del Transito', 154536, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b89fdc1a-9d5c-4545-8843-1aab5dab1c2a', N'La Morada', 486316, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'081d416b-e7d8-425f-9959-1ab0dfb43d9d', N'Saavedra', 401043, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c715faa-2a9d-4ecf-a810-1ab5f58e834e', N'Calchin Oeste', 905575, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9388e63-4636-4951-939e-1abd15f6940d', N'Tecka', 163528, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4483262b-3809-47a8-acb6-1ac4b79c480b', N'Leones', 516685, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10eef8c8-3dcd-4d59-9a54-1ad80e11253a', N'Los Hornillos', 871664, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9423f970-cedc-4d46-a29b-1ade12310806', N'Lules', 817729, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6ed876a-3c78-4d7a-9c31-1ae12b06f688', N'Acassuso', 46793, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cf289a9-4d79-4e4e-8881-1afe8daa543b', N'Gaboto', 564012, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f74e1c47-18a8-4578-8d6a-1b09cc407014', N'Mburucuya', 588893, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75b0a6f9-70ff-45c0-aaff-1b15aad3af9a', N'Colonia Bremen', 247675, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'feed051d-9c7a-4e7d-9ec0-1b3ba52371db', N'La Primavera', 518268, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f8af3ca-2b79-4344-acc3-1b3eccec9c26', N'General Acha', 3370, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36298731-bf31-4218-b771-1b5c7b5f2c3b', N'Famatina', 677795, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e6b934c7-7903-49ca-bdc8-1b5fcb36d347', N'Barrio Calle Ciega N? 6', 366253, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cfb31aea-86d6-4baa-a31a-1b781363f23e', N'Claromeco', 569035, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5e80c87-b730-4cf6-99ba-1b79056db362', N'Pinchas', 385174, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a059324-54fc-442e-8924-1b8f8fb27d40', N'Arroyo Dulce', 536807, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8820629-6d20-48e9-b89d-1b94573b73f5', N'Nazareno', 337291, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af6c291a-1f9a-44ab-a6b5-1bac207734a6', N'Ingeniero Moneta', 156810, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cc9bedb-1722-4ee7-9bd4-1bb53d6da228', N'Los Medanos', 42321, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d8c0c01-1425-4c17-9979-1bb752df9add', N'Capilla Del Carmen', 612644, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5fa9fdf9-c934-4712-8440-1bc9c4f18738', N'Buena Esperanza', 943028, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'50f5df39-4b21-4acb-b152-1bcc4f3e44c4', N'Ramirez De Velazco', 598928, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41a5c8d3-88f8-40d7-90f5-1bd4cab4f91d', N'Corzuela', 983834, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f46151b3-8b0a-4e38-a11c-1bd8f8954a4c', N'Villa Raffo', 713055, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'117ce586-a730-48d8-b6db-1be60e98298b', N'Area De Promocion El Triangulo', 279834, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6ad60d7f-c79b-487e-b435-1bedf43158b5', N'Santa Rosa', 911984, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a845001-92a2-49b6-baf4-1bfa183ddfd6', N'Colonia Ana', 496836, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'acbe63c7-b9e4-4f39-8586-1c23fc0420f6', N'El Ramblon', 674573, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd24650f3-0a7a-4f5f-a8bd-1c27af4b6d1a', N'La Calera', 7505, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b7c69e4-836d-4b66-ac4b-1c3644bc1846', N'Garupa', 592820, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd90a040-8170-4bd7-bd81-1c3bba5c74b2', N'Tranquitas', 80110, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a84f6a2a-da13-45c6-9da5-1c3d21a02dfd', N'Blaquier', 327480, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'13b3e9ea-7b24-4e7d-82b7-1c3ff27dd689', N'Infanzon', 436663, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3cc6407-b514-4f6c-9c17-1c5cc278dbb6', N'Rio Muerto', 694261, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'49396af7-8b46-4bd0-a6d8-1c9dd557940d', N'Lopez', 300448, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2555fb34-ddb8-43d9-b7d9-1caf702d22ad', N'Juan N. Fernandez', 644454, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'94aab882-d739-482f-8f2a-1cc3c46cec34', N'Colonia Carolina', 2491, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5369c747-7f79-4624-9a85-1cd59ef3d4c3', N'Maximo Paz', 950844, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf3b91d8-d9ed-42c7-bde2-1cdd1dd08b19', N'Centenario', 922018, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d85b1f3-ea3a-4033-9cde-1cf9fd7edf26', N'Tafi Viejo', 683563, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0a912b61-65ca-4920-ac84-1cfb0b4af3ed', N'Coronel Hilario Lagos', 438593, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'764fa133-6ac8-45fa-80d7-1d0b50190135', N'Guanchin', 50542, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0001a7ac-306b-4c94-ad57-1d3632ad9293', N'Urdampilleta', 747153, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92ff6132-8408-45aa-81e8-1d3d9edafa66', N'Villa Zula', 182939, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ed0fd463-205f-460a-98e4-1d5667ef5d8a', N'Las Tapias', 911301, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f1164f8-d7f9-4995-9248-1d63c34e99a2', N'Inocencio Sosa', 408070, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'842f9a09-011c-4cce-92c6-1d655ba7c9d7', N'Caspala', 207729, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39e219cd-85a0-4431-b8b7-1d6aa35f02d5', N'Solar De Los Molinos', 105778, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02a03f44-0bc2-4f70-b34c-1d6b5ad0b0ec', N'Colazo', 499012, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fafae80-a362-4bce-8581-1d7b37c8e24c', N'Estacion Lazo', 394567, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c347623f-2672-4a36-b597-1d8641b26697', N'San Pedro', 462166, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1d0726f-92cb-4929-8bc5-1db025192d1b', N'Villa Ana', 90686, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'937dea05-ead6-49c2-a66e-1dc9cb367b65', N'Logroño', 831200, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'858a390d-2da5-4235-bdda-1dcef477ff45', N'Ñorquinco', 431565, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'962c45a7-62f2-4942-abfc-1ddca96c2358', N'Colonia San Juan', 203841, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f03a826-6512-44bb-a137-1de0f27330c8', N'Victoria', 171582, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1813a601-c110-4e8a-acd2-1de178aeb962', N'Faustino M. Parera', 4073, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a925e5e-7f7c-4baf-b9ca-1dfbfbd92601', N'Dos Arroyos', 173391, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0b13239-e5e5-43a8-9823-1e07f8bde8c5', N'General Enrique Godoy', 427013, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f5439d5-00ca-433d-8cb6-1e3892f3d5a6', N'Juan Jose Paso', 47049, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'310faaa1-3a02-44dd-9158-1e4722d91735', N'Villa Parque San Lorenzo', 818104, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc685015-32cc-46b2-8201-1e5e48f3ce8f', N'Parada Labougle', 56959, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1507dfff-cb76-4172-ae4e-1e6380de7208', N'Sansinena', 996131, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'143154a9-20e6-47e8-b80a-1e64302a08db', N'Causana', 463920, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4aa4bd15-929c-48e4-b9c3-1e64cf4ad060', N'Hurlingham', 215552, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e101525f-0b57-4173-aeac-1e76b5ad9c28', N'Ita Ibate', 100060, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0ff0705-f1c3-4cf5-bd05-1e8b18ea1e9a', N'Salta', 827726, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1f02bdb-ea3a-41d5-9826-1e9fb872018b', N'Barrio Cicarelli', 143692, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a1752e7-441a-46f0-8af6-1ebe9d1ad759', N'San Benito', 553556, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4affb462-7f42-4837-873e-1ed2876a1b05', N'Transradio', 256473, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9cd96fd-35f1-401d-9db8-1edc51d40bbc', N'Colana', 512554, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85c5d5fa-32c9-4528-b9a7-1ee580d9ef19', N'Barrio Molina Cabrera', 960703, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3df3bf1c-10f5-4a9b-937c-1ee612761718', N'Caimancito', 701773, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db11ddbb-bef3-445a-bbfe-1ef44078fd27', N'Piedra Del Aguila', 40749, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd0f8099b-ab1d-4502-99b8-1ef5751a2798', N'Dock Sud', 867874, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a53bebfd-edab-4a93-ad8e-1ef9612f5753', N'Tapso', 294608, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5ff0952-42d3-4ebb-b439-1f41966f282b', N'Bandera Bajada', 576176, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'09aaa510-3152-4f23-982b-1f4cb107b74e', N'Puelches', 493935, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4568aa83-fea6-40bc-b5c4-1f602bf06ff0', N'17 De Agosto', 155309, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'42846afc-979c-4b4a-ab61-1f8231834d87', N'Villa Mercedes', 257641, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'245de61a-3f4f-4b3c-85ea-1f86320ae8c8', N'Villa Pehuenia', 540497, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db651a1e-37f7-4dbd-9d36-1f8bf63674a8', N'Salazar', 197807, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22113cc7-b645-4ceb-a634-1f98811a56db', N'Pueblo Bellocq', 392597, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'438f20fb-6bc5-4889-88c0-1fa0891aad8f', N'Santa Catalina', 926559, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e541f0e-1f04-41c8-be00-1fa9ce8ddb82', N'11a. Seccion', 286602, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c3e7558-6c34-4313-b78d-1fb18fc9d7be', N'Abra Pampa', 129002, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0d3030d-45bb-4bb4-b3e5-1fba7670399f', N'Alijilan', 666261, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79a11d61-66d1-48b5-a64c-1fbe8ba96879', N'Cruz Del Eje', 383977, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'299de003-d84d-4816-af9a-1ff8daffc232', N'Barrio El Carmen (Oeste)', 149045, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cb6496d-3551-4f2c-965a-20018f82d1c0', N'San Gregorio', 195004, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ecf790d-40c8-49ef-8493-200af595af11', N'Villa Del Totoral', 338842, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffdce42e-e17b-4ccc-827f-20167adbc16c', N'Montes De Oca', 463062, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b745ca51-939f-4f80-8307-204355cb2c1d', N'Villa Mercedes', 844874, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'91bdef88-9722-4a35-8352-20439e812672', N'San Pedro', 565430, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7cb01d7f-93ce-4153-9b87-205b54a71803', N'Barrio Restinga Ali', 469996, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35a49bd1-f136-463c-a244-206914e22f1d', N'Uribelarrea', 727178, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af5b615b-3fb0-4ade-9564-2083f558c27f', N'Torres', 929992, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41c5878c-5f51-4932-ae83-2088de77ca8d', N'Gobernador Sola', 28711, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e3b540e-1a65-44f1-b266-2089f84466ab', N'Santa Ana', 7047, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e13fbafe-fca0-4ef6-918f-2098cf642eae', N'Villa Padre Monti', 389649, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56af6985-6c3c-4924-b593-20a1c59dcce0', N'Villa Elisa', 685123, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e52cd6c1-7cd2-4df9-be38-20a65cb5645b', N'Quimili', 113722, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9a11cc7-0fdc-4290-ab0e-20aeda111ce9', N'Balde', 736448, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5b3d420-9bcc-49da-9d72-20b2b2dbe2e9', N'Juarez Celman', 732887, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'866031ba-f686-4fdd-aee4-20b9818c699c', N'El Quebracho', 481702, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3b2df82-e932-48aa-a8fc-20c16767cda0', N'La Banda', 310828, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54eacdae-0a1c-4411-a7dd-20c4c2593cc2', N'Capilla Del Rosario', 147811, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f1119de-d71e-4f99-be14-20cba4ef30ad', N'San Roque Del Lago', 430280, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e6ce07aa-86b9-44b0-bc58-20cbd6008c5c', N'Lucio V. Mansilla', 914179, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a933f19d-cb10-40d9-9c91-20fa26997697', N'Barrio Ruta Sol', 256607, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0571cb75-8408-4561-ba52-20fb557f1e81', N'Loma Alta', 756094, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6dc40ebf-6c04-4fc9-932e-211f8c094e17', N'Tres Capones', 384776, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7bd7f108-e576-439c-8a83-214838377ce1', N'Miguel Cane', 8574, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa73cac5-47ba-404a-a330-21610c8fc983', N'Grutly', 323193, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56698f50-34d9-4a17-9043-216a2970ce43', N'Roberto Cano', 833580, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c180da1-1884-4d8e-9156-2172ed44fb45', N'Colonia Liebig''s', 264853, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'528fb615-3315-4131-ba0b-217fe9e38475', N'San Eduardo', 387422, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0afd5919-a1a4-47cb-a1b9-218d7d4d2779', N'Tobuna', 338660, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f832fbff-fb7c-46a2-9ade-218f57121126', N'Temperley', 300114, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02306faa-1c19-4458-aa84-219d24d6b9fa', N'Ordoqui', 420149, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd3fd86d4-8929-488d-8168-21b837896bc3', N'Vertiz', 964117, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21b72f61-6fba-40af-996c-21bd72c1ddb1', N'Polco', 250203, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e1d9259-3f46-4e2e-a098-21be4980bec6', N'Dos Hermanas', 22044, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f29d7b5c-10b9-430b-80b8-21be639f00cb', N'Urdinarrain', 609020, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b83de50-f239-4952-8dda-21c43b98c3b9', N'Mataderos', 190666, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'322accad-8128-4c66-badf-21c78c8b19ca', N'Villa San Marcial', 934537, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd60c804-09f4-474d-9a67-21e475fd9975', N'Ciudad De La Punta', 672558, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d7c0092-fdf3-4ba8-bac5-21e9bbf6d45b', N'Laguna Paiva', 210606, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'798c2cfc-5235-4588-9bd4-21ea3e39a47f', N'Colonia Prosperidad', 9077, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd2785459-8b87-4fb9-9820-21f475ac99c7', N'Jaramillo', 64797, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e23e3424-d196-4ff5-a7b9-2207e8f020de', N'Quili Malal', 821422, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b9e4e05-85dc-4b6c-826f-2223823117fc', N'Mariano Acosta', 580767, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7dd46963-bee0-405c-96f6-2236d17ac1f7', N'Villa Quilino', 866848, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0406b12-2279-4826-ad24-223a64889dca', N'Villa Salavina', 872756, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67057c8b-f2ac-4358-9142-223fef74daa1', N'Riacho Negro', 236671, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63314207-4d24-44db-8a49-2269b99b8742', N'Yala Laubat', 500899, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9a0b96b7-9d3a-4458-9f8f-22753b4230fc', N'Villa Granaderos De San Martin', 991005, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'764757cf-f0d3-4760-98f3-2289984342ef', N'Piquillin', 347727, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d9af1c0-07b0-41ac-a4e9-228bcccfb3cb', N'Jose Juan Almeyra', 419316, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b9bedca7-1717-4472-8d35-22a799ca2fd4', N'El Sauzal', 958319, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'09c02a55-6e66-449b-8ab3-22c3b644838d', N'Villa Nueva', 977862, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'291f2112-a5a0-4daa-9241-22c935e2941c', N'La Puntilla', 180370, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8fc51fc2-2dfa-47f1-b981-22d71390cbcb', N'Cafayate', 186057, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c93b165-90c1-44f2-b712-22e04bcfc42e', N'Cabra Corral', 412509, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd50ff359-d777-4249-b134-22f92c36b5e8', N'Punta Colorada', 365125, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'beed3e3b-e13b-4715-b710-231eeb2adba3', N'Colonia Veinticinco', 448124, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b816cb53-0a17-4734-8a3e-2326c592b0c0', N'Mayor Buratovich', 633891, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd3a1e670-af8a-4687-b7d5-234615ec1629', N'Villa Fiorito', 978123, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc25e47c-177e-40f4-a4b4-2346488e3840', N'Reconquista', 929079, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f48b8144-a806-4b04-bb81-234a2271a736', N'Colonia Santa Maria', 690539, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6bd9f486-befa-44f7-9315-239824f08e3b', N'Barrio La Ribera - Barrio Apycar', 617406, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0259b26-fa3d-40a0-9d8e-239b863b3ca8', N'Anzoategui', 833665, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7794480f-9634-4a8e-9841-239d44b81eb1', N'Tres Lagos', 623499, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'52a607e8-5a5b-4b6f-8ead-239df9de3157', N'Balvanera', 778214, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce3387f9-a872-4299-b4b9-23a039507e0c', N'Tandil', 415290, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1e2e29b-0e47-4906-bfc7-23aa205509a4', N'San Antonio', 940392, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'adc2230e-f1a7-4c04-8ae1-23b3a947e435', N'Elvira', 165202, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0dc9a3e1-493f-41f8-a030-23c0e0e8b243', N'Tatane', 400463, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10557b84-8a25-4a92-ab8f-23cb925a73ca', N'Chorriaca', 140782, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a611207-b728-4d2f-a243-23dbddfead13', N'Salicas', 452676, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b873b1cc-5a31-4b99-a2bb-23f0ed90b320', N'Villa Rossi', 232039, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'daa62b28-2ca2-4b56-9edc-240248d010a9', N'Isidro Casanova', 785975, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b7c3403-4677-499f-90f4-2424e2fedbdc', N'Villa Gutierrez', 998747, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6582a974-b8a7-44dd-80be-24403797ec58', N'El Paraiso', 365101, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ebda9d7-7d87-4659-bfeb-2441513363bb', N'General Roca', 273151, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05bea031-ac40-4cc3-bcc3-244166fbacab', N'Beccar', 766708, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7112550b-125f-4cb7-ae9e-24454c1751d9', N'Carmen De Patagones', 620821, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f57fc568-7e90-44f0-867c-2446c8650801', N'Villa Cañas', 995422, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e85047a-9da9-4369-adef-2454e41fb82d', N'Bouwer', 273081, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1fa319b4-3cc5-4319-8d47-24631c964f5f', N'Chascomus', 264660, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6924bf28-0a72-4aa9-bdc9-24662247696a', N'Piamonte', 545000, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ed1b6c8f-e9c5-432a-8038-247e8ce76edc', N'Villa Elvira', 760873, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63b38171-9a70-4ebe-8ea7-2482df8983bf', N'Chosmes', 800361, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3706cedb-a098-4344-aab3-248ea60175b1', N'San Antonio De Areco', 801217, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7815b79-2bcb-4d95-9a0a-24923dcf6e8c', N'Varvarco', 778636, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1990ef6-cb65-43f4-8cbb-24a8d6f08e55', N'Leandro N. Alem', 459259, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c3849d2-6756-41d8-bf4c-24abf210e550', N'Senillosa', 873068, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5162641b-e66d-47b6-9710-24daca74b193', N'Fortin Cabo 1° Lugones', 223954, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd9d0b65-2f47-49c0-a7f2-24e51811b640', N'Villa Ocampo', 660005, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a83ad405-5c20-40af-b981-24ec71afcf5f', N'Calingasta', 68849, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'378ab145-cdf0-426e-8ad5-24ff6081ee76', N'El Trapiche', 191605, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba71a398-252f-45cd-90ae-25074acfe4d1', N'Piñero', 960130, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fa5d919-0af9-439a-b5ae-25094614fc11', N'Barrio Caleta Olivares', 74222, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb12e95b-cbfc-4a8e-9197-252717e7c6b5', N'Zarate', 323753, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9984c9e2-4152-4105-8c36-25394a29871e', N'El Sauce', 426295, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'886b8533-fda8-4509-ab68-2542898a2ae1', N'Barrancas', 102931, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06983ae4-08c8-4a7f-af99-254e518846fe', N'Idiazabal', 955405, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'adfa6378-4add-4644-95fc-254f44e0fbba', N'Los Lapachos', 537065, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8945e82-b3e6-4ba7-a7f8-25680259ac91', N'Barrio Alto Del Olvido', 632331, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'178d8462-bcca-44e0-9faa-256b41b40015', N'Berrotaran', 898960, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b1c7b3b-a093-466a-8799-259596f54d92', N'Playa Magagna', 902308, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4dddcf23-904d-4395-86a7-2596a73235d7', N'Aldea San Juan', 337113, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4776ee30-9ba2-4f13-be26-259e0eaeb026', N'San Francisco Del Monte', 543486, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0de29663-d56c-4292-ae73-25a2870207f1', N'Carlos Beguerie', 959043, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'55724f0c-d3f7-48cf-b444-25a5d866a478', N'Los Pozos', 691912, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b7df422-8bbd-490e-afed-25bd4fd4ff06', N'Tupungato', 305031, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f32a4e60-e0e1-4a1b-acea-25ded624c05a', N'Pontevedra', 958046, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d42f07d-f051-4ba2-a8d4-25e28a69263e', N'Villa La Rivera - Pueblo Andino', 431672, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f0e4cae-3456-40c7-8a9f-25e3d57d9b59', N'Velloso', 642165, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00b560a8-032a-4983-9fab-25e87cb08b0d', N'Barracas', 499862, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0a8aad85-eb1c-413f-a72a-25f70ca6f558', N'Lanus Este', 831777, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b04448b3-133e-41c3-9a11-25fa1db4acc5', N'Barrio Banco Provincia', 824973, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6ccccd1-faec-43f0-8fb8-2601e2f1ebcf', N'Los Zapallos', 667166, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b9add4e-d998-4d6c-9b63-26080fa06f25', N'San Nicolas', 756801, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60857c9a-59b9-4f3b-a952-2613ea944f96', N'La Para', 896457, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5d7b2dc-1be8-4881-8bec-26341226a857', N'Lopez Lecube', 340744, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba7fa368-84b2-4715-a297-26440a5ed0ea', N'Las Chacras', 330874, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64f7b918-9c83-487e-a7f2-2649668ea112', N'Santa Cruz', 438871, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8142748-fc10-4c8a-bcfa-265800b58134', N'Villa Arelauquen', 447, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a0844029-ae52-481e-9728-265d91e108bc', N'Laguna De Lobos', 375086, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e0576d0-a459-42b1-8d7b-266aed558453', N'Km. 5 - Presidente Ortiz', 425725, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab630a6b-1f40-4e2b-bd50-2670c98e2907', N'Los Sarmientos', 410637, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8ed11a8b-c703-4c02-8366-267569afef7a', N'Villa Sanagasta', 632741, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88db89e1-1c89-4e34-ba2c-2680a21e0c06', N'El Cabure', 492362, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'09cc82aa-5115-41bc-b45c-2689620908ee', N'Lisandro Olmos', 816520, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e1d7266-a954-4858-8c74-26953c21b129', N'Brea Pozo', 345237, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'713cb5c9-f7e4-4861-ba12-26971c7c3904', N'Los Palacios', 99112, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90d74b81-f644-4923-8de9-26a10936377e', N'San Esteban', 350344, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02aed6eb-3942-4d4a-8b0e-26a9ea810b6d', N'La Cortadera', 71124, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5008134b-f901-4033-8541-26b2fea592ff', N'La Union', 223982, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8eb15f6-69aa-4432-a857-26b4add43126', N'Martinez', 415158, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6af3e86b-3fa8-4fd5-9ce3-26ba5092de21', N'Salsacate', 150717, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f65adfc5-0b9f-422f-a581-26ba6bbdd022', N'Ferre', 453030, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'baaf7db7-320a-4302-a1f2-26ccc214648f', N'Pichi Huinca', 405533, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9d82f197-ffcb-4099-a0af-26d250c8e634', N'Chacharramendi', 528451, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'948cf7ad-aaf3-4d18-9ce4-26dba1c11803', N'El Juncal', 793922, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3596630b-152d-4d45-a01e-26dfa1ee190e', N'Ceibalito', 589879, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3523b366-a7bd-46a5-bccf-26dfde6671ce', N'Huinca Renanco', 560974, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0eea0c1-2095-4640-8201-26fe9663d044', N'Sierra De La Ventana', 87048, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'be598fcf-814c-4599-bc02-2706062baf49', N'General Mansilla', 997681, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35ed321c-a045-491b-97af-273d3f92fcec', N'Kilometro 101', 537133, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0deb48f7-fa1a-463c-bb4d-273f68cef00c', N'Pueblo Liebig''s', 112473, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b521cbd-b870-402a-8174-27459e6829fd', N'Assunta', 555768, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'09dd94e1-d22b-4b02-88a0-2756e1f50109', N'Cerro Cora', 614147, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aaa0d07c-8f99-4601-ba59-2768f3aa1b4c', N'Luan Toro', 671519, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9448b39-f564-4c7f-93a6-277999f540e4', N'Villa Adelina', 619604, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'423661bc-aa6a-4602-ab91-277fece32128', N'Villa Nueva', 379404, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39b9c0e3-eba8-46e8-ba95-27949522d375', N'Colonia Carlos Pellegrini', 84882, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1256e5d0-2098-4cb7-a942-27a2373197bd', N'Campo Largo', 449172, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d950f47-d6f5-4864-afd3-27b72ccb9682', N'Panambi Kilometro 8', 752062, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b54451c6-00a5-468c-a16a-27beeffb024f', N'Colonia Santa Maria', 69865, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'13020855-14e6-4a49-b942-27ccb233cba8', N'Magdalena', 883687, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'630e0fc9-5ebe-429c-a800-27f7a3b22a42', N'Villa Burruyacu', 68644, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffb0f91c-557f-4673-9b56-2805f77bbc20', N'Arroyo Los Patos', 577166, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bdd5b133-739b-4c05-b26b-2809ed07d75f', N'Campo Los Andes', 419880, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1a850f6-1bd3-4e7f-a340-281a31f02895', N'Molinos', 914499, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7d87c1c-f259-4eaa-8fab-2846c0a09b1e', N'Barrio El Labrador', 9160, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc281013-d59f-4f19-8ee1-28554eec2868', N'Lagunillas De Farallon', 833119, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f3ffc00-1d8d-4e5b-ae80-2857a9ed5b32', N'Rio De Los Sauces', 637026, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23b7f057-415c-433c-8c09-285ee17d5088', N'Estacion Empalme', 117506, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6905c01b-96f8-4ff2-851f-287044482fb0', N'El Rincon', 247039, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec958acb-d60c-476b-8c61-28b27fffc158', N'Villa Marini', 841593, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'69ff3435-fbd7-4791-aa25-28c2739ebfc4', N'El Tala', 619092, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23761a8e-22fb-43a0-a4db-28c506d2da1e', N'Bell Ville', 160971, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eeb8f4eb-074b-4e2f-a565-28ef61ed6319', N'Estacion Libertad', 329256, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56a956d0-906b-463e-ae03-290b4a3e317c', N'Cayasta', 87667, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd730874-9819-4847-b995-29257c289a68', N'La Banda', 141327, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b2f096b-055d-4c86-ae4f-2926e9c9ae83', N'Villa Flor Serrana', 173684, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'061cd6a4-ebe4-448c-99c0-293e8f4c4fcd', N'Villa General Jose Tomas Guido', 951262, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86185eee-02f6-48b5-919f-294f03c23d55', N'Tamberias', 373901, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e61fb3a4-9eef-4ac2-b4ae-295361233c15', N'Santa Rosa', 600801, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4419a219-c092-4469-bb52-295f8ce9cc22', N'Lomas De Zamora', 927501, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7c2db41-ea3f-4ac8-afd9-2963e6b2c221', N'Esperanza', 807791, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f23fd0ec-1cf5-4fce-b96a-296648bfb971', N'La Poma', 521875, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47060c55-1c44-4e8e-b232-296a6160d11f', N'Chazon', 290599, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'770b3af6-9288-4264-8ec8-29a6a9f690d8', N'Villa Manuel Pomar', 731629, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89bc3238-3aa7-48f8-91e2-29baa2cec6a5', N'La Almona', 549243, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00399fb2-c756-46a4-8236-29c843b0fe66', N'Rodriguez Peña', 550118, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c0423eb-cda3-4d29-9b75-29ca8415f37a', N'Villa Gregoria Matorras', 817116, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f74f2b7f-fd1f-4490-87c3-29d0a08b480d', N'Barrio Lomas De Tafi', 600083, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad3631b9-26fe-44ba-924c-29d84f014601', N'La Florida', 306627, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c40d2b60-041b-4b3c-a848-29f8af09b547', N'Alvear', 663083, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f4ef95c1-bdb9-487e-ad11-2a056f694c5e', N'El Trigo', 462001, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb0a53b0-b246-4570-b3a4-2a31369813ca', N'Anguil', 246976, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64052db9-e9cf-4b28-b71a-2a4ddfbbda71', N'Las Gramillas', 811999, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'425fba61-0aee-4e44-936f-2a58361cb7b8', N'Domselaar', 597752, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'641ea17d-4a39-4bac-932a-2a7328cab4c0', N'Lumbreras', 143730, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d09dd64-55e1-48e8-b35f-2a972409ff89', N'Carlos Tomas Sourigues', 946660, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f0ee5243-5e09-4271-8939-2a9d1854963a', N'Altamirano', 566517, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5275bfc9-3d87-4ece-8dea-2aa077b2e21a', N'Cerro Azul', 863621, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea884d6c-9dd7-4074-a92e-2aa8edd37137', N'El Diquecito', 473813, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'58af644f-2bf2-4b99-9141-2aafaee2de90', N'Toro Pujio', 823194, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d149e71-2b73-4438-8859-2ab345ffd4b1', N'Estacion Taboada', 836889, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ab5210a-3de0-44a5-af69-2abed9fefeb5', N'El Potrillo', 702373, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77bed104-cbf4-4f0d-a020-2ac5a6f9649f', N'Barrio Colonia Conesa', 889144, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb931431-6f60-41ef-9d5a-2ad3c40e401b', N'Federal', 896611, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8fc8315c-e369-4992-ad4e-2adf63127819', N'Constanza', 676387, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd47ad5f-342a-48d7-9742-2b01df59a875', N'Bouquet', 162451, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06f47b0e-6d2f-4343-96c6-2b0fdcf30d4b', N'Las Palmas', 42353, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a438c790-329c-40ba-a57d-2b1472244f1b', N'San Roque', 62749, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8915e0e-b173-4971-9e31-2b1977156def', N'Guanacache', 8506, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9b7c9941-484b-4366-9145-2b296e30e772', N'Cañadon Chileno', 726401, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26697d23-d9ee-4073-b7ef-2b6e8c62b7c6', N'Santa Lucia', 41501, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'239e066e-9ee2-4403-9e96-2b740ba8a451', N'La Loberia', 92098, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc830658-f0a8-44e6-bd93-2b7a1d8716b2', N'Pedro Luro', 905362, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44aeb9f6-4309-4fdf-b808-2b81af9d387b', N'La Darsena', 81713, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7500628-ce3b-4901-927f-2b916c5b362e', N'La Libertad', 711257, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07d1db8e-9204-48dc-a1c9-2bd7016ddf8b', N'Ariel', 844439, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc4ba49c-11b1-4029-857e-2bd97ba88cda', N'Teniente Berdina', 327871, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc5aae5a-6b09-479c-9aa0-2bf8f9c4b3cc', N'Simoca', 771675, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7858e5b-360e-417f-b817-2c086c3cbac3', N'Cortines', 296977, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef11a9c2-df9c-4d9b-956b-2c3f1037c3ee', N'Pueblo Brugo', 501489, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2137d5e7-bb2b-41bb-b932-2c512b30a953', N'La Invencible', 773494, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9faa5cbf-d675-4719-923c-2c54e24b8f88', N'Barrio Santa Rita', 799899, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8956e4a7-f515-4cd9-8d87-2c5799541ba5', N'Villa Catedral', 615416, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0bcb4cd-61ef-4880-8865-2c639eb8258a', N'Caucete', 290144, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'84bc5f3f-569a-4063-bc4c-2c654104d41b', N'Santa Maria', 425340, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6e97dbf1-2a1d-4477-8405-2c7695007f6a', N'El Chocon', 579925, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70105241-4c2f-4db7-9f6c-2ca0dd5908f0', N'Cintra', 631652, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4df5c20-8dea-4c27-b2ee-2cb290884534', N'Pituil', 914239, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4195207b-d7be-461c-bdc3-2cb5d8c93307', N'Medellin', 768766, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6ad718e2-f90f-4fcb-ae0b-2cbb590eba4b', N'Fortuna', 427561, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10d7890a-fd4b-43a7-a7ca-2ccff31d03b5', N'Punta Indio', 158505, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5a3fe5c-f389-4c3e-94c0-2cd8e62f9295', N'Ezpeleta', 187091, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b990965f-f362-4cd2-b662-2cda6a2b694f', N'Neuquen', 907029, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd2680d6c-4ffa-4cbd-815e-2cdbd62eb373', N'Leguizamon', 329296, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dac253d4-8c02-4fa7-bb0b-2cfb35273e76', N'Puerto Yerua', 828314, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c97d722-5d6b-4928-ba48-2d058387cbf9', N'Aminga', 962800, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0a0b9bab-b9dc-4871-aac8-2d0e1b8489df', N'Alpachiri', 1086, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffdf3bbe-0610-403a-9b09-2d0f4c0402bc', N'El Pantanillo', 655210, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'815b4760-e8f9-4a73-9d8b-2d3fa3bd726e', N'Barrio Universitario', 141798, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3e39acd-92af-48d2-8b76-2d4b8a1c8b33', N'Pedernal', 429963, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c95bdbf5-4404-4996-8b54-2d58f7f671c3', N'San Antonio Oeste', 325357, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64a0c148-aa6a-4ea3-bd55-2d5edafe9b2a', N'Ministro Ramos Mexia', 760358, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3798984a-65e9-4d2c-b861-2d61e47b2f0e', N'La Carrera', 308207, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1a49302-b38a-4b74-af92-2d6d66ff1026', N'Parada Pucheta', 602794, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36b7528a-1525-4b6f-9bd1-2d9752657feb', N'Daireaux', 144354, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4bd6f1d-ea85-4b17-a528-2d9cc844fabe', N'Las Tinajas', 530881, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2a2a511-9bb6-4269-9eb5-2dc0aec037be', N'Lozada', 996019, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4532605-a72f-4154-a449-2de94d6b02b7', N'Espigas', 459947, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a73b63a6-337e-4720-bdca-2df8c4620f4b', N'Obligado', 607060, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97c08b1d-80e6-4f6b-a4a4-2e3ba3c92749', N'Sarandi', 561687, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90670381-e795-4302-8f06-2e3d4f922260', N'Churruca', 760881, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ca76dd1-9f1c-4a23-96fc-2e50bb249938', N'Cote Lai', 128012, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b509f9ed-01cb-41d6-98f1-2e568426de58', N'Laharrague', 275164, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd1754785-194e-495d-8dfe-2e5ebcbfc656', N'Saco Viejo', 104214, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbf31172-b5d2-44bd-afbc-2e680e059000', N'Villa Elvira', 657010, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23eda326-3d81-48aa-814b-2e8afa95d9f9', N'General Alvear', 949137, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad72e88d-0abc-4aad-85f3-2e954ed9e6f0', N'Villa Margarita', 218050, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7856ae17-4f94-40e8-8d0b-2e95f9c0fe94', N'Media Naranja', 290451, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6302ff73-1074-41d7-a59a-2e9af998f2eb', N'Villa Devoto', 157743, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2172fd98-e8b6-4150-b958-2eb4fb4a7ec6', N'El Brillante', 590216, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b04552f-b52b-4da8-b325-2eb64a0e8d94', N'Paso Aguerre', 465271, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4a47b18-6df6-4596-a965-2ed8c9f10a5a', N'Agua Escondida', 587126, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d561a03-b823-426c-9d41-2ef6378cf1f7', N'Santa Maria', 221003, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c15fda14-6682-49a9-92cd-2ef7eb121f10', N'La Paz', 705155, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe9c7315-7e33-465b-99b5-2efd209ea1b6', N'Barrio Norte', 963546, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a266f19-d65d-4c00-a27c-2f1733f46edf', N'Barrio Emergente', 724917, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cad7484e-cf63-4305-a3c9-2f2e6c8c0182', N'Barrio Porvenir', 996254, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fdee0e52-71c7-493d-86df-2f34e28ce779', N'Esquiu', 44696, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f6ccadf4-604f-4f38-b269-2f4205a2b4b0', N'Trebolares', 936345, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2450a2a-5e08-465f-a7d6-2f52b55c60b0', N'Palo Blanco', 597270, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3a0787cf-4769-4f7d-add0-2f5b5d48d80f', N'Ramon Santamarina', 827351, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0beb0c81-8b80-4a19-8a14-2f66879188fe', N'San Isidro', 364031, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2f85007-bb33-4cb0-aeab-2f7f713a3e0f', N'Villa Rio Hondo', 88830, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7fd8cbb8-5be0-4683-aa0d-2f8150c4344f', N'Marcos Paz', 158142, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1d1690e-ac19-41c8-847a-2f8e5a74c0c5', N'Pedro R. Fernandez', 720672, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ddd71db9-0cdf-43ab-af0a-2fab03e78cc2', N'Chorotis', 902422, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6bc05f5-868f-4007-becd-2fab23445c43', N'La Toma', 989508, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'589f9f2d-3756-4097-96bc-2fbecdbeb72c', N'Aeropuerto Internacional Ezeiza', 50166, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3838aa38-8d47-43eb-80c8-2fdc7bdbacb2', N'Ingeniero Thompson', 218340, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1b55a5f-4231-46e1-b371-30004f2ca45c', N'Merlo', 998252, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cf130fec-f1be-40ac-8b96-3009017a61b7', N'San Jose De Orquera', 264054, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2d2bbfe3-a70c-4af7-859a-301bf36f6ad6', N'Pueblo Italiano', 193579, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'49ff9c85-126a-4dae-9ff2-302210b567bc', N'Riocito', 66511, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'187155a0-8f7a-4084-afdc-3029c9879ed4', N'Las Ovejas', 806283, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fee6f0a7-84d9-4a98-b0fc-305bebd5d98b', N'Toba', 266434, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6d5e75a-601a-491d-a4c7-3067a28925d8', N'Cruz De Piedra', 297072, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae7fb524-3a2d-4566-a0b9-30759d251aed', N'Azul', 299756, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9773f5bf-e716-4ec0-aa94-3098ed4b2ead', N'Barrio San Felipe', 376399, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eed0b269-537c-4d46-8678-30b9f94264cd', N'Estacion La Punta', 430718, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92a67120-6d69-4368-8ddb-30c7b1eb634a', N'Sauce De Luna', 759982, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c03ab843-4729-4cce-a608-30cb42713bdd', N'Arenaza', 175079, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd09aad11-821a-4aec-8839-30cf21191bfc', N'Villa Don Bosco', 335024, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'759de162-88d4-4944-93db-30fc281017d9', N'Funes', 400273, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47ed6529-1bc1-4218-83ac-3102233902f9', N'Humahuaca', 435794, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'589a9d0a-d31f-4c10-9248-312a704191d0', N'El Pajonal', 846172, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8cedd8f5-ba46-4441-9511-31436becd22d', N'Reserva Area Protegida El Doradillo', 364885, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76ef7427-bb3e-4b5a-a5f3-3152fc251e03', N'Horquilla', 147822, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3697cbe-8ff0-4a29-852c-3161e66aecf6', N'Palma Sola', 888856, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26805ddd-2802-4546-bbe3-31661adcffd5', N'Las Juntas', 98760, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f76a22a6-ffcc-40db-9a3a-31949577b19a', N'Barrio Chacra Monte', 221972, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'437d1c1c-e1b7-4f8c-88d7-319d2ace944b', N'Puerto Andresito', 862130, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f622b571-eccb-4fab-aebe-319da93c0f8a', N'Villa Ciudad Parque Los Reartes (1a.Secc', 115004, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5c8f94c-40e1-43d3-b069-31a99ac294e0', N'Salto Grande', 345746, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'337648f4-9d70-4b34-8483-31c25a09a242', N'Uriburu', 645396, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1dd2b40-d712-4dbd-a51a-31d2881183ef', N'Ciudad Jardin Lomas Del Palomar', 742040, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88f974f9-887a-47ef-9dd3-31dc95e4d4f4', N'Piedras Blancas', 833037, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7536b6f-7cc9-4501-80d4-31fd65233dbf', N'Miraflores', 669854, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a10a95d5-d194-4d0a-a83b-321cad44a65e', N'Sumalao', 436643, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79600e25-ac14-4c05-998f-3240d63cbfad', N'Villa Tulumba', 24617, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb8900bd-9c99-4753-90d7-3272e9161248', N'San Javier', 580512, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75203abf-fbcd-4e63-ac8f-3282260352cd', N'Colonia San Jose', 577220, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c686ab2-341c-4e4a-a54b-3292e82a6dfc', N'Darregueira', 693410, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2e5408d-5b00-45d7-82fa-32b08dd9d289', N'Santiago Temple', 833749, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0390dfd9-079a-4636-a9dc-32b7d383ec5d', N'Chapuy', 286370, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43f2eec9-07b4-40ca-85cb-32bda12ab28d', N'Quinto Cuartel', 320171, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a782f42a-b5de-4eda-a8bc-32be794b448d', N'San Cristobal', 555145, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65700c72-0c15-424e-ae1a-32c3bc52b675', N'La Clotilde', 755085, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8d53231-3c95-4826-9182-32d611c82fcf', N'Villa Maria Irene De Los Remedios De Escalada', 328534, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6cde3c0-5897-4f6a-9162-32d9a8855558', N'La Chispa', 836501, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c38e98d-cd6d-4b91-a78a-32eb825dfc66', N'Maciel', 48685, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6ae4f107-4839-49a6-a907-330076634115', N'Puente Del Inca', 589032, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'81088bec-3758-46f4-a32e-3302e46532c8', N'Cordoba', 742232, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1217646-715e-4e69-b793-3357d68ac67c', N'Villa Reynolds', 642670, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'19efa8d2-0330-49a9-b603-338f992161aa', N'Aldea Beleiro', 363743, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'698d07a7-0969-4b2f-ae0e-339e2c1e6417', N'Monterrico', 837221, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b1238fa-f66a-4709-acc2-33c7c06ab03c', N'Villa San Justo', 779340, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3045df55-6358-48af-a814-33dd2fa8ad62', N'Brinckmann', 922061, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23a72ef0-bee9-439b-9534-33fc2ab5cfad', N'Anjullon', 434597, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c4cc05e-ce31-4a20-bbe7-3423ecd57061', N'Barrio Los Jarilleros', 273643, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2065f7c-cb2e-469a-8ce1-3427a8bc7c31', N'Termas De Rio Hondo', 961615, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0740d678-5146-4022-b3c5-3427c52d4667', N'Dudignac', 55848, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'969bbfbd-2838-48a5-ba1a-3428b3bffe9e', N'Gobernador Crespo', 884285, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'58d71c7e-3e64-45ee-a1a7-34346f435168', N'Cipolletti', 429826, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a2f414d-c0cb-4ed2-8214-3437e0ca3fff', N'Simbolar', 497508, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4060b241-3e58-445f-a538-343e3af8d370', N'El Bracho', 883390, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a015598b-d99a-44c5-a845-3466f23df163', N'Juan Maria Gutierrez', 344252, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d80f328-7d3c-4321-87fe-346f85fbe054', N'El Bañado', 466341, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15d23c8e-aebb-4d85-9114-34702bcbc76a', N'Villa Esperanza', 541821, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92581422-8c41-4304-b7b8-34753420cf0c', N'Nuestra Señora De Talavera', 853109, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ace47c62-303f-4ffa-b0a6-3477d5841782', N'San Pedro', 499667, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad357b1d-6433-4f6a-bb10-347bad02ec6b', N'Nueva Pompeya', 133432, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6af56eca-a109-4f74-ad04-348d16f07565', N'El Trebol', 934099, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c182b29a-536c-4e82-b9b9-34945413be8f', N'Tortuguitas', 633303, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c84d1d1-f346-427d-b08d-34977e4aa1c6', N'Ingeniero Barbet', 178927, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db2f51b9-f868-4f77-a2d8-34b9bf836be1', N'San Martin Ii', 74186, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a55cc906-e50b-4226-b7dd-34d0fbc591a4', N'La Higuera', 142521, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd2ef4e82-bb35-4dc9-a1ef-34f113ef1980', N'San Lorenzo', 32356, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cabf8df0-853d-4f6f-b930-3512cb61ecf3', N'Irazusta', 102720, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'588f5d1b-a9ba-4809-9f98-3513452719dc', N'La Larga', 803483, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26fddcbf-9781-45f0-9798-35270707be1a', N'Santa Rosa', 736593, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf1b4a5e-bc3a-4dcd-bfa2-352d2b129fb0', N'Burzaco', 495049, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9bf8e645-f8a5-425e-be16-3534ba5d10ec', N'El Mollar', 282869, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'995fd4d1-972e-49f5-855d-3539b1f27a54', N'San Andres De Giles', 656756, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'136303d7-b57f-4050-9bc4-353f86a223a7', N'Intendente Alvear', 820544, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88dffb96-bc31-4632-a157-354aa04d6639', N'Tacuarendi', 484041, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4c0c982-857d-483f-a719-354e6fe9ba3c', N'Barrio San Cayetano', 130426, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e709d029-9a68-4fdd-b6d0-3559fa78e3a1', N'Country Club El Casco', 475911, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41b9f0d3-4da9-4194-8ab7-356e3f5cf02a', N'Chilecito', 120380, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef336b8b-89e7-4450-8aca-35732e8d513c', N'Tellier', 523375, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f8e9ca8-11af-41ab-bf1a-357f726aa16a', N'El Chalten', 935423, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87c72172-6878-4912-ae7b-35910cc5913f', N'Las Cañas', 739485, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38da010f-73c6-4810-95d2-35a9a379a4d3', N'Villa San Lorenzo', 691320, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90a7e916-94ba-4736-9816-35b000b3301f', N'San Genaro Norte', 793453, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'befada93-8ae6-4dda-9f5e-35b08e2575f6', N'Campo De Herrera', 152160, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'973d521c-493a-4c3b-bbe3-35b43a868ab3', N'Villa Mirasol', 277524, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cee9639d-7927-4eed-9dc6-35b5cff32c4f', N'Palmar Grande', 134106, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5064a13-079b-4e26-86df-35bdab91c46c', N'Libertad', 766497, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c3c022f-b008-475d-a187-35c34702312a', N'Pinzon', 140207, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ce88840-0a44-4cce-8947-35ce65d1eab9', N'Manantiales', 60492, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'19e1984d-4498-4ee1-ad59-35e6f79f92e4', N'Santa Lucia', 859218, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e67ae784-dd30-450c-bd5e-35ecd7ac8c77', N'Villa Malvinas Argentinas', 670431, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b928d41f-9f59-44df-bcc7-35fe470275a6', N'Arminda', 241093, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e3611ce2-97c0-4666-b4c8-3605bd531495', N'Barrio 12 De Octubre', 519172, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e774c42a-6e63-4675-8b6f-36078047ef40', N'Pila Pardo', 869927, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd9a7356-a30d-4f66-a8f5-3609652d86f5', N'Santa Margarita', 418507, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f673102-f728-460b-8d83-361d94f3ae78', N'Garabato', 608631, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c53b638b-9cee-4b5f-b81a-361e40f048c4', N'Mision Kilometro 6', 821287, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a82abdb4-a006-4913-90de-361ff71ca492', N'Olivares De San Nicolas', 945292, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30433d06-fd75-4b59-aebb-36301d6f00b1', N'Barrio Puente De Madera', 311478, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7622a6a1-3cee-4631-a8a0-3630fa2f161d', N'Casira', 467204, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'721452da-96f1-465a-9d1a-36401971078a', N'Ramos Otero', 121117, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04349e2e-adad-43cb-af81-364d663e9526', N'La Eduvigis', 582656, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd96ec62d-d382-4c33-bfcd-3650c648bd9c', N'Alvarez', 331153, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8764f8e-bfe7-4bb3-99c3-3664fad08cc9', N'Pueblo Doyle', 11757, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f0522a6e-51c4-439e-bf01-367f07881b85', N'Don Cristobal', 28926, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b2a400c-b472-49d7-a104-368f080c9918', N'Tasna', 218864, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79d36f67-1263-4a6b-8489-3692f4503d6b', N'Desiderio Tello', 706058, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af4e621a-e109-4b20-bc02-36a7c2ffa52e', N'Pilquiniyeu Del Limay', 608401, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3878077b-1c94-487b-8e4c-36d99f827b0c', N'La Puerta', 122437, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99366ac6-dbcf-4298-b485-36e45cc6f3d4', N'Tejas Tres', 120719, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67a0f259-d286-4c84-bafd-36e78c8e2dbb', N'Ingeniero Juan Allan', 480555, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4532283c-bb75-4242-9b88-36fae82365b4', N'Cascadas', 183901, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e03a1b8a-ed1d-4145-9211-37180cd00415', N'Libaros', 416592, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'247bb8fb-cfcf-4a41-b22a-371ed8586f48', N'Guasapampa', 257499, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c0c469b-796f-47e2-aa44-37201e9976d7', N'Santurce', 156423, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'74afa855-fbc0-4333-8077-3720ef06727f', N'Herrera', 417347, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'785745f0-216a-4916-ad07-3723c63377d3', N'Balneario Sauce Grande', 429733, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'466f2cb8-7cd1-48e0-b20d-374259d71079', N'La Rica', 544551, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b54e54b-ca61-4e26-8186-375becd7b737', N'Longchamps', 940634, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'409ef325-592f-4fd6-9d21-3776f6771646', N'La Esperanza', 119704, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0feef52a-da52-453f-ace2-3793da454dd8', N'Juan Jorba', 486376, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'51ad5b31-87d9-4812-92a8-37a9e9136533', N'Villa Francia', 405374, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38195860-caf0-460c-893e-37b85e51f994', N'Villa De Trancas', 973163, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ac2b5a25-9295-4e10-bd8f-37cd3bf1cbc6', N'Mechita', 993865, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da6ea7e4-43ed-47d3-ba6f-37eae4eeae8f', N'Alicia Baja', 137625, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5e50055-75d3-4961-aa80-380717849bc9', N'Antofagasta De La Sierra', 707726, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8672d47-218b-41bd-8207-38238df39a87', N'La Cruz', 30547, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a861181-afed-442f-8f60-3823df5f0035', N'Barrio Pino Azul', 535288, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b94b50c-f1f8-45ae-a049-382e017d9c7a', N'Ramona', 119592, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98435d85-951a-43bf-b000-382e3b4b50bd', N'Real Sayana', 1139, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bb2f89e9-67b1-41b2-95ca-3841916e0776', N'Villa Aberastain', 713191, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db56dec8-0b17-4a18-ad4c-385eea2b49db', N'Moreno', 842735, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b35174a-fd70-49b6-85b3-3877bce0574b', N'Barrio La Pega', 210478, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'74694f5f-5ec0-4ee0-8688-387ec3dc1f99', N'Chicoana', 853002, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'33f20b19-de11-492c-9fbd-3894ee730c50', N'San Antonio', 263424, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'855f3d27-99df-4c01-a6ab-38b07d95eabd', N'Barrio Union', 1257, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ed79c791-457b-4ec9-b5ec-38b26f9afcc8', N'Pozo Salado', 819586, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e42901fb-8e65-4b98-b3e8-38d42f0aa632', N'Perugorria', 70166, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7645c4c-a136-4305-8f9f-38dc81ad2c7a', N'Villa Del Carmen', 942274, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86b29214-0a0a-44ee-a73a-38e3920d4bbe', N'Santa Maria', 380032, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'315eab16-f2a1-4df6-a584-38e494038bd7', N'Los Talares', 668834, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b128c35e-8e31-4271-b78b-38e92f79b284', N'Puerto General San Martin', 608301, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7a69d6b-e387-47e5-ba76-38ef8996d6ea', N'San Marcos', 28345, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cfbe287-cde8-4eef-946e-38f416a11ad9', N'Barrio El Casal', 91265, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb70813c-1b9f-4207-a418-390845a4e3bc', N'La Travesia', 772116, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd1f61a38-95a7-40d0-8677-390c3e365ebe', N'Laguna Escondida', 835572, 23)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b16c1d89-31f8-40f4-b733-390cba256a3c', N'Paraje San Manuel', 570085, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4d6635f-7118-4cc8-b3dc-390ebf30f584', N'Campo Grande', 553263, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'29acb32b-51f9-4301-a6b5-391326d50767', N'El Colorado', 985713, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'716763d7-5e59-4783-992c-39135c6e43fe', N'El Divisadero', 725073, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b443438-cd1b-4dd4-9747-3922ef7e825f', N'El Escorial', 755920, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cdaef0fb-3bce-4059-8695-3949d948b672', N'Moctezuma', 371321, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7c303cc-f098-4013-971c-394b1cea7ccd', N'Esmeralda', 529170, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e27a83c6-3b98-488b-8576-394d5c20b6fa', N'Juan Jose Castelli', 607238, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9411a78-6eb5-4f9b-96e0-394dff382799', N'Sumampa', 981466, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6448277d-3409-4dd8-a949-3971fffdced6', N'Macomitas', 609772, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc81f295-64df-470a-95fa-397f5184c028', N'Villa Urquiza', 581091, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a32ee27-87a4-4fa5-8ea3-3996bfd4d8c8', N'Buena Nueva', 971082, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7933a71a-544b-4f30-9719-39a375d9bb2b', N'La Cienaga', 181895, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0484ba7a-e3cc-4bcd-922c-39b34b80bdc6', N'Nare', 504107, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'08bd7061-1a2c-41da-8fc9-39d8c719e85a', N'Colonia Vichigasta', 691226, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab0c86a9-a662-4a05-ba53-3a00be3e596c', N'Malanzan', 178333, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7964108b-075c-4319-bfa2-3a0297b8f6d5', N'Villa Reduccion', 486689, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2bfece45-4123-44c3-87c8-3a06803d37b2', N'Los Molinos', 915126, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'17e2eae4-d5ee-4ab5-96d6-3a0e9f9094ee', N'Los Condores', 215287, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd7c3fac-64b2-47dd-b94e-3a13d925871c', N'Carapachay', 971144, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'461e431d-49d2-48ee-a0b5-3a3ff49b3f93', N'Los Muchachos - La Alborada', 639778, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a164bbd-63ca-4926-84c8-3a63b21095c4', N'Alvarez De Toledo', 876505, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a15c2f32-cea0-443e-b1f3-3a683c9e601b', N'Villa Salles', 276711, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7c10f78-1d6b-4d58-8eba-3a6f19c62359', N'Los Toldos', 567809, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5d7e9ec-5167-45a2-b549-3a7d05408c03', N'Villa Parque Presidente Figueroa Alcorta', 679219, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27b259f2-5ea5-4c7d-b772-3aaa0794eff8', N'San Francisco Solano', 760088, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0677b957-019c-42c9-9f84-3ab2945e4689', N'Villa Nueva', 725031, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4780d48e-23ed-4dd3-a72d-3af6b2bc3d54', N'Almagro', 976283, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9973253d-69ca-49e7-88b2-3b0a5334ac52', N'Villa Carlos Paz', 407336, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5cf7449a-ca11-4da5-a568-3b0ea514e25c', N'Villa Kilometro 213', 296239, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67a23428-dddd-4c4f-979e-3b22715abd47', N'Villa Ciudad Parques Los Reartes (1° Seccion)', 581064, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3871b7b1-3809-420d-ae79-3b24f8403cad', N'Sampacho', 341021, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ace13a35-6988-4fe9-8a3c-3b39268bd538', N'Saldungaray', 450077, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cecd4d73-245f-4634-9e29-3b4eb939ec56', N'Malargue', 54593, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c87f3c1-6238-4ce5-bf98-3b5c6819e79e', N'Uspallata', 358268, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72b7d87e-b1eb-4314-ba5a-3b5d3c41d8c0', N'Villa Atuel Norte', 780765, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e662cb93-d86e-4d65-a428-3b6815d93a8f', N'Barrio Primavera', 807785, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4fb03c8-9ac3-4550-94ee-3b745c3b15ee', N'Ciervo Petiso', 210618, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b4f9e77-adde-45d1-a186-3b93f80f2f19', N'Zapala', 734961, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f8564820-496d-45b9-aefa-3bb88a880970', N'Santa Teresa', 845740, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2be87ba5-ca0a-4c5c-8278-3beff20b2e6c', N'Olegario V. Andrade', 357892, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6011a00-540e-47db-b9a0-3bf84a240bd9', N'San Antonio De Litin', 201026, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cfd7c4d8-82fb-4ce0-afb7-3c307e22b461', N'Goudge', 538847, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebb581bc-b558-49b0-b1b6-3c41bd81edf3', N'San Francisco De Santa Fe', 867728, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8ccd239-c496-45d6-b015-3c47e39efb24', N'La Pelada', 806277, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c596d7ae-e7c8-42fd-bbf0-3c6a7ad6d4b6', N'Villa El Refugio', 148137, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6dae971c-42ea-4871-82b1-3c6c992477ae', N'Irigoyen', 734183, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd0847ddc-859c-4256-8895-3c7d453ca9ce', N'La Rioja', 771057, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92da6961-fde6-4b19-8685-3c8c1b365b5a', N'Salto Andersen', 724772, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88f6b18e-2fc9-4f70-8935-3c9fe9271890', N'Emilio Ayarza', 28196, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'17ade794-9c6a-4e85-9ce7-3ca111fb9582', N'Gancedo', 317834, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fbc2447-90cf-4de3-9f08-3ca9905d347b', N'Juan a. Pradere', 821516, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5ee6422-813b-457d-807f-3cac4a8c013e', N'Jardin Arenales', 268244, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0a3d12e4-b055-4e5a-98b0-3cb699679ea3', N'Santa Coloma', 874943, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7f4e57e-75e4-4bea-89f3-3cb854294934', N'La Carolina', 847659, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dfbf7ea7-b8d3-45af-a8aa-3cc22d09378b', N'Santa Lucia', 165466, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca4236fe-087b-4f87-9581-3ceb048e728d', N'Dique Chico', 13495, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'25d4ad08-1656-402a-9625-3cf2020e32db', N'Los Mistoles', 50471, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'424962c0-dc03-4670-a6c5-3cf9cc37397d', N'Coronel Pringles', 29908, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54d48f39-34de-4365-afeb-3d1c1571bd0b', N'Theobald', 887645, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b09d69c4-2c45-4c36-b804-3d2375fcd8d5', N'Angulos', 581122, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c42a8db-7a8a-45b1-9af7-3d28d564473d', N'Tigre', 754611, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b68bb344-a343-4b8c-abda-3d505c38b0c4', N'Villa Concepcion Del Tio', 243902, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57578747-f37f-4dfb-91dd-3d5bf67d0995', N'Frontera De Rio Pico', 163727, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7470a159-9560-42f0-9580-3d66d1f25e55', N'La Penca Y Caraguata', 724802, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41dc7987-89dd-485e-b0b0-3d8dddbccf66', N'San Juancito', 981734, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b18c387-5adb-403b-9783-3d9498d91efb', N'Barrio Guerrico', 216201, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00b34575-0a16-4fee-9d0e-3db304b52441', N'Condor Huasi', 960598, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e828c21d-0847-450e-8105-3dce5c4aa842', N'Beltran', 407092, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd39819b0-4c47-4080-8d35-3dde4122b2e5', N'Retiro', 851740, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5ce937f-87ec-4356-aae4-3de15f83f457', N'Las Martinetas', 726290, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'adf7939c-0089-4ebc-9635-3ded100d8874', N'Monteros', 905285, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'31858269-03d4-4291-9c03-3e008f98330d', N'Tricao Malal', 71893, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa068c70-ef42-4f1b-b720-3e00f9c056b2', N'Villa Flandria Norte (Pueblo Nuevo)', 789657, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d26a71f-d296-4663-8c6c-3e06bc5bcdf4', N'Puerto San Julian', 466863, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00f63fbd-515c-4903-a487-3e23795fc6ac', N'Warnes', 622203, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'383f7051-42b4-4319-a25d-3e2fa4254730', N'Caviahue', 389835, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'534f49b8-f786-4d61-865d-3e31577628d9', N'Perez', 687618, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'95269458-ee35-417c-9279-3e339ae3b599', N'Valle Alegre', 997807, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5cd5f735-b6b3-4aba-8890-3e3831f81ff5', N'Country Chacras De La Villa', 380010, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f711b338-5fd5-46bc-9466-3e60f7318fde', N'Ingenio La Florida', 744082, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd5b2d13-3f9b-4d0e-ae5e-3e6c534f56c2', N'Algarrobo Del Aguila', 166778, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd423ede0-2244-472f-9c9c-3e893974d03e', N'Campo De Mayo', 164874, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'48566902-862a-469f-828a-3e96006eb0a8', N'Barrio Santa Paula', 805471, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd5659b9-d122-4892-8f73-3e964c4fda04', N'Las Moscas', 370986, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0bbbe23-62d3-4636-b1d3-3e9b0d05ca34', N'Saladillo', 633125, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9d8d253f-72cf-4949-8c01-3ebc166be90d', N'Las Violetas', 231115, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ad98b23-6e14-4ba7-86a9-3ed5ec26c579', N'La Armonia', 351175, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b27fc67-f132-474e-ba6f-3ee90e1817db', N'Pismanta', 688249, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8da2f19-632e-4fc8-8f5f-3ef376b58d6b', N'Chacabuco', 96249, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76adb5ea-03f1-42d1-b3a5-3f099d999e5e', N'Arroyo Aguiar', 682171, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4fd29da-d7a1-45cd-91f9-3f0c3fa441ae', N'Yacimientos Rio Turbio', 89547, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a6ed3c9-534d-4a9d-b84a-3f16ec3b49fb', N'Colonia General Roca', 966672, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05dc2c04-ada5-451c-8ff6-3f1f4c6065b5', N'Las Plumas', 238852, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6db26dbd-c836-45af-923f-3f3dcb9f00ce', N'Atahona', 853262, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c50349d6-93a3-4d79-a81c-3f4822069143', N'Pueblo Esther', 189436, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'afd41634-db30-4819-8edd-3f7356373472', N'Gan Gan', 840694, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec36173b-7301-49d2-853f-3f9333298577', N'Arroyito', 207237, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbb302fc-01e1-42ba-98f6-3f962a6a72dd', N'El Mogote', 636884, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0117d4f9-bb3b-43db-8294-3f99c22b13b8', N'Aguara Grande', 227284, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63186ad5-0a3d-4b75-9bd9-3f9dc65e2fd0', N'Barker', 839482, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb6a2979-d2f6-46b4-96b9-3fb064709194', N'Aurelia', 290701, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c212fb87-b784-492a-a1d0-3fb88abb09d5', N'Santa Ana', 801427, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f9f7650-b56a-4fc2-899a-3fb909a92991', N'La Ruta', 193057, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0163f854-ec50-4cf4-92a4-3fcb7dcebbaf', N'Puerto Mado', 464021, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'96fc320e-d3fc-4497-9348-3fdd9804c3a4', N'Los Berros', 467516, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0787b75c-0cec-4ddb-94fb-3fe5408f7273', N'Uquia', 985804, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a51e1cfe-88f2-4f60-ac35-401a167ac52f', N'Villa Borjas', 623813, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'274025bc-8ce6-4146-a74f-4023b5610cae', N'El Palenque', 508901, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4d7e9c3-0da5-4b2d-92dc-4028bc1ad21c', N'Batavia', 439346, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39b91160-3e22-4eba-890b-40308c2259cb', N'Luis Guillon', 645939, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77a18247-92c1-4dd3-a286-403cdd05c46e', N'Betbeder', 847199, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7770243e-7757-46a4-acd0-40496c0945da', N'Lavalle', 935137, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4006d8eb-4beb-4987-a309-4063a9185e71', N'Segui', 746331, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1476450-2eb7-44d7-bb66-407208e01b89', N'Carcaraña', 146129, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'894d32e8-b735-44a2-97d5-40805195d08d', N'Rinconadillas', 943296, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89cc5a48-7b7c-4006-b0eb-4096a4b8db65', N'Comandante Fontana', 826033, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'370db05d-abbc-42ac-9751-40999200e02b', N'Llulluchayoc', 851398, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc0ac52f-8faf-4bf3-8155-40a7c7874953', N'Roca Chica', 423157, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9ed221f-a5fe-438f-bbf8-40b4e02bc599', N'Villa Mariano Moreno - El Colmenar', 217759, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57d7ee53-9cab-49cc-b76d-40b565c6702a', N'Del Viso', 51888, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bef12bec-02fb-4aee-ba6d-4103b3672325', N'Villa Futalaufquen', 916708, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca4585b4-90ed-46b9-8bf0-414086d10ecd', N'Basail', 126673, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a1154f0-83ca-4dc8-bfab-41430863390b', N'La Lucila', 561254, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5540f069-1479-4f2d-ba43-414cf75f962b', N'Villa Pueyrredon', 318830, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bfd7b70e-558b-4828-b0d4-41612a3575e0', N'El Peral', 638361, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b298f60-d4d2-4721-8b9a-4161674a0a8d', N'Los Molles', 474783, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'036c70ae-5be2-496e-844c-4184f9fb442a', N'Barrio Villa Del Parque', 146212, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca0c9900-7002-4696-b589-418d4220876b', N'Villa El Fachinal - Parque Norte - Guiña', 994812, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0dbe60c0-5bd2-49ba-a760-4196434de823', N'Las Saladas', 312290, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf6f8c71-9345-4fee-b2ec-419cfe55ee54', N'San Isidro', 281690, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0cfc11d-00ab-451d-9b3f-419ebbadbe80', N'Colan Conue', 810183, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dfe95fe4-15bc-4b45-975c-419fdf522b35', N'Don Torcuato Oeste', 651031, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dac057d5-cb3d-4767-95f0-41a20aedca85', N'Capayan', 662308, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa35945e-6c3a-427d-b68c-41cb59a9752d', N'San Jose', 167326, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'384f0b4e-9e08-444c-80a8-41d82f063f60', N'Marayes', 128732, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'176f6482-26eb-464a-944c-41e0366c01c8', N'Famatanca', 496749, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b95349ea-ca85-49a8-97e1-41f16f00098c', N'Campo Afuera', 323701, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10bfe137-d3fb-48fe-8bbc-4201de02bbd5', N'Quetrequen', 392638, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'605b389f-30ce-49a0-80db-422e4b0740d4', N'La Playa', 122705, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0091b810-9e64-4432-8ac1-423b2a2d9237', N'Estacion Luxardo', 443581, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f2aef5a-6615-41b4-8f13-42540441372f', N'Candioti', 15075, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d746fba-5d63-488f-9b94-4260a713ac81', N'Colonia Benitez', 372411, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd28da786-0cfd-4feb-beb8-4260a8be2a69', N'San Pedro', 84143, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0bb21907-5ba3-410c-91c6-4265c469e0a0', N'El Rincon', 631921, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7d59149-5b9a-4f7e-ba70-4285bee70342', N'Maco', 818757, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'42de1000-1c6b-4908-a36a-42890ae7221b', N'Mencue', 826339, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cbe482f7-7794-4135-8396-429682a8d54d', N'Ex Ingenio Nueva Baviera', 222575, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'373cc2e9-7a85-4a8c-898e-42a5a734c473', N'Cuesta Blanca', 148057, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b4543b4-1a0b-4351-8bb3-42ae6c37ffe8', N'Salta', 618754, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89c454f0-2208-463e-ba70-42c565842b37', N'Iruya', 430032, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae5caaae-4210-49a2-a03e-42ccf49f401e', N'Rodero', 464407, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a951594-1465-4573-b617-42d8da7db347', N'Pomona', 385885, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a427b94-03b9-4e41-ae71-42da7d75c292', N'Villa Los Llanos', 64871, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c765a6d-b784-4611-b438-42daf117b894', N'Villa Traful', 248369, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a838051-50d4-4aba-afb7-42e549a8a0c5', N'Tedin Uriburu', 517113, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'91914b87-04d1-413d-93ae-42e5bb39f585', N'Gorostiaga', 222672, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f772bcac-32ec-4794-971e-435125c53f43', N'Puerto Deseado', 712593, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b8f1d26-bc8e-4811-abb4-43613a31d20d', N'San Martin De Las Escobas', 300614, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'150a8b7f-d2ed-4c9c-8f41-437b7912d3bb', N'Loma Blanca', 154837, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abcc787c-df5e-429b-a433-438cead6e4c9', N'Chichinales', 801715, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d173038-6929-4cdd-8e96-438e56ea979c', N'Plaza De Mercedes', 823983, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b898b41-0734-49a2-9a10-4394edc79abb', N'Villa Bonita', 767820, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'01f6bd4b-8fe6-4568-94ea-43964b07d942', N'Montecristo', 373062, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bde4b78f-ff61-443d-bfa9-439674b7481f', N'Colonia Margarita', 197548, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67cb3caf-306f-40bb-9575-43aed78375d0', N'Yerba Buena - Marcos Paz', 502290, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a46396e3-f675-4946-94a0-43aeeaa4e8af', N'Monte Nievas', 219491, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa6668ce-e58c-4f31-93e9-43b05806b056', N'Felipe Sola', 605641, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'350b9034-ffb9-4290-baa4-43d5be3a48f5', N'Rivera', 300651, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e469a66-1d4f-41e9-bda2-43de96252b99', N'Murphy', 690057, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b3e6e88-2ffd-4209-8e65-43e85064b8ff', N'Ingeniero Miguel Sajaroff', 64629, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6167f82b-252a-48be-a7f7-43f407965c3b', N'Lavaisse', 25619, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a54e8df9-f704-4105-8d4c-43fd3e660ba2', N'El Paraiso', 315281, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7646d13e-a9bc-4dea-8192-440a9002cc42', N'El Medanito', 362520, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd708214b-a741-4b34-b3a9-4444ab942942', N'Bauer Y Sigel', 758320, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df6fd275-4502-4afd-b487-446267ea172b', N'Junin', 90818, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9a755a04-d966-4a94-8056-4485ced69a73', N'Las Higueras', 191589, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a5499d62-aa92-4c5d-a49d-4488ed75384e', N'Nuestra Señora Del Rosario De Caa Cati', 541858, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'acc4bdcd-b94e-47ad-83a5-44914624b314', N'Chañar Punco', 841300, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df68e844-ff8c-45aa-bedd-44aef851685d', N'Ramallo', 906446, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83c9f47a-9413-4e1e-8b38-44bb08ae8ca3', N'Las Heras', 493791, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad527e9d-c317-44dc-9e48-44ca95db3e71', N'Rancul', 198663, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec03c7dc-cd0f-4ea4-90b9-44d137e81838', N'San Pedro Norte', 456644, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'96c258f0-faf4-4df0-a680-44dd17d7defb', N'El Cazador', 632984, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc8514fa-edcf-4583-be79-451315d516d0', N'Iglesia', 665473, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'08523833-a6e9-475c-aa48-45318072fcbe', N'El Caramelo', 549935, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ccd6d0a-2ea6-4171-ae9b-45347f96ed26', N'Campamento Vespucio', 382801, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02856da3-922e-47f6-bf13-45443cf9d729', N'Colonia San Miguel', 699900, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7200fcd6-70fd-44fc-9cfb-45450f17d13f', N'San Andres', 9748, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b860a9b9-31fd-443c-8080-455d989e73bd', N'Antofalla', 214631, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae995059-b503-4fa2-98b1-456c48251814', N'Villa Zorraquin', 105249, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1da1919-9b90-42fb-84b3-4584955177be', N'El Corte', 995309, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7cde5ef-4806-4b98-9fa6-458d7ae1d5fa', N'Los Cardales', 705744, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77c30621-1e79-456b-8d9a-45a837c4fb7f', N'La Union', 935167, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d92383c-6d2e-4092-b871-45ba38f17af4', N'Arroyo Cabral', 30237, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd862e453-9c1e-493f-afcb-45c82ec95265', N'Gomez', 489920, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2331694e-b50a-4b70-bcd7-45d550cf1622', N'Nueva Esperanza', 46756, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f9ba7bed-7231-4ae5-9151-45fda0316972', N'Colonia San Jose', 426017, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79914970-826a-41d3-89a0-460209c06019', N'Paso Del Durazno', 599265, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd824f1a-1742-4df9-9b95-460c8e2873de', N'Berutti', 100573, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76b8cf12-cefb-4d57-b7be-4613b0abd037', N'Los Cedros - Las Quintas', 333144, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c69a9fd-5839-4a3c-b3fb-4636fabe8f40', N'San Manuel', 145047, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f8353bce-36f2-4058-b11b-46485a3d4420', N'Quinta El Mirador', 990723, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00b6599c-e128-4270-b517-466afdeda419', N'Vilelas', 981072, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a83114d1-0b28-4420-b10f-466fabf6ffbf', N'Bañado De Ovanta', 302688, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'506191fc-e6c4-446d-8595-46a04753691a', N'San Pedro', 152415, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd842ebf-b8ef-4168-9f6d-46a09cc94788', N'Seeber', 657011, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6fd6c95b-3cca-4c91-8cd0-46a0c2a866cb', N'Bajo San Cayetano', 939524, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c10231f5-7b5e-4439-8d61-46a0dca90ae4', N'Arias', 354504, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fbc249e-fc27-4d1a-ad02-46b882196f37', N'Faro', 898995, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b1d258d-716a-47f4-bdb5-46c829b4f367', N'Villa Lago Azul', 904604, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'03602978-c4f6-40f8-a29f-46d080740fbc', N'Pueblo Santa Lucia', 544348, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72246b2c-881e-45a6-90b3-46ebabba5c59', N'Palo Labrado', 622576, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'843cfc1a-eac5-4c6a-ad3e-46fdb4020e54', N'La Nena', 995642, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c3f739f-b34c-454a-8203-47142ea49af2', N'Angualasto', 105640, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc8361b3-b990-47d6-836e-471bf270d61f', N'General Mosconi', 94455, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02d532e1-5c1c-428d-a78f-472bc569e5aa', N'Maimara', 654206, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d762f85-c059-48ce-94aa-47789b442854', N'Barrio Las Golondrinas', 609687, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5304ddb8-740f-4c96-9566-479420ceffc3', N'Santa Maria De Oro', 843479, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd08e4a09-592a-4386-bfaf-4796897f6db9', N'Villa Albertina', 427774, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'28f97a87-558a-4a2d-993e-47a9543dd52f', N'El Plumerillo', 826198, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8918d4f3-19b8-46a8-8124-47b2afb7a736', N'Hernandarias', 445257, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'602aee86-65b0-4b77-949e-47b3aac1e52b', N'Nicolas Bruzzone', 269731, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5005758-70d4-4cbd-a5de-47bcf6e269da', N'Cañada De Gomez', 515020, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea66ca98-e564-43d0-8772-47bf9bf5bdea', N'San Jose De Jachal', 947679, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e936f071-d36a-4cb3-8bc9-4826d3d895cd', N'Ramon Biaus', 824300, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'938e548f-f1d3-497a-9313-483660636d1e', N'General Pinedo', 619665, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'28fc5f6a-d1f6-4d85-882f-483ad0e05b30', N'Barrio Ciudadela', 152068, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f12c79c3-6b1f-4dc3-8e29-4843d2621dff', N'Bosques', 406949, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ad41b30-dc70-4837-b4e3-4855093320d3', N'Rivadavia', 629214, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cd0bd00-406c-4696-8cde-485ad1445e7a', N'Gobernador Ugarte', 697051, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0796710-3243-4bfc-8df4-4866d83db59d', N'Villa Del Carmen', 685611, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10fcc67f-660c-4ee1-8da2-48875d679c79', N'Laguna Naick-Neck', 54326, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e7e8f469-9ecc-44e3-a2ec-488c66ffcf95', N'Cutral Co', 810629, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'16d58940-a572-4e14-879a-48a4a6119f95', N'San Miguel', 84593, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c5f2fed-858a-4af8-8c5d-48c2c4e2839b', N'Colonia Catinzaco', 476115, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f53a1aff-a829-45ea-ab0d-48db53e0e355', N'El Rincon', 57745, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb21120e-1bee-43c8-8a85-48e1377e6e8b', N'Rafaela', 880722, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'334b1713-af4c-413d-9161-48f227a16715', N'Ciudad Del Libertador General San Martin', 746566, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'de5c53e5-7bfd-4591-a57b-48f83d38edfd', N'Macapillo', 226273, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2931d67-395f-4709-8c9d-4926264b8a38', N'Villa Los Patos', 517602, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0cea3ae8-e9c1-4907-8bef-493ae493f005', N'Parana', 636727, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1caf2c6e-35b3-4c95-b9fb-4942f2a512fa', N'Quebraleña', 999320, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6496f4e0-5dc9-49de-bee4-494a1ae0282b', N'Frias', 767351, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4832680f-f9b9-41c0-8d39-495cc70def6d', N'Carpinteria', 432694, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c0ca634-4089-4b29-9d20-496b166fe441', N'Desvio Arijon', 799764, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70c1b201-7b94-42e9-a8f4-498ef52ad0a7', N'Carmen', 206095, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'62bec890-b1a7-4241-baa9-4990ded5fe7c', N'Punta De Balasto', 822472, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa6d71aa-f2ef-40d1-a3a3-49a3aab21998', N'Dalmacio Velez', 882760, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23898c6b-6613-4232-acb4-49a66977de6e', N'Union', 197239, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c418c97a-2572-4b4b-9b44-49c1046a64fb', N'Las Compuertas', 779956, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fff02370-25ef-4fc2-901f-49ca1786c2b7', N'Gahan', 681427, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15c18a38-c8c5-474b-83a1-49ca514a40ce', N'Puan', 19864, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'235b3b5c-f48a-46d2-a89c-49de61995b0d', N'Colan Conhue', 835458, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c2706a95-79b3-4405-a12f-4a1dc46b23a7', N'Barrio Puente 83', 248197, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7f283ae9-5608-4dc7-9418-4a1fe9091916', N'Los Telares', 819535, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d6cd775-0115-49e9-9c31-4a3cb18b8b34', N'Soldini', 185833, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'be39ebaf-fa23-4065-b199-4a4ec9c17fb0', N'Puerto Pilcomayo', 722162, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'31a9fabe-21f8-42e7-a806-4a612005159a', N'Vilmer', 713679, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b37b2b3-6538-4fea-8cbc-4a80f238a781', N'Cortaderas', 347838, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd5b648c-fab0-4789-9e91-4a9be1b73c1e', N'Roosevelt', 669961, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89d07e6e-9243-42f4-b87b-4a9e379ab9ff', N'Colonia Pando', 917480, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'378b611c-a9bd-44bf-9353-4ad4713f56e4', N'San Francisco Solano', 773885, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15d251b2-1264-4cf3-9fe8-4adac56626fb', N'Gardey', 182579, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a9dc9c6b-a8d3-4228-94eb-4b04e139d5a5', N'Camarones', 442285, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30db73f6-9c97-4a34-b6e7-4b262658d916', N'Picun Leufu', 637392, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'877a3dd9-1964-46d8-8e3d-4b285f4cbc80', N'San Jose De La Cocha', 71586, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8770851d-db8c-4e58-baa0-4b41a81bf51e', N'Cachari', 895360, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f34a0f6-fc25-49b6-bd77-4b4aec7219af', N'Azara', 112101, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3a39d9e6-f484-48b1-9efd-4b6094cdd2e0', N'Bario Ita', 470523, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9a7dffc3-cc1f-4b4b-bd84-4b65ab5276d5', N'San Carlos De Bariloche', 44932, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c41d41a-d8ca-48fa-ae3d-4b6b5748e621', N'Baradero', 630438, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5f6aa43-8276-4fc1-9730-4b791b8896a1', N'Las Lagunas', 786661, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7ac085b-bdd1-4aee-85ad-4b7b5062e3ee', N'Villa Libertad', 468006, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7572d9dd-5bbd-4aa1-8ff6-4b80481719b8', N'Barrio Nuevo Rio Ceballos', 333321, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a959c50b-7fb5-4a40-81dc-4b9fb4ee58ab', N'Lugones', 971931, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1f4130b-e759-4abb-91bd-4ba65f27af47', N'General Alvear', 614567, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a751cb28-8ddc-4481-a75c-4ba77030c75e', N'William C. Morris', 377169, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b3000d0d-a517-4bb1-bda3-4ba95d61af3f', N'Puesto Sey', 441425, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0922073-765f-4da9-b3a9-4bad219d40ba', N'San Jose De Las Salinas', 491064, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7cbea1c-ffa9-4db8-b060-4bc24214277a', N'Rodeo De La Cruz', 730222, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'333e586d-57e5-42bb-9d4f-4bd93f61c9d7', N'La Tablada', 983893, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c063e054-e27a-4e7b-b09a-4be5b39a0162', N'Atalaya', 503873, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'48396035-c464-468d-bdf7-4c0ae9fcd23a', N'Monte Potrero', 873480, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2db5b1f-a9b7-48db-b7a2-4c0d1aab94ab', N'Barrio Moño Azul', 800148, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'642e3b81-d07d-43a3-936c-4c1016e8ebb4', N'Villa De Pocho', 663440, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2d7b8ac-86a3-4fd0-bfc6-4c12eeea88df', N'Florencia', 733982, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc0499e7-cc2a-42d1-9044-4c1531756768', N'Sierra Chica', 558099, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc6294f5-9366-4477-92d5-4c2a64299f82', N'Pampa Del Indio', 792717, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1b39adc-b204-44d6-b122-4c32ba115c82', N'Barrio Goretti', 438114, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2613a802-7093-42c4-b64d-4c3d6445828e', N'Zanjitas', 640202, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2993c74c-be88-40ed-8010-4c4a9efcde8b', N'Liniers', 524847, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0086d5f5-884e-4617-800a-4c64e1c54407', N'Nuestra Se?Ora Del Rosario', 115255, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c73884dc-6546-4875-9966-4c6bbc10f596', N'Las Tunas', 213501, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5989f344-6d0f-47fa-82e5-4c6c688b9f0b', N'San Jeronimo Norte', 337670, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'be0f3c53-5a0b-4b6a-8fef-4c734b2d0ef5', N'Alto De Sierra', 427115, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e648b387-8ad3-46a8-8391-4c746c9cc7c0', N'O''higgins', 372697, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1af4256a-9af1-4b1d-bbdb-4c8c13f6deec', N'Barrio Morabo', 426462, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0e275c3-1d93-44de-8da6-4caa683483b1', N'Avellaneda', 589620, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a921d4c-225a-4d46-b207-4cb193ad77f7', N'Parque Calmayo', 187756, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05479f73-0d4c-44dc-a161-4cc164fc6ee2', N'San Francisco', 965789, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec8867e2-5634-49ce-8029-4ce398e25e39', N'Abdon Castro Tolay', 724337, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c04c733c-217a-42a0-ab90-4ceeee3e82c5', N'El Peñon', 741229, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4286216-ea8c-4ee9-a844-4cf31fa68e4b', N'San Francisco Del Monte De Oro', 694882, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'319862a8-2e70-4f5c-bf02-4cf907c2f574', N'Punta De Vacas', 292051, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7907cb9f-0553-4d99-8ca9-4d06a58e8ac1', N'Coronel Segui', 81302, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd744bcfa-0ac7-46bf-91d5-4d0ebb91fef6', N'Villa Santos Tesei', 995330, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14364b0a-b7ba-4b70-bffb-4d110458319a', N'Patquia', 917783, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'50512995-7c5f-4163-b9cd-4d3421345d3a', N'1 De Agosto', 791937, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60b512a9-a54f-4d11-8f50-4d3757fe5453', N'Alto Verde', 253125, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd56283f-90ad-4c8d-a0fa-4d5d963c0bd9', N'Villa Ortuzar', 115125, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'839eb2e1-8029-4479-8230-4d7846712b14', N'Mauricio Mayer', 465687, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6cc2078-ba4f-4809-a2fc-4d9062548a4a', N'Metan Viejo', 682383, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e675861b-8a38-419e-a346-4d913ce7f28f', N'Mallin Ahogado', 890150, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'521010b7-d69d-4f9a-b244-4da19a25b5f2', N'Esquina Del Alambre', 838381, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eadb6b68-d917-41e5-b0c7-4da687bd7e24', N'San Lucas', 576439, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4fa127b8-fe97-43c0-861a-4dac168db5ee', N'Cobos', 582573, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cced428e-0867-4bdd-acf9-4db9ebcf56ee', N'Las Chacras', 482684, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7035b55c-de8b-4c68-a68c-4dbd55480257', N'Capitan Bermudez', 128964, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'09d4b2ce-0609-4c77-a7cc-4dcffdc09c10', N'Crotto', 878574, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5b789ec-09a6-4bd0-b51a-4dd58faf7901', N'Aldea Valle Maria', 574505, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83b5b28e-30e9-40d8-a0f0-4dd762440ba5', N'La Maroma', 760847, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb4920c0-5282-4a85-a8a5-4dd96d155f2e', N'Alto Pelado', 191599, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b22dc02-79bc-4f33-9933-4dddee463e79', N'Famailla', 647651, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa2b786b-2580-45a2-9af9-4deb9c5e9334', N'Pueblo Uranga', 768478, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99ec187e-4904-43cd-9a57-4e2133221cf8', N'Rosales', 189347, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0eb5905-24af-48e6-ad4c-4e25329bca72', N'Tortugas', 748144, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b07c292-0079-410b-9543-4e3ac26c7681', N'Barrio Emanuel', 124500, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ebebd5f-1362-4887-b063-4e3f86469c1e', N'Las Varillas', 857930, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8103039-1c02-41ff-aa6d-4e4ca3173177', N'Monte Maiz', 754118, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'66a714e7-d2a2-4838-98ca-4e62778222e0', N'Glew', 440358, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e92924c2-ca2c-477e-9dfb-4e8cd51e89b1', N'Los Antiguos', 785073, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0c73c00-e8e8-4cea-8083-4e99f73b34ab', N'Colonia Nueva Coneta', 310434, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f41252e-6406-45b5-816c-4ea971b3f945', N'Caspi Corral', 946342, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'341e24b4-92d2-4056-a080-4eb097683193', N'Ñirihuau', 801589, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0385cc54-e644-447f-ae63-4ed93e12ed4d', N'Choromoro', 600635, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5decbcde-8e73-4029-8354-4ee7c2eb228c', N'Trevelin', 245733, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e1f810a-e6f8-4e2b-9d08-4eef2db41a48', N'Manfredi', 623376, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c4b037e-9101-4f42-a444-4f07a188fd45', N'San Clemente Del Tuyu', 932274, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf352ba4-ed2f-481a-afbc-4f126e300318', N'Palpala', 133310, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4562f4e1-f942-4214-aad0-4f1df371452f', N'Palo Santo', 296093, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98cc6d13-03ff-4ba7-814f-4f2e5379cae5', N'Astica', 380238, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22822849-130b-4933-bf95-4f35435615fd', N'Santa Ana', 197354, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a8f7b71-717b-403b-80ad-4f4628d106c3', N'Irineo Portela', 270994, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36e73739-30f5-4558-a9fe-4f4c13f23a2f', N'Concepcion Del Bermejo', 317463, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abf47912-9672-4860-93bd-4f56954cb8e8', N'Los Talas', 981575, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9bbeb3cf-c0f6-4f0e-8e4c-4f78dc75b9f7', N'Fortin Acha', 877648, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a6b6988-aa51-4510-8f2e-4f9310d1fbae', N'Yuchan', 202673, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02fba506-6733-4a90-944d-4f9759a41c4e', N'Lobos', 469970, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5f563a81-4792-49f4-95ab-4fbb86db3835', N'Villa Manzano', 910808, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1193e7eb-e29c-46c5-8940-4fe01358c3c1', N'La Puerta', 31693, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'62529209-f776-4019-8570-4fe76b2ae110', N'Roberto De Vicenzo', 148331, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83e93b90-58cb-4226-a345-500c9541ad72', N'Esteban Agustin Gascon', 624357, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6512b257-afd5-48c1-95b3-50102913eb7c', N'Chauchillas', 289925, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39bb0a69-1236-499f-9b5a-5018c6b751b8', N'Colonia Las Cuatro Esquinas', 714397, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f831e127-c634-4b40-a5ce-501bcc548da2', N'Villa San Isidro', 720085, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1e88481-77ed-4482-865b-502fb5783669', N'Colonia Gutierrez', 494310, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c75b3b1f-b52b-42f7-8ee3-5033a82ea7fa', N'Santa Regina', 885550, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9f422cd0-d419-4ef3-ab19-50368b22c6c6', N'Barrio El Milagro', 142251, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f703698-231f-4860-b95a-50508f3e04cd', N'Coronel Boerr', 967620, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57ab74ae-bb39-406c-8f06-5059f9b6c719', N'Pueblo Andino', 317768, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b000125b-64e1-4384-8eab-505f7f173f7a', N'Ambil', 133634, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'13b324a1-148a-4b05-a19f-506a8fcb9b94', N'Sacanta', 449562, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'368d34b8-f7be-44d3-89ce-508c5b11de86', N'San Juan De Quillaques', 232510, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4eb0c1c6-f8e7-4706-8105-50cfa99684ff', N'El Manzano', 500000, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2d592b49-caba-4707-af20-50db07baf062', N'Aguas Verdes', 80843, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d12d14d-3cc6-46c3-a3e4-50dc2e7aa495', N'Dique Nº 1', 347435, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b7922c7-0ad1-4d31-9061-50e1094b424b', N'Barrio Parada 14', 992255, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c807c52-7482-4cf4-b623-50eb9c71e2d9', N'Los Indios', 640329, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffebf387-dadd-4cdd-b711-5138ff6b33d9', N'Plaza Saguier', 569057, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8077a5fd-20b8-495d-b7e8-513edd31023f', N'Villa Adela', 452470, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae33be68-6807-4947-a9ad-51447412b415', N'Balneario La Verde', 68798, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61953295-55ce-4d71-b65e-5146803590e2', N'Castelar', 844728, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'042fe659-3137-4057-b658-51469f895108', N'Matorrales', 870516, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c6370d9-fc6a-4f50-9dfd-5158cbc888b8', N'Yuto', 90940, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4aaf141f-e873-4cbd-9d2b-5176d247ff23', N'Colonia Fiorito', 945562, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7fbf03a-533e-4ae1-b858-51975a567c1d', N'Los Hornos', 437610, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ea78719-68a2-42a6-ab95-51989374d377', N'Guachipas', 749112, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5f7a972d-84c9-4371-a819-51a085fce519', N'Colonia Medici', 776196, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c391433a-650a-40ce-b735-51a56f7c43b2', N'Melo', 400806, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7aa6a98-bc59-4525-82f6-51b3bb5b70c6', N'Olivos', 213292, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a20acb3f-76a4-4706-b954-51b6d3a7269f', N'Don Torcuato Este', 496042, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27d6f2f7-c64e-489b-ab74-51c7fb41075a', N'El Cerrito', 275051, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a89afc7-fc05-41bf-98c2-51e1f7c4b164', N'Joyango', 448304, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b13d486-be1a-4e88-b8a9-51ebc65aef35', N'La Beba', 701979, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5962496a-739b-46f7-bdbe-51fad93df1a7', N'Las Palmitas', 396816, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'18807962-f6ac-474c-a47f-520107a9c12f', N'Recaredo', 115973, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b49f880-506d-43c8-a077-521139426b3e', N'Estacion Escriña', 150362, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a9f5d1c-eb11-477b-a6c1-521431afee92', N'Santa Ana', 450854, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1fbe01ac-901a-4f49-9f76-522110892dcb', N'El Crucero', 908475, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'607213cd-8563-4520-be9f-5223513fd6cc', N'Del Campillo', 669121, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'320f3346-ae15-4216-84c2-52277b222959', N'Villa Bolaños', 979151, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'edbe06a4-006c-4dc8-b508-522f1153c10b', N'Helvecia', 686654, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bfe36e6c-23bf-49a2-b35b-524f86d64ae8', N'Club De Campo Las Malvinas', 759252, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'967b7eab-053c-4740-828e-525f9d4252c0', N'Villa Brown', 242286, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'17356d97-2414-4f90-9991-526a15d90ce9', N'Lujan', 144906, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8fad2392-1c81-4e10-8d95-52709f492582', N'San Jose', 668936, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da515746-bc11-4b9e-9a3a-5280a568a9f7', N'Comandante Nicanor Otamendi', 21596, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'766fec59-1efe-4633-884a-529dae35a97c', N'Larrechea', 841968, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57e23a61-b3fb-4d25-975d-52a7c3540c8e', N'Londres', 38376, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73bc4a16-be27-4319-9939-52efb2b69ae6', N'Copahue', 88263, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa63555e-fb73-4493-b2ba-52fa910a86fd', N'Boulogne Sur Mer', 508875, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ded0cf73-4836-4064-99ba-530459781164', N'Sauce Arriba', 354926, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15d2bdaa-c944-43e5-9f14-5320f2d9af62', N'Villa Rio Icho Cruz', 530790, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5458e103-589a-457b-8d85-532df2588f01', N'Don Orione', 138732, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4231964-026f-4eb5-8a35-533b947777c9', N'Fleming', 711213, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5eb8a2b-f000-47b1-a2b6-533d9148a73c', N'Arroyo Corto', 542617, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89ed4308-5725-4de3-9b8b-536944237566', N'Carmen Del Sauce', 740268, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'847b7b20-c107-4ea3-ae2f-5384dd1d0b28', N'Villa Elisa', 2556, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1291e903-ff29-4485-b878-538dd8cfb31d', N'El Solar', 904634, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a31463a4-e2d7-4cd3-9bd5-5396f23a51cb', N'Los Cipreses', 280336, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2de4877b-7c60-4dd0-9616-539cb1672fe2', N'Selva', 796901, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c85bfa5b-366c-44b0-9dc4-53aba1c66168', N'Los Nogales', 875607, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bebe147a-41f3-4607-ad17-53ed9b8b9fbc', N'Estacion Tacañitas', 290596, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47906443-c4df-47b4-b797-541d05652e47', N'Las Lagunas', 435283, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b4d315d-b3ab-42df-a7c1-54384cc05901', N'Villa Astolfi', 465184, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abfb34ef-ab58-44ba-a6c3-543a46cb0a28', N'Barrio Caleta Cordova', 657759, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc7d8880-2418-47f7-8e71-544379cebffe', N'Dos Acequias', 630712, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f095d11-f472-4236-9fdf-54478edffcf1', N'Luyaba', 213499, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c2e5dc29-4a5d-4b9f-b03f-5448a894a39b', N'Santa Anita', 615337, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7325a838-49e2-4c7b-8082-5448db78badd', N'Cerrito', 622134, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'62ee5e1a-6deb-4c39-ada3-545791bd9ed6', N'Saujil', 568311, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cf27073c-0a63-47d9-85df-5459018d3640', N'Merlo', 113366, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8fba9e2c-f089-4d59-a262-54785fbee6b2', N'Berazategui', 801103, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dcc46506-81c2-4f5b-a3f3-548526e34dc4', N'Plottier', 581453, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e1a4ece-933a-4709-9c6f-548dcf5f5bac', N'Cangrejillos', 850992, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c760d23-be95-4ec7-bfe5-5497da20ccd6', N'Wilde', 266043, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3ac9af2-56da-44ab-9a7e-549cade94dd4', N'Dean Funes', 792835, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4411704b-97a0-42e9-858e-54aff64b0d18', N'La Hoyada', 134292, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd3e76cc8-ce5a-41b1-995a-54c7c4d35c68', N'Villa Alberdi', 877257, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'80d41e07-9218-449c-af8b-54cf86a48c3a', N'Ciudad Evita', 366031, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a1bd461-27fa-4da2-abb5-54d662ee9645', N'Trenque Lauquen', 100799, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'970977c3-b18a-410f-84ea-54e53b589415', N'Los Polvorines', 915994, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe20c34a-878e-437e-8fab-54f83fd40a28', N'Chabas', 475161, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b1f579d-1eed-4b5d-8c0b-54fa34db1d0b', N'Las Toscas', 672114, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ba7be9d-bde2-44b3-a289-5523c72a6819', N'Alta Gracia', 652850, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fa99303-bc95-4155-b4c3-552816b0c168', N'Noetinger', 605722, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e07e60f8-9492-4e49-9aec-5535b55d789d', N'Xx De Setiembre', 297600, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3559982e-b053-4066-a12e-554833e273f8', N'Villa Cacique', 507229, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1f9e102f-2bf7-4731-b166-554d716341ec', N'Huerta Grande', 158351, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba477b2f-2a5b-42c1-b049-5565cc5f7b01', N'Rojas', 395461, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30582e07-2455-4c11-a16e-55bd32f89158', N'Montefiore', 160153, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0790c063-4911-4229-bb2c-55e42cdfd34a', N'Subteniente Perin', 276847, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5e9f99d-40c9-40cf-b909-5607dbc35e96', N'Franklin', 69305, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7d02dab-5888-40b9-a96e-56394dff20ad', N'Hilario Ascasubi', 849782, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c78d5056-c0d7-4b30-9339-563e3dbea8e7', N'Puerto Madero', 59478, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b14915b-286b-465d-9344-564aef1bc157', N'Barrio Isla 10', 44445, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a75464b6-203e-41a1-b4f2-56685364dfbc', N'Ex Ingenio Los Ralos', 977926, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70cc0821-dfec-42f1-90b1-566942765984', N'Barrio Frontera', 664111, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'454faa91-eb42-43b4-aeae-56798538489a', N'Estacion Clucellas', 310968, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb3d36f0-4b53-45a8-b8ab-5684c2cab2f9', N'Ricardo Rojas', 998722, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'663a8777-e8c2-47c1-81c6-5685373161bf', N'Ampascachi', 362839, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8a0de20c-a203-47aa-adaf-568da2b952c6', N'Florencio Varela', 69363, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2bb1593-fb14-4e87-827a-569916dadda2', N'General Arenales', 12041, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'48fddc6f-c4dc-4d63-b063-56a14ba4bb50', N'Corpus', 651725, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d6eb0a8-05a8-4f67-9ef9-56a5c2921e50', N'General Juan Madariaga', 214782, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9a8d3c90-8872-4645-963f-56ac2423f2e7', N'Barrio El Pilar', 648735, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97a0101b-7457-4db0-9a6b-56bea4030d02', N'Villa Fiad - Ingenio Leales', 594736, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'53b2057e-1a91-4f36-b27e-56c91307149f', N'Rio Pico', 998831, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b79938f1-cf5e-4c41-8d15-56d04b476422', N'Mutquin', 348986, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ca86f11-5406-46dc-a784-570146afcf8d', N'Punta Del Agua', 914032, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d80fc0d-06a9-4e8b-84f3-57127c32bc58', N'Castilla', 352521, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8bbb1753-7501-4218-9627-5716632b9964', N'Lago Epuyen', 341035, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'03b1ef08-462f-441e-a64d-571c992085e4', N'Pasco', 543722, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd8557aa-62da-4647-b05c-5724570fae60', N'Charata', 614585, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc4d5306-bcd8-46cc-b127-573158e5898c', N'Fiambala', 628709, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07ce6ef0-9f07-4e22-8eef-573c0978702f', N'El Araza', 637598, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'514d4fed-0a12-4bd6-8ce6-5744fbed0d0b', N'San Jose Banda', 533459, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff03bd40-097e-417b-ac34-57502e5fddd4', N'Ramon M. Castro', 140439, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'11df74d2-bf7a-4ce1-b2f0-5758bffe4a22', N'Villa Recaste', 951136, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca474e5d-3f43-4406-bb4d-575979893789', N'Ucacha', 477295, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6659896-7940-4e73-bd58-5759baa13e0b', N'San Fabian', 753542, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c68e6559-db82-4eb9-96e1-57688ae18575', N'La Baliza', 64352, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0acf9b8e-4882-4ddf-b741-579635f57de7', N'Telsen', 327069, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0a54578-ab5f-4c61-af4b-57bdcfa5610a', N'Barrio Caima', 522014, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3dbac82f-901f-4b49-9218-57c26611cb01', N'San Antonio', 734802, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b37fd09d-22d1-4ae0-b90f-57cb62ecab7f', N'Colonia San Martin', 968707, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'80bc6afa-7aae-4b72-90db-57cd680bb28c', N'Arroyo San Antonio', 799583, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc791454-d7da-40d8-af3a-57d23a0e6e63', N'San Agustin', 429307, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b766e91f-edb1-47c3-8799-57eebe519ebb', N'Ordoñez', 475688, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a736ed2-51b8-48df-88b0-57f1a50ff615', N'28 De Julio', 676766, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e92ee5a-5db2-4cdc-98c1-57fb8b9cb99e', N'Gobernador Costa', 233600, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9125672e-c3ca-4fc0-a353-580aca7116e4', N'Claraz', 948804, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'944a2bbd-bedd-4548-9a9c-580e6dc2ae13', N'Barrio Gambier', 914365, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'95ff18a5-2699-45ab-a542-582006e63a6f', N'Saturnino Maria Laspiur', 58108, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97310f59-d760-4b0c-923e-582e2006545f', N'Norberto De La Riestra', 22212, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6417cc62-5188-4ee9-b27d-5832a47cfff2', N'Chumbicha', 867960, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85403a28-1e9b-4305-845d-5848803e24dc', N'Posta Cambio Zalazar', 335461, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'388e1ce0-c852-40d7-81ab-5877275463e4', N'Jose Hernandez', 980988, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9a4b132-e7f7-4802-a9c7-587da9d4d990', N'General Mosconi', 279067, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ec0deae-23ce-4c19-865e-589042c6acec', N'Fortin Sargento 1° Leyes', 211668, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abee7ecf-b8c6-48b2-8c9f-58977242bd23', N'El Alcazar', 342249, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'681b7d76-4ac0-4990-a6d8-58bd0323149a', N'Colonia Ayui', 434672, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10b877f7-eb43-4cec-b253-58c0b201f51f', N'Canning', 396371, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a8f8e11-4050-4db1-938a-58d178f1e87b', N'Villa Benjamin Araoz', 768322, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f080ff0-8111-4b46-b9cb-58d4c5f52d06', N'Los Corralitos', 129104, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d11671a-a036-4b29-acea-58e2b9069af6', N'Vaca Perdida', 978306, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7ff4694-e987-48ac-bfc0-58efd4ec394f', N'General La Madrid', 857443, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cac947fe-061a-404d-990e-58f969b977db', N'Barrio Cooperativa Los Campamentos', 634108, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd30c747-fb5f-493a-a8c9-591a855fa889', N'La Reforma', 965690, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ac193dfb-3079-4bd2-906f-591d9a3eb3c8', N'Puente De Hierro', 552524, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61906322-62e7-4bde-8c94-5920a4c2dde8', N'Colonia Tirolesa', 604649, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff386f35-1fe3-43b7-aa36-592468056bc2', N'San Salvador De Jujuy', 648289, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92a1694d-696a-4688-95ba-59464a07194e', N'Llavallol', 570305, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05cafc94-48bb-483b-81e9-595fe8afee56', N'Coronda', 472028, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23191d01-dec0-45ec-b488-597e806cb619', N'Las Grutas', 830070, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0005e30-5b35-4631-8e6b-59833a9b6f34', N'Huanguelen', 959866, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0a97830-63c8-40be-93c6-5989d05df11f', N'Pichanal', 217446, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8581198-897a-4ab4-96ce-5994357a87a4', N'Bernardo De Irigoyen', 960478, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c798dfd-4f45-4819-9373-59a7ae0f9723', N'Don Bosco', 502961, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad5ac1c4-af7a-453d-9a44-59b77c76460c', N'Astra', 345953, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c344c90e-354f-41ae-bb36-59cc6a5af3ea', N'Paraje La Virgen', 704317, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0cb2006b-b7fe-4c51-b4c0-59d3d93f65be', N'Cabal', 909718, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'de06ef89-88e0-4a3a-9754-59d8303a0df4', N'Arboledas', 940338, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'94aebe15-af41-41eb-9277-59e64e15b76f', N'Villa General Guemes', 519044, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6e9ddce7-169f-48cf-bbf2-59e881a0e9e9', N'Los Alisos', 226311, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'285255d2-4b1b-49e1-bee4-59f542afb29a', N'Barrio Costa Linda', 236442, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e757f7b-46d3-4999-a714-5a050cab8ede', N'Coronel Suarez', 239762, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'851a1882-a8fd-4b6d-aea6-5a4d46c610bc', N'Garruchos', 101098, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e1977b4-d29a-4ae7-80c2-5a669eed4535', N'Colonia Campo Villafañe', 862061, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'34715a02-ceb4-4682-9074-5a93851a2d6c', N'Centro Forestal', 449158, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa2b301e-0046-4188-af6b-5a9804e4fcce', N'San Miguel', 6109, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b3dae64c-3b6e-49a4-be4f-5ad85ef7c02c', N'Teniente Origone', 470402, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'742de42b-64e6-4e99-ba72-5add0ed04403', N'Lehmann', 643173, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2a9c872-c2c3-4da1-9f5d-5af3eabc2e9b', N'Lujan De Cuyo', 31593, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca73b785-b82a-405c-a02c-5b01de20c67a', N'Los Cocos', 549504, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'863a7854-c52e-4c88-9bab-5b0b0b00b0be', N'Dunamar', 20007, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'206e4da6-b083-44b8-acee-5b0e92ea48e8', N'Cadret', 171093, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a5a436d-7add-4fe9-bf92-5b16c4cb2eda', N'Sevigne', 100602, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db483c13-4077-453c-95ff-5b3f3d74754c', N'Cura Malal', 652999, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'025af8ef-f96e-41c8-8bce-5b4afb495914', N'San Javier', 660895, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5510c55-ba72-4c80-b2be-5b7f4264b5d6', N'Jose De San Martin', 688680, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fdc326e2-5c53-4f08-bccc-5b80db90c8e5', N'Barranqueras', 32971, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14c1a8bb-bafe-492e-bc5e-5b897f2b3297', N'Barrio Manantial Rosales', 86623, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6aa977fa-96a4-45ff-88ed-5b8bd96d0714', N'Gobernador Mansilla', 19510, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b598a79-bb4e-4159-859a-5bba92bed181', N'Munro', 944051, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64aa03f8-7871-405d-a30d-5bc36e9d825d', N'General Fotheringham', 139724, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c800e5c5-2b02-416e-9b39-5be22dd04411', N'Los Penitentes', 638560, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dcee30eb-047b-4e10-a7e9-5be873ef1b5f', N'Hucal', 264415, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf8d3b4f-6a3d-4a37-8b5f-5bf3fd533a2c', N'Santa Ana', 333720, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'143e54b2-3b65-42f5-8ae5-5c050d8d1404', N'Huacalera', 383941, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c294ee7e-1ab5-447b-a5b0-5c13e4c058e8', N'El Carmen', 853188, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5039a74d-9de6-43ce-a367-5c157dfbcc1d', N'Marcelino Ugarte', 832548, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd19535d-6bba-433d-ad73-5c16d605a0f4', N'San Ramon De La Nueva Oran', 850234, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72233185-dca8-4b45-a772-5c2055ee2fb2', N'Villa Berna', 446497, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6bfa8d5c-119d-4852-be05-5c2504f9ae95', N'Pardo', 323145, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b1370f3-5c89-4246-a02d-5c2913407f10', N'Sauce Viejo', 415825, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21af8c46-50f3-457f-8fd8-5c2e00f18aeb', N'Pozo Del Molle', 468994, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'74c54f73-1d5d-4295-a1a2-5c370621bf6a', N'Chaquiago', 427715, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f605611a-8c3b-4b81-b25f-5c523ad7b209', N'Villa Riccio', 298922, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5d23035-2a5d-4ac1-b31d-5c55af983ea7', N'Tabay', 580631, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30411de8-e7fc-4975-aea6-5c594a8cd777', N'Juan F. Ibarra', 676166, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77679407-68f4-4c29-aa94-5c6ae1fb87d7', N'Paso Cordova', 576388, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21512974-193d-4f11-91a8-5c6b49cec919', N'Villa Saralegui', 236588, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c80b2dc0-5dd2-4498-87c9-5c700dfb9041', N'La Soledad', 444962, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9a8827a0-7c8e-4ae4-9221-5c708e582b3e', N'Leandro N. Alem', 349890, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd07bb41f-e20f-4076-8783-5c777188c8b2', N'Tilcara', 532231, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'122e9fc8-4488-4b9e-857e-5c86ef5fc6a8', N'Arata', 813083, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57cda210-e00d-4e25-9e2e-5c8e371951ba', N'Cruz De Caña', 169600, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4dc5a314-02df-4478-ba88-5c900b19915c', N'Maria Ignacia', 531978, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b085a86-055e-4bd7-aaf1-5c9ac77aa44d', N'Tala Huasi', 293595, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'12f517c6-741b-40ee-b88e-5c9c7605df54', N'General Rivas', 173392, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e55387f-4a00-44df-8f08-5cab783fbb63', N'Olacapato', 407137, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8af7fbf-fb7d-4775-8342-5cc3e2a12c3f', N'Centeno', 485515, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d45ee83-9bde-43f0-aa5b-5cc85e645592', N'Puerto Madryn', 812294, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6ac1c245-b0a9-43d3-b159-5ccc7a2068a7', N'Vivorata', 612910, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'240f53f8-e0ef-4a85-a6f6-5ce755fb652d', N'Bermejo', 188779, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6055d704-2313-4a0f-b2da-5cec0ab00507', N'Mision Tierras Fiscales', 624535, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78bb2d1e-a319-497b-ac5f-5ceeabbfe9d4', N'Palmira', 400606, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d8c3528-58a0-44e8-b17d-5cf3619a0d53', N'Antonio Carboni', 477309, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6038f44d-eca8-4b16-af45-5d143121a43d', N'Campanas', 599266, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d1a3956-2115-4a7e-8ffd-5d16408a2a9e', N'El Carrizal', 365996, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dfb4f62d-0399-4f94-95f3-5d20f64db1a4', N'Aldea Epulef', 439853, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4e2a82ea-19ab-4ea1-aba8-5d2d753d78f7', N'Maipu', 84404, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45bd54da-f225-4261-88b2-5d2fbf3a53de', N'Vieytes', 199493, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9de03ec8-f2a2-44b0-a766-5d47381c4d41', N'Estanislao Severo Zeballos', 568596, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0fb49e7b-2b37-4ab8-b127-5d59acd6fff8', N'Villa Flandria Sur (Est. Jauregui)', 460600, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ccb2bbb1-3ced-4e6b-875d-5d64b482770c', N'Santa Clara', 561538, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2419eab-0ae9-4f6e-a4dc-5d6b437331b1', N'Sancti Spiritu', 655193, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2009ddb0-a302-4528-8509-5d6c32642e13', N'Hinojo', 56748, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5cda8553-32d3-421c-8dab-5d7db3c8b781', N'Las Lajas', 5890, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90644976-c4ff-4b52-a080-5d80c9822712', N'El Chañar', 931877, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d210526-81ec-4396-9d65-5d8535758403', N'Julia Dufour', 984901, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1fd980fe-48ce-4edb-9bd0-5d95a3390967', N'Gaiman', 718319, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3cd2cb83-a5ee-4e30-a454-5d9ce1329067', N'Villa Saboya', 488554, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9034799-fffa-4a10-95e0-5d9e7102b547', N'Barrio Tres Luces', 786574, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'101c238d-18e0-4c1e-ad98-5daf95cfb343', N'Huaycama', 116026, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce717253-a584-405d-902f-5dbdcd3ddba9', N'Las Cuevas', 831448, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'052c5398-b0da-434d-8bae-5dd15944f544', N'Canning', 991456, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1e72d76-67e7-48e7-9230-5dea3c266b07', N'Chaupihuasi', 648585, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a279cbbc-0b75-408b-9930-5deb4e6e8e77', N'Lagunita Salada', 768811, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'547f35f8-391e-4420-81c8-5deebf7bdef2', N'San Jose Del Rincon', 395244, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4971b516-4204-4121-9b14-5e2475bba41f', N'Buenos Aires Chico', 756818, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8f693f9-5ca7-4903-9fac-5e2dbb85cc76', N'Moquehue', 380561, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'876dc189-4ba7-4660-9b8e-5e397a88cb73', N'Bernardo De Irigoyen', 713755, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'52f38cc9-5881-449a-8053-5e580d8ea4b3', N'Colonias Unidas', 509858, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd1e7c1e-1af1-40ad-bd0f-5e7065091229', N'Puerto Arroyo Seco', 303772, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd80cfdf5-2c52-47b5-8f7b-5e74c81ed755', N'Santa Ana De La Puna', 708715, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'29272298-b0c1-48b5-bed6-5e753855ec61', N'Magdala', 702356, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f4b0ddf1-c2e2-4a59-b7a6-5e8ea04259f7', N'Colonia Mayo - Barrio La Milagrosa', 382406, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97a78c38-b0cb-409a-bc42-5e98b77e60a6', N'Alba Posse', 432341, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c727bc9-d102-4c95-a816-5ea3c6f1a11e', N'Maria Juana', 122156, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'786e3133-4e0b-41fd-a313-5ea913e6bbff', N'Las Oscuras', 163448, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44d520b5-29fc-442e-96ab-5ec9c4feab5d', N'Bahia Blanca', 307001, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87c81268-6110-4f80-b538-5ec9ccb54861', N'Coranzuli', 959520, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0795e32-9044-4ee4-84cc-5ed8a33ca566', N'Club De Campo Los Puentes', 504362, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1b9e9c4-ee04-42b2-ad80-5edc3621bc41', N'Aguada Cecilio', 571264, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3d0b7c1-c436-40aa-abb4-5eec7a95103a', N'Villa El Tango', 289967, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c47babb9-09d7-4c80-89d2-5efab94dbc82', N'Los Pinos', 89276, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'120a3433-a62b-49e8-add7-5efce0b85ed8', N'Goyena', 137459, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec061c9d-5f14-4127-9a90-5eff837cd768', N'El Charco', 123694, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ad03894-2f1b-4d96-a9ec-5f06dd0deae0', N'Perico', 81700, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47de2abc-0c0d-40eb-b076-5f0725631f1e', N'Alto De Los Quebrachos', 336122, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79222a26-a1c4-488b-9534-5f07c213047b', N'San Jose', 260930, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ab4173b-1ae1-42e1-a17e-5f1b2c6e89e7', N'Las Aguadas', 441699, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec163251-881c-47b1-9bbe-5f1f7907e2ea', N'Maipu', 760722, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ac5f74a-7b59-491b-9ff6-5f211534b45f', N'Barrio La Esperanza', 316550, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10bced1c-5b70-4b7e-b0b9-5f242ed47996', N'Carro Quemado', 727725, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7abf0769-9eeb-4d23-a25f-5f24d6a182b1', N'Coronel Olleros', 455636, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cf9aeaa5-2ca1-446e-bfa0-5f362f9779a4', N'Santa Clara De Buena Vista', 409552, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90808520-9369-43b8-af61-5f4266f760b8', N'Tolombom', 793006, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'802409f6-411f-4df7-924a-5f567234b5eb', N'Bovril', 62385, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e72da13-f4a8-4ef0-9272-5f6c2ee6a19c', N'La Puntilla', 143870, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c83921bb-74cb-45d2-96e9-5f6f0c359863', N'San Miguel De Tucuman', 177466, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'059a59b9-cbae-495c-ad7e-5f77b8dffb10', N'Barrio El Coyunco', 63058, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98c99576-a4cf-4d4c-a684-5f8db2a935ba', N'Quebrada De Luna', 916356, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8cf613bd-0c40-49e2-905c-5f988adac71e', N'Presidente Sarmiento', 121164, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'251b636c-f30f-4a5e-a411-5f98eeaa9d1c', N'Salto Encantado', 385435, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46befec4-6c17-4454-870b-5f9ce0cae624', N'Tramo 20', 191682, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'19428f25-d758-4a93-a732-5fa46fa3b33a', N'Capivara', 58872, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00a44a2e-9b54-45ab-aada-5fbdd09eccdf', N'Ingeniero Maschwitz', 106750, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'32d8bee6-cf52-46d5-be64-5fcfb1a271f0', N'Silvio Pellico', 784072, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59702c6c-0902-401a-8d20-5fe4aa32a69c', N'Tres Arroyos', 544760, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da69d92e-165c-48a7-845c-5feb86f5160b', N'Las Arrias', 663457, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9625361e-e304-4658-9431-5ff1a5fd5f5e', N'La Violeta', 161347, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8fe15a6-6324-43a9-9e94-5ffddc08398a', N'San Francisco', 163309, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'37962d9d-10fe-405b-a87b-60013c4de987', N'La Aurora', 400231, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0944bc3b-cd4a-4044-9ee1-6015933b8e18', N'General San Martin', 26872, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'296ddca7-c96a-4c3b-99d8-6059da297bb7', N'Los Molinos', 448204, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'765af8a5-7dcd-4bee-b5dd-6063bdaa4c03', N'Barrio Aeropuerto', 968868, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2b244a5-fb11-46bb-8380-606abaa21dca', N'Colonia Elisa', 721673, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b54930bf-6050-41c0-aaa3-606afef1cbbf', N'Rospentek', 4694, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4be80af4-1828-46d9-9c6b-60870e6a863c', N'Santa Clara', 712371, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63fead0c-5d4e-45ee-a80a-6097476c9b99', N'Rosario Del Saladillo', 258622, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ab58d5a-7484-4945-8f38-60a27c68a97d', N'Los Soria', 701918, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1b1d586-0ee4-43dc-9c6d-60a373367c19', N'Tres Picos', 140958, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd50bfb4-398e-4549-b91f-60c3addb54c6', N'Federacion', 16333, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e37c351-76e6-49d9-a682-60c5428c3ea3', N'Rama Caida', 810510, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'405db500-b801-40e9-af33-60d595741c38', N'Indio Rico', 202624, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c1110a7-0359-49f1-a740-60ec162a8eea', N'Barrio El Pacaa - Barrio Comipini', 43429, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b778308b-7f19-4ac6-a803-60f62f661f12', N'Santa Elena', 101341, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'281dab6e-fb69-4b5a-b937-60f7b2fa12d6', N'San Agustin', 50197, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8e737f2-6f07-4b2b-be36-610821dd536c', N'Rio Cuarto', 951692, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5035d23-358a-46b6-b78e-61188881316d', N'25 De Mayo', 83000, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27abdd9c-7bcd-4f3b-82a9-6121f6d875a9', N'Amaicha Del Valle', 95358, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1dd7f666-bf8e-4c0d-8e87-612b98464a2f', N'Laguna Vitel', 368481, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4fdb177a-8e75-4447-9125-613113e0a69e', N'Enrique Carbo', 522557, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77a817b3-08ad-4a64-9047-613447ff587b', N'Paso De La Laguna', 97782, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'66789879-4569-4f96-9699-613aa96f2b06', N'Corcovado', 630490, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'29f040c9-36fa-4e31-a1d2-6153cf036be2', N'Larroque', 999431, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9e77071-6df4-4313-b80b-6166e7626699', N'Capilla Del Se¥or', 276991, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2412da6d-6bef-4a61-8f57-616e734fd1e9', N'Campo Viera', 769156, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ae84081-3b09-492f-857e-618b991123d9', N'Esteban Rams', 581151, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8b35403-b455-4022-84ed-61f795d3594d', N'Hipatia', 355755, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'667ae0e2-049c-4460-9283-61ffe80a7a57', N'Villa Independencia', 44097, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd88468eb-da7a-4110-b599-620078901eaf', N'Dos De Mayo Nucleo Iii', 233171, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06ff0661-7e74-40b4-9641-62222a88c936', N'Orense', 239088, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6edd36d1-26c1-46d6-82ca-6223a95ff1b2', N'Colonia Hinojo', 103851, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d9b9645-5701-46a0-8063-62246dc937ce', N'Salto De Las Rosas', 262359, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7cfb13c4-aa81-4d36-b353-622864e5b80a', N'Cuipan', 654156, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85e2031e-7b26-4abb-a795-6229f199fa12', N'Villa General San Martin', 752705, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76e4241c-851e-475e-8466-622d84dcdf24', N'Santa Florentina', 356738, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20ee2e39-0e86-40eb-a9d4-62393b4c0ce3', N'Fontana', 437846, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'12f6f779-82c3-4a5d-a20e-624937c4373f', N'Los Pirpintos', 215693, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'036b702a-f0a3-4efa-9172-62605fd11d60', N'Naico', 648376, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44cfd937-f30b-4c47-898d-62821cc55600', N'Sargento Cabral', 136826, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8047302c-b9b4-431d-aa64-62824bbd4f6f', N'Ranchos', 411003, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f465c030-f46c-467f-9f2a-6283ad9e18a4', N'El Alto', 507792, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'62404572-ad2a-4bbe-b55b-6298bc519bdd', N'La Majada', 49372, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c85ed70b-63ed-485d-8d30-62b5eaa3c007', N'Salvador Maria', 124149, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dad3d064-4a4a-4969-9484-62bf3cb36fd3', N'Pajas Blancas', 400183, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ceeb162b-255d-4a4d-aa9c-62c510d31330', N'Benavidez', 912639, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c415bc8-7e9c-49dc-ae89-62c8db56dabf', N'Dolores', 829527, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93adc85f-4c00-4850-89e5-62d3d56d393f', N'Velez Sarsfield', 825448, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d156efb-e6c8-4ae4-9535-62da62a895ff', N'La Bajada', 482849, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bea9a85b-ecce-4e8c-8f7c-6302928529ae', N'Tres Luces', 161217, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aefda6cc-b8bc-4d9f-a050-631ea67fbfa6', N'Ex Ingenio Lujan', 671308, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d7904d4-bc71-4f27-b509-631fe8927942', N'Saujil', 305165, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bcabde71-f556-4f47-842c-632aa1b34f05', N'Tusaquillas', 891955, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2128f558-cb95-455d-82ba-633676c73a16', N'Gunther', 474115, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f6cb9977-42dc-4968-8be3-63375f06e04b', N'Rio Seco', 887803, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6cc46503-ef5d-4681-8f78-633d44d89fa0', N'La Plata', 73171, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04e2320e-7d7c-4104-8743-6346558bd71e', N'Campana', 312476, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f0eae1d-f4ae-427a-be10-63497f99145b', N'Aguada Guzman', 489409, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6edc90f7-14e5-471a-aa7d-634c2a4a899e', N'Justo Daract', 902915, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'129d6bf7-95ff-44eb-998e-6350b433dc33', N'Country Club Los Caldenes', 845790, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e3bce8d7-1a0f-46bb-89e1-63572040eef0', N'Manuel B. Gonnet', 420271, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9b1573cb-a490-4d83-9b57-635a7c6e4d5f', N'Formosa', 893817, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90523fcc-5954-4643-af38-636b0ead35df', N'El Pueblito', 254114, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ac4b1a10-6d2f-4a86-9c17-6387846eca14', N'Salto', 775260, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'766afa98-7b4c-4e0a-8039-638bd930ddda', N'Villa Allende', 115224, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63ed2eca-ca0a-4b2f-88b3-63bee85934fd', N'Capitan Caceres', 793050, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9d600798-1d36-4926-b0af-63c05c4fb1c2', N'Cieneguillas', 294445, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1fd0895-2a43-42a9-8a90-63c07002317e', N'Las Catitas', 691256, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b8f6697-c374-4e8a-9a10-63c34f184991', N'Tronge', 502955, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4383c693-03d7-4c66-9d1a-63d95ca6173a', N'El Cajon', 901110, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54be3429-fd90-4aed-9f8a-63dec0331f17', N'Barrio Municipal', 89362, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b37cbf0b-38aa-4949-994b-6414e527ca2b', N'Marull', 836260, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'be4adc0c-c13a-402e-9930-6419a3c388a1', N'Clemente Onelli', 816351, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ecd0093-8c6e-4076-8cfb-6427ea5c400e', N'Country Los Medanos', 102357, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8addeb88-4e4f-42cc-91c5-644311c4ae0a', N'Tres Lomas', 704347, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a64cd08c-d73d-4558-8bd6-6446e3258454', N'Sanabria', 955934, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1206558-250a-432d-a249-646b219ed61e', N'Villa Amelia', 367988, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61ca5615-8f61-4485-bbdc-6482728936d6', N'Bella Vista', 427726, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'004e1b12-5f59-424f-b98d-648ea8de0743', N'Florentino Ameghino', 631274, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'34ff38f6-1adc-4b28-9b3c-64a4d7fa8934', N'Capiovi', 964140, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a4cde50-5b5a-4411-a1ad-6500ea19f3d8', N'Fraga', 455401, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56912d12-23b7-4dfb-bfe6-6538f13b4ab2', N'Pila', 508594, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45dafcf1-3b5d-4923-9e68-653ce6dde7aa', N'Treneta', 963515, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'293125b8-74c7-4111-8404-653e7d4d7a6f', N'Santa Rosa De Calchines', 333306, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41f9397f-0b05-4344-8900-6553c083a34c', N'Saldan', 901007, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd28a3db6-ce13-4614-b764-658817900965', N'Febre', 690558, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9d669609-352c-4da6-8523-6594093d27eb', N'Lastenia', 967244, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f453cea9-fdf0-4bd9-b3b5-6594c1edd116', N'Minerva', 217688, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cef7272d-3f21-4086-85f3-659db25ef8b9', N'Colonia Alicia', 142055, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa22da39-83f9-4bd3-bf49-65b598f0f07a', N'Estancia De Guadalupe', 335031, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc3c8457-c86f-4c64-8fe0-65cfe0a3a262', N'Maquito', 892016, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'766ca54c-d4fd-49c0-97ff-65e49f720585', N'Caballito', 340554, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93965fb9-2902-46cb-a83c-660bd81803a5', N'Santa Fe', 818531, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64b9e27c-d0be-44fe-ad61-660d628d11e9', N'Amanao', 249502, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a47f5cec-07ff-4d50-9b2f-661b3b56beb1', N'Las Garzas', 998188, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99129dec-e568-44c4-be70-661c47f97fea', N'Santo Domingo', 605193, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6adc3bad-fb81-423c-9782-661c92c41f5f', N'Jacinto Arauz', 645665, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e64094dc-c92d-44f1-83fd-662423204e9e', N'Junin De Los Andes', 310543, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67cc48aa-a514-4b80-856d-6636d54ae40e', N'Barrio Belgrano Norte', 773453, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c740d75-ad6e-43d4-bd4b-66426614d281', N'Vi¥a', 419632, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'40265486-bef5-4af4-98d4-6642d4932ca3', N'El Cadillal', 202125, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f38f2164-a7fc-42dd-85b1-666e2fb1cf19', N'Las Coloradas', 867525, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4c2f84f-8f3a-4dac-91b0-667314bfe48a', N'Las Encadenadas', 402634, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e938404b-c12d-454b-a6d8-66800b8f189f', N'Tunuyan', 394321, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f50bb84c-245d-4dc8-b2a5-669da8aa3fc0', N'Villa Catela', 391567, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'403bb650-4c89-424c-8548-66bac14bee5e', N'Gramilla', 374488, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffe3c56b-03df-423d-80a9-66bd165d6393', N'San Roque', 618061, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fde58772-9143-4216-958b-66e861307fe7', N'Tezanos Pinto', 617143, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd016a08a-0ad7-43c4-a5f4-66ea5ee8fb53', N'Tolloche', 777026, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0eb23a66-dc96-4e99-a8af-66eaf8e0365f', N'Hermoso Campo', 987508, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0db8ecf9-e54d-4c71-9c1e-66eca7713df6', N'La Corita', 609467, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e8e900d-28c2-4c83-a4a3-66fab9603282', N'Colonia Ortiz De Ocampo', 699543, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb845bc6-66f6-431f-8f06-66fb14f9049f', N'Rio Del Valle', 511037, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca0f6784-43ad-4124-a8ac-67420a0eb100', N'Posadas', 689888, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47d39166-74f1-454f-a846-6781eeac8eb7', N'Villa De Leales', 497253, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d3425c7-e91d-4040-adc3-678f48281c5e', N'Patay', 431792, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41e62f3f-0c57-443d-bd87-67995894f6fe', N'Talaini', 27660, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b735221-62e4-4132-be89-679f6332ea24', N'Alejandra', 497846, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a1a2c3a-4dc6-486e-ad23-67a5d418c3de', N'Barrio Esperanza', 378591, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27364bff-4347-4047-9a15-67bb5a61f889', N'Villa Silipica', 941582, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5eca8b0e-b4a0-4c40-8e92-67c0a640f1a9', N'Los Angeles', 707801, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23c66291-b31a-49c6-8da3-67cb73248e9c', N'Calabacilla', 675004, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'903a2738-32e0-474e-8513-67fd906b0385', N'Fortin Olavarria', 548807, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ee00e66-2803-404b-b293-6803f37090ee', N'Villa Rosa', 735492, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4de9371-bc7c-4d25-9a38-6808b2140397', N'Malena', 969132, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'222b11ec-4601-4309-a55c-680ae8b0355a', N'Valle Hermoso', 168518, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f731ae4c-552c-4df0-af64-68299ac1b4fb', N'El Sauce', 975952, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af6ad3d6-ce88-4b84-83ef-682ad315c43f', N'Carlos Keen', 684640, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f2de8fa-9d8f-49f6-aef1-682fa2d26603', N'La Colonia', 64142, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea9f428a-8aa9-4dac-88f9-68497174afe8', N'Colonia Las Pichanas', 552383, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6e526c8-a595-47ec-b2cb-685b3581e186', N'La Reduccion', 410660, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b11a7b3-7c37-423b-b565-687206fe92b6', N'Colonia Fatima', 394132, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'629c6024-d2b3-4da3-92b1-687672b226c7', N'Chaupi Pozo', 554191, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1dbc8c19-db91-4426-8044-6885f8328689', N'Rio Grande', 845831, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9eda5dd5-7c71-46c6-8307-68862c14dca2', N'General Rodrguez', 607307, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'53e0f843-16c9-4ed3-8e46-68892cd7c21b', N'Gessler', 500859, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04596da2-89da-4653-b95a-68bb94b38d28', N'Sargento Vidal', 298059, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98fb8218-3bd8-4f97-b120-68c5dd8eb487', N'Villa Del Parque', 99391, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9b0bfbc8-7d5f-4e0b-9f9f-68c7a280345e', N'Correa', 988927, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c9b0c85e-b270-4b48-9415-68cd63c89ef5', N'Socavones', 894197, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'482b5423-d47f-4ac7-abd9-68e1d730e29d', N'Villa Coronel Jose M. Zapiola', 530392, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'37352c60-327d-4be0-96f5-68ee5bca72b3', N'Aerolito', 416403, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2e05752-788a-4155-83ec-68f0f6064db0', N'El Puesto', 312304, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60af9ed1-651d-4b58-ad37-68fb73215199', N'25 De Mayo', 268916, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0253fe8e-8f63-40d6-b4e0-68fcef5eb3c6', N'Martires', 566778, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76dc7842-3027-4ae3-b08e-68fee3db361d', N'Villa Adelina', 876703, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9cee95b4-f90e-423a-8122-694fb1596cac', N'Salinas Del Bebedero', 675451, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d35e97f-c599-4f7f-afd3-69539a354af3', N'Bengolea', 641079, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e02ed9a-61c8-4133-822e-6956b4e945ea', N'Caraguatay', 438838, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c136d9b-c524-4bda-b402-696693f9e05c', N'Caseros', 243960, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'66ec77b6-8912-41ac-ade3-6979c131ce8e', N'Barrio Carrasco', 103549, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5d50060-3702-49a3-8a05-6990f1f30610', N'Comico', 985671, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'624703fb-3809-411a-894b-69974d87a642', N'Pampa Vieja', 475023, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ec20353-8703-4a3f-849c-69a2d34175e4', N'Canals', 462635, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3cd19544-f85c-4980-aaa9-69adcd5684a8', N'El Acheral', 496860, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'def1f0f5-b3bb-4fa9-8462-69b89746050a', N'General Gelly', 931727, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3c2a482-2109-4efa-ae4c-69ca11f7cdac', N'Sanford', 479610, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf7a183f-23d2-4149-bac8-69d501b67d4e', N'La Paquita', 61918, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b12cfc57-23b5-4d78-b8be-69ec6e9e5e73', N'Pomancillo Este', 97324, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebd54db3-0f18-499b-85e1-6a0e0f212b9d', N'Barrio Mutual San Martin', 697327, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56eeff16-2189-407a-9a1c-6a43c461955a', N'Collagasta', 720710, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b692683-6e2b-46be-872f-6a5628f8bf4d', N'Capitan Sarmiento', 682315, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26b34a54-22f8-4f57-9bfa-6a58de96d714', N'San Francisco De Laishi', 936617, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7efeeeae-06de-4eda-9773-6a59e7965491', N'Aldea Brasilera', 389670, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c0d6221-93ce-4240-965f-6a5cf585e96b', N'San Carlos Sud', 434210, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'143b201e-6ee3-4924-9a0e-6a5e9f1258aa', N'Barda Del Medio', 326405, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f9340e76-350c-4e51-802b-6a721f04e566', N'Puerto Leoni', 126746, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8e1ae5f-b71d-4afa-9890-6a7b124853db', N'Yapes', 497960, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ab8b7ef-3ad4-49ff-b28d-6a96577d807f', N'La Rinconada', 210963, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b3f4b81-77d4-4286-a6e5-6a980daf24b4', N'Vicente Lopez', 550573, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a9b0ece3-00d9-44c3-a5d7-6a98c01d243a', N'Isca Yacu Semaul', 34827, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3734b3ec-a08e-491e-8a81-6aa6ffc6c0cf', N'San Ignacio', 41756, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'95bf4ed8-faeb-477d-87aa-6aaec12fed83', N'Rauch', 637791, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b43aba5f-3ff7-4a76-823b-6aea82ae7aeb', N'La Luisa', 443133, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f579c7a3-7297-404e-9bf3-6b144235de89', N'Rucanelo', 569513, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'683e4f59-9b1a-405d-9c5a-6b16fe84e7ed', N'Pla', 713815, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ecf905b-5b1a-409b-a318-6b176024b4d4', N'Agrelo', 977015, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'619bc4cb-e9bd-4674-a21f-6b28d6d1e71f', N'San Guillermo', 460880, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'048f150c-fe23-4ea9-b015-6b4185647ec1', N'Yacoraite', 75234, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'40e19788-a371-4db4-aace-6b4683423f5d', N'Barrio El Taladro', 37102, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47d7d7a2-b2b9-49d7-a981-6b48d430dad9', N'Paraje La Costa', 824724, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'154619f5-85b0-4c06-976d-6b4abcc447f4', N'Barrio El Congreso', 439354, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'679bd526-5e59-4bae-be97-6b4f430c5afb', N'Ubajay', 103994, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6e2faba7-192f-4734-8f1d-6b589186e9f6', N'Paternal', 255610, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'efa29e3e-9066-42f5-aefd-6b628ca5053d', N'Esquel', 54047, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43c670bf-7924-4955-9371-6bb129df938b', N'Villa Ventana', 534764, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'721140e6-5558-47b2-a110-6bcb481f8246', N'San Emilio', 509688, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e93a8311-92e5-4fa6-9408-6bd9f26e0ca0', N'Emilio V. Bunge', 230336, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cbdb1ff1-ca2b-47be-898f-6be7e134e736', N'Talapampa', 798721, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc81fa44-44cb-462b-93d7-6c02e38fb7ae', N'Villa Campi', 201638, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4541f00d-4728-4d08-a39c-6c2039214189', N'Aldea Grapschental', 632221, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44f12457-e68d-4dcb-b502-6c265698ae67', N'La Carbonada', 303644, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b11ccdb-4e46-46a6-932f-6c39b5a1bc3e', N'Margarita', 279895, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35f2af58-51bf-4988-9366-6c39baef9934', N'Carlos Tejedor', 606830, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db52cb67-9f61-4f8a-a751-6c3d8a8ad1a0', N'Mina Clavero', 553916, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'555a5caa-cbce-4024-98ef-6c50073276be', N'La Calera', 252692, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c34cd9c7-85de-4dde-83fa-6c5cac93b126', N'Hersilia', 998656, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93e16c73-5882-40fd-98b1-6c850cff27a2', N'9 De Julio', 64047, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1445b484-be99-4499-8f47-6c8d58577197', N'Campos De Roca', 575886, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9d3a65ea-71d4-4c1f-92de-6ca345c2f8d5', N'Sierras Bayas', 703663, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebee40c2-cb6e-4c0e-a2dd-6cb0965a2bcc', N'Villa La Rivera', 331383, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86d1e853-5caf-4aa3-8e11-6ccf45b4498f', N'Villa Rio Bermejito', 334350, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3296529e-b15c-4454-aacd-6cd8e8c89fff', N'San Sebastian', 773515, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a222105-46d0-41ab-b6e4-6cf8bea5a165', N'Alpa Corral', 339656, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0dbd808b-84c4-4b07-a4ba-6d17e1b39d1d', N'El Cimarron', 125543, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa335f4e-a562-47d7-8478-6d17ea7a85e3', N'Villa San Carlos', 986651, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6db0ac03-ef27-4001-bd06-6d34bea1443f', N'San Vicente', 596534, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06eb62b7-a5fd-4aaf-b372-6d3d6927be82', N'Potrerillo', 131960, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9f4dec03-2860-41aa-bf6d-6d69b73e5cf5', N'Parera', 496774, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f624d45f-9817-4d28-a951-6d6b9df98361', N'El Rastreador', 550939, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65695710-dd98-4e2e-9710-6d8862f8b8a5', N'Coronel Moldes', 64717, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1d31e45-b240-429f-a316-6d8f4ef7b600', N'Sir Leonard', 444669, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9554a75e-7a54-44a5-badc-6da567736642', N'America', 622426, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'754eac86-a860-4ddd-acad-6dbf46a0e786', N'Taton', 9770, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d6f242b-377e-4efd-b1ff-6dc0292c909d', N'Jose R. Gomez', 66018, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d70e765-3ac5-43ec-acab-6dd11566545f', N'El Colorado', 926123, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8ea898f-dec9-4d0d-bd45-6deeaf13eaac', N'Fuerte Quemado', 377207, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65de3887-92f2-473d-b6f6-6dffe0a46102', N'La Rinconada', 113387, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0991b048-5034-4a39-a601-6e091d8bc8ea', N'Durazno', 6939, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5169d797-2a3b-4ab9-82a3-6e17b445017d', N'El Alamito', 217806, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c2b79cd-9f11-4816-9f74-6e1b6d1be889', N'Corrientes', 425087, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb5b337a-5a28-488f-9eec-6e2aa9552189', N'Nueva Trinidad', 515126, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da0edfc9-af18-4a51-afd8-6e3de0e0d4f7', N'Villa San Jose De Vinchina', 502868, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f074a60b-9c3a-434e-a46b-6e527ee8bc89', N'Avellaneda', 405076, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1bf6149b-f7e9-4065-9bac-6e619120451a', N'Tartagal', 24169, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bdc21360-ebdf-4009-9fea-6e69fc07edb5', N'Dorila', 168341, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef6d113d-20d9-47a9-8eed-6e723473e674', N'Colonia Valtelina', 281981, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c21ab718-d8ac-4f5b-b7c2-6e746f4b30ea', N'Cañadon Seco', 937913, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'29b64717-cceb-4f4f-a5a9-6e823e3fe5b4', N'Villa Pituil', 989170, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86736b05-e0c7-4371-a291-6e99161444ea', N'Barrio La Palmera', 503196, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26f66eca-1f17-4d30-8107-6ec9ad5ccd04', N'Villa Independencia', 899941, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'425e8240-dd60-4931-bd77-6ecd53acc079', N'Chos Malal', 578020, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6fdee83a-7db4-4e29-a30e-6ee82914dce5', N'Macia', 722865, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'667de0b5-bf3a-4c9f-aab4-6ee953b96588', N'El Rabon', 774790, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'29e7765c-c889-48cc-9581-6ef34b3d9e3f', N'Pueblo Comechingones', 478820, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fda4ac6c-f002-48fe-98c9-6ef9b6203d10', N'Rojas', 710036, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75b4e64a-7908-4f74-8f9d-6f171f2c2f24', N'Vaca Huañuna', 944899, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3be434b-220f-4533-96dd-6f1a6df8ab17', N'El Mirador', 670762, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7d00dc55-63f8-4c1e-9823-6f21a59e2861', N'Sijan', 31939, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e51e4cf8-8571-4f05-b97b-6f28f0f5e05c', N'Las Mojarras', 881889, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77ff6653-0c44-4954-aef2-6f310597e34a', N'Colonia Belgrano', 869640, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b002a5c1-fbac-4469-bbf3-6f3be47aec0c', N'Juella', 689435, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3a619a2-f6b0-42c9-89b8-6f3dc75a3d36', N'Mariano Moreno', 469889, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d5be313-8015-4016-b0bf-6f411dcd8465', N'Galvez', 502802, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'222d24d1-bcb2-4b82-a4de-6f44c8eacf09', N'Loventue', 475641, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7c01ba0e-ad64-408f-8f63-6f4591bf0eb4', N'Darwin', 690006, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd180e471-c619-4c63-897d-6f581299a21f', N'Ituzaingo Sur', 215371, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b313904-45fd-4821-9538-6f591300f8f8', N'Colonia Elia', 459605, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a6a31450-5918-4e44-81c6-6f659340bc9c', N'Huillapima', 284625, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb9d3905-d54d-4474-9a22-6f715dbd38e5', N'Tio Pujio', 458149, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8f0efef-c420-4865-877d-6f75d54cef62', N'Comallo', 882532, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c776417-0b5c-476f-bc8c-6f9ba5cf781b', N'D''orbigny', 786179, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7dc8f8f7-5a29-4d08-a8ba-6fa16b85f960', N'Santa Teresa', 25433, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99b482ea-65ac-4dcb-aa2a-6fe6bdf29ab0', N'El Pingo', 640149, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebdfc088-29f1-4755-bd6d-6feaf15877d5', N'Diego De Rojas', 735201, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'16bf1b43-64cc-4684-b0f5-6ff63fb60181', N'Manzano Amargo', 632363, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8044a73d-1bb4-43d7-9238-700044e8ab8d', N'Estacion Robles', 609704, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83dcfe98-95f7-479d-9d25-7033ecde1158', N'Cosquin', 931269, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b9f31638-9ec6-4e1f-9a8c-70403d4198dc', N'Comandante Luis Piedrabuena', 979721, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7d28fe9-5506-42a8-99cd-70668eb72dc1', N'Barrio Escuela 461', 740182, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c22011f8-a3e9-44e9-9bdb-706951fa9d3d', N'La Verde', 214943, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8831c79a-1b90-469d-bc7f-7074b2e977b4', N'Barrio Las Angustias', 546893, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e00ac0a-865d-4ee0-8f35-70800b2c8b47', N'Pilquiniyeu', 153117, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5cbef14b-8b41-44fd-95f1-70a3af3b55e4', N'Carlos Spegazzini', 782571, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2cacbec5-0616-4d6f-be50-70c3888e44ff', N'Piedritas', 942577, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8733f8f8-b53a-492e-b479-70c778d43768', N'San Jose', 946759, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'530714df-05df-4b6e-a45d-70c8f951bbdf', N'Olaeta', 444454, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1c9c3b2-1a2a-4137-bdae-70d02cd796bc', N'Antelo', 146149, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'68f2866a-e39f-41e4-a81d-70f51fab6c59', N'Colonia Las Rosas', 808798, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86489033-b018-4e12-90f5-70fa86647a76', N'El Corcovado - El Torreon', 231862, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'688a18ff-6c7b-475e-82c9-71020fcd0d43', N'Villa Ortiz', 396402, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da241a2d-3d65-475e-a381-711c2b6b3cfc', N'Lima', 71953, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da66fbcb-5e3a-4767-8514-7127582ccf73', N'Alumine', 828624, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'184835b0-477c-434d-b0ad-7128809ba9ea', N'Montecaseros', 40682, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7371851-b9bf-4e9e-ae15-7142ea5d85a7', N'Puerto Piray', 831780, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8bcb0c7-616f-48b6-98b2-716559c071ac', N'Susques', 345525, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07b40f97-31e8-47cb-9036-71721b3e15d5', N'Maria Teresa', 182811, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c5bf546-2443-4dfe-9b8b-7183bce90de1', N'Aparicio', 904556, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57fd518f-bee9-4830-b5c8-719de2859ab2', N'San Mauricio', 783199, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a90ab441-1560-462d-a28b-71aba5c9eaee', N'Banda Del Rio Sali', 57329, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e635a59d-3d87-4a79-bc16-71b7b303a3b4', N'Santa Eufemia', 379434, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7338e980-8ed9-4ba1-87f6-71e0022bdacf', N'Dolavon', 419880, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'869600b2-0292-456a-a926-71e3ec192036', N'Pampichuela', 952290, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'55083ebe-181d-41f2-8bdb-71f8a2d10e0b', N'Blanco Encalada', 744023, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e7db2310-fcd8-479b-a517-720220a68dd9', N'Alberdi Viejo', 630468, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'333e0889-eb8f-4562-a007-7206c863e9e3', N'Carpinteria', 910814, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67046fd4-3782-4cb4-b4f6-7209c4056522', N'Chuquis', 389305, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'857a03a8-34f8-45cb-9b5f-720d4de9cf3d', N'Barrio San Jose Iii', 445981, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'523f33a9-c5d2-4f86-adde-720e5644b5ee', N'Los Troncos Del Talar', 126010, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c396e84e-7760-457c-a12e-72184349fed0', N'Santa Sylvina', 231270, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ddd9b84c-2da8-4d1f-b76c-722423a4afdb', N'Lucas Gonzalez', 72220, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6e25e182-61a6-4c22-865f-722451f85947', N'Alto Alegre', 371276, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6fff8761-5f1e-43e7-9b6e-7245d13f337d', N'Cipolletti', 593607, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'25a8c6f2-3d7e-424d-af83-7280396a40ec', N'Colonia Almada', 826482, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6535794e-844f-4f12-b771-7282122d9ac4', N'Norumbega', 902546, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b9700ac-1c8c-4eeb-97cd-7286dd215a3d', N'Abralaite', 545686, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'84fc2a8d-97a7-4e90-bf34-72a304724841', N'Barrio Sarmiento', 330803, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1ea46cd-e3b5-40b9-a27e-72a9a091c0c9', N'Argerich', 7907, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'09426168-dadf-4c62-9cfe-72af8308519a', N'Tres Sargentos', 839225, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a402b921-6c4a-4d5c-9c40-72b4b3c3fe56', N'San Patricio Del Chañar', 401429, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a223f2d-4c1a-4236-8ac5-72bb99229189', N'Villa Chicligasta', 957916, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'25833328-9fa4-4af2-a21b-72cdf6f82c30', N'Divisadero', 575403, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54d808ad-a17c-4f8e-aa16-72f28c1efb34', N'Plaza Huincul', 473547, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea19a777-fbdb-440a-9679-72f71f1b5e91', N'Villa Roulet', 651344, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3af3eaa8-a8d6-4e10-a8eb-72fd7bf48624', N'San Felipe', 229489, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa673264-d4b4-4ed9-887e-72fed3d90b77', N'Las Tejas', 365449, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa2db99d-3a18-42ba-bf6b-72fef3850e53', N'San Telmo', 496266, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c55db985-0936-4a01-993b-730b60808bc0', N'Antinaco', 238396, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f43c247-aee3-4895-bbca-730f7a2768a8', N'Cabalango', 861418, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b42c1fcb-e038-4cf0-b0fe-733f8a749ebb', N'Valentin Alsina', 990485, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a961103-2a5e-45b5-ab36-73445ab11b99', N'Coronel Baigorria', 922876, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b10e1986-697c-4388-9d2e-734895611baa', N'Resistencia', 106718, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'885ef295-392c-45c8-8359-7366b5afe7fd', N'San Antonio De Padua', 810739, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1266b6a-32fa-46a6-b780-73680f0fbd17', N'Puerto Deseado', 577821, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7716c900-49fb-4540-aa9d-736f2243d58c', N'Alvarez Jonte', 546899, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'948511da-f1b8-4e27-afd2-73746a8caac5', N'Concepcion', 419144, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85a7510d-4706-4adb-aec8-73775944d7c7', N'Villa San Martin', 494361, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6dfd411b-48ae-4c13-8d34-737acccc3a75', N'Aldea Salto', 922486, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f5cd380-7c2c-42b4-b32a-738783fca13f', N'Taninga', 978412, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'231dc979-2223-45c2-a04a-7395f1909b63', N'Santo Domingo', 999053, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a26e6d03-6c9e-4b03-808f-73a327093ce9', N'Villa Ruiz', 245925, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb246fda-abc3-4aed-aeaf-73c6184de936', N'Garmendia', 60697, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9bd79bc8-2f36-4744-983e-73c66a77c60d', N'Guamini', 823074, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1dab4851-bad2-4d7b-bb35-73da8c8472a0', N'Sierra De Los Padres', 332221, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'325b5d17-3223-45ca-90a6-73ed18431127', N'Diag. Norte - Luz Y Fuerza - Los Pocitos', 429, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93f1dad5-d4eb-4613-b172-73f9a9d01bed', N'Gobernador Juan E. Martinez', 760471, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38bca9f5-8d0c-408d-8f1d-74010b074a4b', N'Puerta De Colorados', 362477, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7193e92c-96a8-4029-a0d2-74018a5b97b2', N'Ñanducita', 937104, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'71996139-2671-48d4-8ecd-742081d961ec', N'La Viña', 83387, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c30a0c75-fc14-4c05-a02a-743e8a26c9aa', N'Colonia San Pedro', 883641, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'937ecf3f-b852-4076-8496-7450ce165a58', N'Los Altares', 106991, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c4c4f40-2074-491a-b823-7454c14ca96d', N'Casilda', 975744, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0857dc67-829a-49ec-a11f-74652efbd78b', N'Panaholma', 148390, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'351a78db-b8c5-4046-9696-7477473f3c00', N'Las Talas', 411242, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa74559c-c2f2-4d35-a28b-7484b3215a56', N'Bigand', 245170, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e31f079-21aa-4727-8a4e-7493d5f39c23', N'El Triunfo', 269470, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa3b571a-2a0d-410a-8b9b-7497dea22a10', N'Pasteur', 500724, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fbd245dc-1b0f-4225-b556-74a8b83a89f3', N'Patricios', 471699, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'224e0960-11b1-4a40-ba8e-74b010d6e062', N'Rocamora', 711234, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36f611da-432e-44f1-bc64-74b4b4404a31', N'Yala', 582651, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15baa29e-5ac3-4a48-a2b6-74b9e5602c55', N'Yahape', 769798, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23bca7c9-f332-4950-9a2e-74c4f73a2512', N'La Angelita', 455177, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c4e0cc0-e9a6-49c3-8184-74cc0707c7b8', N'Chalacea', 32697, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cea215d0-324a-4760-8260-74da04290612', N'Las Tortugas', 321613, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9d1b53c-e77b-41f3-83f4-74dc031a9f8e', N'Apoyaco', 39473, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1688259-99fe-4d03-b9c9-74e1dda3b4b0', N'Monte Flores', 746911, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a97a592-8bf8-4f0d-9166-74e85b4a4acc', N'El Tabacal', 438433, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5801cf3f-de10-48ec-9a20-74ef017e5bfa', N'Gobernador Duval', 63557, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cd39e86-362e-4f88-8c09-7508f96e01f5', N'Rincon', 959108, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76648cc0-2740-4fc6-8d95-750dca42fd7a', N'Villa Escolar', 779930, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c1ccbe5-3776-462d-8552-75112a68a697', N'Empedrado', 649865, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db3c7397-352b-4fcf-b292-752847ebe0b4', N'Laguna Alsina', 65720, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35d99ea3-3038-4855-b0d6-7539f04ebc47', N'Oriente', 427753, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c434af1-202b-475a-8ff7-756a3f808fa8', N'Colombres', 80143, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0797609d-d349-420f-85cb-756e2addd443', N'Open Door', 671521, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3a0e1b7-a4a3-4f41-9bac-75941fbd1965', N'Josefina', 944180, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b80fd31c-8673-406c-8532-75a4fccbab7e', N'Aaron Castellanos', 752357, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ac690094-ca96-4a96-9e28-75b424322387', N'Capilla Vieja', 955346, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c4e82c5-3dfb-4225-96e0-75b60df4d4b1', N'Isla De Cañas', 987632, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63d5ac15-f543-4d37-8590-75c19da49d69', N'Los Nogales', 910979, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a72202a-efc8-4db0-b489-75c474be997f', N'Agustoni', 904939, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fd85803-1b4b-48d0-b12a-75e1ee5dba3e', N'Barcena', 744728, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7f8830e-97cf-49ef-98be-75e8cfe80723', N'Colonia Del Valle', 893669, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4027f6da-7b54-48f7-87b1-7611de27d98f', N'San Jose Del Boqueron', 170655, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db299deb-430a-43da-9725-76188997494a', N'Vistalba', 834450, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'638ac54f-2ea6-4574-981e-762718d77815', N'Marcos Juarez', 257644, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'230990c8-32cc-47ca-96fa-762b7b3f0c92', N'Añelo', 932248, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'711fe65d-7020-40f0-a2bc-7630eed21a3d', N'3 De Mayo', 907155, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2d3ff982-b753-4b6f-b367-76674f1902f3', N'Villa Los Alamos', 277305, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e483b31e-ce16-46db-b143-7686798b1f7c', N'Palma Sola', 116478, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5300b0ed-54f7-49c1-a191-769dd40090a2', N'Suipacha', 38361, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a02b5959-44bb-44da-a27b-769df2632a4d', N'El Puesto', 818654, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c36ee708-97e6-4121-bae6-76a25fba8437', N'Miraflores', 825403, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'697dce34-c9d9-46c5-b581-76aade80ed9a', N'Huanchillas', 798829, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea2ebaf6-f9ea-40fc-9d5d-76cfaebbcd7c', N'Vaqueros', 609146, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b2f67f3-a727-4a6d-b936-76f6e7d9c8a8', N'Parada Acuña', 57978, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2141753a-37b0-4dec-9de1-76fc8c090c3b', N'Lamadrid', 659312, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c14922a-a0ef-4ddb-b2c6-7708b7032801', N'Santa Lucia', 127792, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebcbaa12-d7b3-43c1-bd1d-771c8f073fd4', N'Bialet Masse', 863331, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60c6405a-c63f-4c4e-a29f-773cc934fcf0', N'La Chimbera', 230785, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f3a0b8b-abd1-4dba-b764-773cfb495d04', N'Colon', 586425, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f9ef89d-53ce-4f64-8bed-77addca37cd2', N'Berdier', 890376, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06ddc647-210e-4ece-8ec9-77bcac5247cf', N'Ministro Rivadavia', 602197, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8df26359-5a95-4d9f-8034-77c9b6041876', N'San Fernando Del Valle De Catamarca', 603316, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7f633f2d-443f-45c4-9971-77c9ce2bc06b', N'Casabindo', 187617, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4eac3ebf-a37e-4c4e-aa68-77ce80b01501', N'Paulina', 464677, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'314fef82-40cb-448e-921f-77e22185f010', N'Gonzalez Moreno', 29749, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'789b98bc-f3f1-42c9-8249-77ea6c3ae517', N'Villa Akerman', 254275, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35c02085-f949-4ecf-99c5-77f2657342bc', N'El Palomar', 875575, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'25f1ab60-e566-4c56-9603-77f6eeac2a5a', N'Payogasta', 403404, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'292c7993-df26-4d3b-9415-7803ef8ffd27', N'Santa Cruz', 186135, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd07e3ca0-8315-4ada-82da-780fc2582990', N'La Posta', 318519, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9b1a4397-117e-445f-8db2-78297adf7225', N'Beron De Astrada', 446618, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe1346ec-d5ad-4a2a-907b-78388cad2ec9', N'Villa General Arias', 873370, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dcbb9a0c-1519-4ada-9bda-785cd63ed9de', N'Potrero De Los Funes', 627651, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2845dbea-955b-4426-9a23-7862b54fdcf6', N'Rodeo', 830782, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca092f63-dfff-478c-90db-7865da1b3ff7', N'Palos Blancos', 522846, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffd8ed20-c03b-4330-a8e6-78aca446d24a', N'Santa Lucia', 421311, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7dfd201c-104d-42b9-b73a-78b09c815246', N'Rio Chico', 97615, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2d33b7cf-25a7-4b5e-8136-78b6704c861b', N'Mayu Sumaj', 7454, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07bd2175-3ca2-489b-a5cc-78e2496a5ff4', N'Quilmes', 11027, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65f88235-f5a8-4c1c-9f8d-790d106386f9', N'San Bernardo', 350266, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6275909-9f8f-43de-a838-792f7f9f6d71', N'Mariano Boedo', 507384, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'351056c1-068e-47f3-8be2-795580d33216', N'Ramblones', 15341, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bb2e3004-15ca-4d01-9709-7957e3f9a238', N'Despeñaderos', 423336, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'094fb376-3b87-4e81-9606-7973202152ed', N'Nueva Galia', 256986, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0e79585-2968-4873-a27e-797efa813f53', N'Colonia Libertad', 745627, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca5c777a-c311-4eb3-ad4d-798a8b522aea', N'Puerto Reconquista', 621264, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23c4faca-f2e8-4070-8741-798f1d4a0a86', N'Barrio Empleados De Comercio', 588422, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f4ae925-964a-46c3-b1c3-799d71ed9ffa', N'Sarmiento', 110675, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7246edcf-de77-4f8a-a039-79b6ea0706be', N'Malligasta', 297905, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ac3a3534-d409-4c15-ab6b-79c1f85f8cb3', N'Esquina', 897985, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'91b8e339-dfa1-425b-be49-79ca3ea476b0', N'Fortin Olmos', 108426, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'32e9b998-799c-4d4a-8501-79d2ce4228ab', N'Barrio La Estacion', 483994, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ae742c3-c18f-482a-97ca-79d8deb12f3c', N'Villa Tercera', 202538, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0abf918c-a5ce-4c2f-bf50-79fb966c55c9', N'Villa Bordeau', 591938, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6fd14126-bb53-4313-a101-7a05968a286c', N'Las Acequias', 925707, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8185faca-90ff-4cdf-b633-7a0e1261b69a', N'La Rubia', 544511, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'03a2df67-ca1a-4656-970a-7a10934bc0b5', N'Machagai', 230218, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7bd57efd-77d4-4872-82b0-7a27b0a8e3a4', N'Tatacua', 687640, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c9f5144e-6d70-45ac-8fa7-7a3f7ed2cc03', N'Estancia Grande', 198994, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ece46daf-1766-4a0f-9306-7a5459135a0f', N'Nueva Vizcaya', 370002, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1f5c3d8a-17ff-4aca-bc39-7a595fc332d4', N'Pereyra', 886277, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90957759-30b8-4077-8964-7a6579b65c30', N'Puerto Iguazu', 573116, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'40adcb2e-c0ba-4b43-bbe1-7a65dc8e9861', N'Martin Coronado', 805989, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a954451-b267-4857-ae14-7a76b685b308', N'Monte Chingolo', 482577, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26c13efa-0f35-4ae3-b447-7a7799e92512', N'Villa Yacanto', 962677, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'baa7f751-cb4f-4133-ac57-7a77b6025f2f', N'Villa Santa Cruz Del Lago', 677812, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae376f83-0000-4b62-bea4-7a86cdc01c0c', N'Miramar', 265266, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6aeb12a6-8d74-4ddd-b683-7a8a9916a43e', N'Costa Bonita', 654749, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7f24b5a4-bcad-48c5-911d-7aada4a64df7', N'Puerto Bermejo Viejo', 575512, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4640c54-dbdb-459e-8c18-7ab051ce62ee', N'Las Peñas', 436541, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b50c7e1-597f-4904-9096-7ac35e1a52a9', N'Candelaria', 861632, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'283d03fa-e583-4b9a-8923-7ad372c7a0a3', N'Villa Luzuriaga', 120016, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4d3f311-d20e-47d0-9514-7ae6d2ca5aa4', N'12 De Octubre', 520576, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73921c36-be8c-4d9b-9438-7af7d45f89f0', N'Gualeguaychu', 996134, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f21e0dbb-5df0-4ce7-8abe-7b10132457d1', N'Russell', 146675, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'824dd7a5-af3c-4ffb-a86f-7b22d9a43318', N'Mision Tacaagle', 768652, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b34448f-658e-42c9-97de-7b2fbb8b5b3a', N'Barrio El Boqueron', 658793, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3b3e74e-71b7-46b3-8a37-7b3c81d3786c', N'Cienaga Del Coro', 581045, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'088f6ac0-1fa9-4f7b-8812-7b486716b788', N'Castelli', 586171, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f6b3f3a-25ce-4033-9400-7b7b93cfdd91', N'Chillar', 498411, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88d98495-c647-4ec7-bead-7b832b300f64', N'Sundblad', 946561, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60a669ae-5cff-4b54-bfd6-7b8824e5c886', N'Kilometro 17 (Ruta 8)', 457322, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6017052-495c-42d6-b897-7b915fb777ac', N'Catriel', 331799, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d10187e-78e4-488b-86cb-7b9ed87195fd', N'Cerro Condor', 248701, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15207345-bc76-476b-8848-7babd1843754', N'Barrio Luisillo', 339099, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebb4abcf-0cf8-4b93-998a-7be177217066', N'Bella Vista', 923945, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d870edf-efe4-47c3-85c2-7bfb406bd3d5', N'Bajo Caracoles', 505643, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e09138f7-36ae-4718-aebe-7bfec608ae98', N'Estancia Vieja', 771446, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43008910-809b-4a26-83bc-7c014dda567a', N'Villa Quinteros', 341756, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d6d3dd2-d908-4c10-b52f-7c5c4fadc3c4', N'El Challao', 396273, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f34e56a9-e8aa-47c7-a605-7c6fe48faa42', N'Pavon', 984633, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0529a397-0982-477e-8681-7ca0d9baf627', N'Manuel J. Cobo', 750929, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbfaa60e-098d-4c4f-a6ce-7ca3e3904b5d', N'Orosmayo', 522524, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5b4f916-7717-4d25-92f4-7ca8753b65b6', N'Villa Bosch (Est. Juan Maria Bosch)', 507809, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c737bf7a-90e4-4932-ab78-7caf610576cd', N'Fray Luis Beltran', 186293, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04918ab9-a625-4348-b3c9-7cb00d47a2af', N'Villa Garibaldi', 855176, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10e70a83-e241-433e-82a1-7cbdd5c963af', N'Sol De Julio', 581463, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'55830a19-797e-4668-8237-7ceee133fd20', N'General Cabrera', 98377, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8170d587-0439-4575-a207-7cefc390f9ac', N'Plaza Matilde', 221050, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73696f77-da50-4105-a717-7cfd2030153a', N'Azopardo', 834411, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c0c37d9-08d1-4e2d-a6cc-7d0201863769', N'Versalles', 786942, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b9459bb4-6df8-4acc-a85a-7d1349cb4866', N'Puerto Aragon', 770785, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'daba894a-59b1-4883-afae-7d2b4c2f806a', N'San Roque', 194825, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f349c7ad-9c6d-4b08-b83a-7d620ebfb6b4', N'San Fernando', 863104, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'408ce0da-d191-4d05-a5ef-7d7c8ea6de3a', N'Villa San Miguel', 673417, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd593a0c9-3957-4dcf-b2fa-7dc2c0ae302c', N'Estanislao Del Campo', 563488, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e20dc46f-0d32-47fd-8d53-7dd7258c0749', N'Barrio 25 De Mayo', 201223, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89095b38-8a0d-4856-8725-7ddc60e2f76c', N'Aguas Calientes', 256369, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0eab4d54-4e17-4bdd-8761-7de39ea2e3ce', N'Bombal', 122329, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b50fdbd-fa74-4c08-89db-7de5f35ca443', N'Villa General Juan G. Las Heras', 279408, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fdf5221a-e9a8-42b9-a3a8-7de8aab371e6', N'Estacion Camet', 637845, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d14e553-0b4f-4275-a7c1-7dfd130e8bf6', N'Fracran', 134641, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b524b8c-ffc9-4435-97fc-7e1d1e730155', N'General Ramirez', 284700, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4f74bdaa-5776-4e80-a718-7e2852e0d6d5', N'1a. Seccion', 487828, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ad0825b-7dcf-4d9d-b660-7e3a84fdf542', N'El Pato', 52850, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45d98fd2-4833-4d1c-9426-7e42175d1c1c', N'Curaru', 390036, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'edbcc2e9-9044-47a9-8259-7e50c2a91919', N'Leleque', 410672, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79df09ba-b9bf-412a-9291-7e65257eb224', N'Isla Del Cerrito', 547112, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4148d30-b66f-4281-af26-7e73f591ba57', N'Pueblo Pablo Torelo', 406155, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'890067cd-c7a6-4eb8-9c6f-7e7c5c73c485', N'Puerto Santa Cruz', 442724, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1431755e-21c2-4569-a243-7e7d29ec5448', N'Acoyte', 154251, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'efbbf747-d94e-4f23-b25c-7e86b8d530c4', N'Arrayanal', 402700, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4473eb53-89ff-428c-abcd-7e8b35c116d0', N'Agustin Mosconi', 306776, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'82911f36-1d82-414f-bcb4-7e8efcb3d318', N'La Higuera', 950857, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aca012ea-90a9-4fd0-8aa6-7e912d3a3c45', N'El Zampal', 515204, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b84ca459-b2c8-4bf0-8e96-7e91759645ea', N'Tortuguitas', 34322, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5cee0b1-5211-4c84-8d93-7e9eb83869d9', N'Barrio Gasoducto', 322941, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'18823777-6ee2-44a1-b3d9-7eaabd7f0d3a', N'Ataliva', 543447, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2eda71f5-8d41-4949-84d2-7eca811d9384', N'Las Perlas', 731043, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dccd1878-c093-4606-bead-7ecedfc26abb', N'Rawson', 765013, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'640a501c-e913-44df-b58e-7ee490cd1d60', N'Valle De Anisacate', 496039, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3f923c7-6b2b-438d-8ea9-7ee977d26fcc', N'La Paz', 32727, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6429413-f473-44cc-94bc-7eeb3c45f9a8', N'Ferri', 78183, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca2e53a4-e903-4d4c-82b5-7eed8cb0aef1', N'Casas', 665697, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c070a405-391d-481d-9f77-7f0a5dd845e3', N'Las Isletillas', 282010, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2bfebc6f-bdae-4d9a-81b3-7f234cd370dc', N'El Maiten', 914545, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2951ba90-1ffa-4aa0-922b-7f36ed421f88', N'4a. Seccion', 224279, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e5a475e-07f0-44e6-8c3c-7f38ad00df72', N'Estacion Lecueder', 772636, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'946c0ef1-61ca-4c5b-bbc8-7f3af643126e', N'Perez Millan', 892827, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4c7496e-48b6-4de7-8a71-7f464066815b', N'Sierra De Los Padres', 942278, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79cf5889-80b7-4c41-86e6-7f47641bf909', N'Rodeo Del Medio', 670998, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da1c98d8-3621-4518-8a4a-7f48a26d8b00', N'Huancar', 981068, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b9e2a41-0f27-4c22-812b-7f7832f0c2ac', N'Vichigasta', 605539, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd409a777-f424-4084-a74e-7fa53e45334a', N'Rivadavia', 572340, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dec8c56c-669f-441f-a423-7fd128e0cb2d', N'Corral Quemado', 730232, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1799368-a1df-4f17-985f-7fd678f46ca8', N'Aguilares', 663607, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab488cc5-04ea-459c-90da-7fe18822fff9', N'Las Carditas', 153304, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a840285-8f3a-4352-80ad-7fe5b32db8ac', N'Ituzaingo', 595623, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8e90d25-d024-4a5d-9a9a-800c11de1dea', N'Pilar', 162407, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38f6f9b5-3f94-44e4-8bc7-8011b38c8dd3', N'Lujan', 63015, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'773ffe99-e93e-4af1-8cd5-80189c219c2d', N'Talita', 668987, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61058dba-c090-4f7f-9ba6-801b84284455', N'Las Corzuelas', 815989, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd0b8fc66-d893-43be-83ba-801c43fd5c0b', N'Pozo Hondo', 316610, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a417636d-e17b-418f-aad0-802474842bbb', N'Pueblo Cazes', 487357, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9a9662b-e303-4861-bf27-803bc32cbc84', N'Lavalle', 860734, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'567e5377-1902-4be4-9d0d-8042dbf8383d', N'Villa Real', 587432, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1440da33-27d4-4d2d-a433-804d57bac958', N'Del Viso', 189235, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'753f3c73-9811-49bb-a777-804e25932fec', N'San Mayol', 723948, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a1e54896-faad-4cb9-8662-8051305d1bb8', N'Carlos Pellegrini', 183212, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'12ca76be-be37-4d12-822d-80531c403a4d', N'Balneario Pehuen Co', 42638, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7fc99c3b-848d-4bee-a15c-8068064c1ebc', N'San Pedro', 585426, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'95ebaf54-549a-4e48-a1da-806b813443a1', N'Casa Bamba', 60579, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'94816701-4f35-4145-8666-806dd6527b6b', N'Juan G. Bazan', 612052, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5673b75-921c-4177-aaca-807237485efa', N'Caleta Olivia', 671862, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0eafae01-8646-4368-8f41-80747398336f', N'Cañada Del Sauce', 259078, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8943f89-3080-40e9-a142-80a0374b1e27', N'Villa Vil', 856051, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7444b923-93be-4e10-93f4-80ae102932cb', N'Villa Dominguito', 326673, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e70508af-eee1-4b1d-9af8-80e4ee805291', N'Tosquitas', 119930, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe422727-1086-4638-95bc-80fe20523a9f', N'Amenabar', 814651, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2eb060c8-97c8-483b-9a8d-8107a04349e2', N'Cc La Almudena', 642765, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75094962-a854-4aa5-8b0e-812627884f24', N'Pedernal', 143975, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d8f1284-aa54-4515-a8df-812895f5fa44', N'Palo Negro', 474311, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c899b770-2e9b-4dbb-8b11-812fbdc72a94', N'Pozo Del Tigre', 92026, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af362d17-215a-4614-aa8a-813c99381b67', N'La Humada', 53288, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3aeb48bc-dc00-49b1-b3ad-81456de63b0e', N'Matheu', 902423, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'101f1ee1-6ca9-4cf3-adad-8151c88f29f5', N'Colonia San Miguel Arcangel', 874803, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ba3aaf3-c8fc-49ff-b69a-8157d635cedc', N'Cavour', 410129, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'680fc5f7-1b16-432f-939c-8169dad5557c', N'Pueblo Ledesma', 877208, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fca6f519-6f30-426f-8d9b-817bfeb62fce', N'Junin', 311532, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a275265c-329c-4ed0-bfb4-81970a099c7a', N'San Ramon', 548459, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce897b10-90f2-44d0-abe7-81973cd2774e', N'San Ignacio (Loteo San Javier)', 831376, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'001343a1-d738-42de-8f30-819a5223b2b7', N'Remedios De Escalada', 379563, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec6b62fc-70ba-429b-882b-81a6c844240e', N'Fuerte Esperanza', 637381, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78fb1fb6-d5b2-48c6-aa84-81b30f3baa78', N'Ingeniero Forres', 353536, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'955a55f1-e3c7-44e5-aab6-81ba247c1a64', N'La Mesada', 587749, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'461e1936-4908-4cc1-8130-81bd4d0223e2', N'Colonia Sarmiento', 837634, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85392fa6-741a-45ad-9e9f-81d166694077', N'La Perla', 16868, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4714090-a7c6-4c98-9b9c-81d4d309f4a7', N'La Colina', 636170, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2fa0c74e-91bc-40d4-98d9-81d5c6da3bbb', N'Guaviravi', 359566, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cfc145ae-0f78-4254-b7bd-81d990026bfe', N'San Carlos', 789036, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7106c2e7-282f-45ba-a1ea-81da4dfe04ff', N'Nogoya', 23100, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5243090a-989c-4940-a2eb-81db6e788ae2', N'Los Balverdis', 149667, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60dbc72d-708f-4cf9-afd3-81e27c139205', N'Villa La Rivera - Oliveros', 568928, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'18d40d70-c986-4647-a14b-81e67fabb424', N'Las Vegas', 520993, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9948f436-a235-4fba-ae7f-81e71127a91f', N'Chajan', 483039, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce73751e-b4c9-4ce4-8807-81f5add0b8ab', N'Quitilipi', 764260, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2bcd1cd8-3e11-430e-a95b-8216e8f86332', N'Villa Constitucion', 444283, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65c1e27d-4aac-481a-863b-82232dbf8b1b', N'Valeria Del Mar', 329360, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f6720761-0885-48f1-8355-82277f130daa', N'Bermudez', 295215, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39c5f060-12ee-46d4-801f-8229e57ccf5c', N'Venados Grandes', 188258, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a39c7c3-5140-4536-af2c-824727f67237', N'Villa La Viña', 300246, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4bd98cb0-f18a-4509-9456-82537cf256e2', N'Las Malvinas', 566172, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aaffd990-c969-4744-be42-8254e1273729', N'Bananal', 237528, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e871d6f-eb92-4601-9c31-825ea85efc29', N'Bella Vista', 792608, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff96269e-549f-4c7b-830b-82648765238e', N'Teodelina', 976885, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cd39cb4-357e-4dbe-8be7-827dc2fc23ea', N'Mojon De Fierro', 940551, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45aedcb4-0064-4456-86fa-8287dd17ba36', N'Bocayuva', 152891, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'143fe350-d71e-4314-91aa-829d04fb82cc', N'Ezpeleta Oeste', 564895, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'004a6a0c-ae61-46c9-a0b8-82b1ee1a9132', N'El Remanso', 818588, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'28ad684f-bc17-4cf9-827b-82b5acfd240b', N'Fortin El Patria', 105346, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20990728-d331-4be1-a316-82b891c31d31', N'Juan Anchorena', 629835, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6825aac-d60b-40bb-b56f-82bdb7b9021c', N'Licenciado Matienzo', 16384, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'468effde-6d92-49ff-9b99-82cd5c4d3851', N'Las Rosas', 503150, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30ba41cc-0f98-4025-8477-82db7afa79c7', N'La Poblacion', 612267, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b85e6c2b-0c19-4d74-a65a-82e4a1383b23', N'Estacion Torrent', 642276, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ac25f76a-4290-4e05-9899-82eba84b100a', N'Las Costas', 281075, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd0cf0d78-1495-4828-bd83-82efdbd20976', N'Bulnes', 546315, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8abc9ed3-958d-4422-8f8c-82fc1f6e7cdf', N'Malvinas Argentinas', 443068, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76f74fde-736e-41cd-b69a-8303880eb02b', N'Ticino', 940149, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a9b1e99-2e69-4c15-8e54-833e2431300d', N'El Potrerillo', 24692, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1dae0019-9c38-4f32-8924-83469723f9e1', N'Barrio Gilbert', 990516, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8c682e1-9052-4404-9a7a-837ed99c2f1d', N'Jocoli', 32861, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd021399-dcc2-4a63-ba86-83839ea41c3b', N'Villa Lynch Pueyrredon', 520533, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a5902467-d5d9-4e6f-a2a2-8386e71f6bf6', N'Sauce Pinto', 613096, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2738a66c-105d-4924-9889-8389b0dbbcb3', N'Guerrero', 175595, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64c48047-c4b9-4039-b02e-838f2ed6697f', N'Las Delicias', 947083, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98506b8b-9416-48b7-9531-8390527a7a2f', N'Cerrillos', 803453, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9635183b-b089-4012-bb0d-8392fb94cf8f', N'El Salto', 437579, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab0ffb9f-578f-4d8f-a192-8394f4504f46', N'Malabrigo', 6350, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'468cfe1d-882d-463d-887f-83b30b22d8da', N'Copacabana', 639931, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb94a1f2-4825-4e7c-a42d-83bb6595e3d4', N'Los Varela', 789077, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14367193-3f60-47ac-b033-83c490739b7d', N'Ana Zumaran', 28290, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79101062-52e5-481a-98e6-83cdab750be7', N'Los Chiriguanos', 310502, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f95e35c5-65da-4ed0-91b3-83e71ab7b12c', N'Adelia Maria', 960418, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45c7098d-37e6-4c34-8342-83f1d8889000', N'Santa Rosa De Calamuchita', 638464, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7db8b84f-865c-4b1d-9895-83f68eb33fa0', N'La Laguna', 488935, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc655ff3-55af-4654-a529-8412b4409f77', N'Humboldt', 876063, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b216e00-2758-4e84-a245-84193edfa5e7', N'Viale', 101729, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2f49cbe-99f0-426e-98f1-8419cf6bbbb8', N'La Pala', 100389, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b983bad5-9acd-40ea-abf8-842fa01a25d2', N'Villa Libertador San Martin', 467052, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83623a0a-e204-435e-bf20-84458647d914', N'San Jorge', 871229, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea1c619b-ad7a-4e96-8312-844b7697c564', N'El Tuscal', 881200, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0d3dcd9-42ef-44f7-8581-844e9f2d1a95', N'Coctaca', 579970, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b2655dd-12d2-4cba-870d-84870e3fc552', N'Aldea Maria Luisa', 882846, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'266b77cb-d064-4702-9f8e-849ec2bfaba5', N'Selvas Del Rio De Oro', 644994, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d1e3f2d-9a4b-42f8-930f-84a8b71f57af', N'Carboncito', 884103, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0e504e91-62c1-4167-9946-84bf80e5b1f3', N'Plomer', 767203, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41fa618b-3063-4821-8a1e-84c4e9ed5e67', N'Arocena', 844932, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'706859f0-a883-4674-8d65-84e9686a86c8', N'Villa De Praga', 610043, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79a46afa-24c1-465a-ad0d-84fa5cd8f4dc', N'Quebrada De Los Pozos', 749872, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0aef9a14-80b2-461f-92d7-85010947eb15', N'Juan B. Molina', 524010, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a52ac2a6-b245-46c2-a903-8503ec63f9ca', N'Santa Eleodora', 204609, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f09616e7-013d-4079-bc47-852e792e3dce', N'Villa Parodi', 314906, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'847e8b7b-9ca6-4441-aa1b-854362b0f646', N'Bermejo', 822246, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fec065e9-6dc9-4e9c-950c-856564554346', N'Cañada Rica', 441146, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4f59e0a9-d44b-4e30-9ac4-8566d11e2cc3', N'Cañada De Rio Pinto', 824186, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7cc9ddc6-c015-4534-8f4b-856d12ed3d29', N'Pico Truncado', 455798, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8c58965-52fa-4965-8b4f-857efeda77d3', N'Intiyaco', 212162, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5953cd8-391a-4576-94ee-859167ffb5ca', N'Villa Gobernador Galvez', 563436, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aeb6e91c-ca85-49e1-b609-85aff3334baa', N'San Martin', 965786, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7af6dacc-9205-4dea-a1a5-85f42c90d5aa', N'San Cayetano', 931570, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb442a50-d893-475c-8368-85f8890a4b7c', N'Coquimbito', 90308, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'daa1d2ab-5549-4796-8d3e-861a076916c6', N'Mallin', 847479, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2480c1ba-a59f-45e8-ac7f-86277dc51a76', N'Pirane', 499509, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63ba0270-7b95-4ea7-b77d-862e9608df89', N'San Basilio', 618053, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2d10491-f0b2-4829-b0b0-8651cf28c1d4', N'Acebal', 567264, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1bcdde66-cc5b-4048-8916-866e4c052aca', N'Santo Tome', 867476, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e001588b-5c6b-4442-964a-86a25b64ffe7', N'Castelar', 690253, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c319ca88-8f06-4dfe-bf4b-86a48e0ea15b', N'Bermejito', 481401, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a146d3c0-40db-42fc-b6e4-86ae33ff0c2d', N'La Granja', 249663, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd44864e-6ab4-44e7-83e8-86b3d0f9a5ba', N'Las Albahacas', 459157, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67b9f834-a462-44ee-88cd-86c1b25ec431', N'Olacapato', 723492, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4d234c3-b00a-412d-be26-86da577e37d8', N'Mar De Ajo Norte', 939210, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'687952d4-bf25-470e-8f31-86e257e92fda', N'Limay Mahuida', 799389, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae207ef7-7689-4c98-9446-871850ec4612', N'Sosa', 378866, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ffa8e09-a702-4f57-aae3-872615ecb2b9', N'Saladero Mariano Cabal', 537430, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba059fcd-25c5-47ed-83c0-872a1c2e64c8', N'Tumbaya', 845725, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'572ef37a-7401-4571-807f-8733fde0de05', N'Barrio Presidente Peron', 516377, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9351116c-ab38-4949-98e7-8734af64c0e9', N'Villa Union', 889730, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fef240aa-f8ee-4695-ae1b-873839cb2789', N'Yanda', 519035, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'82992bfa-e4cd-4250-a3a5-87431a218cf6', N'Puerto Pinares', 185807, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45229e40-8c6f-415e-a701-8748d0f9e551', N'Villa Mailin', 34140, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f549ce9b-4bb2-4cfd-abc4-874e26a38654', N'Medina', 750244, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'48cfcbd2-9158-4739-8595-87716fd0c0e7', N'Los Corrales', 444158, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'427693f5-309c-4026-a899-877b8615d96b', N'Guardamonte', 812914, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3dc351d5-7b6d-4fcf-85c9-878fd7a23608', N'Loma Blanca', 365041, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'51792bda-ea4e-4876-8a4f-87c26913d416', N'Pavon', 756626, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a75d13c-198b-4065-af39-87c3d0e60659', N'Chajari', 810287, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41091ec1-65ff-4cad-980a-87cba99310a7', N'Strobel', 777568, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'03dca7be-e006-46e6-83a0-87cda97c0361', N'Inriville', 591292, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad26f568-b13f-4879-abb0-87da25deed7c', N'Coronel Rodolfo S. Dominguez', 476491, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79e4dddf-358d-4c4d-ab12-87e430169742', N'Santa Victoria Este', 429424, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36afa743-9e51-4022-b14e-87ecda4f8e05', N'Concepcion', 572623, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f9eaeee-a8b4-4542-bb6e-88330433d377', N'El Arañado', 355524, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c00f55d-3e0e-4841-884d-884b90c859e1', N'La Caldera', 907142, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'986df8fb-a8f2-4f02-915d-884f51e9effc', N'Barrio Las Malvinas', 465216, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46e35f3a-979a-4581-8766-887d97923452', N'Yocsina', 744779, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5534e44-c67d-4bae-bcd0-88818f7faf62', N'Campo Gallo', 241172, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'856d8d55-fe52-4a22-b49f-889b93ca3fe9', N'San Cayetano', 528319, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c3eb68c-9ed9-4844-84d4-88a90dd6379e', N'Usno', 62606, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c2128523-c242-4097-a97b-88af1e05b0d7', N'Salsipuedes', 658438, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'34d95252-6072-4357-bb2b-88b4d1f39590', N'Rodeito', 605506, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e737d33-b708-4369-b53a-88bae022bfe0', N'Barrio Los Olmos', 141059, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a9e0cf34-ff86-4895-a3c7-88cdad870f99', N'La Cuadra', 685089, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1d87f9f-b939-439e-b71b-88f8eabc3fa3', N'Hipolito Yrigoyen', 363935, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0cfee67-5bed-4147-9e0e-88fe53e4d62e', N'La Paisanita', 540738, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d578393-1796-4927-9c52-8905daf63826', N'Lezica Y Torrezuri', 849681, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af50c5b3-6b41-4030-bff4-890da8a58797', N'Lilo Viejo', 902915, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'078fdf22-53fe-40c9-87af-891673bf92f6', N'Haedo', 382254, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e658b20-aebc-428a-b48b-891ed067f554', N'Cinco Saltos', 943664, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87e79aa0-c41e-44fa-b42f-892b0459640a', N'Obispo Trejo', 279209, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fcb65a2a-9bc1-4f47-ab49-89326c2c8472', N'Zaparinqui', 348766, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b3318adb-9e34-422f-a6a7-898947a9a226', N'Tabossi', 617082, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dba28cbc-e20e-4914-b132-89aa303acf02', N'Pirovano', 572122, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59cffe6a-125a-4cde-a997-89b5f0f2cc89', N'Hipolito Bouchard', 604847, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e344a5a1-83c3-4f16-bf13-89bc34fd2522', N'Berisso', 96655, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f33555fb-c4dc-4da8-96d9-89cf3886105c', N'Diadema Argentina', 617419, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7542be54-23e5-4325-8c5d-89e18f3182aa', N'Barrio Echeverria', 237355, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2a87b5a-cf06-42a4-bd6e-89e412e2fc80', N'Pilar', 559721, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65494d5a-5fdf-4bdd-a568-89e84ff016a7', N'Colonia Italiana', 215458, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41c3a4a1-b05a-48b6-ad29-89ee052df86a', N'Las Juntas', 437617, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc1610c8-7a91-4152-9296-8a17fb20f1f3', N'San Miguel', 887945, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'de33373d-2b71-49fb-80f9-8a2e488f23eb', N'Estacion Apostoles', 770012, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'82800999-699e-4b60-b490-8a2ee834cd42', N'San Eugenio', 254278, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f032283-9c3b-4135-89af-8a431053e535', N'Emilia', 254037, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc9cbf2e-60f5-425c-b273-8a5cef4991ef', N'Oncativo', 613523, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d43dc06-4710-455b-aa1a-8a5dbef410cc', N'Reduccion De Abajo', 565382, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df4880c0-6086-4264-a339-8a617057e79f', N'El Lindero', 36246, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b1d4b0d-4424-4e68-9d7d-8a74a4bf0a48', N'Rufino', 876052, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8cd5e461-77f3-450b-a040-8a8f6a4787ce', N'Los Quiroga', 646897, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b37731b-231b-4035-9bca-8abae48bc914', N'Villa Las Pirquitas', 444532, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c188250-f7f5-4109-bec5-8abcbd10dab4', N'Canteras Quilpo', 345750, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6033f592-b658-4e28-a3f7-8add1d62b94b', N'Las Cañadas', 963780, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'efff184f-919c-4d5b-b621-8ae6b4692420', N'Las Avispas', 510186, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6f8fc5f-de5f-4426-8c18-8aecee4e7e00', N'Singuil', 374162, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06c6b288-ef62-41dd-a915-8afc98741712', N'5a. Seccion', 358235, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca41b49a-2135-4f0d-a60b-8afee417a55f', N'La Aguada', 695171, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3985ee2-0288-44fa-98c6-8b00f70abd5a', N'Pueblo Marini', 360375, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b901bf0-602f-4828-aa2a-8b08b422026f', N'Villa Soldati', 29847, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'000ba819-6adf-4543-a43b-8b2284a62f18', N'Ugarteche', 227815, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'251a98cd-7c9a-4260-8eb2-8b3309ddbe66', N'San Carlos', 974343, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b280e53-3b6c-4f64-9678-8b3c448d2798', N'Mira Pampa', 955096, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e84cd61-dd7a-43fa-9253-8b4406a8f558', N'Casalins', 546130, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'670a6fd5-17ce-4f7b-93a6-8b4822554059', N'Estacion Yerua', 117304, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aea3aaad-5d50-48d0-9790-8b4bfd4fc849', N'Barrio La Costa', 455155, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6bbb0e19-1a4b-48cf-8e22-8b4e2813edda', N'Anisacate', 364096, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b95939dd-6b16-45b8-abe2-8b60be80582c', N'Nueva Esperanza', 417766, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa7695ac-c484-4342-80d3-8b7ba0ee0361', N'6a. Seccion', 73021, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe9d0fd3-432d-48b0-81b3-8b8991654717', N'Campo Ramon', 809220, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b1e2c97-e51b-453b-9514-8b90f8b028c6', N'Tortuguitas', 873732, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1198542b-2384-4051-90d6-8b976cffef68', N'Tinogasta', 450878, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'95e44bbd-b8cf-426c-8e7b-8ba5dce28b04', N'Aldo Bonzi', 821171, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35398829-5194-45cd-9568-8c372314fb9f', N'Cacheuta', 646964, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd423bf1f-e211-4732-ab4c-8c3ae8c26ec0', N'El Puesto', 377424, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'adb12ab3-49b7-470d-86e0-8c3f03683228', N'Barrios', 766410, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd9d022d-4a00-49c2-81a0-8c402f8fb174', N'San Agustin', 988877, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7cb7f89d-cf70-41df-835a-8c68e55b54bf', N'Facundo', 62522, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d37faef-46ae-4234-a37e-8c83690a6b0f', N'Mar Chiquita', 22738, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e328c3f2-86bc-490a-b323-8c8706cdc5d7', N'Colonia Baron', 978133, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87c28ae7-607d-41c9-842f-8c8c01c4c395', N'Pavon Arriba', 766503, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'796eb5ae-2fff-4a45-90cd-8c8e1bb01944', N'Amana', 883377, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c80d4f8-04a3-4f1a-be1c-8ca107b3eff6', N'Jose Maria Ezeiza', 448727, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3f6196c-6bcd-4327-b5c6-8cda6a18ce51', N'Altos De Chipion', 172658, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd95c4d6-dfaa-4960-ac0e-8cecdf39008c', N'La Palestina', 791884, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'820b1e8b-41d4-4266-98fa-8cf2f0342e2f', N'Porvenir', 744877, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77337568-48e1-4863-ac82-8cf5fe342c82', N'Hipolito Yrigoyen', 469572, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90868368-d97b-4d55-a2ef-8d0e71684886', N'Arraga', 209939, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fcc518b0-5cf8-4e25-8ba6-8d28dcc18bd1', N'Serrezuela', 762014, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc5b86dc-2ca8-4734-bbfa-8d5ab7e1ddf5', N'Villa Los Aromos', 745023, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b25281f-6d8f-4d14-9eee-8d65300a6c2c', N'El Hueco', 97511, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04d00107-d6ab-4226-b5e0-8d7c116979ad', N'Libertad', 733213, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97c83745-b115-4817-8de3-8d840dd40365', N'El Valle', 633157, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'130c6866-941d-41ba-9807-8d9a1732f016', N'Santa Teresa', 837843, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'620020eb-731b-4984-ae16-8da45f0c46fa', N'General Campos', 538126, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c430860-28a6-464c-adf9-8da5c4717633', N'Tapalque', 744816, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd70911bf-386e-49b8-95fa-8da96a632b3a', N'Haumonia', 522235, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b97c142-3148-4ea1-8ee7-8dadd6381843', N'Totoras', 781745, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87e8317a-6311-49f7-9200-8dd335b483e2', N'San Carlos De Bariloche', 242612, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc54a060-c31d-41f9-a3de-8ddd1b76971f', N'El Dorado', 82734, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'166ca129-f860-41f9-9f71-8dec8b0d1a6c', N'Gobernador Lopez', 658212, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c35e1cf5-21d9-4ffb-b75c-8df25a2819b0', N'Barrios Lisandro De La Torre Y Santa Marta', 832246, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90820827-3a94-4a7f-97a4-8e0d4a9ebe69', N'Chiclana', 825758, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ceacc7b1-3112-4c01-8ac4-8e428df04d9c', N'Gualeguay', 272817, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd65ccaac-0898-459e-a8b5-8e487e5a3def', N'Alpasinche', 845812, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dedd853a-a878-47d8-9d65-8e48985ff9fd', N'Libertad', 688479, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83a28900-806e-4cda-9f39-8e72317bf86d', N'Fortin Las Chuñas', 311315, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'09756ac2-dd8c-47f1-a13f-8e905beebd82', N'El Vergel', 852087, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1314b37b-a6fc-418f-9715-8ea93a877d55', N'El Manantial', 805414, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'057a861f-7157-47d0-b7ff-8eb73bfd52a4', N'Garre', 876571, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46d24f6b-21d1-4c11-b7d5-8ec7da09a727', N'Los Molles', 960527, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c3d9e4d-1bed-4d7c-990b-8ec7f37f079a', N'Mision El Cruce', 420465, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'55e3e8eb-4268-4db2-8589-8eca312407b3', N'Barrio La Rotonda', 785644, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54bd9939-bfb9-4062-9b55-8edb2d90b8ef', N'San Enrique', 495808, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5aee5637-3bac-4d71-bc95-8efa054867d3', N'Barrio Intendencia', 873000, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8b1036c-3d9e-4157-a3ad-8f06408e6e22', N'Villa Barboza', 823372, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd6edbb6-c4b1-4d65-aa28-8f15ec60828c', N'Alfredo Demarchi', 192710, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47742247-c69a-4dad-96c5-8f4bc0231ee1', N'El Pueblito', 666581, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57f1d2da-2523-4feb-ab2b-8f537ffdd4a7', N'San Francisco De Bellocq', 240369, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97a23ee1-ba65-4bcf-9b63-8f5443d59af5', N'Wanda', 710711, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'48f71dac-7f42-4a05-ba42-8f5be7e6f434', N'El Encon', 550832, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb0d0dbc-1eec-4365-b359-8f63af40cd8d', N'Pincen', 237022, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ed04cd1-3172-47f9-bf5c-8f63c19ee4bc', N'Enrique Urien', 511151, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'13803453-37fe-498a-9532-8f68afcfeeac', N'Valle Azul', 647068, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6cb01714-aeac-49e5-9c46-8f69b0b3c5e3', N'Santa Maria', 387129, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'841cc5c1-0467-40cc-941a-8f7232a357c1', N'Punta Alta', 847409, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5b96a57-cb46-4f5a-b8aa-8f8d869deee3', N'Barrio Escuela 633', 590634, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99d368b6-6a8e-4eca-af66-8f9aede11dd2', N'La Trinidad', 922438, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c34887ed-14e0-4ed3-a932-8f9f5b9c1a07', N'Carhue', 684815, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8669f3cb-8abf-4cd8-a7c7-8fd34fe05dfa', N'San Jaime De La Frontera', 613974, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b56bd42-e279-488d-aa47-8fd93c42d3e8', N'Pueblo Libertador', 265449, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c099802f-029c-4e2f-b907-8fdb3fb20370', N'Batan', 973002, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dccbb7ea-12a9-48f8-bfeb-8fe929803b92', N'Santa Vera Cruz', 435737, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a60cbb62-e013-4a85-96fa-8ffe565f1c64', N'Monserrat', 839465, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'adda1837-0c16-4e62-bc72-9016af032312', N'Comodoro Rivadavia', 234617, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e25dcfce-ce82-4858-8bfe-9056dfcc55f9', N'Villa Gobernador Luis F. Etchevehere', 879139, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d7b313d-6b82-4e84-a5ca-907f60d10c37', N'Catrilo', 951308, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c87e0e20-26fb-49d1-98f7-90914d07e0c0', N'Chucuma', 120049, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd190f84-1568-440a-ae0a-9096d451928c', N'Stephenson', 407689, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'deb772fe-619b-4fbc-98ad-9099e79c76f2', N'Monte Buey', 574764, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70077725-ff83-4df3-9a7a-90a090616415', N'El Bañado', 699384, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd6de299-36a6-4177-a39e-90a218ba749f', N'Colonia Barge', 559639, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd57ce07-0c26-4008-b5a3-90bf5a02807b', N'Quemu Quemu', 395755, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db090ca0-74e3-438f-b608-90d69d183465', N'Colonia Malligasta', 193315, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cf7485ab-41bd-46f4-b6d9-9111c3ded20b', N'San Francisco De Asis', 978074, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ffae0f4-843f-4951-a414-9124ccf59719', N'Quines', 964842, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'730ac278-4b00-4fec-bb8d-9124f6b976a0', N'Hasse', 226866, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f96e0d9-bb09-48f4-9aeb-913457285de5', N'Piquete Cabado', 168834, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5530bbee-579a-440e-b306-9161911689d3', N'El Fuerte', 611428, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f9b4f95a-4e21-4989-80d4-91649ce79208', N'Tobantirenda', 333764, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae863248-f269-4c1f-ba91-9170bfd3d932', N'Barrio Las Casuarinas', 135207, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7651502-fbdb-4c33-8d9c-91a1ecdc2b1e', N'La Donosa', 11445, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2182df2c-0299-4acc-a710-91b8a42af77c', N'Villa Porteña', 272603, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7c386511-1f7f-4cea-bc27-91bd10b81324', N'Villa Sierras De Oro', 619656, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d64af88-131b-4cc0-9ece-91d077943a83', N'El Rodeo', 665755, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffe83e27-9177-4984-8fbc-91e459e51c57', N'La Carlota', 567751, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ea48fe4-d36f-4444-9d9e-91f4c11fa589', N'Ojeda', 748509, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5bbf6bc8-cc73-48fa-aacb-9202d9d67b95', N'Aguada San Roque', 22141, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3a278c58-9f5d-4674-95f8-920e23457073', N'Huyamampa', 811287, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1736d0b1-8bda-4e58-b1af-9210df40f4f9', N'La Agraria', 148074, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27b34907-470d-4698-ae03-922269ce9632', N'Villa Giardino', 694345, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0ebf169-e832-4353-b39e-924ec55ec44a', N'Las Heras', 392564, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27a2d701-d55f-41c5-bc9c-9260292f6b1f', N'Centro 25 De Junio', 760014, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca4d23ee-c537-48fc-a003-926564d9a4fb', N'Aldea San Juan', 880791, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1098547-fd88-491b-aa4c-926f21659beb', N'Bernasconi', 911569, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20b62f8c-e5a5-48b6-bc0d-927bb7a05d2f', N'Huaco', 178277, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a156965-3660-4458-9329-9297dc6d3d7f', N'Susana', 236009, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1af37614-4931-4391-8703-929a461429d0', N'Maza', 178544, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa450413-0462-466f-8c17-92cd531d72fc', N'Molino Doll', 526630, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04a14a9c-06e9-4375-a93c-930f0e2c97bc', N'Posada De Los Lagos', 226692, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78cd02c2-18bf-4ee8-85e3-93155f35dfbb', N'Villa Minetti', 702888, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0a54ae6-4acf-4dea-9ad1-93178ad0b444', N'Santa Rita', 505809, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd712ee24-547e-4209-a5bc-9325f0f01801', N'Lozano', 430559, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'044c5494-e86d-4695-9c95-932ee7230160', N'Ciudad De Los Niños', 436760, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ec0e896-ce77-4dee-b515-93338280cf52', N'San Jose Norte', 490675, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e48cf782-27b7-4c32-9302-933632fb9541', N'Yapeyu', 748845, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb87dc4e-a080-4375-8ef8-9347bcfdaa93', N'Octavio Pico', 923199, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98602c02-245c-4a0a-9237-9366e78c1220', N'Gobernador Igr.Valentin Virasoro', 646227, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'817bbd1b-a11a-406b-908e-9378b4fecc14', N'Monte Quemado', 899984, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39e6f43b-12b3-45e6-aa10-937b6a957605', N'Maximo Paz', 920466, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79b4fdaf-6c4a-4b94-8954-938dad17474f', N'Altamirano Sur', 897582, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c413c5c-d404-4333-bae2-93941e7c40b1', N'Landeta', 234720, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'037b54c4-85dd-433b-96dc-939522c2c9aa', N'Santos Lugares', 373505, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7df7a0c-f582-4d96-8c7f-939ae1299dd8', N'Colonia Santa Rosa', 515803, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9fd5c71d-8896-4f83-a99b-93a0b8c2c4bd', N'Cañada Del Ucle', 373766, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'968cae0d-1f5a-4c15-a587-93af93cd0ecc', N'Tristan Suarez', 212006, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2462ba92-74a3-42b6-83e4-93b58eedbfc5', N'La Esperanza', 689298, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9cc084d8-28d1-4262-ab8a-9407a66a4373', N'Padre Lozano', 52743, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8de76410-1dc3-42cb-a015-940da7bfc7e3', N'Campo La Cruz', 649006, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07934d2e-9d92-4d71-b643-941d19134d46', N'Villa Valeria', 104099, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5dbded48-6b27-4623-abb8-942ce8740f66', N'Los Cerrillos', 96101, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c931fc9f-3df2-4e50-84a0-94333a2b6f98', N'Mechita', 564486, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db40d1b9-6cbe-47e5-84fd-943f13a474b3', N'El Perdido', 742888, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5abe34e-a30a-4d54-8ada-945871d5d0f1', N'Villa Jose Leon Suarez', 843730, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4f3ec8d3-3088-4c6a-818f-9466439a9334', N'Necochea', 958455, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2bf52221-24c1-4f56-8ed5-9466a9003faa', N'Cayastacito', 417644, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8a0be29-26dc-4491-a12c-9466f0f5bd2b', N'Gregoria Perez De Denis', 977335, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ebbe28c-80a5-472c-98c2-9473d70dc83a', N'Classon', 289412, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a85e3782-d199-4a93-830c-948192b31ff3', N'Mi Valle', 852158, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df5abdef-6146-4bbe-8792-9484127b809b', N'Barrio Ntra. Sra. De Fatima', 109237, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd76c4dc-0d8d-4c8d-95ff-9488d68a01b0', N'Hipolito Yrigoyen', 87968, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38825b9f-1a24-46b3-9f87-948b8c1f5a72', N'General Hornos', 105714, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'331a5258-1416-4bd5-b624-948cd557ec19', N'Pareditas', 821080, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45715023-e1e1-4e5c-93e3-948f82549563', N'Antinaco', 375678, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f1d91de-4cd9-413f-981d-94b525931ea5', N'Gregorio De Laferrere', 63783, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39c1b0da-6655-4700-adac-94c87c823b9f', N'Villa General Roca', 565455, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a26a08e5-935d-481c-bb4f-94f4f125a271', N'Hocker', 227616, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b64fd0a0-1ccc-4633-82e6-950652d2fcc3', N'San Agustin', 523854, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba67936f-00fe-4b63-b6db-9541aded7442', N'El Bolson', 220124, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4118767-8825-404c-96f3-95495adc4113', N'Vicente Casares', 706690, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cfe52211-4d5d-4ade-8d8b-956964adcb5c', N'Floresta', 285962, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'effe52cb-9b78-46ba-856e-956e0f571134', N'Adolfo Van Praet', 533431, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'24277f1f-abfa-4d53-82c0-95876a9a3b72', N'Don Emilio', 499156, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4147bbe6-6936-451c-ac60-9596a94f7b16', N'Coronel Charlone', 820894, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6dbf8ced-87b1-44bd-9093-95a44310b1cf', N'Zavalia', 245656, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf622860-60b6-421c-adfb-95b04100b988', N'Area Cinturon Ecologico', 806368, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59ff8c76-82cf-4b13-8969-95b37f9250a5', N'Icaño', 359231, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5374f7f-3093-4611-ba69-95c4cc7566d3', N'San Martin', 6119, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'51b5386b-a2ee-4706-af02-95c928aa3cd8', N'Potrero De Garay', 813286, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea5d90c6-0d57-409b-a389-95de63f768b2', N'Puesto De San Antonio', 961694, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92e2c85c-069c-4001-ad00-95fe5284b5a3', N'Barrio Castelli', 62429, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1148e90-f1fc-442f-8eb2-95ff48702a85', N'La Lucila', 77319, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97c47e7c-2532-4c61-bb8f-960ff0ee04d8', N'Barrio Jocoli Ii', 175650, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'111f02e3-0ba0-4299-984a-961f11a282b7', N'Candelaria Sur', 430961, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc1ad539-7a01-45e4-9676-961fb6c725dd', N'Mojon Grande', 2613, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6dab1e64-98af-42ab-9298-9633fae93b8b', N'Barrio Los Charabones', 846006, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23d28960-c4ca-4465-8b4c-963b3c3782e3', N'Villa Marques Alejandro Maria De Aguado', 800551, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'172a3ce1-9e5b-4797-b875-96420a4f18c8', N'Ciudad De Buenos Aires', 861979, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'625ed8fe-cb75-4099-a3e4-964578fa297f', N'Villa Ramallo', 275984, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3706d1b0-bc58-4960-a432-9652b5106fc5', N'Wenceslao Escalante', 954774, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64e5b477-1e99-4a55-b667-96555aa1f49f', N'Gonzalez Catan', 872979, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2f16db8-3f85-4684-b9c5-967d0e2a4b46', N'Pago Chico', 828047, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2830df54-23a8-4a02-9464-96c2efbb7acf', N'Transito', 593253, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e143de65-6b79-40ec-889d-96d0384a29bd', N'Arrecifes', 140275, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a113b0c-e003-4cf1-8cd5-96d4efa2354d', N'General Belgrano', 299867, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'831c84e3-2809-41a0-bdd8-96d8b1ba081c', N'Ausonia', 964503, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d0516aa-dd84-47d2-b8ef-96dd06e8fcf6', N'La Puntilla', 320751, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb050e5c-ac48-4278-af82-96de08faf391', N'Banfield', 604009, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0351df8-f98a-4bf8-9f68-96e7638b1aac', N'Rio Grande', 115951, 23)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b77534cf-cf46-4aad-825a-96e91331c2f5', N'Barrio Lomas Altas', 3317, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ac708737-d376-4174-b832-96eaff778387', N'Constitucion', 350352, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da7e2f16-2838-49c8-b03a-970f3bc35b2e', N'Villa Sauze', 484104, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9320c50-d8ab-4016-9e7f-972ccd7a7280', N'Jose C. Paz', 162280, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a69ed0b8-84c6-4fa9-b2bc-97347ce17243', N'La Juanita', 361527, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a793bcd1-5daf-4de8-be40-9749ec895fb7', N'San Jose Villa', 674594, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9785867b-4d06-4a9d-a88b-975db5c90c2e', N'Cushamen Centro', 255845, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44b97a64-1c56-402a-a23c-97641f41acd3', N'Villa General Manuel Belgrano', 339764, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5fd9eff0-8f44-4989-8fe1-9788cc07a4d0', N'Pueblo Muñoz', 643456, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0d7a4a3-8ec6-4cb4-a32d-97a622ac08ee', N'El Manzano', 258379, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fee04bc3-f9a4-4ae3-b8c0-97abd25cd0a7', N'Balcarce', 869060, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df491c32-bfef-4fe9-99fb-97c0fab5e7d1', N'Villa De La Quebrada', 85070, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c068217-3e59-428a-8d12-97d4fd50fc73', N'Barrio El Maruchito', 485065, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6137b7c2-f215-4fac-80ea-97e1364617b7', N'Barrio Los Pioneros', 447437, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b287e5d-1f83-4e6c-b586-98246d1b0ffa', N'Yoscaba', 200636, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90865366-34e9-44bd-aabf-9851314b96d4', N'Capitan Juan Page', 134103, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf3eecbe-54f8-4f24-ae03-986665d8ea19', N'Delfin Huergo', 311030, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9bdeb5b2-8d75-4dc2-bd88-986cdad47218', N'Cona Niyeu', 525409, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9f8de3e6-8a95-4a58-a089-987068dc511a', N'C.C. Bosque Real', 22029, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba2538ec-b1c2-464e-8b1d-98892636326a', N'Rafael Calzada', 745558, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'49349672-6232-4d74-9e0d-989cd7047fd0', N'City Bell', 39148, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85c7ab02-d593-4ff0-a544-98b4ae0b7436', N'Barrio Casa Rosada', 348353, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5eb30b5c-9a5c-455a-8f8f-98f2fbb84f06', N'La Adela', 493470, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'37d572cd-b080-49bf-a59b-99084786ad23', N'Angelica', 639423, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae877014-86f5-4e27-b367-9919a2a36a15', N'Francisco Alvarez', 787092, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6bc533d-01f0-4e34-8334-991e6fea7589', N'La Tordilla', 308420, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb505942-b0a9-4ef3-8456-992f49a0b814', N'Concepcion Del Uruguay', 200410, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7010e050-4d0b-43a9-ba1b-992f81007195', N'La Isleta', 627804, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90a2e011-45f4-4365-8ad2-99772d541ad2', N'Parque Patricios', 9585, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'81a802d1-ad91-4e43-82dc-997b5261ffba', N'Villa Maria', 275870, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ec1bb31-f0d7-415b-b4ca-997d454239a0', N'San Gotardo', 854294, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9d1973fa-8822-415c-beee-99811725ef35', N'Mechongue', 781392, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abf4a58e-d214-4a44-b3d2-99968f650ab6', N'Colonia Pastoril', 974131, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'419d23c9-7d5c-4c30-ab08-999e69a0b2de', N'Sa Pereyra', 817603, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab149f8b-7a70-4367-baa3-99a64881756a', N'Prahuaniyeu', 446502, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92137c18-fb30-49f7-acbb-99a6d797f17b', N'Anillaco', 994711, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c1238bd-33b5-4894-a58f-99b72635222a', N'Los Nuñez', 9977, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75382f24-3c86-4e2b-94f4-99cf1229d95a', N'Coronel Belisle', 582845, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd046673e-7cdc-43cd-bdef-99db7b6cc41f', N'Valdes', 843474, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e4c7249-3bba-453c-9ca6-9a012a9c65e1', N'San Pedro De Gutemberg', 77467, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'764b4462-4fa3-4ae5-8d33-9a042df8f4ab', N'Huinganco', 403950, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db822a33-172d-4b71-baef-9a435c354aaa', N'Las Lomitas', 137408, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'371768ce-6fd1-4c21-bd15-9a45042adad2', N'Villa Adelina', 893229, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc3bd9b6-c58c-408e-96a4-9a6032a8a5ae', N'La Cruz', 78167, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c78cdea9-addf-4886-b116-9a74559525fe', N'Blancagrande', 414639, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd75ba6ad-1495-4a48-93a3-9a764adca8a2', N'Los Cachorros', 321965, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a6075b8e-428f-4f8b-b02e-9a82207935c6', N'Presidencia Roque Saenz Pena', 557610, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6af9e3a0-93a2-472d-ba39-9a914583bcb1', N'Guaymallen', 568550, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99695ee1-adc3-4f50-8cd7-9abb67df1fbf', N'Chuña Huasi', 131990, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a563421-9c9c-4bd3-9ab8-9abe7ca416c0', N'Nuevo Pirquitas', 827454, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'37b17eac-7f16-4d04-801a-9ad0cf7dc8dd', N'Guillermo Enrique Hudson', 735748, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b05048e-b81a-4283-aabe-9b10c048f5b9', N'Clodomiro Ledesma', 910276, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'435e623c-5467-4a54-9bfd-9b11c348a314', N'Lomas Del Rio Lujan', 266956, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1dd2ae18-0746-459b-8ea9-9b24a13a18b4', N'Pujato', 970413, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'34535670-6422-4cce-b753-9b25bc127fb0', N'Los Charruas', 816999, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3dee6780-b97e-45d9-9c4c-9b35882b1b7f', N'Ramada Paso', 318235, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'18440c38-eb63-46af-b955-9b42bbb9cf16', N'Benitez', 826263, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b63dddc7-d0d1-4175-a88a-9b57541fdb58', N'La Carreta', 842417, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14117dbf-aa89-440c-8e0a-9b5865278803', N'General Vedia', 94910, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e17022bb-a6e4-4e38-8363-9b5f3ebc9437', N'Choya', 714734, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce32e97a-5229-455f-bfe6-9b61e9f756ed', N'General Manuel J. Campos', 883619, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d37d93a-050a-41e1-bc01-9b8a74a98345', N'Villa Luro', 242798, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a56da85-e2fc-4bd5-9284-9b8f8ee4897e', N'Azcuenaga', 162491, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8efb3e3-0e8d-450f-8c5e-9ba0cc9de55c', N'San Jose De Metan', 92802, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba3f4200-621c-4c0b-8c2d-9ba218f52c2f', N'Almafuerte', 428854, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'846a36c5-0f36-43a3-a603-9bae0207674b', N'Barrio U.T.a. Ii', 49691, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4365df4e-f02b-4d54-98fd-9bb52e47b8af', N'Pilar', 205849, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'31ed223a-b62e-44cd-9373-9bb606fe653c', N'Tomas M. Anchorena', 306646, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'414a16ab-86c8-4aee-a8fc-9bbac7d7e858', N'Panquehua', 599454, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd32214f8-52d7-4cab-9cd5-9bcccc9b9bd3', N'Coronel Brandsen', 173515, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3aac6e24-3d57-4f80-831b-9bdf2341bcc6', N'Los Sarmientos', 303238, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd1e74b4d-2583-4fb7-8c7f-9c24ad7b85a0', N'Colegiales', 687494, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'84eaac25-b078-4b24-925c-9c2a33fbf3a2', N'General Conesa', 958128, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f8560afc-5706-43ff-8342-9c4d7066019b', N'Las Tejas', 166074, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a3f929d-71c8-437d-ab1f-9c5d10c870db', N'Campo Santo', 388422, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'904373fc-06be-455a-be9e-9c67d65a2c88', N'Pindapoy', 680449, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f95dda9-8307-41a5-a178-9c6e38dc4f13', N'Villa De Las Rosas', 264948, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88f7adca-64c0-4cbb-bf3d-9c7477def265', N'Colonia Dora', 530064, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abefb762-6f9c-455e-8a15-9c786ed4cdc9', N'El Rincon', 314058, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cac3ba4b-f634-429d-b99d-9ca23b062372', N'San Clemente', 48050, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5f864d2f-e5bf-4746-aab0-9cae5f2b7681', N'Poman', 224240, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'616b9afa-1c11-44e9-b673-9cb7621ff19d', N'Freyre', 418187, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ba0560c-69b6-4403-aa49-9ccd06a307ea', N'Bernal', 897601, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46548541-7496-4756-98a5-9cd73d63b686', N'Villa Del Mar', 640139, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6fe15999-8bd2-477d-b459-9ceaa0d4fdd6', N'Pedro Molina', 553796, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f00944fd-3a84-40ae-b132-9d0026a4083b', N'Chepes', 675809, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9241f1cf-9428-4154-8a61-9d1b976cae71', N'Pascanas', 287974, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c65aa884-8ee7-4626-b904-9d2307571593', N'Jocoli Viejo', 406485, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0a72aa2a-d0e1-4211-ae0c-9d51fe2f6386', N'Ingenio Fronterita', 341238, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a704c8ca-3926-4423-b161-9d5766e18f6d', N'Ibarlucea', 707733, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'96b3ac9c-58c4-43c8-b5c5-9d756506518a', N'Urundel', 486541, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ede089dc-5fc3-4e60-aa1b-9d7b3f1665b4', N'Villa Bastias', 720495, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f80f754d-7d44-48f1-8b38-9d9350e5a673', N'General Ballivian', 332242, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'319d4540-d830-42a2-b90e-9dcb374448c3', N'Cerro Negro', 164731, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'393fb8ba-87b3-4a22-9f1f-9df87d6f2c5d', N'Tres Lagunas', 837382, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45dcc3fd-c069-42b1-b28f-9dfcc52bf8b1', N'Napaleofu', 976678, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1cf341a6-7055-4d55-aeac-9e0066d0910c', N'Puelen', 155558, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'894e0842-3825-4922-95a3-9e17e5e52481', N'Santa Elena', 198093, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22f7322d-0b74-4994-b583-9e43106c58aa', N'San Carlos De Bolivar', 833947, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27d181d6-4359-49d6-a944-9e4d74573b71', N'San Francisco Del Monte', 776197, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd038307e-7dc2-46da-b623-9e51d847ab4f', N'Villa Cerro Azul', 290719, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f86ea750-f404-4de3-a064-9e5c9456ee09', N'Villa Ciudad De America (Loteo Diego De', 150951, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da349253-a367-4a45-b2c2-9e5fbaa9703a', N'Estela', 487520, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5f00db13-bf38-42e3-9624-9e6aca152ceb', N'Rio Chico', 171358, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5bae0b0-581c-4b1d-8641-9e759a091b44', N'Colalao Del Valle', 285990, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3f35881-709c-49e1-9538-9e7a5c8f38ee', N'Mina Providencia', 195876, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c76d50a-7660-4f21-8af9-9e952811a6c4', N'Los Helechos', 218593, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e73e94b5-e50c-4e9a-a847-9e9752c1d0e1', N'Caseros Centro', 318199, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'652629c1-2cd9-4590-b476-9ea31079de60', N'Toay', 727279, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'175631de-94ad-41c0-96b5-9ea39421d498', N'Barrio Parque General San Martin', 244870, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e177d669-caf9-4ab1-9f1a-9edc28efbd08', N'Embajador Martini', 564014, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8b497bb-04fc-452b-867d-9ee0c185ccef', N'Kilometro 658', 284055, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae0e9b67-aefd-4a08-b821-9ef58e8a4e3a', N'Tomas Jofre', 624499, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'41dd0f1b-13be-4bb1-8bf5-9f0766b2f138', N'Villa El Chocon', 307796, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'218f3fb7-ced9-4258-a00c-9f12017f20b2', N'Barrio La Herradura', 937173, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cbd816e2-7acc-4267-bb79-9f15a62a0448', N'El Bañado', 878916, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00c9cb51-f420-44ac-acf8-9f27241d575f', N'Mar De Ajo', 845827, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'670853f3-fbd7-4caf-8175-9f3688556f97', N'Buta Ranquil', 405071, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ac539d9-6bd3-4f17-9b10-9fbbee060624', N'Los Gutierrez', 344482, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dfe33f7b-9048-4fdb-825a-9fbf7f43313e', N'Maiz Negro', 189858, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b2ee003-372c-4782-bb72-9fc2166cff28', N'Pumahuasi', 430191, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7c5787bf-1482-4db8-93d6-9fca03cbb61d', N'Aldea Asuncion', 778875, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'879365dc-96c7-4bcd-8d84-9fcf8e486295', N'El Borbollon', 45201, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b35587b0-aae3-4976-8883-9ff0d6600d6c', N'Mar Del Plata', 534013, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b62a51c5-8b69-42af-8663-9ff4267ec6a1', N'Medrano', 23296, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf3d8435-248b-4096-8efb-a00131df98d9', N'Rio Colorado', 9087, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'94cbda8b-e137-40fc-ade5-a0077c4aa0d0', N'Manuel Ocampo', 140718, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20c9b1b4-9d70-4f78-900f-a012fb0a2e9c', N'Loro Huasi', 415726, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0426cb95-613f-44ef-98e3-a019a1ab893a', N'Belen', 804303, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1561ad2-b433-4949-b4c2-a0578d37f1be', N'Las Palmas', 354750, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf9d1558-8001-40b4-b006-a062c9c33a48', N'Suriyaco', 946028, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c078eaf1-26b5-42fe-860e-a06f7de311f0', N'Parada Orlando', 545070, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22cc941d-7847-467d-a51d-a07e443070e6', N'Bernal Oeste', 304816, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dafe86a9-441f-468a-8900-a0b5b986a39d', N'Del Valle', 233250, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3a714998-7ac4-4582-987e-a0cd1dc64fb1', N'Guatrache', 213423, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e5d6ec7-8d12-4b8e-82a1-a0cd930b52bd', N'Pueblo Nuevo', 109677, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'400e33c2-bb1d-4f2d-8d73-a0cf46103fea', N'Herradura', 22109, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'03a87318-38ed-449b-ae49-a0e169822a4d', N'Pehuajo', 906425, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3aec9fef-4c8d-4eeb-8954-a0f360fca12a', N'Barra Concepcion', 415055, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43ea41ad-7b58-4060-9a20-a0fb403112af', N'Guernica', 974093, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c4f08cf-a1a4-44ff-9fbe-a1003904576f', N'Pueblo Viejo', 743463, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0bca7ff6-c841-4d95-9d85-a1040a72e473', N'Cardenal Cagliero', 653736, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab50d1c3-2a1c-4f43-bd3c-a111cdcfa2ba', N'La Aurora', 357663, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f4f6eb39-0ed7-4422-a7a2-a114f768b439', N'Paula', 90281, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0149172d-97ac-45c0-941f-a11c61de77cd', N'La Firmeza', 484878, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b42cffc-3379-47bd-b532-a13ec76e5853', N'Villa Gimenez', 412963, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'80c6a009-8fd3-4b92-9af4-a162d467c2a8', N'De La Canal', 690323, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22d5e5a5-bf19-403d-b1c0-a196154d115d', N'San Miguel', 663704, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbff01ac-68e0-4944-999b-a19dbf890d6f', N'Villa Castelar', 966874, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7bebdee-7aa2-47a2-9e31-a1a25aac0188', N'Angastaco', 476909, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04960a68-52ae-4285-a505-a1ba10bd566e', N'Tres Cruces', 188100, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2cee794f-3b23-4a60-ba80-a1be01864d8b', N'Punta De Los Llanos', 300221, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d588f18-1ef1-460a-97ad-a1db6f1447e2', N'Villa Alfredo Fortabat', 620889, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e8b71b6-7ccc-4381-ad44-a1e1fb867cae', N'San Juan', 93747, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fcafe349-0a2b-49ef-8ed0-a1e235a19223', N'Hambis', 831548, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef82331e-97d0-4c47-acbb-a1f5f5156635', N'Arcadia', 120008, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'096fdf2e-de05-4bf7-bd59-a20d35d50d50', N'La Consulta', 631939, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e17a913d-ed40-44a5-af4e-a20dbd598305', N'Los Miches', 864093, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b2c9f0d-b997-437a-bf73-a22118ea66e1', N'Jarilla', 272396, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'453e8cfc-899e-4bd0-a8c9-a2376468391c', N'Francisco Madero', 400636, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1129aec-1dec-4831-90a3-a23dc32f0e18', N'Covunco Centro', 382619, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78dacadd-a770-4011-8afd-a2460ef87f7c', N'Ca¥uelas', 175209, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f391ff5-8189-4f69-a797-a24b0c180a05', N'Hualfin', 200883, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'185302f7-23d1-4dce-a86d-a24e34ec6d4c', N'Chacras De Coria', 273288, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9841e38f-7bb0-4b6a-934a-a25c67e02556', N'Country Jockey Club', 273157, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'16318f42-ca5b-4c99-b8e1-a25e62a020ad', N'Florida', 551527, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'061bf31d-0b64-48ab-b1c7-a27ea1e927d8', N'Pacheco De Melo', 838305, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c28e633-8479-443c-994c-a28ff9c0b325', N'Rayo Cortado', 394852, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14a1e0dc-b011-4692-a61b-a2921b37c830', N'Laguna Blanca', 400120, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'08634cd4-9a70-4c12-b7dd-a29a448eacce', N'Los Barriales', 463137, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a40d7a06-392e-44f8-801e-a2bdf45cba7b', N'Casa De Piedra', 127323, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'093d659d-c1a2-4737-898e-a2dc1089492c', N'Puerto Rico', 799999, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af064db5-99a9-42c0-bbf4-a2ddc4fb6bed', N'Villa Chacabuco', 71288, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abca0123-9dfa-439b-9305-a2f4bbd22244', N'Campos Del Virrey', 434669, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4bf0ea9c-bd66-4044-9a22-a33ce9d7a52c', N'Villa San Jose', 617295, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae86ff81-ad5c-47ae-92c1-a35703c8fbf2', N'Tamangueyu', 476484, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87df114a-77e1-4a7e-8b83-a35c3eb5d7da', N'Tierra Alta', 463671, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cbf8a936-0981-443c-9218-a373944a202c', N'Villa Josefina', 922009, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'896b9900-5e48-4a89-9e80-a3939d97b844', N'General Capdevila', 717783, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ea85445-068f-44a9-92ec-a3972ea5a92c', N'Villa Arrieta', 535696, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd31701f0-e30a-4a0f-a9dc-a39e411e335e', N'Arequito', 461608, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c27fb12f-c67c-43d0-bcaa-a3a794ad2bf6', N'Mar Del Sur', 831410, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd8619d8d-9eae-486e-b17e-a3cf4083e0f6', N'Girodias', 479897, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'69e91814-a4ec-4ec9-b2a3-a3d37c916f72', N'Los Chañaritos', 885819, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70c2c76a-ed9b-4807-85a3-a3ef4c65b5b6', N'Estancia Grande', 772312, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3decf30e-f5a4-4691-8fb4-a4034e7cb79f', N'El Talar', 398307, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3ce2c07-c69c-478a-9064-a40ab0c5d878', N'San Vicente', 751205, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cce7b799-f2f4-4714-b60b-a41e860264b8', N'Pueblo Nuevo', 770778, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c874ea2f-a17e-4642-a6b2-a4249616e149', N'Colpes', 586813, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff80f125-94bb-4fd0-b45b-a431cbefca3b', N'Rio Bamba', 896274, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bb007d1a-70ad-412f-ba78-a4484bc5c7bc', N'Barrio Las Margaritas', 805867, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b204247-bcf4-4309-9ef2-a46df5b70962', N'Villa Turistica Del Embalse', 435972, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cec1572c-b1bd-4e5b-b74b-a494117a165f', N'Morales', 427373, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'32d73109-70fb-46cf-ba1c-a4b856eae57a', N'Colonia Crespo', 541732, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10215c8e-865f-49f1-a290-a4ef299677a5', N'Bowen', 640324, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c4f67dc-56a0-41fb-958e-a4f5d8f0d8ac', N'Playas Doradas', 420350, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b455704e-b9cc-42e6-8a7b-a52f7d6fe1e9', N'Nogoli', 885781, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0715d3d8-f5b7-4a2b-9a7f-a535f2f1020b', N'El Bolson', 978094, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d552c39-05bc-40ee-a017-a5368df65660', N'Colonia Popular', 308773, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'128f46de-6948-4cf2-a04b-a53de88098e4', N'Villa Regina', 523699, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'740dd746-5c66-4742-b08a-a53e5d7c78b9', N'Colonia Duran', 878711, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'959b6c24-1221-4183-afeb-a571bef56be9', N'Guerrico', 132886, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'229a1914-36bb-460f-b035-a57af8e252d4', N'Maquinista F. Savio Este', 935221, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83631772-9032-4bb8-922c-a5a53b7718d0', N'Saavedra', 637351, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c83fd498-6c33-4c1d-90eb-a5c920b76e52', N'Integracion', 214618, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a5868df1-5576-4f90-ae4e-a5cba3cb98bb', N'Coronel Vidal', 923271, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b41b1003-a9bd-419d-a7ad-a5d81509dc82', N'Vallecito', 893652, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3e8d3fe-832e-4653-8981-a5ee85645ddb', N'Las Talas', 440402, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'baeac190-d9c0-46aa-9abe-a5fd06de614b', N'Ingenio Santa Barbara', 787498, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6583bd04-f3ed-441d-9bc0-a5fdcefb8c0c', N'Las Lajitas', 770270, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'82d425fe-5c61-4ca9-8765-a60020490846', N'Laborde', 508591, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7dec2a46-cbdc-483d-9abb-a60698ef1e2f', N'Alcira', 181381, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'334e2500-db5b-4521-9141-a608fd669275', N'La Clarita', 399378, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d08ff56-7e10-4a96-aff8-a61b2ed7aa35', N'Lonquimay', 344744, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'91e8c04c-59b1-4625-9ee8-a61d6a8f4f94', N'Barrio Cuatro Bocas', 784819, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd775c21-b408-4f29-b831-a624e60f64d2', N'Pablo Podesta', 46943, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e775691-ce6c-4764-b863-a6354b1ed46a', N'La Puerta', 224365, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93973276-fa25-423d-b261-a646d33aa668', N'Chuchucaruana', 6893, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4c0cd21-318d-4b0e-ba36-a64dd8372b41', N'Villa Paranacito', 434338, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c17bd5d-6dc4-4c2f-82f1-a6537ffba50c', N'Moquehua', 653043, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f486280-3d21-4c01-af3e-a65b5add12f4', N'Alpachiri', 821637, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'005303b4-88dd-42e3-a80f-a66a100c48ca', N'Villa San Esteban', 555341, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8cf57ab-9dbc-494a-99eb-a677ee564afa', N'Laguna Blanca', 832475, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bacc046e-a9be-4362-bf80-a68e80fc2d15', N'Gran Guardia', 532622, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b64917b-9c5f-4046-8879-a694b342fd14', N'Paso Cordova', 834893, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'71ddcbd2-56d9-43d8-b6cc-a694d54af4b7', N'Espartillar (E)', 958919, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ce01746-5ef6-4dfd-9e7a-a69767b240a7', N'Barrio Mitre', 976669, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9078d882-2a99-48fa-a2ed-a69897a1848a', N'Caburei', 772266, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c412619e-3f13-466b-87ad-a6a2a48c0171', N'La Cautiva', 186375, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a487578-c098-42df-8025-a6a5f84653db', N'Caseros', 533501, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'962eaf2f-9afa-44b0-a541-a6d2eeb317a7', N'El Turbio', 665562, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa354e90-95a5-4aeb-934e-a6d42bf98767', N'Doblas', 783292, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e19e79cc-77f0-4ac7-a450-a6e03888aa04', N'Falda Del Cañete', 106709, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e7b86a7-bd4f-41f0-ad34-a6e8c44efc8f', N'Hernando', 347449, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad20f8ab-6c00-4ae3-a42f-a6f19d6053d5', N'Cachi', 64498, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'03720df3-9c51-41ee-985a-a7024fcb3b17', N'San Pedro De Toyos', 364704, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f7304bc-2adc-4471-97db-a71d8c655e59', N'Ardiles', 117455, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4d0cbcf-8de7-455d-aa7b-a71e31ec3a7a', N'El Brete', 696210, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3877f816-8595-4800-958b-a72b83894857', N'Los Conquistadores', 247379, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9484eeb7-2639-4bf1-962f-a72d30c17978', N'Makalle', 906805, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ed2e10e-3747-4016-bb17-a739d3648dbf', N'Yavi Chico', 312293, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef82e32f-c92b-4eea-8bdf-a7501e2319e0', N'Colonia Alpina', 692976, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'13bb7544-bf98-453e-87ba-a763bf40c7e0', N'Castro Barros', 9620, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89ca0cfc-6157-46a5-bc28-a77d76e3955b', N'La Dorada', 77987, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a705f1bb-4029-4b54-a678-a78390aa75fb', N'Manzone', 618885, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c56b27af-4d70-4a39-b870-a7a0972d8315', N'Garayalde', 845812, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59e62148-23ab-42f2-850d-a7a28b82dfd3', N'Ciudadela', 232908, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c67fd2e-670d-4ba2-b035-a7ccac3f36ca', N'La Cañada', 589831, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'739fcd82-28b0-42f5-ad44-a7cec3705af4', N'General Roca', 433705, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b99a8096-0e91-4190-b333-a7e2d9cee6d0', N'Villa Ciudad De America', 200808, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'557c1b31-b4ec-4d78-bf67-a7e6167dda35', N'Lomas De Vallejos', 352991, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a9c7346e-c69a-48ae-8964-a7f2318886eb', N'Paso Del Rey', 452527, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9494c30-fcc2-4c56-a3e4-a801def47f33', N'Jose B. Casas', 427315, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'041a8f40-c78c-4bc2-9726-a8066c11521f', N'Ballesteros', 635063, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'512f8f52-7e4c-4c59-8ec9-a80b4256d362', N'Viamonte', 323524, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'012bf95c-3167-437d-b8b4-a80d60df9710', N'Isla Santiago (Oeste)', 988309, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7cce7d2b-cc88-4fcd-a205-a82853627543', N'Chacras Del Rio Lujan', 876411, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da700711-a4dc-4b8a-9935-a8309e532e9e', N'Sañogasta', 666730, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e8587dd-3e43-4a6f-93c3-a838f8455af2', N'La Ramada', 475324, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fbba5838-d8e6-4b13-b393-a847bb23fca7', N'Carrodilla', 335534, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd0f79af-71ca-42d4-b88b-a8aa9145da48', N'Estacion Arenales', 599545, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ca1d4a3-6b4a-4912-b7c4-a8d04ba7cb8f', N'Naupa Huen', 270106, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'910e4e4e-4c54-4572-8916-a8d2015f56b6', N'20 De Junio', 899471, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d6106a2-883d-4933-b900-a8da3e2388bc', N'Cañada Escobar', 601122, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9a32e01-5c44-4485-9e4b-a8dfbfcb28d4', N'Barrio El Cepillo', 155638, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3bd7067-7b07-4c15-8030-a8e9b2cf3a8f', N'Mari Menuco', 495624, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'edba02ff-dfb3-4659-afc7-a8ee1c033128', N'Estacion Yuqueri', 575293, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8963a0e6-9c82-428b-927a-a90cdc52d798', N'Jubileo', 926314, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec6cfb34-1914-45d7-a30c-a9232e2c812f', N'Pedernales', 299061, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'543b1a8d-ac18-45b9-ace3-a92fbbd35954', N'La Caleta', 957321, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b3d291b-ebcc-4c46-b4a9-a9363bc681bb', N'Gilbert', 258255, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'40f3ccb8-eb5b-4241-89d8-a93d4dde91b7', N'Barrio Ruca Luhe', 470593, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2fd2f151-d323-404a-b252-a9489a13597f', N'Los Juries', 831134, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64a96f23-378d-4a33-9ef6-a94ea8540779', N'General Las Heras', 593875, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bfac854c-e0d9-4920-b5ac-a95a438f0207', N'Puerto Las Cuevas', 763830, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'08029b5c-fc7a-429a-85e9-a97d695b994b', N'Guiñazu Norte', 426547, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9abcacd8-cb18-41e3-9376-a9a16761a6f8', N'Barrio Ruta 24 Km. 10', 427391, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'adcf3ed3-9731-4958-bd56-a9b0dec57942', N'Chañar', 687390, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c74cf6a3-e3c3-4404-b79c-a9e3d08304f7', N'Choele Choel', 266272, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75a5ff24-8c15-41d1-9fa6-a9e7e3a9b9ec', N'Taco Ralo', 599002, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca43baf2-8a11-4b44-a83f-a9ea676a5532', N'Parapeti', 313738, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8ae0eb3e-239a-44f6-ac08-a9efc263adc0', N'General Rodriguez', 763987, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c86a6dca-d045-4a80-9d3e-aa00be9cb14c', N'Villa Cooperativa', 732584, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0a90fb5-d393-4a41-80fb-aa042763dd52', N'Almirante Brown', 110673, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9fc646ac-7f7b-4e65-b84e-aa048effdd2b', N'Barreal', 817307, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88843a92-1970-4b9f-9ebd-aa3cbed80b7d', N'Joaquin V. Gonzalez', 602503, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6498909b-760e-4a13-ba77-aa3e5a2bed6c', N'Gobernador Benegas', 177584, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc223108-039c-43fc-b7b2-aa88d5dcbcd8', N'Villa Tulumaya', 732051, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e52ce85d-09ad-48b1-95ee-aa8dd99aa26e', N'Rivadavia', 747543, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'28baadee-8ced-42b6-a0fe-aa9a40e9a950', N'Monte De Los Gauchos', 682112, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e3eac887-e5d9-4796-892c-aa9f41837a8c', N'Los Arboles', 690193, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'758909f8-fb72-4f2f-a8f3-aac0c19dd1eb', N'Cacique Ariacaiquin', 954454, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c13b80a6-8968-4874-800b-aac7e8231203', N'Bahia San Blas', 127592, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63427e58-7b93-4473-bd7f-aace9ac59b4f', N'Fontezuela', 161986, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'634ccc30-0428-47b4-92d5-aacf7d4e8966', N'Villa Lugano', 585656, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0f93ddf-a12e-4e36-9a87-aad996e018f7', N'El Portezuelo', 266519, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd652f51-d16d-41e1-aef2-ab11529dcede', N'Vilisman', 881383, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d8791c7-e092-449c-8578-ab19a7beebf4', N'El Piquete', 496949, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4bdbbbd-8fa1-49a7-a28c-ab2170066c33', N'Goya', 299876, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b762bcf-ba57-4338-8741-ab31ee4e0490', N'Alicia', 544802, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'188f930f-030b-4167-8be5-ab84dc13db94', N'Palacios', 719195, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cf57e967-d027-4777-9422-ab881ef8d56b', N'Alberdi', 477086, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc30c47b-7d6d-4dee-8056-abcf6e3805f7', N'Remedios Escalada De San Martin', 982672, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d8c36c1-66b0-47e6-9f00-abd25e2aeaec', N'Barrio Mosconi', 137916, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e82dbaf-b26a-4f72-a248-abd309dddc1b', N'Santa Rosa De Calamuchita', 914528, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a090e3a1-8159-42d6-9cd0-abe3a375566e', N'Villa Los Alamos', 641660, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c73b4f4-8bab-4a0a-8dd0-abf463dd3eaf', N'Los Altos', 400215, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ed517709-ba49-44e7-abae-ac103cc9e6d9', N'Rio Villegas', 831471, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'688e2952-90c8-4134-b6cb-ac1f94d8e83b', N'Pozo Borrado', 303696, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8aa77a0-997f-4d7a-830d-ac4e2d4698a0', N'Santos Lugares', 247508, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'061b818a-f74c-4359-a1ed-ac7744629074', N'Pozo Del Mortero', 351641, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d755675-5126-4d5f-b2e6-ac7dc496c523', N'Maria Susana', 931327, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0d1577e-d5fe-44a7-a467-ac99948d0d0c', N'Naschel', 233531, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a9c0d341-99e1-47b2-9d5f-acb72cd03287', N'Villa Ciudad Parque Los Reartes', 628594, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c67e1bd-2e71-4b38-847d-acc2659e3b44', N'Concaran', 437865, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9b1aabed-75c1-43e4-8961-acc6c80aa310', N'Arteaga', 20579, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aafa9973-9b20-446e-89ed-acd3635a594b', N'Parque Avellaneda', 837390, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92dc7fea-3e92-4d96-af54-acd7ef7b332c', N'Parada Robles', 679936, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af60d73e-0fdf-4f6e-98de-ace6d911975a', N'Cochinoca', 272032, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c027da7-4fb9-4649-9d91-acebd7899e9b', N'Presidente Derqui', 116749, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba3cb883-8be9-44f3-b4b3-acec5f8858b8', N'Chacarita', 13426, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0cccd65-e30b-4074-ac99-acfaf1b18313', N'San Juan De Oros', 226323, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4100445-e99e-46ed-bcba-acfe5dabd497', N'Tapso', 735939, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'855f983b-b1d2-4898-b290-ad079ae8bf5b', N'Colonia Nievas', 734185, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9b8213a4-e338-4f6e-8d42-ad0d8ecd0618', N'Alto Los Cardales', 384934, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'626b71d5-9279-47fc-9906-ad121b210903', N'Tapiales', 510638, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6f9f4fe-5a1d-4137-8792-ad24eb38ce8a', N'Barrio Maria Elvira', 908976, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5efec2e-d23a-4f52-813d-ad3801bec0ef', N'Villa Hipodromo', 463454, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4a3e907-4866-4401-a960-ad611beaeb32', N'Aldea San Rafael', 148572, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65ab24a5-e2f2-4fa9-ac2c-ad7c040ddaa8', N'Piray Kilometro 18', 725689, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7f0e3040-e2c3-45e9-9654-ad8056e42b9c', N'Gobernador Castro', 119846, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f64d20e7-6437-417c-918c-ad80b41c49c9', N'Baigorrita', 915096, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'51523d6e-246e-4374-9ba3-ad95500b7456', N'Belen De Escobar', 241795, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'627906be-fe19-4cb5-85ea-ada6ce6583d2', N'Cerro De Oro', 847301, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6451466-32ad-4a68-acb6-ada8d86f4822', N'La Cumbrecita', 95412, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a61e75a4-b88a-458e-870f-adab203be81c', N'Medanos', 646028, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ab27bb8-1652-4f2f-8fd2-adae931c19f8', N'Asamblea', 599461, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b6034e7-5e27-4040-ac6e-adb3e9fe386d', N'Crispi', 474961, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'01505018-1146-417d-bc55-adb75e6b522c', N'Los Angeles Sur', 337885, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'481b49db-7433-4eb7-9ae5-adc7f31f1ede', N'Luzuriaga', 652472, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a4ec59d-459c-4ff6-a304-adcba07dcd75', N'Ascension', 517289, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72e52564-8458-4016-9d65-adec5e211362', N'Navarro', 973141, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd0e7edc-91a4-400e-97a0-ae202f910673', N'1 De Mayo', 961978, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56eefdfd-9caa-4421-a262-ae2bf4d60fd6', N'Villa Parque Girado', 657981, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78309e7c-9d8f-4d11-ad81-ae375e5e4bb4', N'Las Varas', 454684, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4775bed2-fd9c-42d3-ac11-ae4a16d4f20e', N'Tancacha', 838947, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd13ca313-7b88-44f8-bf93-ae5cf01978e9', N'Villa Nacusi', 324647, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'886dc0a2-163c-4fde-845b-ae5e5d5b7d07', N'Leandro N. Alem', 473847, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ea3f54e-30c5-4a60-aa97-ae68dda8f508', N'Corral Quemado', 310804, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd1cfe689-8ccf-481f-a2de-ae6aac23628b', N'Rincon De Azara', 465447, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e12a1ab4-faf1-4cee-ab87-ae7c792f9a42', N'Villa Del Dique', 286350, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3320fa1d-1a24-4fd9-a498-ae87acdd6406', N'Roberto J. Payro', 330098, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cea41f5d-704c-4793-879c-ae92b657b5a8', N'Punta Del Agua', 747955, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e67eb0cc-11f6-4342-9583-ae9d8e423a5f', N'Guandacol', 171271, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02eba6ba-7ef2-40a2-accc-aea776df5772', N'Miraflores', 485015, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1094c9f-8f02-494b-8de2-aeae83931d1f', N'Agustina', 615591, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89321b7b-ba0f-4bda-b5c3-af06b46f730f', N'Barrio Guatambu', 344090, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2dd3df8e-ca78-45bc-ac69-af0aa568a012', N'San Jose De Feliciano', 204322, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a929465f-bd14-4e27-904a-af0fc365424c', N'Espartillar', 569971, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'502e8902-44e6-4ad0-9236-af489675af37', N'Costa Flores', 246219, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ccb1c640-4b3c-478e-ad83-af7835f7fa5b', N'El Cuy', 150700, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cecad4e8-b250-4d57-80dc-af850d339d25', N'Fraile Pintado', 515374, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b237b7bd-f038-4d83-bbbe-af8b2eb45d01', N'Colonia Avigdor', 724272, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'816969c8-0391-43ea-9205-af989460e359', N'El Durazno', 347509, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0931a1ac-3bec-4d79-8411-afa705c76d58', N'Firmat', 976487, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'906760e1-7369-4540-9723-afab147bcf59', N'Ca¥ada Seca', 333848, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc2bbb38-aa29-4608-a33e-afb5651f241d', N'Clorinda', 397039, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1c612a5-2080-42cd-8d42-afb6fa0a3c05', N'La Jaula', 290940, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67c126fa-644f-4ef2-abf4-b00ddd848302', N'Guarani', 943511, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8896472-4341-4f14-8da7-b01bb70cf9f7', N'Laguna Blanca', 208266, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbeae3d4-3eaa-45a2-a225-b04c6dd99f2c', N'11 De Octubre', 777050, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef4749c7-f1ac-44df-9519-b06f75438132', N'El Tio', 802503, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30702dc8-fbda-4059-a35e-b07f27da79d1', N'San Antonio De Obligado', 355263, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b43c9da2-57fd-410a-984b-b07f8d0d0d97', N'Los Cedros', 140428, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'812b2fac-016b-47c3-83c7-b089b47ef8bc', N'La Francia', 588162, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af1f09e1-c6f0-4246-b509-b08b6276d633', N'Camet Norte', 949123, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ee5eba99-8ef4-4974-86f4-b09ade4b9924', N'Ojos De Agua', 843999, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72fdbfe1-174a-408a-b719-b09e6639910f', N'Paraiso', 259120, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7fff9623-22c8-483a-b0ea-b0b42a3a85d4', N'El Charco', 260064, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e0684fb-c2e4-4577-aab9-b0beb4c5bc39', N'Luis Burela', 42951, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b9eb614e-9790-453f-be92-b0c3737b943f', N'Las Chacritas', 46836, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7f2b1bf-766f-4d14-a915-b0c695fa7ed8', N'Lago Meliquina', 489264, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'222e3c51-9eff-437a-9d66-b0c8a3db6bde', N'Crespo', 460453, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'acbc6d68-6aed-493b-94c9-b0d38438cfc1', N'Romang', 773932, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'32786f9b-7122-4f2c-b188-b0d976b4ae5f', N'Villa España', 212371, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9068a41f-1223-470e-a9fd-b0ddaed5bfdf', N'Las Chacras', 584791, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'159374b1-10be-405d-8d54-b0e81fb89043', N'Coronel Cornejo', 384372, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'84fcee51-1b52-41df-b4f7-b0e8ac45eb83', N'Villa Montoro', 625062, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8f70d8d-943c-4a58-a68e-b0f881d03276', N'Barrio Adina I Y Ii', 298847, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21e23416-46ae-4816-bd36-b0fedc521493', N'Banda Florida', 906180, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05712dd1-ace1-4ba3-ae84-b1347442641e', N'De La Garma', 443598, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb15743a-abcb-4489-9890-b13938376c75', N'La Central', 438514, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5007314a-e1e4-4d4c-9049-b146d6cf41bf', N'Villa Eduardo Madero', 256359, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a0f37efe-9499-44c2-a636-b17d520fdee3', N'Sauce', 420476, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab86bc0f-6e45-4a3b-b174-b18ac6eb26f0', N'Los Laureles', 134602, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc218d60-f1c8-44d2-8832-b1ac58afc130', N'Villa Vatteone', 871410, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70420643-860d-45da-8f3b-b1b1d76c680e', N'Loteo Navea', 597674, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3652d85-b05e-4416-a56c-b1c0410d1990', N'Jaime Prats', 448031, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04e5316f-3348-455d-b788-b1c10aceacf0', N'Tartagal', 26854, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6237cc16-3f7e-4ac1-aa0d-b1cf6f934a12', N'Nahuel Mapa', 943296, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9823b683-1509-48a8-83c7-b1d755f14ec8', N'Rafael Castillo', 740163, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'622af4bb-57af-4c0b-96f7-b1e8e0213e4d', N'La Vertiente', 550290, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2345d6f-22e1-4da2-9249-b1ed4905a8f3', N'Cc El Tipal', 370877, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73207234-44cc-4426-b224-b1f02dbc6954', N'El Quemado', 343947, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6eaa13e3-92dd-4d43-b14c-b1f35fb68fa9', N'Laguna Gallo', 180638, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44ec74a7-4663-4e0b-83b6-b1f759b29a21', N'Villa Union', 951595, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43e15559-7702-42b5-8030-b1fecb9025b7', N'Punta Alta', 809845, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1677f25c-5ab8-4302-ac51-b215fcf81d2f', N'25 De Mayo', 57334, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'101fe7ff-2034-4039-b6a5-b216f7aca7f1', N'Villa Del Prado', 177617, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dcbb46f2-6e30-4f26-8bcd-b220dc99cc4f', N'Playa Union', 711398, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db2c82df-a0e3-46de-b784-b224a0e2a4c4', N'La Calera', 491314, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'68b18db1-6036-4887-9f16-b225c9dd926e', N'Villa De Soto', 277116, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b02eb13-da13-472d-ab5a-b2284ad785fc', N'General Racedo', 20194, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f27cafa7-bc5a-4fd0-9d67-b22a90860727', N'Macachin', 409024, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83b4580f-ee08-47c7-ad53-b22ec967d9df', N'Trelew', 186181, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4f9917fb-ffa0-41e3-b9e4-b232bb31e546', N'San Salvador', 396616, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'752c76ef-346f-4b20-bc67-b237638c5a5d', N'Cordoba', 541476, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a9debe21-52f1-4034-8652-b2386664c439', N'Gerli', 902105, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca0316f6-66e7-4c82-ad58-b23d8e54bcb7', N'Villa Del Parque', 55559, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'781956c4-33c5-4d70-b309-b255089f6319', N'Cabildo', 373342, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ea933f3-c790-4853-a3c9-b2558c2352c5', N'Cordon Del Plata', 296571, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbae2693-5bbf-4bb8-8791-b25cd7cc3467', N'Santa Catalina', 64609, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd1f7a056-1c8d-4b46-956e-b271608fe604', N'Ostende', 133281, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f3a8f8b8-0c7f-473a-8daf-b27344b32f14', N'Pluma De Pato', 26130, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'108b9b8c-9a36-4ae3-bd75-b295eb248fd9', N'Medanitos', 410300, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b725658-328e-4f15-9c91-b298ff6d4adf', N'La Toma', 538265, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e65a1aa2-bb0d-46c8-9c54-b2b3b9a721b7', N'Trujui', 760265, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c5ba17e-f909-4336-a8ba-b2b6b113df30', N'Golondrina', 220124, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'900386cd-b2c4-49b4-83af-b2b9eb351373', N'El Quimilo', 947785, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90a39b0c-b14d-4b59-abb2-b2c7a89fe8bb', N'Chovet', 682517, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5094b86e-2eb2-41b0-9b15-b2c88e9888c9', N'Maggiolo', 945734, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c7f6816-5454-446f-bc7a-b2e68f298998', N'Weisburd', 354210, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7810f351-d9be-4c70-8c4f-b2eb5d0711cc', N'Villa Gobernador Udaondo', 913730, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a57e4308-60e7-49c4-b567-b305160611e2', N'Villa Dominguez', 622594, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'616f6e96-8301-4908-a35d-b3125f080cd9', N'Villa Iris', 893038, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1667f763-9ff3-43b5-8203-b3174346cef1', N'El Pensamiento', 135912, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c7242dd-ede3-4e53-9a8a-b31ae69ed8ba', N'La Punilla', 599677, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4d35d2d-c82b-4d2b-b197-b32ac6363ca4', N'Oliden', 482845, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87b77d6e-ecfa-4447-8c97-b34d75dabf2b', N'Nacion Ranquel', 180023, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ed79aef-d0c4-4212-8822-b358e0fda484', N'La Delfina', 19851, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cdaabe39-9707-4cb4-8ff2-b37b59fc0aef', N'Villanueva', 888184, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a56c1db0-6a92-4a68-8173-b37ef6bb7b48', N'Reta', 740414, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ad1daf9-b642-495a-bc66-b39c362416c1', N'Ingeniero Jacobacci', 948406, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a0b50732-c031-4fad-a7fa-b39f5ce858a8', N'Rio Piedras', 456197, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35a260bd-2be7-4b51-837b-b39fe2f68fdd', N'Suardi', 111888, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bea97f5f-e24e-4e8a-bb47-b3abd0520ca2', N'Jocoli', 887059, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'55df64e4-e6ba-452c-82ba-b3b923d3a8c1', N'Juan E. Barra', 53700, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'edbcfcd2-3355-4256-8e4b-b3b9c3c64a67', N'Las Bajadas', 4486, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db725d9f-2e38-4c19-88f1-b3bcd29f0856', N'Cerro De La Gloria (Canal 15)', 380249, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59726696-f1df-4282-855e-b3d2bbd2d093', N'Santo Tome', 100491, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb7ba284-fe61-4f85-83fd-b3e67cbc16ec', N'Villa Bernardo Monteagudo', 525720, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'25e36a74-c732-4111-8165-b3f371165b4a', N'Bartolome De Las Casas', 747666, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a288816e-164c-4c7e-a33d-b416b3d1eec9', N'Los Angeles', 88371, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd98882af-d124-466c-8657-b4188a60bbdb', N'Mainque', 53342, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5c54c06-9f83-4d86-b6b4-b41a24b2a96d', N'Cruz Caña', 812845, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a99bfb0-0f11-4b2e-9934-b429acb638d3', N'Pobre Diablo', 522501, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3348049f-a01f-4cba-abf7-b42ef882d453', N'Los Reyunos', 889980, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22e14cb5-ed99-4d7b-8bdb-b465e25fa596', N'Miramar', 461818, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f4df4da-e02c-47ff-a57f-b4697342ca95', N'Agua De Castilla', 950278, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'edef5e67-ffdf-4772-98a3-b48034390667', N'Bonpland', 42169, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'325e55c1-69ea-4c85-a8a0-b48db1e8ba8b', N'Ulapes', 47099, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'933484a8-7e5f-43cf-b984-b49297c7076f', N'Bajo Carrizal', 109162, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7c462c8-1f16-428e-90f3-b4cf6ff72b0d', N'Barrio Los Olivos', 803451, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db75f2f9-0ce4-4d51-b647-b4dcaa8f5665', N'Bagual', 33259, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'add268b0-6b08-4804-8663-b4ecb1538c47', N'Colonia El Simbolar', 375507, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38e38504-b960-4bfe-9312-b4f8ffa9addf', N'Tosno', 45101, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8425a61-eebf-4277-ae00-b50994259fa6', N'Balneario Orense', 109849, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14c6c729-aad1-4daa-a3ad-b52af901c29b', N'Aparzo', 694657, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1f964bd3-c3c7-441d-b07b-b530ccc3f652', N'Jama', 874134, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9cdb5dd6-cb0d-4f4d-9a50-b54539b08bc7', N'Villa Parque Sicardi', 674725, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e6f69412-92d1-44a3-871b-b54b7eab1979', N'Nonogasta', 72437, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d490aa8-ab6d-47d6-925c-b55b72f1b210', N'El Moreno', 243915, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9e7e35e-f677-442a-ac90-b569295d76ef', N'Barrio El Nevado', 819253, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da9ab637-5852-48d7-b76b-b56f30e0a1ef', N'Arroyo Verde', 806538, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'305aea4a-00ee-458d-a86d-b5967721c4e3', N'La Puerta', 517866, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5d2e6f3-c451-467f-b10b-b59c1e4c87f1', N'Fortin Inca', 964640, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a924ac5-ad78-46f5-8ba8-b5b0befb48f1', N'Yatayti Calle', 639749, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a18c13ff-0b68-40fc-a7ad-b5bf6b09ed7e', N'Bella Italia', 296593, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b1e4233-21d6-4cd1-9506-b5c3decb3ea4', N'Riachuelo', 493629, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'985cfcfb-4c47-461b-8fb4-b5ce5f76c52a', N'Villa Llao Llao', 89585, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1774bf77-3f62-41b5-a832-b5d75d19fc82', N'Ingenio Primer Correntino', 691792, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'38fe0559-9271-4dfd-8fe2-b641a7fa5563', N'El Zapallar', 338480, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc397190-31c4-47f5-a773-b64ba2204fb4', N'La Arboleda', 781541, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'90d41b35-b6bd-4433-8db8-b65c03ef02c8', N'Ancajan', 227077, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21ff484c-c8b2-44d1-9152-b660aeeace6d', N'Laboulaye', 725084, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1fdd971b-3a97-4f73-8043-b6757f95a2d3', N'San Hilario', 932033, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e723d22-bd24-4321-8a3d-b677847c3738', N'Cuatro Bocas', 947980, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'434bef3d-6662-4572-b542-b6a641549863', N'La Puntilla', 410763, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eef57fc0-caa2-403c-b7e4-b6a6f1e2e583', N'Los Miranda', 494415, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7b3b3bd-888c-467c-be24-b6a838417366', N'Cerro Colorado', 856736, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07f0a751-6789-4de6-8c52-b6a8a58f2ad8', N'Villa Mazan', 523573, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26f8cfbb-33d5-459c-b158-b6ab5f54fc83', N'Ignacio Correas', 378689, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e6a192a9-4ca4-41e2-bdb8-b6af39f8a6ad', N'La Falda De San Antonio', 935564, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26034c2d-a3e8-46c8-9d76-b6b2e8956284', N'Las Petacas', 450080, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ffc4fb8-2d63-4257-8997-b6b4b641cbb8', N'Villa Media Agua', 115485, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd887b361-2c39-4823-aebf-b6b61ef169f0', N'Villa Mercedes', 406209, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c18fc296-f19d-42a2-8c89-b6ba1aef00c0', N'Barrio Mar Del Plata', 301631, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'11671863-d983-40dd-a39b-b6cb626c9374', N'El Cholar', 191015, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6cb7b42-710e-4cda-9b93-b6de398ad45f', N'General Conesa', 901297, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eeb8bc3d-65d6-4bef-8984-b6f7a7db1eaf', N'Rio Mayo', 307531, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'481c4633-f263-47db-917e-b729a9feb368', N'Elortondo', 452137, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2d1739e3-6e75-40c1-8cda-b7370673fdf1', N'Arroyo Baru', 735771, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'58945b25-c7a2-47e0-ba21-b754efeb8f80', N'Aldao', 225875, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e46f116-eb58-4dda-957c-b760caf3c822', N'Rinconada', 89726, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5d40cf6-dc9e-41cb-8b74-b76db4954b6d', N'La Maruja', 998165, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad13a669-6d36-417c-80c4-b77826093d5d', N'Manuel Garcia Fernandez', 382309, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3881811f-180d-46ac-85ee-b78be8196a08', N'Paraje 29', 771880, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b5863925-7fec-437a-8a53-b78ca24fb99c', N'Olascoaga', 438513, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'198e85d2-b374-4670-ab96-b79e01e6d9d4', N'Coronel Manuel L. Rico', 508561, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4dee1d1-ca41-4d37-a5c8-b7a5098988fa', N'Diego Gaynor', 982353, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a44f53b4-605e-4e3b-b102-b7b376a91206', N'San Isidro', 35136, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7e7de21-8927-4f6c-b0d1-b7b3d2f8736e', N'Barrio El Jardin De San Martin', 771560, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46e039ce-c294-4c9d-b843-b7bbc2627b97', N'Cañada Ombu', 129167, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1bdffcb-1e1f-4cfe-8686-b7ce1cbd681c', N'General Paz', 777376, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'be452ca7-0858-4a80-a02e-b7f53199c6a4', N'Santiago Del Estero', 188259, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd72d180a-8c54-4231-beae-b7fc28d5cd96', N'Libertador General San Martin', 892572, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00c69ad9-167e-46e1-b6fd-b7fe7f03b5e1', N'Balneario Monje', 929673, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0adc6b83-a81c-4c8d-89f8-b81e1d5e5ab4', N'Pampayasta Norte', 645233, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f787f1c7-13b2-4b61-a031-b82a73dec7be', N'Platanos', 904083, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2801e552-6423-4748-a926-b843fc9d7097', N'El Medano', 210114, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e569ac9-b173-430c-aa6e-b854310552ba', N'El Cuadrado', 281416, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67eb9aaf-f20e-4338-9c0c-b85b201da098', N'San Jeronimo', 371838, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05f60a65-c5e0-4b5d-a482-b863e13fc760', N'Carahunco', 446705, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1540204-628f-4558-9462-b87053bd3f70', N'Sierras De Encalada', 891903, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'647fbeb0-a043-40b9-bd5b-b8956336089f', N'Colonia Segovia', 881847, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1295d010-f0f0-47f7-80f4-b896c192ed2e', N'Canteras El Sauce', 340894, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'82604eb6-fe8a-4b69-af24-b8b5b306961f', N'San Antonio', 380974, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c1abfee6-7af0-40d4-931a-b8bdf46e5b28', N'Ascochinga', 34260, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd1f90cd5-298f-473b-a5b1-b8c7dfa486d1', N'Florida Oeste', 11146, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'144dd1e3-a216-4cbe-a5fd-b8d29198ead5', N'Aristobulo Del Valle', 202820, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'378a9469-da70-4078-986c-b8d616dbce74', N'Barrio Sadop', 682877, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a80534f0-b103-4a70-b1fb-b8e3b808dbcd', N'Maquinista F. Savio (Oeste)', 419818, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'720bccb4-582b-4a52-a1b6-b90950dc834b', N'El Sauzalito', 32743, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5df5fc72-a497-43e3-94bf-b910d87b5090', N'Speluzzi', 474652, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5aff518-6b6c-4f00-9bb8-b915dfe34f0a', N'Pueblo General San Martin', 973789, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff23e57e-eeb0-4ac1-b223-b9175a2719f2', N'Aldao', 966123, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b3d9ed35-2d02-41a9-91d6-b91cbd7d8682', N'Villa Amancay', 938225, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'17faa3e7-4b97-47c9-9615-b969d332c10f', N'Villa Ayacucho', 687765, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1bf8297f-0c4f-4c2a-88c7-b989a33b7e35', N'Relmo', 142059, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a47b5c03-120f-47c7-9600-b98e52c53caf', N'Bajada Del Agrio', 826656, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9271843-1ff5-41c2-b895-b993eb75842f', N'Capilla De Siton', 670192, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5609e5b5-2c7e-427e-bd78-b9c32c0cd23c', N'Eusebia Y Carolina', 133400, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b0135f6-bba1-4504-ab16-b9c371bb4910', N'El Galpon', 860557, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'380ad682-0f32-4c1f-9dc0-b9eb421c2672', N'Colonia San Ricardo', 653893, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f389c80-72da-49aa-9860-b9eb8f8d1a1c', N'Villa Clara', 432616, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d573aad-ce6b-4c8c-9099-b9ff7fe95b08', N'Roldan', 929783, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'964d18de-0edd-4b93-b038-ba187a0289b8', N'Guardia Escolta', 630959, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93b440ad-1b08-4079-9dc1-ba2837231004', N'Villa Laura', 749584, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7349f3b1-96e5-41ba-9a1d-ba28cea472cc', N'Carolina', 668838, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a566a03-eaf3-4a04-af88-ba471fa4bfd9', N'Chilibroste', 227769, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a43f208-fbe3-4e56-8cbe-ba4ceb7264ee', N'Alto Pencoso', 735860, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59fa4040-d2bd-4618-bb31-ba54e7606b98', N'Suco', 69885, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6842b70a-859e-4be0-ae0e-ba9ca819fc3e', N'Vista Flores', 294445, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7f60b7e-3ace-4ec0-8250-baa7cce3da94', N'San Rafael', 537029, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'50441c40-6f4d-4f64-b563-bab3d6b66b2d', N'Agua De Oro', 438126, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b5f8399-a4ce-4ffd-84cc-bac69f43fdf4', N'Lartigau', 308258, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b20cefb4-53f0-49ba-b0a1-bad0664caf7c', N'Rancagua', 732926, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47d2e0aa-5f37-4a0b-8df1-badfa112f1c4', N'El Condor', 9395, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd042e7ff-584b-4c0e-84b5-bae10291d6cc', N'Villa Rodriguez', 354574, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9eadb82e-8b5f-4724-b754-bae408090292', N'Samuhu', 3655, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c3261919-2542-4d78-942e-bae9754c7515', N'Rio Ceballos', 894149, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'be37daa3-46d2-430d-aeb2-baf1e4d6b228', N'Olivera', 449949, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd3669c0-71f0-43a1-933e-bb08c7a3c69b', N'Pinamar', 822337, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63f40b0f-8604-45fe-8827-bb304a05db89', N'Arbilla', 390053, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a823b67-9893-4457-b89d-bb6c142dd192', N'Saenz Peña', 408190, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f3ee691-a09d-4902-9cbb-bb9ff5821634', N'Jesus Maria', 844331, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'66abadcc-01c3-467c-9cbd-bbc541e5acaa', N'Jacipunco', 384236, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dbffd39c-c8e6-418c-9468-bbc7af5e78ba', N'Gerli', 606467, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'244a2f4a-40e3-4ff9-8b26-bbd061b46fca', N'Napalpi', 989632, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'838b646a-a244-4214-a421-bbdd6f3eb316', N'Rio Tercero', 49461, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21ba3f27-9555-4715-9d1f-bbe5089296a6', N'Pueblo Illia', 739754, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eced1a74-cc1c-4e11-b4c7-bbe9f945426a', N'Ingeniero Luiggi', 605546, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c6b38e9-99c9-4dc6-9fc4-bbf0df588fb7', N'Isca Yacu', 657260, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b00e352-3ff3-4f6f-bd96-bbf9a5041846', N'Nueva Lehmann', 231985, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7bfa85b-666c-4e73-9d5a-bc172b723e89', N'Barrio Chivilcoy', 393249, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e6938b30-7fe0-4a47-980d-bc18b64e6dd9', N'Carreras', 381520, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7eb1c098-1676-4ac7-8e64-bc31c3678239', N'Energia', 784891, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0876eb16-ab01-474c-895e-bc457b58d9e5', N'Loteo Costa De Rio', 119230, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88672cad-18c4-47ce-88b1-bc63ab3e18d4', N'Mar Azul', 172042, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4db197f-d827-46cc-8a6e-bc69c8e28f9e', N'Tres Isletas', 116736, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'47af231c-2f23-4906-845d-bc6f267ad09b', N'Calchin', 363412, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a70e36eb-5813-4c68-8f24-bc7262c385db', N'General Deheza', 151982, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'174deb8b-6f83-4a23-897d-bc79d749014f', N'Los Zorros', 92987, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ee9a0d7-1bb2-4ad7-9346-bc9167615661', N'Aimogasta', 719949, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a76b5a3c-f3ad-4d6b-a842-bc9c172aaaca', N'Medanitos', 985146, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2afd5084-70d0-41f9-b62e-bca0fbf664e1', N'Recreo', 826815, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ce68d97-d5e4-460c-bd51-bcbb301cdf94', N'Villa Cura Brochero', 348951, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f66cb40-1c09-406f-a6a8-bcf4c8cc2acc', N'Bustinza', 564738, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c07ef0d-7354-4b55-8bad-bcfaeee82fe9', N'Chucul', 879283, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec188060-3340-4970-9d0d-bcfd3dd6b028', N'Chuña', 58544, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7d24e4b-deee-48c5-92c1-bd0cb07d53ae', N'Colonia Santa Rosa', 944615, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'105b07ff-dc20-467a-8411-bd197b77bc9f', N'Los Castillos', 728876, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'487f1b90-b746-4f95-939d-bd1fe61ae151', N'Villa San Jose', 971048, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57c535d3-5998-44e1-b780-bd20058b5bfc', N'Chañar Pozo De Abajo', 654344, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'53000e3d-105a-419a-9284-bd26d27db56a', N'Barrio El Carmen (Este)', 574456, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d8f63f4-4a53-494f-8e17-bd2b5bd2abd8', N'Mauricio Hirsch', 623584, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc8153cc-0f3a-4a8d-b7cd-bd3420293ad1', N'Navia', 470793, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67116e93-7777-41ed-a412-bd350652e528', N'Cruce Caballero', 56515, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bb1a125b-e5fb-4171-b12a-bd43ba87f646', N'Colonia Baranda', 300208, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8eb22216-8804-469e-9887-bd4b2aab7220', N'Bartolome De Las Casas', 746295, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'11b477bb-ab75-42c0-9e89-bd56fb71943a', N'General Alvear', 475454, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'32e49686-827a-4d76-93b0-bd5d01f93c30', N'Maria Magdalena', 513202, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67905038-cbdc-4362-9379-bd66e36d991f', N'Ataliva Roca', 552710, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'49d78a99-8766-4d7d-9124-bd8c3f084281', N'Puente Lavayen', 836481, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4d1bdbf-5c6a-42f5-910f-bdad603d25e1', N'Santa Isabel', 109078, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ae1dcbc-953f-49d0-8e52-bdc157be742e', N'Barrio Union', 852594, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3cc90514-59bf-4e83-aca5-bdf4b930b115', N'El Bobadal', 455559, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'674a0487-611e-4622-990e-be040deb439c', N'Roberts', 302247, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'803adbf3-f290-415f-92ff-be0df4f06856', N'Jose Ingenieros', 810475, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f20e7be5-a1c6-4293-8098-be3c506eef73', N'Mones Cazon', 591376, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1eeb193-a335-48a5-99d3-be4370dcf671', N'Barrio Justo P. Castro Iv', 573390, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26bb6eef-aa5d-4846-b658-be540f3842dc', N'Pellegrini', 907305, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e157f47e-6db5-437a-9443-be5d6f65f1d2', N'Palo Seco', 35377, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd610e4b-d848-4291-8669-be6deaf3a23b', N'Las Rabonas', 988182, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd2d8971b-d8c6-4a96-9dc4-be72090cb2dd', N'El Naranjo', 367190, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b783f0cf-30fa-45ea-9f05-be7616674dc2', N'Pastor Britos', 948281, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b9569bc-d336-4b2b-8df1-be7777468869', N'Hernandez', 415698, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06a57c22-5f7d-48aa-8267-be80bdd1de5d', N'Christophersen', 590772, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce5efbd9-b2c0-4b16-8e20-bec07a9edccc', N'Profesor Salvador Mazza', 173730, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'330ea9ef-8df1-433b-b20a-bee3eb60b716', N'San Blas', 109805, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'22ca50f9-7759-4f3a-8bf5-bef00ed6b117', N'Oro Verde', 738724, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e55aff58-c515-4a37-a10e-befade6600f1', N'Colonia Bicha', 845043, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd6ff348-5f2f-485d-b758-bf67a46162bc', N'Armstrong', 842756, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30301637-f96a-4400-92c7-bf703bf111cf', N'Rio Primero', 983724, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd680d941-ef33-4a7b-84ef-bf7991653bec', N'Acheral', 596661, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1cb7629e-2755-4d6d-b2cb-bf7fee1d4686', N'Ranelagh', 547617, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'664ee84d-dda4-49ce-ba08-bf8165119351', N'San Javier Y Yacanto', 245833, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3945ba29-4a8a-4c01-bca1-bf998f5cc4b8', N'Bahia Creek', 919434, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7020cd21-a444-43cc-9c54-bf9e562db52d', N'Nelson', 103797, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a6f2054-a304-4157-97a9-bfa277e57bad', N'Alejandro Petion', 684918, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3580f892-81c1-48ed-93ba-bfb1368b1d82', N'El Algarrobal', 223576, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1863e0a-789a-4016-bcf9-bfb4cba9c32c', N'Chañar Viejo', 269644, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fab075fc-7e77-4ec8-8483-bfc5f8babded', N'Piedrabuena', 224831, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ee86e750-beeb-4c79-869c-bfc9a0dc8aff', N'General Lavalle', 225255, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e39d2c90-dd62-4c6d-bc26-bfe7a3da9556', N'2a. Seccion', 973071, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86832ce4-0830-4511-aef7-bff331801b94', N'La Serranita', 117932, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6f0cf33-2b3a-43d3-8ca7-c01255646bf1', N'Soledad', 117211, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9d213896-101c-42ee-bb96-c014172e014f', N'Llambi Campbell', 550636, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'868bb3ed-c025-4e60-a0fc-c018bd71a3c5', N'Barrio El Cruce', 184673, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15ab58d2-6502-4488-811f-c01f72a146d2', N'Carrizales', 663283, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2dd1a692-4772-435d-9038-c038d7795f4d', N'Eldorado', 817929, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd36b7839-d912-454a-9f60-c041c277de6c', N'Barrio Planta Compresora De Gas', 145322, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e056e0b7-6d9d-4979-a820-c05291c471ba', N'Guardia Mitre', 390286, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'954ad4b2-791c-48aa-905e-c0577c4f629a', N'Guadalcazar', 830448, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2cb69c0-04b4-45ab-826d-c063b3522159', N'Tafi Del Valle', 63832, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07c70781-12ad-414c-a90e-c067fc55ab8a', N'Tudcum', 383268, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0e87b659-5602-44ae-996a-c074bbc5d9a8', N'Panambi Kilometro 15', 539052, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b2da185-36e2-4311-9b6f-c07702c3a1d4', N'Unquillo', 659247, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'14aa18a9-0abe-498a-9eb8-c07f8d9c05b1', N'Andacollo', 365970, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1dc1f54f-66ba-47a2-85d6-c08dea13c9b2', N'Serodino', 994984, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'142a0552-a5de-4077-acfe-c0b0af10afa6', N'San Nicolas', 860566, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'66c3e41f-88a8-48f7-9f0b-c0baf447082b', N'La Limpia', 421308, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd30c869a-2d2b-4cc8-830b-c0c41385cfa5', N'Milagro', 633198, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'227caa68-5644-40a4-81e8-c0c9a97287c6', N'Ernestina', 296034, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca318309-e3f5-4c34-a308-c0cbdf309ac8', N'Pampa Blanca', 881476, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d6ed1ca-fe1d-4a22-aef1-c0e59ed9f227', N'Carlos Maria Naon', 438238, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'71722cb8-a757-4df0-a8e3-c0edfe07c9be', N'Victoria', 929277, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1640e10c-dc19-43d9-b0d0-c0fb2e265673', N'Quera', 836962, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'35bfcf2a-a782-4ad5-b131-c11990d2db54', N'Comodoro Py', 418495, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3651af7b-f26d-425f-a791-c12ba5b27ffc', N'Estacion General Obligado', 823997, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5140138e-adb2-4f4a-949b-c14c4c662d3b', N'Aldea Santa Rosa', 279683, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75d9be3b-541b-46de-9de1-c16226dd4054', N'San Pedro', 855576, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4af83115-0eae-49cc-911e-c168ae3ea5b8', N'Domingo Savio', 508049, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe959048-dbca-406b-8ac8-c169752e8497', N'Leon', 825118, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a15a2149-f8f8-4963-9345-c1757b4fa7a8', N'El Desmonte', 673793, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f1d2b5c-e557-44cc-a0e1-c17c3c320a6f', N'La Sofia', 814705, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'705211cb-accd-47c4-825c-c17f6ea98be5', N'Ranqueles', 921731, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f98910cd-352e-4b08-8d5d-c18c150ee4bc', N'Rawson', 476581, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da381281-58cd-4012-a2f0-c18e7a5c215b', N'Termas De Santa Teresita', 613542, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9abb582d-e77a-494c-be4e-c1bb2e33ca53', N'Sierra Paileman', 425299, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7504a751-b846-41ad-80cb-c1df66675fbe', N'Herrera Vegas', 221199, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1911d5a8-82f5-445c-96a9-c1e6345a9039', N'Arroyo Leyes', 399718, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1ef8bd75-e2d0-4b7e-841a-c1e9c053fe6a', N'General Mosconi', 265202, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb97e7e4-e7a2-48b8-869f-c1f9e996cfe0', N'Rincon Potrero', 203472, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98841ae7-d81a-4c7a-9f01-c1fb6c53b6e0', N'Eugenio Bustos', 555569, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e3f4772b-db3c-47fd-9adc-c21e588ef5be', N'El 49', 711026, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0e6a718-82be-43e2-8fcb-c251ae8f8e46', N'Cuadro Nacional', 190654, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3558b677-329b-41f3-b8ed-c25bf41bebe3', N'Villa San Martin', 551406, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b142414-7636-41ee-ad71-c267e71e3ea8', N'Mbopicua', 931578, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'82c95edb-6aca-464f-987e-c268336396ca', N'Isla Verde', 11373, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5cecfb0-170d-4568-8961-c26d75e57a6e', N'Juan Couste', 966992, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec0f406e-aaba-4bd8-834a-c27398fb0908', N'Soldado Maldonado', 281696, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43d5cbb4-57de-4d8c-b533-c27c74da003b', N'San Carlos Minas', 737779, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3a6b7798-39b2-45d0-844e-c288f4fcdc5f', N'Arroyo Los Berros', 937585, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7d571d16-3c14-44f1-9daf-c297a9eca984', N'El Arbolito', 637253, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aceb1e9d-40ed-4c09-8f2d-c2a0d44bd7c3', N'Ocloyas', 325731, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f0aa7f32-1534-4c0c-95fe-c2a2092bfb98', N'Villa Sarmiento', 4108, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ea50354-2a63-47f2-a253-c2b2a8d17ced', N'El Carmelo', 27583, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'835c0164-a41a-4de9-9cbc-c2b39d610005', N'Colonia Caroya', 438260, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ad8e995-dd52-499a-aaa7-c2c5b8bf90cb', N'Lanteri', 435568, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9a733b39-284a-476f-81d2-c2d5069b619d', N'Urutau', 498853, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bae3aada-29e4-4670-9e8f-c2d66c27f773', N'La Choza', 680451, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebb6f802-4f36-4851-8821-c2d7a59a5def', N'Lin Calel', 355174, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2134e242-f01e-4a18-a1e6-c2f68974a066', N'Adrogue', 550279, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1f5d3a1-18fb-4f4b-9d9e-c305280cdbbb', N'Colonia Rosa', 935014, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e295f5a-e9a4-47f0-b73d-c3216da5394b', N'Villa Urrutia', 212857, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f43ddb92-2279-4857-971a-c32850185c8a', N'La Loma', 376525, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc444839-deec-4dd6-a797-c3727c4752ee', N'Las Parejas', 815049, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8ff834f5-8e42-4e00-804f-c37c1dc527a9', N'Ibicuy', 596573, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa514399-18a2-41df-8ae3-c37df5ce93be', N'Tala Cañada', 617530, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'760c12df-b0e8-451f-bd41-c38d47e77755', N'Loreto', 386378, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'423b4674-a2ec-4ed7-9dc9-c38fd696795e', N'Cazadores Correntinos', 663187, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ebfadbc-0901-4f82-9873-c39d47c2a0f0', N'La Cieneguita', 833195, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'71bdd366-2f29-423c-ade4-c3a0660ec320', N'Muñiz', 773266, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99f15c8f-3017-4688-b12c-c3b2ca1da25c', N'San Bernardo', 724755, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15e224e2-d588-40d6-b336-c3b7fd3d4bd6', N'Yacuy', 433658, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43056376-ebe5-434e-92f8-c3d1a9a52377', N'La Criolla', 259498, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'258113c3-4fac-4bd3-9332-c40c6a4f1751', N'San Pedro', 562448, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b11da847-8941-49aa-958d-c40e201dd18e', N'Tama', 757025, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc1b07f9-0570-4e19-a5a0-c417e55c917a', N'Las Armas', 245194, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'003c140d-1565-47f4-a617-c41a01289b49', N'Zarate', 828591, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db3ce1a3-e064-4002-b80d-c41b433e24ba', N'Casares', 901317, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8718f8f3-9bbb-4613-879c-c4342ca7762e', N'El Potrero', 308429, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0db2beb-8b4d-4294-8e23-c44836afec89', N'San Lorenzo', 701946, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ee68dc12-c0f7-42c1-8b65-c449d7f131b5', N'Barrio Calle Ciega N? 10', 184267, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'837cf0a2-4d6a-4c32-b465-c45308dd84b3', N'Dina Huapi', 477496, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec9a6f8b-467b-4b11-8c04-c459ab905656', N'Frontera', 437193, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d39b2f2-220b-4d87-965a-c469cf07131b', N'Godeken', 353872, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'159d6fcc-bb45-43b7-a319-c46e046cb878', N'Santa Rosa Del Conlara', 78147, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20e90caa-3c88-4a63-96f3-c472d558fba9', N'Barrio Colinas Verdes', 15895, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4230488e-0a71-424c-a8a2-c47fa8cf952e', N'Vicuña Mackenna', 471963, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa172d4a-fc94-44bf-8fe8-c48ad1875df4', N'La Reja', 41925, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b848999-7551-4798-9093-c48d9b818fe5', N'San Gustavo', 133324, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd6d75ce-04d2-4a65-b6fa-c4946c1a3b26', N'San Geronimo', 202456, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'150aff48-1bdf-46c4-bb30-c4ab57adc08d', N'Alberti', 128706, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fae8aa0b-f890-4079-bb85-c4c1c4b4774d', N'Ruiz De Montoya', 292940, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'52d8a518-c849-4197-b5ff-c4c317d8eed1', N'San Pedro', 379758, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8355e844-588f-4c3b-a799-c4e3c701e1d4', N'General Gutierrez', 133794, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75923fd5-1a84-4319-947d-c4e512dcbcd4', N'Barrio Perdriel Iv', 520459, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d2a41ae-4b5f-48cf-b61b-c50f50455f31', N'El Carril', 444641, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'290861e5-d9a8-49bc-b729-c516640886cf', N'Sarah', 17543, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c310b659-23f4-47d0-80d6-c51f9176238c', N'La Cumbre', 890468, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea7ea02a-ad8a-4b73-bb1f-c534be6faf50', N'Solanet', 162405, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae4075f7-a379-4edf-9938-c53689f44447', N'San Jose De La Esquina', 821181, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4bea94f1-45cf-4540-97fa-c540897fa404', N'Nueva Escocia', 929287, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c575747-e26a-46e2-891a-c55c97fd5541', N'Charbonier', 101941, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8522b0b4-5125-4a87-90c7-c55d96003187', N'Lujan', 277496, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'55e3f2af-1a40-46b4-b1ac-c5606d2e4db2', N'Villa Roth', 275004, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'544c8b21-daa8-4841-a194-c5700f7ec1c9', N'Ingeniero Luis a. Huergo', 6329, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe9cb76c-8a8b-4cd2-ad90-c57320f76903', N'Monte Castro', 110288, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'449c499f-8de1-4041-85f7-c5746da97095', N'La Playosa', 508863, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a2c4604-fbba-43ee-8d86-c584722712a8', N'Andalgala', 769054, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c396aef-7f35-46d9-a469-c597d49519b1', N'Arroyo Colorado', 408666, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'892fdddc-b20e-4822-ba37-c5b2a666abf1', N'Balneario Laguna De Gomez', 702772, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'198ef321-14a3-46c9-a585-c5b3aefdf950', N'La Picada', 366606, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a728f76e-44aa-42c1-9677-c5bddf265ad2', N'Campo Quijano', 139521, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4e1d19b-6c50-416a-865e-c5e71f00887d', N'Villa Espil', 455962, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6164665d-1ab6-47f3-8fb9-c60233f86b0b', N'Recoleta', 766933, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aafdf81c-3992-459e-b5a5-c6041b55fc5c', N'Barrio Villa S.U.P.E.', 673860, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'32a5be6c-68d9-49f4-aadd-c6043b290be8', N'Villa Parque Santa Ana', 754764, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'221c320d-8d59-4290-a0e2-c60a21e38e8e', N'Puerto Santa Ana', 991636, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c815dc0c-e027-473e-87d1-c612f452ef06', N'Andant', 287165, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e607a58-1c71-466f-be5a-c661e851a816', N'Cachirulo', 202741, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a0b1f5c-234f-49da-ad21-c686bbefaa00', N'El Sosneado', 407372, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0328462b-6145-4423-9496-c6888baa830b', N'Bellocq', 552550, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61cee018-d173-4bb3-8e56-c68f6030090e', N'San Antonio De Arredondo', 664905, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'55f7624c-ff0f-46f9-9fa3-c6bbf55214d6', N'Realico', 780940, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23416d78-aec1-4098-bc1d-c6cca40c3bf8', N'Villa Lynch', 573290, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3eab3293-7092-4246-8830-c6eee442a7ec', N'Boca', 362010, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5caac4cd-b1ad-466b-b573-c700926f837c', N'Lanus Oeste', 24908, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2a90e26-dad0-4100-83bf-c706b04de51c', N'Tramo 16', 229363, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88179417-e936-46fa-b6e2-c7114dfaa792', N'Quequen', 466339, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ea523eb-2aaa-4da6-95df-c720c1484b72', N'Mocoreta', 828002, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'538f3eed-5ca4-498b-9c75-c727b28c27ee', N'Rosario De Rio Grande', 567236, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2898421-b0a8-426c-b0bf-c72ae2a97b66', N'Andolucas', 441694, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b55177a4-bcb0-4ead-a118-c72f74d96d2b', N'Santa Luisa', 933122, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54a79b07-fcb0-4107-a5eb-c73d3b1e3330', N'Las Marianas', 209913, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'876695b4-e28a-4c32-887e-c74599ab4ea6', N'Colonia Avellaneda', 328839, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1db305ab-0fa0-4dda-b41e-c7502a4cc93a', N'Villa De Mayo', 304212, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4012300b-920c-49f6-8ae9-c7812f677864', N'Capitan Solari', 835524, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e5b5ff5-696b-41ee-b8d5-c7c3ed4574c3', N'Pipinas', 651167, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'12c3f6df-9466-4147-8e43-c7c7368a4260', N'El Alcalde', 212721, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0aa8801d-53a7-4a8d-95a0-c7cfdff5510d', N'Villa San Isidro - Jose De La Quintana', 494033, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'58ac35fb-b2ad-40d4-a212-c7d67dc66fca', N'Ramayon', 254432, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6481441-1a12-4bbb-bf5b-c7d8fc30f8f5', N'Angel Gallardo', 138519, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2cdc2c4-8332-4d45-bdb2-c7f5d6d0e53d', N'Hinojo', 195650, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'63dea172-20da-4abe-8d97-c7fac22544a1', N'Coronel Moldes', 934901, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c611233a-1ead-46ca-9af0-c8372828a192', N'La Buitrera', 259657, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6499ce98-d81d-4e77-8df2-c838818cf53b', N'Lago Blanco', 891913, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'194ae145-2c10-4812-bbc9-c83f69a707cb', N'Polvaredas', 858978, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c0b8f0f-5cf4-41d3-bc7e-c863488a25a2', N'Barrio Ruta 24 Kilometro 10', 195184, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65131a90-0df6-4fb5-ac5b-c8ba9d3ce4ae', N'San Cosme', 825860, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05ac002b-4426-4ea9-b9cb-c8bc3762e01d', N'Las Toninas', 911571, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75aee517-eca8-4eb0-a82e-c8d0485373ea', N'Villa Alsina', 806713, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd2403d7-aa64-4820-9014-c8e0913743df', N'Coronel Dorrego', 346593, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fb13cbc-c28a-4c2b-a2b1-c8e26651f438', N'Portezuelo', 243326, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a41a702e-5109-408e-a5d3-c8f317fdfdd2', N'Charadai', 962541, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1d2af9f3-2b50-4610-92be-c8f910b49584', N'Rosario', 876347, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'def797cd-43a1-44c1-ba42-c8fea30d7979', N'Coghlan', 818926, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea0d7bad-4caf-4598-a0a5-c90bb6e32159', N'Conscripto Bernardi', 246488, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3687e208-cba1-4225-8651-c929ee6aea27', N'Rufino De Elizalde', 109060, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f917be6d-f8ac-4f64-90d1-c9447961db0e', N'Dorrego', 631014, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0cd11eb6-291d-4188-93d2-c96e377d9de0', N'Tacural', 447455, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c955c403-aaea-49ba-878a-c9775929874e', N'Villa El Salvador', 86841, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1e367c6-cd5c-4faf-aae8-c9a10d9a0989', N'Tostado', 651969, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8a920ca-4d53-45ec-a0fc-c9c30fd8065e', N'Ex Ingenio San Jose', 72474, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d167c33-6796-4446-aa60-c9d4b4e8e19a', N'La Puntilla', 652194, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c94924fa-50bd-490a-9d3d-c9e14a34ae85', N'Quehue', 709822, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dac8b461-c91e-47dd-b630-c9fa8604fc00', N'Iltico', 107289, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b03130d0-dd46-4cd5-bcf3-ca1936a9c9f0', N'Nuñez', 264048, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'659923b9-5037-4259-9d22-ca1a68f11b2e', N'Massey', 237663, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79f7a874-0974-4af5-b55c-ca235890c8d6', N'Plaza Vieja', 782969, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88b3bb58-dd83-4fd4-9ae0-ca25bb526c7e', N'Villa De Maria', 916306, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2399d38-3d04-4ef1-8822-ca2a58969a82', N'Culullu', 300796, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'efb13836-5d99-4be8-a0d8-ca3ff3561748', N'Estacion Atamisqui', 144982, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e56b6897-af21-4337-ab3d-ca4aa1c13101', N'Chimpay', 831830, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da3962c3-0388-4d40-9573-ca500b029e49', N'Alto Carrizal', 371177, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0f505de-8236-4d6f-b4d4-ca5c1ed448fb', N'El Condor', 806320, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87ca003f-c1e5-4f2d-a853-ca6e8f0a5779', N'La Florida', 842427, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0eb4c00-3688-47e7-87d8-caa4f8f9063b', N'Mar De Cobo', 646852, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb65981e-3aa8-461f-b232-caa7c0e8e836', N'Maria Luisa', 340085, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f8046f34-f193-4ee9-b175-cac79b4982a8', N'Pozo Betbeder', 147488, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2e4fdb9-de7f-4f71-85e0-cadd1e3fd6c2', N'Tambillos', 728576, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1dc746e6-83c5-48da-8753-cae7ae9c91ce', N'Berna', 68451, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8835d8c-1a6f-46c7-9d2a-caf39c0b7ac4', N'Alejo Ledesma', 640126, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'126d37ce-fda2-4213-8e0b-cb043e9631a8', N'Zavalla', 664037, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b30f731c-93f6-45b1-aabd-cb3c284e1529', N'Villa Belgrano', 321817, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0974d634-6e70-43c3-81fb-cb466b562870', N'San Jeronimo Sud', 725948, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6c949f8-0aa2-4228-82ad-cb4fccdb400d', N'San Miguel', 769819, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'19f008f0-1e40-4a9c-9a26-cb62b32bb5cc', N'El Espinillo', 490853, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'604b3acf-cc87-4143-a0d3-cb83a39994e4', N'Colonia Videla', 752920, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06d8e23f-997a-47d6-b7d7-cb91ebd9c2bf', N'San Nicolas De Los Arroyos', 480037, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4bebd2c7-a9c4-483b-868f-cba4e8deccc6', N'Fitz Roy', 563387, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae482264-c607-4827-b06d-cbad7ff72af5', N'La Ramadita', 951701, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d171058-2daf-482f-8d1c-cbca55e40b78', N'Gobernador Udaondo', 341167, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7e112b65-cf11-4605-b678-cbccb824627f', N'Sunchales', 44139, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9bf2bc1b-ba7a-44e3-98ff-cbd4afc07e55', N'Mamuel Choique', 478050, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd1f52aa-b348-47ad-8cb4-cbd756d495f6', N'Bialet Masse', 834416, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0985d493-c38c-490c-aae7-cbfc363ef8c7', N'Ballesteros Sur', 102022, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eceafe80-7645-4426-a10e-cc0fb588ad0c', N'Barrio Laprida', 639889, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73bd8f0d-cab7-46ba-bef2-cc1328f744f4', N'Villa Del Rosario', 690156, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4591ebb-0fec-4897-96cc-cc1d1e3a8c12', N'Añatuya', 995000, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a6dd64fe-6063-46ef-9c54-cc1ee617b16e', N'Villa Moll', 469172, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6ed271f2-d53a-40a7-861d-cc753267d783', N'Bañado De Los Pantanos', 270940, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ee831cef-17e2-41d2-b65e-cc919e599847', N'Laguna Yema', 589508, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6f152fc8-cacf-4cc0-bfa2-cca8af7cb903', N'Arroyo De La Cruz', 126780, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'125dcd91-d0ca-4e07-89d5-ccab979b1d41', N'Mayor Drummond', 259987, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'959472a9-e33c-4c7f-a68a-ccb2f42166a4', N'Lamadrid', 820351, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc1f8e97-7520-4540-b37d-ccbf1aa54fe3', N'Santa Magdalena', 794787, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'500d26d8-bacf-426d-adae-ccc957ecc1db', N'Abasto', 497228, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6703afe1-0630-4be7-93b9-cce11434450a', N'Cazon', 306221, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'71ec08b0-4931-4903-8edb-cce7cff9e9cc', N'General O''brien', 887352, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5cb4f114-33e6-446a-8701-ccef1131a5e5', N'Campo Andino', 375650, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8dec3afc-3c8f-47cb-906d-ccfe24ff3c84', N'Cianzo', 183043, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59c6d949-0157-451f-b7e5-cd028dcbde96', N'Villa Atamisqui', 243569, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'599315c3-9e95-48c3-a9a0-cd0eb6d1e310', N'Arroyo Seco', 125568, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'802031e5-eac1-40ae-b3d9-cd1d8842d04d', N'Capioviciño', 741171, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f0b4853f-41a6-451f-86fb-cd21dae863ca', N'Juventud Unida', 969932, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e401846d-9fee-484a-94d9-cd5598ea384b', N'El Chorrillo', 612522, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44b8b3b2-bb61-4831-99da-cd57c392e8f3', N'Renca', 858259, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1cae708a-f43d-4097-9b22-cd5b51631318', N'Tilisarao', 803571, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a506975c-6015-4e54-a80b-cd62ca88bcf4', N'Villa Godoy Cruz', 746603, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea37c45b-30af-4485-8a06-cd63e0056c5b', N'Rincon', 957556, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'12800824-7052-4923-ba9c-cd6c521681d8', N'Valle Hermoso', 104740, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a0a0d5cf-3cfe-4341-a21d-cd76e515f784', N'Costa De Araujo', 525899, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67246272-d40c-46d0-bac9-cd7a1bcbd818', N'Eufrasio Loza', 667712, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebc739c3-1381-49f1-98d8-cd981dcddd2b', N'Falucho', 628627, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd57aed29-cb9d-4d14-a36d-cda2b43d0f0d', N'Vista Alegre Sur', 631325, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc7f4d0b-04f4-4674-942e-cdb5dda0f4d4', N'Morrison', 436657, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'128a6401-6733-4401-a305-cdb982d3d8c8', N'San Pablo', 652761, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8ee4742c-1035-4217-a27a-cdcf1aa6f869', N'Cruz Alta', 748198, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc7f1ed8-5691-453b-b657-cdd52a10d6ab', N'Ushuaia', 858814, 23)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7b07f65-d662-40c6-be1a-cdf4d1803d2a', N'Balneario Marisol', 213787, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bb0315fc-12da-41dc-9f0b-ce06c1c74ed6', N'Tres Algarrobos', 442116, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd78b75bb-3c59-4d70-acc8-ce0f443ddc4a', N'Cordobita', 627256, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4995bfa1-21de-4361-95cb-ce1531d4e8fe', N'Silva', 36369, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd14b520e-c23e-4c33-b8b7-ce178c745dc9', N'Santa Rosa De Los Pastos Grandes', 683534, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b607940a-9380-4806-a722-ce217630fb80', N'Villa Teresa', 806383, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0e2dfde1-fc11-482e-9baf-ce26e509c15a', N'Barrio Jesus De Nazaret', 191599, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c40580f-a14b-49ba-89ef-ce456fbff7fc', N'Ceballos', 280764, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0bbb1cfb-1e0c-4179-af52-ce4cb7adc4a1', N'Pie De Palo', 862943, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a49dbe77-2cef-4dcb-b912-ce665d43d8da', N'Curupayti', 835509, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9c70b2b7-1631-485e-b2d4-ce79547ad385', N'Villa Ballester', 972483, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'338f42f3-b652-42b7-a6c4-ce7faaf36628', N'Empalme Villa Constitucion', 598433, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e3b161e-1128-4ede-8176-ce80a2619874', N'Villa Olivari', 444393, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'26937f8d-786e-4ef1-b614-ce8407783b70', N'General Jose De San Martin', 917126, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e8aa9a6-d040-4fbf-8a5f-cea0ae58daa8', N'Barranca Larga', 572515, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce291cc2-60a3-429a-a1d1-cea5408c7d81', N'Plaza Clucellas', 981631, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05291cd0-0c39-49a0-9c34-cea5b7d8b2f3', N'Los Blancos', 252143, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b33aab8-ca61-470f-9b76-cea9007af7bc', N'Monte Vera', 699625, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75f81c1e-925d-4128-8bff-cec5ed0e9935', N'Ochandio', 529813, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36abd4c3-e32a-460b-9707-cedbfa8e1ae2', N'Barrio Las Tunas', 569605, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea4ee794-2f49-4a4c-9088-cedf55893d36', N'Andalhuala', 163633, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6ee0c95-b2ff-419e-b2ae-cee757316673', N'Hasenkamp', 765910, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'401b58c7-6660-476c-b3d3-cf1428ac0c7c', N'Sarmiento', 2296, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'582de536-f369-4289-ac18-cf191943bfc8', N'Lopez', 296224, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'870fc03d-cf99-4163-a438-cf1c55fad3c2', N'Parque Norte', 384724, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fa49022-3dc6-4d21-8a66-cf1d08c8cb7a', N'Ingeniero Adolfo Sourdeaux', 388510, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0d0a4f9-a117-47ff-97db-cf2626fdb852', N'Aldea Apeleg', 166140, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7bf86ee7-4207-4d59-ab23-cf2740b9642b', N'Beravebu', 662986, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'478e88ce-23f6-4e19-a7c9-cf3269dcd29c', N'Icaño', 548364, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27f33f4e-070f-4efe-a02b-cf698632a07e', N'Egusquiza', 584316, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b2176ab-ee7b-49b6-90bc-cf79bc422a8e', N'Videla', 399128, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2e40d1c-4837-4c1a-b9b3-cf80f092d7e0', N'Santa Monica', 126995, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'068ed900-9fa3-40f3-88be-cf99f7546c9a', N'Villa Ciudad Parque Los Reartes (3° Seccion)', 989727, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83fb9ea0-25c6-490e-babb-cfaa6120bea1', N'Machigasta', 385739, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8296f6f3-281f-4242-9289-cfac7faefab2', N'Billinghurst', 451786, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e0abfe8-3499-4c87-b777-cfc1502c5252', N'Sarmiento', 431291, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ad3baeb-bb20-4169-a0cf-cfc1fda0a80b', N'Contralmirante Cordero', 594588, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'337f4bd7-179e-4419-9d70-cfd44add1a7c', N'El Pueblito', 896180, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'acdd975c-ea51-4f1e-aa7a-cfe4169a96ec', N'Erezcano', 91381, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cadab1f7-0f8e-4e91-8c65-cfe4e5489b2f', N'Florentino Ameghino', 737748, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'094be8e9-2b2f-4257-ba44-cfeaa9f8fd73', N'Los Hoyos', 298439, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b902628-59b3-4855-ac19-d0036f49be43', N'30 De Agosto', 846232, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5368962b-8436-4d00-967f-d008043e24e3', N'Casa Colorada', 218469, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30707c14-e9a6-43cb-aff6-d00a6b0a21a4', N'Elisa', 861384, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4ef0543-1545-4908-803f-d02b61a16e9b', N'Barrio La Defensa', 261781, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b4ceb06-e1f8-4068-8861-d02c41685b99', N'Ingeniero Giagnoni', 451088, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ca02cf0-874b-4b58-b53b-d047e27d80af', N'San Pedro', 336997, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b9bed5e-8e39-4aba-8edf-d06a4483bcf6', N'La Cabral', 28818, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d4e2721-bfbe-430b-8391-d06bf61517a9', N'Villa General Fournier', 19881, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'24192de9-e37c-4b73-aa93-d080e7b6694b', N'El Ramblon', 603765, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43826ec6-f356-4f14-bdca-d09b97d0f276', N'Colonia 10 De Julio', 989253, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5af74acc-78e8-4893-88e5-d1098cd49474', N'Sumampa Viejo', 67712, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98412536-9614-4671-a5b8-d10ce70dff77', N'Las Leñas', 995822, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af216467-0161-41f1-9b81-d12866b6acce', N'Quenuma', 688456, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'33e36a8b-2c3e-4678-88c7-d13cd8b37984', N'General Galarza', 501550, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46fea615-24a4-4683-8f76-d1472a190643', N'Santa Maria', 250290, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ee9d6e5-a3ff-4054-ab30-d1488b00f3f1', N'Recreo', 93210, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'775b4531-c160-4df9-8a39-d16202981ced', N'Villa Del Prado', 922681, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ad02de6-14eb-42a5-aba3-d16b727833fb', N'Barrio Prospero Palazzo', 970936, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73a72994-71b0-4c85-a790-d172ad0e9a93', N'Lazzarino', 627513, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'686b03a7-0547-40f2-b4b8-d1752b7e37c4', N'Cruz De Los Milagros', 907418, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a08fc32d-5560-4c13-8cec-d176b3109a28', N'9a. Seccion', 145272, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ddb809ec-6dfd-472d-b504-d17fe73ef084', N'Udaquiola', 761025, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8fef485a-68c6-4d28-8684-d1a16ccaddad', N'Roversi', 981413, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'746b1e1f-2f91-4c38-966c-d1aa79231fb0', N'Roque Perez', 772590, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21ea3957-2e01-41bf-a4c2-d1ae93700889', N'Santa Catalina', 74199, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'494fe82e-9411-4589-8a8c-d1b0d219b84e', N'Luis Beltran', 769211, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79f8faff-6d10-47f0-86b4-d1c4ea56929c', N'Maximo Fernandez', 600962, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd026c93-daeb-4dad-8bb9-d1da7273afcd', N'Aldea Escolar', 494326, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'072858fc-948c-47e3-a205-d1de19b0619e', N'Villa Antigua', 15261, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3075bd1c-f3d7-41ab-888e-d1f92bcca3c9', N'Los Nacimientos', 944837, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dfc37d87-7827-4757-b6e7-d1fb87be0652', N'Camilo Aldao', 912654, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fddedfe-a1c3-4b34-b7b0-d1fd8f46a1f6', N'Carlos Salas', 234566, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'534c4528-9d2e-4719-a373-d203420db14a', N'Pacara', 103663, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'69476fc8-8525-46b0-88a8-d21491005728', N'Itati', 781797, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f8725073-e89e-4862-a656-d21ec6bd7d47', N'Zenon Videla Dorna', 783940, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af2cc2dc-cbfc-47d9-94be-d23da1bf1e2a', N'Bella Vista', 142218, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3471ca5b-b269-4b08-84eb-d25317461516', N'Profundidad', 430837, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d65d07f-3c14-4619-9177-d25445c40f9f', N'Epuyen', 536967, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5033543c-34e3-4b00-a32e-d261f4606e7e', N'Fortin Tiburcio', 311792, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aa1b860b-4c38-4bcd-97a8-d28e2ef5d067', N'Godoy', 19879, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a649f10-0447-4bc2-a6e2-d293a91d40b7', N'Barrio De Los Pescadores', 522456, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'caa69821-7ead-49eb-a2d6-d296e6f34fd8', N'Devoto', 349792, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'390981b8-f100-41e3-9402-d2ae62bc1175', N'El Pedregal', 61331, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ccc8c63-f589-42a1-b10b-d2e005406256', N'Villa Campanario', 478041, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd679fa7-ed21-4a7b-a36d-d2efac2dd1dd', N'El Recreo', 923231, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86b0fa9f-d9b8-453f-a14a-d2ff3cf5eb34', N'La Falda', 567488, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1953d51-63e2-4c2c-a473-d300addff9ea', N'Guadalupe Norte', 408150, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b0068bd4-6156-410d-990c-d309e8f8034e', N'Vedia', 483263, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ebcac83f-54b3-4b0e-9027-d30c9380e768', N'16 De Julio', 27837, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4d32711-59d7-46b3-a608-d31330ef4fec', N'Piedras Blancas', 608526, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a17bd2a6-48a1-463c-98f7-d318a2b39bc7', N'Banco Payagua', 518080, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f26dc243-2999-4d5b-88cc-d32eeac0b315', N'Puerta De Corral Quemado', 73187, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a68bd0f-3192-4491-98a2-d35cee20b618', N'Barrio Rivadavia', 453665, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce3c527c-a8c9-4df8-9cdb-d36006644879', N'Chapadmalal', 169258, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'024ba6cf-53ed-4f08-8211-d3765f6aa95c', N'Pastos Chicos', 876582, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4745858e-120b-41c4-9bcc-d37c4f195a30', N'Villa Rumipal', 721841, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec700224-7f55-443b-a99d-d388d592b7fe', N'Purmamarca', 860074, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bdaed805-65b9-4289-808a-d390fc0dc06f', N'La Constancia', 781614, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'54473021-5504-487f-b6d0-d3912d626cb8', N'Villa La Arcadia', 224480, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc29138a-e2fe-4fa2-99f3-d3a3aa1a35a6', N'Carilo', 422540, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'24ba62c2-b8b7-4af8-a5b6-d3ac092db331', N'Cerro Policia', 1310, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'58f2a690-c4ee-43c9-88bf-d3b9b63814c0', N'Sauzal', 411949, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88bb7fbc-d01f-4d69-bdc4-d3c3ca50f9b4', N'Pacara', 768706, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f681151-08ba-449a-9798-d3d95143c9ad', N'Monteagudo', 195218, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c8f34a2-6350-43ca-ae7a-d3f8f1ffdafa', N'Barrio Lagunas De Bartoluzzi', 770803, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ccf0dddf-1736-47a3-b05b-d40a27b9a720', N'Barrio Parque Las Acacias', 467537, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4de530c-9d9d-43b6-889d-d41bab5565fa', N'Villa Larca', 452998, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fdf9ba9a-656d-4aa2-b430-d42d7ee523b6', N'Alejandro Roca', 251416, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0fc7510d-574a-40f7-8f8f-d4366d1c032d', N'Sauce Montrull', 903270, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'31896393-9be3-48c5-b73b-d441d30b24be', N'Las Chacritas', 764818, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5d94d29-101f-451b-81c8-d4507cf0d776', N'Lomas Del Mirador', 774738, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8a866b21-a603-4ad5-8eed-d45f1b5ecc61', N'Paicone', 938346, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'48b7f762-8110-460a-9e95-d47c775dd83c', N'Fatima', 71874, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e06724bd-ff06-4783-8310-d4a5ead054e3', N'9 De Julio', 786774, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7939c1d-2a61-456e-8c47-d4c373dbd590', N'Villa Riachuelo', 796797, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6000c7c3-0600-49fa-8a82-d500614dfa79', N'Barrio Destacamento', 368566, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a34b0b10-89ce-4aaf-ba90-d514140e9eb4', N'Colon', 112029, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7eb44d52-8752-42c6-89a2-d53bdaa9d472', N'La Manga', 539577, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1da9368-7905-44f8-bfb2-d563a271af9c', N'Sauzal', 61158, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'777417ef-45d7-4349-9a07-d5838bae0f27', N'Coronel Bogado', 624431, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ec92e93-6a5f-463d-b8ec-d58537851337', N'Fray Luis Beltran', 197397, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2cd27b1-686f-4808-aa71-d58b02deafd0', N'Hipolito Yrigoyen', 388694, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'241ad251-c0db-4d3a-a575-d597789df6a7', N'Los Catutos', 125292, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0fa52305-dbc5-4fb7-b585-d5b72e173193', N'Timote', 192135, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'716bb9c3-8426-4f16-8a2b-d5c690b87f9e', N'Poscaya', 419444, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8b9d30e1-4d27-45d7-8efe-d5c86494e3f6', N'Tuclame', 8292, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3af9fce2-ba5b-44dd-9992-d5cececb0355', N'Avia Terai', 541412, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e346fddc-5395-42eb-a64e-d5d684b1b290', N'Los Molinos', 231861, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e47c5bc2-9c7a-4b46-bad5-d5e1d7337cb9', N'Libano', 71277, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cceaccfa-6071-4227-8665-d5f92e09336b', N'El Fuertecito', 352287, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd6bebb3b-2ef5-44fe-a5d0-d62be42243ca', N'Peru', 124265, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27b96a7a-6347-401b-9c6c-d62f2dcbc2d5', N'Villa La Florida', 38984, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4e9fcad6-a7b3-46df-8a8e-d632e4cef6cc', N'Olta', 642687, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0915dac2-5b78-43e7-a361-d638b690487d', N'El Talar', 136267, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6522f7c2-99d4-4374-874e-d65cc1292be1', N'Oliveros', 781311, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'77964853-a102-45e7-9242-d667e96e1172', N'Alejandro Korn', 256393, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d4ec83c-9307-4741-8c0f-d67384fd1780', N'Los Frentones', 551806, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fadbf8a6-d986-4260-80bf-d68961cda3b5', N'Nueva California', 898898, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c0c24f1-00fe-4be1-a276-d69898ead283', N'Miguel Riglos', 759949, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3462de1f-7fc1-47fd-84a9-d6a54588f68d', N'Carrilobo', 304564, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c59892e9-6198-4e3f-b287-d6ade6005861', N'Barrio Las Rosas', 717148, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dbe77f0b-2de4-4302-bf6c-d6b7ba63f146', N'Monte Coman', 99005, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8d366759-56b3-4793-abf9-d6c03b4e19ac', N'Villa Mugueta', 332057, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd0abef7-e3c6-4f93-b88e-d6c84275fdde', N'Riacho He-He', 796442, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba40d495-142f-488b-adcc-d6cff5d3903f', N'Cruz De Piedra', 353863, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a55bf195-2219-44c0-b802-d6e5f3c99b4b', N'Cuatro Esquinas', 173788, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d73df2f-d17a-4524-9f52-d7224c21ab4f', N'San Roman', 483654, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9a73e81-a2a6-499c-858e-d7337ce9144b', N'San Justo', 570890, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4203bae3-232f-4c67-be73-d7568b5fb230', N'Corralito', 80679, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76c12b0c-fac2-4451-8da1-d75e61e71d1d', N'Alto Resbaloso - El Barrial', 437264, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc28ae82-4778-44b7-8cd7-d7680e066a6b', N'La Mendieta', 593882, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae5acc4f-936b-4683-8be3-d7763cf817e0', N'El Bordo', 670531, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a5d7f99-cbf8-48af-986a-d778ecb418f1', N'Monte Caseros', 224700, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a11436ad-94d0-461f-8def-d78a7b7b3f1b', N'La Pampa', 964466, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ccefd828-08cf-460b-9fe8-d7914a6abac1', N'Phillips', 722700, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d0b77a8-6696-492c-9da5-d7a041b59416', N'Colonia Vicente Aguero', 322236, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7804969-5a33-4cc1-a575-d7c20def6beb', N'Villa Del Rosario', 620832, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9802313f-d149-4dec-9b09-d7e064214d27', N'Barrio Campos El Toledano', 315370, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'371a9834-48f0-4418-81c2-d8033bcf4103', N'Timbues', 757148, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7a0d335f-7585-4290-9d44-d80dcc396e88', N'Germania', 390033, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2652a84-6833-40c8-a2ff-d827f055056b', N'Aldea Spatzenkutter', 195329, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c9c91bb-fc19-416f-84b2-d83132ba3ff8', N'Achiras', 955216, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f6634b14-0039-475a-a16a-d8368b78e53c', N'Juan Bautista Alberdi', 71673, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd83315ad-cfb3-4308-9f2f-d84c07ba4a42', N'General Alvear', 174239, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a5ab99bf-ac0a-4b6d-b311-d8525aa5a072', N'San Pedro', 56677, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5295c19f-2909-4a43-9227-d8570749039b', N'La Cocha', 314271, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2a922b13-4ca0-4e6a-88c4-d858141bc335', N'Moises Ville', 146611, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f94bd1dd-0b07-4241-ada1-d86392579228', N'Juan Bautista Alberdi', 373671, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fba1e181-ed58-4f33-b29f-d866833b80ac', N'Chañar Ladeado', 274994, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'124441a1-2e9c-44af-8005-d86c1a50471b', N'Aldea San Antonio', 438544, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9ef312f-fea3-4572-8b33-d8821fd9e87f', N'Miranda', 872458, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9522b9c3-c4c7-4f00-a085-d8b654a4b46f', N'Arauco', 447275, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'309938c5-be8d-4fd7-82d2-d8bf1b29617a', N'Traill', 971224, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1313a26-0581-46e7-aa4d-d8c3eeda5866', N'Morse', 932327, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6ed06796-d61e-49b1-9662-d8d596024006', N'Pronunciamiento', 519509, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'05c7beb3-0d1c-44fd-a5ac-d8f3444e5b08', N'Punta Lara', 490328, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'106366f7-30f8-4ea0-bbdb-d931f6b1b2a0', N'Tintina', 370632, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88cbb1f4-d4a3-4aeb-ba73-d93b53b69888', N'Gaona', 40457, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'85bb0943-ba2f-4b39-a931-d943b5ffac2b', N'Cienaguita', 164668, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef478c82-2464-47b4-b7be-d96e07cb37ef', N'Palermo', 692143, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a903f79e-f21a-4510-bcab-d9b731f7fec4', N'Barrio La Costa', 587556, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7de9241-18bf-426c-b4ba-d9dc6d4eb6da', N'Barrancas', 729978, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f04f185-aa3f-4032-8e65-d9e9245e8920', N'Punta Mogotes', 339400, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'74ed9edc-9817-40e1-a231-d9ebf12e5a25', N'Fighiera', 203791, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46e76bbd-9928-4a41-80a9-d9eeab98311b', N'Barrio La Union', 628267, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4bd34ab9-5a4b-41b0-a53b-d9f25ec90b01', N'Lapachito', 941489, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64bf5ab5-30bd-4d3d-a983-da1bd4d059de', N'10a. Seccion', 68580, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c472a14-5152-4186-a61d-da2aaec0b363', N'Maquinista Gallini', 593661, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36f0d99a-6a62-472f-92d0-da3cfa91ed9d', N'Alta Italia', 875554, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'138d8750-28ac-4dba-8760-da55bca978b9', N'Saladas', 280290, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'340f0d42-d833-4953-b16f-da580e8b11bf', N'El Salado', 638681, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07505a61-d6db-402a-85c4-da5df39cf296', N'Pedro Gomez Cello', 359935, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1980f7c7-5d76-4b1b-a07b-da5fb389680c', N'Matara', 304830, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'68c90cd9-e93b-4c37-82e1-da658d5366ad', N'Santiago De Liniers', 775009, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'afc51587-3979-463f-b897-da96d36d1e4b', N'Carlos Casares', 96462, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6b00cd0-a15e-4ff4-bd7d-dab482657f14', N'Humberto Primo', 280970, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd60869b-eebc-4f01-9361-dab810b3114f', N'San Pablo De Reyes', 128611, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f21d92fd-f3f3-48c3-9686-dac8eba7775c', N'Villa Llanquin', 357971, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'518b6718-d363-481c-9bbd-dad151c2fbc9', N'Progreso', 584209, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5281a00b-db30-4102-9b8d-dae46d377cbd', N'Capdevila', 716338, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e7ae152a-0b5e-4cf0-9b04-daf45f980fbf', N'Villa Angela', 473277, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0c5aa84e-d514-4495-b371-daf6e2681677', N'Labordeboy', 591582, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e7c21d5c-d62b-42ac-a7f4-db0a4c947518', N'Colonia Victoria', 216119, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5065a62-0c34-45dc-8cb0-db11e406b3bd', N'Colonia Suiza', 631335, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7372552-2086-4976-ac8c-db121bec88ef', N'La Brava', 380948, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3958ced-341e-4b20-8f9e-db26393eff23', N'Seclantas', 356756, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'94fdcae4-df2d-4e7d-b383-db35c8c48d84', N'Fortin Lavalle', 683138, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a4748fc6-df9b-4d30-a898-db381330c8ee', N'Barrio America Unida', 54352, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fef1d345-3b1a-4dff-8391-db4d70f40943', N'Parque Chacabuco', 387775, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b76d6cb6-93f1-48c9-a2c0-db52813ca4c5', N'Los Toldos', 732345, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f0eee403-536e-4eca-8690-db54c499b08e', N'Saladillo', 897323, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2b48a564-4a5f-4a89-8b2b-db60e65e2a18', N'Sebastian Elcano', 247678, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5e7c21a-d61e-487e-8ffa-db6d5a66e0ee', N'Boedo', 775529, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c0ac69ab-571f-4a38-9d17-db76a7ea32d0', N'Marcelino Escalada', 975715, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bfb136c3-9529-46a4-827f-db790a6460d4', N'Chilca Juliana', 267020, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'33e10c81-f6fd-4421-a0d2-db7ac2671c60', N'Villa San Jose', 98120, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5871576d-efec-4286-8ddd-db7f9c749195', N'Villa Carmela', 482294, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6ba0606-c2e5-4278-ad0e-db92b8ba9d58', N'San Bernardo', 98957, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9236b12a-3709-4cb1-bdc2-db9a7d5899bd', N'Parque Chas', 553427, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8adad66c-0af6-4793-a7ae-dba8032a33b4', N'Juan Pujol', 671955, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1eee7f6f-cebd-4962-ad74-dbba1cb758cd', N'Aldea Protestante', 853910, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'83de7417-eba7-4a60-91b6-dbbb3e53649d', N'Vera Y Pintado', 357358, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c4bb3dfc-712d-46e3-bd9d-dbcf38ce8ccd', N'Chapanay', 42775, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b74619e9-3113-46f1-9ef4-dbe0d4da2960', N'Serrano', 220292, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e0062340-b145-40bc-a8aa-dbe4ba471899', N'Rolon', 756483, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b9622d5b-e727-4dde-83d1-dbe5c311e280', N'Villa La Angostura', 43098, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04a65cfc-ca24-4a4d-9665-dbf4c29b6822', N'Santa Isabel', 745829, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea2b76fd-afef-46b0-a7e1-dbfc93b2aadb', N'Los Campamentos', 807145, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'290376cb-33f4-4618-88ef-dc0665b15f4d', N'Buena Vista', 603722, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fa1a80e3-71a1-4130-88e8-dc11641119fa', N'Barrio San Jorge', 915667, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'19edb164-dee9-4b7c-ae41-dc18060ac01b', N'Los Naranjos', 624339, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e4e4732d-399e-4c2a-878e-dc1ce4d960e4', N'Ingeniero Guillermo N. Juarez', 196384, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ea0681a7-8e8c-4141-bdcd-dc44bec1c1e1', N'Joaquin Gorina', 209745, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6aa9a94-a928-432a-a21a-dc5b6035a137', N'Andrade', 682633, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73571d34-c986-41a9-a3f2-dc6ba874a8bd', N'Arturo Segui', 46685, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8501199e-70b4-475e-b591-dc76fe0eac2f', N'Ramon J. Carcano', 216807, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7539691c-126d-4408-8f5d-dc83b31824ae', N'Villa San Luis', 202817, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f4c23c29-6c70-4244-b3ce-dca2c0fb383f', N'Misarrumi', 597286, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b43389b5-6a6c-49c0-9817-dcace29459ac', N'Villa Argüello', 966659, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'40e1ff59-34d1-4002-9fbe-dcb4bb868537', N'El Espino', 542340, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b4115ab-c10b-46d1-a3ae-dcb80fe22c7a', N'Colonia Peña', 709967, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3c5c759-17a7-4d1c-b786-dcbf323ecb14', N'Pueblo Moreno', 290773, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d510aae-933a-4580-9e59-dcd96fe22698', N'Capiazuti', 270639, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cde08765-ee70-46d4-980f-dcdc63b1d0da', N'Gobernador Julio a. Costa', 245099, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'995aadca-6895-4739-88a8-dcec6268e3f9', N'Barrio Canale', 196337, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'50dbaaa5-0272-47ae-93ca-dcec663e04d2', N'9 De Julio Kilometro 20', 886671, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78d3b4d3-c1bd-41d0-848a-dcf13331a155', N'Loma Verde', 674212, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'db63300c-ee34-4522-a3b8-dd08072ba1c4', N'Las Cejas', 936800, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23536cae-6e05-44a9-9ae2-dd1527c2af92', N'Mar De Las Pampas', 522128, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c9832ac0-a05a-42e2-9f6c-dd25a03e232f', N'Oasis', 691796, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d9686da-9122-489b-9507-dd2dc30dfba0', N'Loreto', 212716, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1db5b232-9d16-426d-9fa3-dd332a3858f5', N'Grünbein', 440856, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78d37724-8ca3-4a27-831e-dd376cd6b0b9', N'Punta Del Medano', 962532, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ae04e8f-0ab9-4dde-a556-dd4a2919d553', N'Jague', 698313, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0301db56-0f42-483e-972f-dd52a72457b6', N'Santa Elena', 620167, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8bc175bc-9def-4976-b0e9-dd531c8ebe07', N'Samborombon', 814726, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8c39dfc-d9c2-4186-b240-dd58eb8142ac', N'Colonia Hugues', 850202, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c986dd5e-8125-457f-8c7a-dd5af326bb13', N'Los Nacimientos', 666480, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce0eebf9-455a-4c5b-a26f-dd5afe244fc4', N'San Nicolas', 653651, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5623038-c975-40d5-9844-dd5e4be3b742', N'Pichi Mahuida', 69637, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0382f5f4-bf2f-48d3-871f-dd5e857f28e3', N'Toledo', 714198, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6ad32ce9-bc35-4549-a599-dd5f3615a365', N'Casa De Piedra', 21073, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'efc17583-3201-4a0f-8515-dd78052942c7', N'Villa General Belgrano', 549845, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dd0f04bb-e072-4b9d-8793-dd84c2fecce6', N'Los Angeles Norte', 881357, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e214f57-c1cf-43bd-946a-dd865db76c67', N'Palca De Aparzo', 609872, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd41e44ef-c2f7-483b-97a1-dd9d7236197a', N'Pasman', 93051, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'36c37142-9673-4113-a06e-dda434ab786e', N'San Marcos Sierra', 373189, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd395014-e84c-4757-93ec-ddd9f6163ab9', N'Copo Quile', 878809, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00b89242-0d38-42b7-855c-ddfb981fa863', N'Juncal', 307151, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'637a3225-b72c-409e-a2be-de22d9e1aee0', N'General Lucio V Mansilla', 128723, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2f585a9f-4ade-4b95-b671-de3815334578', N'Las Jarillas', 969603, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0facc68e-f3a8-4b78-9fce-de39a707da25', N'Kilometro 30', 160122, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fb159e10-bfa9-4407-adde-de573712e2d9', N'Villa Eloisa', 132478, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3fa9654c-0c84-4ad9-8aa6-de64c9babd71', N'Las Breñas', 896173, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e36d8f9e-b865-4157-b4fe-de7a483487cf', N'Antilla', 822841, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a6305c77-c8e8-4a8e-8916-de7af86129de', N'Mogna', 337165, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f13602b9-2647-4b73-8747-de84e1d7523c', N'Costa De Reyes', 1439, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'087d824d-dfb4-4979-82a2-deab6cee61d2', N'Onagoity', 364396, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7e6c56f-4833-4e40-8765-decab8c17c64', N'Dumesnil', 860998, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21aa3229-3eb7-4c14-ba60-deda73bb9318', N'Colonia San Adolfo', 222748, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eea2a9eb-a002-464a-8a6f-dee8506b21ac', N'El Tropezon', 668033, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65e4a405-b75d-436f-a775-deedbec477ed', N'Lutti', 62912, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f5060edf-19ce-4b3e-8d15-deee8f43a7b9', N'Oliva', 278416, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2aa0b26b-9848-45b9-bc7f-def09aea2f2d', N'San Francisco De Alfarcito', 374184, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'70af401a-60d3-4b22-8caf-df02c6ffdc5d', N'Villa Maria', 174999, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c22d2f3-a68d-40bd-b5f7-df050e5c5023', N'Wildermuth', 722558, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e3968240-56d4-4db6-8361-df1ff32d8794', N'Ingeniero Pablo Nogues', 598595, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4dc96a4d-36cb-4f3c-97bf-df385acadbda', N'Plaza Luxardo', 870137, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d30d128-cc7d-4068-83ee-df5ab5824b21', N'Ricardone', 648501, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e82445ad-f9f9-46f0-a239-df61941c7577', N'De Bary', 343131, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b26253c6-5a7b-4c54-98a4-df7dc7376259', N'El Barrial', 490769, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a021011-5ee6-4e57-9a5a-df90d74cb53b', N'Rincon Norte', 913415, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a6a30bab-17c0-45ea-82fb-dfc40d2d085d', N'Estacion Araoz', 812568, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'81cee319-7794-4234-9204-dfc84c903d2d', N'Manuel B. Gonnet', 419096, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbc58b88-a65a-433d-8fc8-dfcd0b56e6b7', N'Playa Dorada', 855839, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'037d2623-bb20-4c53-a6df-dfcf9e42e456', N'Monte Del Rosario', 329689, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b8cb7422-9243-479e-aeb3-dfdb8a699e36', N'Villa Clodomiro Hileret', 367842, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cb7eb744-fd60-46cd-9a7e-dfe3eabf5b97', N'Colonia Mauricio', 304900, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0b056618-f99a-4b9c-a3f8-dfeb8d83c9d8', N'Presidente Roca', 927193, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'364590a0-683a-4e73-af0e-dff616a950dd', N'La Invernada', 100708, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d8b7bd4-6cb8-4699-b214-e01fca03ca89', N'Rio Blanco', 855754, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e4abe15-4e2c-4554-b3a5-e04a49f568ad', N'Puerto Vilelas', 520300, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'385c93d7-37a1-47d4-8e7d-e0554ee258aa', N'San Pablo', 912629, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'de5a42ec-d8d5-40f6-aeaa-e05b2a4e559d', N'Sastre', 33413, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce20d1c1-4f9d-4ef7-bc6f-e063be115fc3', N'La Intermedia', 858563, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6113b284-b634-4f89-ace5-e08622f554a4', N'Benito Juarez', 84425, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b1cc809b-b6cd-40b8-97fe-e0921ae5b18a', N'Sarasa', 582488, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c9a4426-8a2b-4054-80aa-e0b8825bee44', N'General Levalle', 44515, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fc8c4139-474a-43e1-8000-e0c70d93ec35', N'Rada Tilly', 315417, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c28dd44-0096-4847-bb47-e0db5692328d', N'Aguada De Guerra', 61466, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca34e542-d628-4ac1-97b4-e0e66c6be339', N'Lincoln', 899217, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c73b6c89-565c-4d40-bb22-e10f12ac5844', N'Mercedes', 638085, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'585686eb-624d-4fe5-bd69-e1116a89bf8a', N'Santo Domingo', 644076, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd977e37b-f317-4b5d-9e47-e11272a4e030', N'Barrio Güemes', 154558, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'75c85cba-44c4-4191-b33e-e11fa8b7fd69', N'La Quinta', 990050, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e8cc816-6868-4fd7-9e0d-e128e2664bbf', N'El Espinillo', 930193, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b48903d1-771d-4f0d-bc67-e13f8576a216', N'Country Chacras De La Villa - Country Sa', 339764, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3bd55362-3215-440d-b9b8-e14d6ea3fe51', N'La Cesira', 309190, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02c45f7e-ad85-4e7b-a47d-e15a89a5f224', N'Gato Colorado', 695839, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd7d8ad40-f69e-409f-aa56-e16068fa32b2', N'General Fernandez Oro', 23804, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d419f74-5955-4301-9ef0-e185654a5879', N'Cobres', 1689, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4271740e-6c4d-4b8b-b9f3-e19dda39c415', N'Centro Guerrero', 24046, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39d3b700-534e-49bc-bbc2-e1aa5039dfc5', N'Nueva Pompeya', 439517, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd38a7d31-b4ce-4f7b-93a6-e1aeee57a8cb', N'Gobernador Echague', 35469, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7ed504a2-7290-426b-971f-e1b6309a590c', N'Arroyito', 872945, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64eba69c-f587-41a4-819a-e1bfe5fedd06', N'La Lonja', 578682, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'87599916-b6db-420c-929e-e205e0248765', N'Barrio El Petroleo', 684640, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'28610ff7-411d-41bd-8135-e207facdbc47', N'Los Menucos', 713495, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1372c305-442c-41c2-aacb-e22b906c1f28', N'Colonia Alemana', 31456, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0d25cee2-2c7e-44ec-a8da-e23dfd847d68', N'Cazador', 315002, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'623b04a4-0f9e-409d-b992-e2469f2f665f', N'La Floresta', 860817, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44d56331-b0a9-4331-a29c-e25206ef21ad', N'Villa Ibañez', 512109, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bb685153-4818-4e0e-b153-e259bfca2989', N'Las Carabelas', 873722, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ccf547f-2c05-4e57-b081-e26a7ef35472', N'Villa De Balcozna', 440984, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04aabaaf-e975-4102-9069-e2869ff1b0fd', N'Bañado De Soto', 414905, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4624e453-60d7-497f-a9c3-e295b81b3cdc', N'El Rodeo', 714141, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'193d2a8a-4ad1-45ee-9a2c-e2b65d70950b', N'Los Cardos', 964239, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5a78223-6900-427f-a195-e2b7262b93a8', N'Villa Urquiza', 725048, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fd85bfc0-e06c-4084-aaf0-e2c693d0935a', N'Laguna Limpia', 704298, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a965b6d9-21fa-4e44-9011-e2c6b54cbcf0', N'Los Manantiales', 868956, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d794692-546b-480e-8631-e2f300b38193', N'San Marcos', 321331, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3daa7678-8331-498f-9660-e2f931db6729', N'Duggan', 160364, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0db03c03-342e-486c-8c48-e2f9d76c9558', N'Barrio Belgrano', 529220, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bcabe9ef-606c-4b4d-839c-e309f8c09ca1', N'Amuschina', 566649, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c5f261cd-b737-4cfb-92ca-e30c03bfc7f5', N'Villa Laguna La Brava', 311952, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61aacb5e-eb61-4f52-88b2-e31b2f4c0a8a', N'Km. 3 - General Mosconi', 664826, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9731a361-de52-4f95-9727-e3233dc67d19', N'Candelaria', 905613, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6df09d75-3162-4243-b02c-e3375de3473b', N'Tuyubil', 569597, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0fb85277-468e-4d60-a8d2-e33e7e6c5763', N'San Mariano', 123993, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43318dab-4e24-42fc-a430-e356a1712ec2', N'Laprida', 294755, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ba8682c-95ee-4ae5-ab8e-e3594dc5c3bd', N'Lomas De Copello', 967417, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b6c35eab-c649-41b1-b99b-e3618d3f48b2', N'Mundo Nuevo', 359293, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ba5f711a-655e-4801-8d1b-e379cdc64f96', N'Cuartel V', 672072, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4399c7f5-3735-494f-a8c9-e38e70b8a3ba', N'Santa Elena', 111140, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca14ed97-ff52-4b95-85ff-e397e156d7c2', N'Villa Alpina', 799582, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07d72349-b9e9-48c1-b987-e3e42a187c4f', N'Niquivil', 898842, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'252b2c3b-f83f-4370-8196-e3ebf13fa7b8', N'Colonia Raquel', 577009, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'040bcffe-6b88-44bb-b701-e3edadf6cbea', N'Conhelo', 732720, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f93067f9-6686-47e6-8b04-e3f37531a070', N'Estacion Mazan', 793055, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'11f53d4e-c186-4e0e-acbe-e4013bf9ba6f', N'Wheelwright', 231348, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'17c4e735-0263-4a13-a065-e4040a2c17ba', N'Chivilcoy', 630117, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5403a452-74ab-4074-ad73-e405e2338317', N'Guanaco Muerto', 829590, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79ac9f28-e1a6-46b3-b6c3-e411675257fc', N'Diego De Alvear', 368568, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d8875b4-04d9-40a0-8dcf-e4420fea1e13', N'25 De Mayo', 433099, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02f24df3-0ba5-4cde-b457-e45e412b3c00', N'San Alberto', 350982, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'659379a5-bd0a-4554-af24-e4659c1dc503', N'Paso De Indios', 910243, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1df7f59e-310c-4568-ac52-e4904c9b1430', N'Barrio Santa Teresita', 999135, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da6e5bba-99bc-4509-ad61-e49244c9ead1', N'Coronel Du Graty', 117857, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc13e57c-98bf-40eb-a122-e4cbcb6b8db9', N'Santo Pipo', 428014, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c04bd3bf-0848-4205-8b69-e4d3585c8f7e', N'Perito Moreno', 153551, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a78162a9-f521-4cda-b154-e4d504e93a39', N'Los Quirquinchos', 381178, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df1f6d02-40cf-4981-9ffd-e4fae74d609e', N'El Paramillo', 198671, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9866b759-2c08-43af-a15c-e565c376b8b3', N'Capitan General Bernardo O`Higgins', 69536, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'294be32c-3076-411b-bfd6-e578075e255a', N'Bordenave', 127641, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02557584-f4bd-4469-be1b-e57952c12986', N'Barrio Rodriguez Peña', 418516, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f2fad26f-ccc9-4478-90f5-e5868d7c18b6', N'Napenay', 296535, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3ea444e-7bef-4e4b-8ea2-e5a19cd118b9', N'Barrio Maria Auxiliadora', 763669, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1fc0e4f3-c05e-4cc2-99e3-e5a2d1f82110', N'Santa Clara Del Mar', 64458, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'81f6fffe-aa8e-426b-80e2-e5b2f18fc787', N'Barrio El Milagro', 264285, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'74e9acbe-fa67-43ad-98c7-e5bcbe9c6695', N'Valle Del Sol', 544797, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b7c18b9-1f20-4632-be74-e5ce50fe0da0', N'Zelaya', 565377, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e2d094a-f68a-49ef-b46b-e5e0f482bc49', N'Piñalito Sur', 944601, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dee86b4b-52b7-4a5a-84f6-e5e36c2e9ec9', N'Villa Progreso', 82808, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4774648e-f09c-4d7e-bd7b-e61e39caaa9b', N'Ramos Mejia', 678774, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'725326bd-49d9-496c-a741-e6229e10877f', N'Caspichango', 872724, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'89a15627-1296-48cb-a2ac-e642484f8304', N'San Ignacio (Loteo Velez Crespo)', 759274, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'34873399-c472-4990-a3b0-e65f2a2704a6', N'Estacion Chapadmalal', 938612, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e500a12-a76b-4ba1-aaff-e67b97899053', N'La Rancherita', 294797, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e71fc05e-2fea-4f23-a0c9-e6a08364c6fc', N'Jesus Nazareno', 469203, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd5323146-5fee-4b9a-a706-e6c198d0c334', N'Allen', 372166, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65cbd62f-7d53-4512-9acc-e6c60f04d046', N'Aguaray', 62355, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ccd826e2-7014-4899-b5a1-e6da0c2aeccf', N'El Huayco', 322639, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7a037a6-f7c0-400b-b0a7-e6ec705ccf60', N'Alto Rio Senguer', 479604, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8760bf85-c87a-4ecb-9578-e6f8eda6c1fe', N'Todd', 331563, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dafb7cbf-4b65-49a9-b4df-e713318f6341', N'Casalegno', 953181, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ade8e31f-14d4-4cf2-b14c-e720a24ee15f', N'Rafael Obligado', 170229, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'095ebd5a-c785-4deb-a9fa-e72bc75430e0', N'Rincon De Milberg', 419895, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e155dd1-6e48-4ab4-8d82-e754f5b74926', N'Campo Duran', 585439, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56d3afdf-0eff-4074-9ac2-e768c3952c92', N'San Jose', 530725, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ffbad65f-441e-4482-ad58-e76b99fc4969', N'Nucleo Ii', 922866, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a91c481c-6b97-44b6-9269-e76fc8af1f48', N'Santa Rita De Catuna', 661763, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c81b01f-84a3-48e8-82fb-e77316e5bd4f', N'Capitan Castro', 156715, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e882c3a8-ec55-420f-b686-e7879963e1f7', N'Copetonas', 89349, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec5224f4-8dbb-4c7d-928f-e78d41fac39a', N'Villa General Mitre', 895728, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aec7d097-6d0c-40a9-b4f1-e78f053d1af6', N'El Retiro', 655318, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e399fa12-bc14-4312-bef9-e79a5605a5e8', N'Villa Serrana La Gruta', 593879, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20f53d87-cc03-4c45-80ba-e79f93f1b470', N'Nemesio Parma', 220651, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79d46fd9-1453-483c-af1a-e7b90f11c35b', N'San Cristobal', 401957, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'afc3761b-1deb-4b08-8830-e7ce8aa2c8af', N'Saladillo', 718985, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'80b4a511-bd9b-4116-acc1-e7d1a4e5f196', N'Metileo', 392489, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27ed1a32-793e-4e67-8c31-e7ea7a73af3a', N'Malvinas Argentinas', 85435, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'046a3bad-bfc2-4032-8d7b-e7f38c353271', N'Frente Mar', 794403, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1b7813b-e824-4abb-ae79-e7f979aa9454', N'Cafferata', 548629, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'16b3c022-ba6f-4c5f-9432-e804d963f549', N'Atahona', 139478, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88e1c87c-0c0b-4ae2-886f-e80bee947f18', N'Salsipuedes', 259460, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd0d0e6a6-0e71-4079-9a17-e80fb49a7259', N'La Florida', 785243, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dbef1eb1-11ba-43da-952b-e81adebc3964', N'Loma Bola', 775003, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'56a39030-c987-4005-96ca-e8317decb344', N'Carmensa', 123566, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'de51476f-5381-4a91-b910-e8394f7dbb3a', N'Huanqueros', 962803, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60f11d3c-b9c6-40dc-8cf4-e84f93f7022a', N'Sumamao', 502672, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'024120e7-37bc-4db7-abe9-e851ad3b4a49', N'El Calafate', 406257, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1912a684-6382-4a9d-ae83-e854b223a347', N'Conlara', 953575, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'50ce091b-78df-42c8-b45b-e85534eead0e', N'Chañarmuyo', 721265, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'02dd2bc8-834b-4c68-ae46-e876a96e3173', N'Quilino', 192825, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a69b5cc8-2db4-47b3-8131-e88b3ffc3c08', N'Irala', 368480, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd571405-81db-41bf-8144-e89790588b32', N'Desaguadero', 462232, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3310260e-f08e-4f51-aebf-e89ccb77c30a', N'Anguinan', 373199, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1fe961e5-90e2-4336-a6ae-e8b4ee892007', N'El Naranjo', 722769, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'07e91c06-fafe-49fc-a389-e8c4d7969394', N'La Trinidad', 7537, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dffe5804-fe3c-4c03-a573-e8d4eab6a1a2', N'Los Puestos', 398934, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9052aca-ebe0-40e6-9911-e8eb3e0f02e8', N'El Marquesado', 263020, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a64a4b34-a26f-4415-aebc-e8fd97ee90c8', N'Lafinur', 146494, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c633cdb8-34ce-49cd-8d3b-e900d7c6f94f', N'San Antonio', 58237, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0cf3c00d-1728-4da7-b4ce-e9158c9052ab', N'9 De Julio', 436490, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd107f83-badf-4965-8008-e948421daf15', N'Granadero Baigorria', 263019, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ef5a55fc-87d1-4636-bb20-e94da4003a83', N'Pampa Almiron', 486442, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a7681337-ae18-416d-a672-e957499c309e', N'Mariano H. Alfonzo', 758090, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4ee9a1f6-e0d5-4ad4-84f5-e9738f54fc9a', N'Blancuntre', 225144, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'34d00dbf-9351-4549-a59e-e9785dbe5bd1', N'7 De Abril', 533460, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cd3a8473-25aa-4ced-98b3-e98fdf5868dd', N'Donadeu', 75549, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f1618866-d5d4-4b65-b110-e9dacbf24ac0', N'Villa Del Nahueve', 969451, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'643a81d5-dd0d-4fb5-ac65-e9df205e2962', N'Barrio Araujo', 484393, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd65ac471-b6d2-4b5e-bda5-e9f55384e89a', N'Puerto Bermejo Nuevo', 531774, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1fca410-ac2f-472f-ab28-ea306c9546e1', N'Villars', 299281, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1cb27474-c38b-4928-b1cc-ea31b49286e7', N'Washington', 558644, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2d10bb95-7eba-48b2-920c-ea43ce7e3919', N'Barrio El Mirador', 832033, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce11d3ff-69c2-4cf3-8eb5-ea659f8e1b57', N'Villa Candelaria Norte', 392406, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bcb9da9b-7142-458c-9a49-ea673b682c75', N'Nacate', 230455, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aea68cc4-c833-448b-9d59-ea8068cb0fb0', N'Arroyo Ventana', 684373, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1b0958fc-de1c-42ff-a1d8-ea82c0d8d386', N'El Tropezon', 436516, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'59d25c54-16b4-400a-a992-ea8971e9fe86', N'Lucas Monteverde', 273351, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1241e39a-da39-491a-9b57-ea9e8bee3ec4', N'San Miguel Del Monte', 518458, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a0926392-ebcf-49fb-9c8a-eaa21177b411', N'Mina 3', 876868, 20)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60007d39-e41c-4603-b412-eaa476d5aa73', N'Milenica', 271274, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15e62c7c-7d76-4d2c-8365-eaac9a9e6aa8', N'Mariano I. Loza', 306673, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'acca6cd9-ac60-4ce0-ae01-eab2f93e8ba4', N'Benito Legeren', 862986, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'abc25db9-9761-40ed-94ef-eab6aab008dd', N'Estacion Camps', 746716, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1212efc7-da51-477f-8999-eaba276f0411', N'Las Playas', 204902, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'13abfa40-342b-49d8-8343-eacfe836c9bb', N'Dique Lujan', 170607, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9421c42b-543b-4490-8b84-eadcb820e8dc', N'La Merced', 554387, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c23f103a-58fb-4148-9ee3-eae0ede1c2e9', N'Tinoco', 678554, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cca7fe4-8195-40ce-87d3-eb1683be88f5', N'Tomas Young', 884580, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4595415-eb86-4d95-b76c-eb2283a22994', N'Chelforo', 911537, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f0a39078-e2e3-40da-aa0e-eb24964a4d4b', N'Villa Sarmiento', 730345, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ab34e6a-79fd-4321-9091-eb363b9c7810', N'Irene', 47587, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'48597139-ae11-44bf-a8d1-eb4c98ce06a0', N'Alcorta', 709906, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'10dc208b-0442-4bc9-a6ea-eb5b34fc6b5a', N'Manzanares', 193953, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'031b47db-468d-4a19-a021-eb62cb9ed5e9', N'Agustin Roca', 142913, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'735d05bb-d65e-47d9-a41e-eb797c86f24b', N'El Resguardo', 264790, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2cfd01b7-49b1-4855-9ce7-eb807828a821', N'Morea', 656264, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'53c70458-bfcc-4c75-b9c5-eb9e8c854f66', N'Costa De Chubut', 57582, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7c318672-846d-4438-987c-ebb29f4ea957', N'Malagueño', 913599, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4a6aa56d-78ae-4b22-a7ee-ebb4481f91c0', N'Elena', 492435, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23f0836a-14df-43a7-b641-ebb58493297a', N'Villa Quillinzo', 851751, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b4c149ed-3734-4231-886b-ebb68fb106ef', N'Arribe¥os', 470478, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'06b3d9bf-5b83-4102-975c-ebf04885d3f8', N'Estacion Saguier', 751838, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dea54f1b-d87e-46ad-90e2-ebf550df4009', N'Bragado', 562908, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f4345353-5788-4cbf-970a-ebf5b308d881', N'Villa Del Plata', 293363, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'62d2b9a8-b595-42e6-a359-ebf99162e919', N'Potrerillos', 961548, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ad12c0eb-4de0-4a27-bef9-ec07892939bd', N'Hickman', 304865, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'60f1ef11-831b-4d67-b14f-ec109f3c8e47', N'Pagancillo', 782349, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f1ffedf-7e0b-4935-a8e3-ec1724237435', N'Los Molinos', 538627, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'68af933b-f1c6-4496-ba70-ec3d620865b7', N'El Fortin', 420655, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2c7e1f2e-3fca-4862-b1bd-ec3e9dd0e1a5', N'La Escondida', 220111, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3001810-03ca-4b19-97ab-ec7f387e2abd', N'Bandera', 259148, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'152feb2d-bb6b-4574-9d26-eca3066b6bda', N'Loncopue', 607252, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8bc48e66-0484-4bc6-acaf-ecaac90a9cbf', N'Empalme San Carlos', 706218, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'788f8ae8-f09d-4b62-a099-ecb951752502', N'Villa Nueva', 841040, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'866e7af2-4f59-4737-aa39-ecbb1112835b', N'Santo Tomas', 1840, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'552d9ea4-eecb-4bea-bf8b-ecc2fd067498', N'Apolinario Saravia', 245985, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5df12a7d-8612-455b-b520-ecc3e02792b1', N'Villa Ojo De Agua', 97856, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ebc9963-5c81-4786-80b0-ecc5bdb70054', N'Colmena', 827081, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbbb037d-848b-4f19-8611-ecce7cc13691', N'Virreyes', 597186, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61119ecf-3456-45de-a09e-ecd7bb48ba8a', N'Puerto Tirol', 812934, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'44ff0c26-c0c9-43c5-8708-ecfc2f2ba4fc', N'Olavarria', 736077, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4da3ec3e-efa8-468e-a046-ed06023de29a', N'Gorchs', 875221, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'498e0724-6ff8-4e65-a43d-ed12b9c383f6', N'Porteña', 928664, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7f4dbaab-a0e6-47d5-bbf6-ed2f8ab6706b', N'Santo Domingo', 875965, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2354f193-e62b-420f-9448-ed36a1000983', N'Gobernador Roca', 896762, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bbe0695f-3860-4f33-a009-ed3e135ae93f', N'Colpes', 257321, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'31810cbf-b555-4745-b9ab-ed5c4a16948c', N'Medrano', 655340, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9968623c-d017-4fea-8b0c-ed636ac14a99', N'San Justo', 249229, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d165262-f043-4ef7-8e5d-ed786f782f9f', N'Dos De Mayo Nucleo I', 216750, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'80f26b86-cc5a-48f7-8d62-ed7f51ef4a82', N'Luque', 184252, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'119b1d33-9311-41bb-9c99-edabb523dab8', N'Mision Chaqueña', 379334, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab460fe6-3f37-4d4d-ac75-edba3e58564d', N'Alcaraz', 94076, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f79abd24-a53e-4fec-a593-edc7cf3cbfa4', N'Felicia', 683763, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e1a480a6-84da-44df-b0ab-edcc64711533', N'El Dean', 331508, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8a502e91-81da-402e-856c-ede7f0383f64', N'11 De Septiembre', 272618, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e053ad43-14fb-439c-b2ae-edee9ed5fcc0', N'Moron', 322968, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0974865c-d91a-46e4-85bf-edf557cb3028', N'El Colorado', 558411, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0cc3c477-5d12-49ec-b940-ee004876d0e5', N'Caa - Yari', 954153, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'98d53a02-3b85-4a44-8dc5-ee0626909565', N'Dufaur', 896399, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'17c99cc6-1644-4cc4-9de7-ee1616a89ce4', N'Vuelta De La Barranca', 828900, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6fa34e3a-a724-42c8-b48e-ee2fad1b80bd', N'Santa Rosa De Leales', 772410, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6fc2ea45-3dfe-4bfa-a796-ee4a5c83ce1c', N'Barrio Militar - Aeropuerto Militar', 331773, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'229752d5-90a9-480e-85ed-ee6dfacadb55', N'Campichuelo', 258249, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e344d2f-72e8-4e5b-a5d5-ee6f411d353d', N'1 De Mayo', 586876, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e3e85af-ec48-46eb-8b60-ee72a544dd81', N'Luca', 858603, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a2551244-f4a1-4ecc-8ffb-ee7a4db1a5f0', N'El Quebrachal', 276997, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'17ec051f-a205-4e71-b34a-ee7a5dee98f5', N'Sinsacate', 617935, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'30c1c60a-b097-4675-a02f-ee871c47b95e', N'Tolhuin', 465342, 23)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb84708d-2507-4c75-a0bf-ee8b67e5c619', N'La Merced Del Encon', 792155, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2415a99c-2495-46b0-a0a7-ee9bc661aa6c', N'Colonia Dolores', 730203, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2756567-a28c-4516-a4f5-eea7794d245c', N'Coronel Fraga', 340604, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df910318-cd03-4c62-a757-eeb569b6986b', N'Barrio Las Quintas', 5727, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'00e82513-67b7-4829-a6ca-eec9c4f2c172', N'Estacion Arroyo Cle', 850447, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'312a4a9b-7420-4bfc-a7d2-eee1b1c58aa3', N'Puerto Piramide', 88159, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a6f2268f-a1ec-4d05-a3d0-eee959d8169a', N'Sierra Grande', 400758, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bd631bf3-e0a1-47c3-bee4-eeeee8ac3e0b', N'General Almada', 455228, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4212c0ce-f083-4ef2-897d-eefa699e8fdd', N'Las Garcitas', 456977, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb9c7d86-0a7e-49a4-987e-ef0b76f08423', N'Las Piedritas', 841891, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ee4bea90-83fb-4465-b5e0-ef0cc9bd6608', N'Colonia Anguinan', 763727, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4c456670-b40b-4c14-8ad7-ef18ad7b2766', N'San Carlos', 135018, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f81b5611-251e-4d21-b64f-ef40d2b4b3f9', N'Chancani', 733507, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f18bc885-b964-44f6-8221-ef5d3543e2ca', N'Quilmes Oeste', 466826, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7b48cc24-7d8b-4849-b26c-ef6352eb18ac', N'Km. 11 - Cuarteles', 210582, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4bb2f89a-92fc-49a0-9bcd-ef6cb0dffa6b', N'Crucesita', 6561, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6cee7df9-166a-4816-9f2f-ef741df70c4b', N'General Urquiza', 47988, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6870f95a-3be8-4697-a0f3-ef75bab037b9', N'Dos Arroyos', 890897, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a070ad45-e291-4970-9a99-ef89f0df496f', N'Barrio Del Lago', 784534, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5777e9ae-3d62-4e30-a78a-ef9f3f3bf000', N'Corral De Bustos', 523701, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f9c1f28f-581d-416c-9a35-efa5b3bd198d', N'Villa Ascasubi', 724603, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04345cd5-b643-4e3c-afa3-efab57627b88', N'Colonia Vignaud', 843853, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9f376348-8023-4106-bb8a-efae699a2e9d', N'Almirante Brown', 322716, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ae66b8e-0200-467c-8330-efc38226e303', N'Triunvirato', 841434, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5a7259f2-4de1-480d-9fbe-efc6c7e1190d', N'Falda Del Carmen', 188615, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27f83ca0-4a06-41d7-902d-efd3d4572877', N'Panambi', 7003, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'913878bc-0142-422a-9454-efffee2db4e8', N'Villa La Serrania', 147173, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6daec3db-a24d-4d3a-bcb1-f00c7caaaf38', N'Country Club Las Praderas', 19703, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5722c0f2-89f0-4bb6-ab95-f02e6ad99713', N'Hale', 817650, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c8964ae-f2c9-49ab-ac4a-f04a5a09010b', N'San Bernardo', 389106, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'94496279-fb2f-4ff1-af62-f053b55dff9c', N'San Huberto', 899571, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9e8777b3-e447-41d1-a4b0-f05623c043a2', N'Pichincha', 163849, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7529fdc5-1d27-4ca4-ae33-f0631780f291', N'La Cañada', 730075, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c8e6f3b-299b-4b8e-bed8-f07cf1c41c33', N'La Batea', 777084, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b16ff193-26c2-4856-900d-f080c3fe23fa', N'Libertad', 294117, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc715e7a-ebc1-46a7-9381-f08d2d9e2218', N'La Tercena', 273657, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43e35563-9b6a-4fd6-b1f3-f093cc633001', N'Acevedo', 52408, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b2ffdee7-56da-4636-9f45-f0994df44a75', N'Villa General Antonio J. De Sucre', 580320, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b29c5504-d712-42b0-84a6-f0b021cc9d53', N'Villa Las Flores', 144751, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c2200188-99cb-413e-9e9f-f0b085cac315', N'El Potrero', 891041, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'74ce3b6d-5768-4df4-88be-f0bf011fb3ce', N'Telen', 782001, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72d29092-87cd-4ed7-9bcb-f0c4092d3866', N'Arrufo', 282726, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3c67cd0c-51e8-4e23-9256-f0ddbb0528c2', N'Eustolia', 78635, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39733c8c-be2a-4046-ac86-f104a19a8d49', N'Barrio Saavedra', 726375, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0a54657e-495d-4b59-b17e-f1082769629b', N'Villa Mantero', 250058, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'01b6ab5d-c042-4b4d-8451-f1111f4666ef', N'Micaela Cascallares', 629583, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0242f9aa-c57b-474f-b1c7-f11a72ca96d9', N'Puesto Del Marquez', 331135, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d054858-5b76-41be-96fa-f12db6330adf', N'El Huecu', 758903, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1e8a7026-e768-464c-8ab4-f13582874236', N'Villa Yapeyu', 522165, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'328b3d21-f06e-439c-b300-f13956ea5445', N'Mansupa', 770739, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7d68c8d5-6f66-4a6d-98f7-f13c9f899ba0', N'Taruma', 330549, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'95c0868e-a90e-45ee-a981-f147c368333b', N'Caminiaga', 602187, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bf6cc8c6-af63-411e-b73a-f148f56f8d75', N'Villa Berthet', 632898, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ceaa57b-1fba-44cf-994e-f155c78bd2c9', N'El Tunal', 617229, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d6c88ba-d7e6-4277-939e-f16a442cec17', N'Las Calles', 291697, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f6d9d8ba-61e6-4f7d-a017-f183fdf6f1b3', N'Alto De La Sierra', 290248, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce452151-a8e0-48d2-86b6-f1964be1bcbe', N'Acceso Norte', 677775, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2cffbec5-2698-4423-8682-f1ba92a70465', N'General Pacheco', 951384, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a6ce0d47-1d66-4b6c-8d15-f1bb8f4f5fa3', N'Fernandez', 528775, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e0b5e19-d944-48cd-a858-f1c1e4585f23', N'El Mojon', 882156, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f8a5b303-4448-41bf-b4c1-f1d04650823d', N'Cholila', 63930, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'dc8e413c-1ad1-4a75-8d90-f1fbefbf5fc0', N'Villa Los Llanos', 482869, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9614a54e-31a9-48df-bc7b-f209ab345e2b', N'La Gilda', 85310, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5dae09e4-e62b-43da-a01b-f21aeb19ec4f', N'Casa De Piedra', 958302, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'555d9931-d52b-467a-87f1-f222166f166a', N'Rafael Garcia', 91837, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'27965e9c-060e-40f7-96c3-f2234e4168b4', N'Pieres', 726693, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7fbda06-4179-48bf-b643-f226b04fdacc', N'Villa Oeste', 641797, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bea8e8e4-9c3e-4a55-a075-f232cce3a03b', N'Vinara', 424865, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'33b76509-80f1-4978-b486-f23a69e1eefb', N'Vinalito', 917116, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0dd065ef-3435-4bc9-b0d6-f24a3d5aec5e', N'Volcan', 482564, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72fee9ce-f9a6-456a-bab8-f25d7ad9c935', N'Los Compartos', 639215, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6b79cf0f-352a-4e66-8071-f2679d8aac5b', N'Balde De La Punta', 723843, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5db62995-7790-4325-a1d7-f27e4206da1f', N'Arroyo Algodon', 84882, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd4629f92-3250-47c3-b22b-f28a90f1f199', N'Villa Mascardi', 923429, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23531ae6-e716-4b86-8f81-f28c6cd1cf9c', N'Loberia', 626679, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'93ff16ba-64dc-43b0-bf27-f2ebf8382d64', N'Piñalito Norte', 574834, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2919257d-838f-422b-bb72-f2f2c8c63367', N'Las Chacras', 925980, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65ed1885-6c05-4aab-92da-f32cdeb2643a', N'Barrio Saavedra', 890542, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bcb2467b-48d7-498c-83f0-f335f8bb8504', N'El Chacho', 774189, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9d8dbc6-1e1f-48ac-adad-f336b14ecadc', N'Barrio Tungoil', 32444, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a3800473-7d96-4afd-acd9-f3463cd76653', N'Damian Maisonave', 611098, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'13411792-4130-4a46-b352-f36fc3d5e690', N'El Zanjon', 648868, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e42199b4-7d71-4b8d-adc8-f370cb4a3a7f', N'Ingeniero Otto Krause', 453622, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'20b4e11f-8ee7-48c5-b453-f381f6346294', N'Doctor Ricardo Rojas', 777891, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd88354f0-31f4-43a3-9a32-f3860a537807', N'Yutuyaco', 124650, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f608a0d0-93c1-4bb5-9669-f38829c5e2ae', N'Piñeyro', 572602, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7c430608-3b6d-4ace-82cf-f3a3920d9828', N'Vera', 216749, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e6754613-ea98-444b-b93e-f3c03785025d', N'Villa Crespo', 931345, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8b583a5-8803-4be6-885e-f3c3f58d4692', N'Villa Basilio Nievas', 470615, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'39ca396f-7ee6-4578-bc6c-f3d3fb9de51b', N'Loma Verde', 819638, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'972fdc13-92dd-450e-93be-f3d771c165d6', N'San Jose', 608192, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'92dd5ab7-2886-4cab-a2d1-f3dd36108a47', N'Colonia Fiscal', 868095, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'131c7fe1-653a-41b8-a01a-f3ebd0c8489d', N'Curuzu Cuatia', 105040, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a206e91-1436-4ed4-b6bc-f3ec4d9f19be', N'Tres Porteñas', 880951, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0aa58cb9-ecd3-46c7-b0e9-f42710773395', N'Los Chañaritos', 488241, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'da4ba53f-1d9c-464a-832a-f4282affc790', N'Las Lajas', 778253, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c2be74eb-ce05-4903-a664-f4302650a7a0', N'Los Tigres', 843535, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e434b84d-2bde-4b29-9faa-f437668cdf32', N'Veronica', 13394, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b3978aa1-f2e6-4629-9930-f45644a0d785', N'Labarden', 216390, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c79e23a1-45c7-41f4-bcf0-f493706535a5', N'La Redonda', 612279, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'aac20812-da66-4ae3-8ba3-f4b19e159525', N'El Angosto', 317521, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f89d8aa3-e3e8-45a3-a238-f4c2e8cea259', N'Nono', 600295, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e704a3cf-4654-4e53-83a5-f4c4b979390b', N'Cañada De Machado', 516231, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'bc6164d1-e606-4efd-aa16-f4c7c548382b', N'Impira', 705100, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2e5a5004-214d-4069-960b-f4f9e117eb85', N'San Pedro', 73043, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'69189350-7161-4cdb-83f5-f4fdf762b998', N'Barrio San Rafael', 692812, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c5e9c02-a585-429f-b3d4-f50033e1725c', N'Los Molles', 644076, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'948f1801-e823-424b-b80a-f53d9252d092', N'San Jose Del Morro', 955497, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ddd9c6fd-e9cb-4c88-80d6-f53e2c30182b', N'Berazategui Oeste', 953862, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'68dea97a-3d5b-4c17-91b1-f54a4321cbea', N'El Durazno', 297852, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'57242ec1-575f-4232-81be-f54c53d3c7d6', N'San Isidro', 832849, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b645f9ec-6d84-4cbe-aceb-f54fa1ec7736', N'Eduardo Castex', 707475, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5fa162d9-e01f-49bf-aab8-f55d5fe92a3b', N'Laplacette', 631545, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0ee4139a-2a59-4568-aaef-f55f5912931d', N'San Vicente', 957029, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'298c20d8-1bc3-4405-a910-f578c6e22a60', N'Pampa Landriel', 670189, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0530a0fc-41d6-4215-a4b7-f5814514c50e', N'7a. Seccion', 292656, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4144a0b0-aa3e-4ee7-94ee-f5920ebb7b77', N'Adolfo E. Carranza', 989941, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1eb794ce-3660-4803-ad3b-f5bffc74b5fd', N'Rio Colorado', 630196, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'397ddd83-5e41-45fc-ad05-f5ccac1dfa1a', N'Embalse', 382834, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c7960029-643a-4bf4-b0f7-f5d53fe44bed', N'Arroyo Del Medio', 161603, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6a9275fd-bbcd-4905-ac2b-f5daabf06c5e', N'El Aguilar', 605160, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff1dfc67-df02-43ff-bea2-f5e63c01080f', N'Miguel Torres', 203003, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fddb4892-ed61-4bf6-9d83-f5e7e6ff2766', N'Pampa De Los Guanacos', 174156, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f390030f-2dd9-43e4-a56a-f5e87f1c1a4f', N'Mi Granja', 977349, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd9907aa9-6d9c-4d78-a5c3-f5ef13b01d0e', N'Cuchillo Co', 168945, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ce4b49af-482d-4ac9-bfa8-f5f0e2845a8a', N'Suncho Corral', 109038, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7226e228-53db-4d58-aeb9-f5f5ee43a9c1', N'San Joaquin', 519427, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5cf73d0-bfc5-4323-8c31-f61170e8001c', N'Villa Paula Albarracin', 440493, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eecf36b3-88b2-4298-b163-f62125546522', N'El Nihuil', 319731, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8eab7946-37fa-486c-87c6-f63a9e9b2919', N'La Leonesa', 844152, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4cb9096d-6348-40fb-a649-f63f6f4789af', N'Pigue', 499426, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd24a4af0-a9a4-44f7-8f3a-f661eb3734bd', N'Tapebicua', 357677, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'404f75fa-77f6-4695-bfcc-f66334752450', N'Ingeniero Foster', 435229, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5134a25f-ad76-43dd-b8b0-f67810cfa88c', N'Pilcaniyeu', 378556, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c78bc82-036d-4ae3-982e-f6843b48f8b8', N'Saforcada', 432552, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff0dde97-e6bd-4689-8c2e-f68b58f15b42', N'Ceres', 695468, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a773553-8859-4e39-b3f2-f69494b8ab50', N'Mercedes', 942607, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe555a02-1f3e-47d4-a31e-f6bb15cb31fe', N'El Libertador', 961233, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'12146d51-6068-4573-8968-f6c4c00b2ecc', N'Las Bayas', 708754, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'895bdf8a-7731-4f69-9cb1-f6f827baad7b', N'Casbas', 666430, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'24001b96-0d9c-4f4d-ac6f-f712e0745766', N'Villa Ampacama', 935944, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'15dc0b24-3eba-4e25-99b2-f75a499c329e', N'Ensenada', 394400, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e6b80270-0614-4259-8933-f761ba6ae7c0', N'La Maroma', 28606, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'79428900-9efd-412c-9eee-f77ba8048973', N'Villa De Las Rosas', 645875, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'45fb6d83-6c17-4266-91ce-f77bb45bcfdf', N'Nueva Plata', 502520, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'340f7951-6798-4e42-b642-f77e1d93a887', N'Choya', 784115, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'009e3275-739c-46bf-a55d-f79626c407b3', N'Sachayoj', 473924, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'de16e6f9-dda7-4872-bf83-f7aa8b1c278f', N'Paso Grande', 969278, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'df7c816e-d848-4f50-8267-f7c1078d537a', N'Colonia Marina', 401494, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8c1a9b9f-214a-4804-a1c3-f7cbb526e522', N'Caleufu', 276272, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c86f682-fe99-4acd-9177-f7cc0a4258fe', N'San Roque', 249564, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c6fa8601-560c-43ce-bdf8-f7cf0f7972a8', N'Pala Pala', 469050, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'901fa910-9097-4d7b-85be-f7f6103d7b4f', N'San Martin De Los Andes', 96911, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'04ae0ffc-8852-4266-ad0c-f81d8f160f51', N'El Aybal', 322609, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4dc1e274-e728-4165-afa5-f822cb7c2ee9', N'Ingenio San Pablo', 391679, 24)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ec58c02e-3dc1-4da3-8af2-f83847f950ff', N'Tolar Grande', 89757, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'744459a0-984c-4446-b86a-f84b4c8b23a4', N'Estacion Raices', 74554, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e940eb0-9352-4c8a-a041-f860c0db5ec6', N'Fofo Cahuel', 671956, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8e51ed9-dba9-435a-9b59-f884cbf8c401', N'Benjamin Gould', 208811, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b90d1ed0-3d1b-4cc1-a13f-f8b8a0d85ac6', N'Trenel', 65360, 11)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cbb91b9f-4a82-464d-87fb-f8be60793976', N'Monigotes', 347048, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'18f2451f-26ec-4059-b031-f8c0e5abe7fe', N'Arizona', 569399, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76b4f92a-7faf-45f2-b531-f8c471c43b96', N'Barrio Ruta 40', 573281, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9a89bca9-18f5-48f1-b584-f8d736f783c8', N'Salliquelo', 135963, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1f18b0ac-82b9-417c-8afd-f9123c94cac4', N'La Quiaca', 697050, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ace6749-b35b-4062-8937-f925d338792c', N'Cervantes', 92155, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'88c4df2b-1c6b-405a-8f84-f9265d208afd', N'San Isidro', 103121, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b922206-43b0-45bf-901d-f926b5a7ae70', N'Barrio Arroyo Del Medio', 730028, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ab25253d-9f24-48ff-8eb3-f928bc34b744', N'Colonia San Bartolome', 543552, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6e4659c8-b130-4397-8da4-f92cdea8b429', N'Solis', 382618, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9b5225f6-d9d6-4528-82a1-f93ce97520b0', N'Villa Parque Cecir', 933282, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'97011b25-ca27-4a70-9d6b-f942545b6136', N'La Nueva Donosa', 756393, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'decf61d4-0d69-4b64-934e-f9498d1ae546', N'Polvaredas', 147647, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e3610073-942a-4985-98bf-f970dcb39e1c', N'Villa Maipu', 39999, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'64b14ceb-9696-4955-a692-f976c33fb010', N'El Sombrero', 674646, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5943b410-5d8d-4284-a767-f981c61ccca7', N'Barrio La Gloria', 379227, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b74dbc7d-31f8-47a6-a7b3-f98376c32f5a', N'Rodeo De Valdez', 826851, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'99fa2daa-8e66-405c-9aa7-f99633532535', N'Las Guachas', 703707, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c67e9e5-103b-4951-888c-f9ab942cb1df', N'Los Cajones', 306217, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e8e5ce08-2ab4-49f6-a31f-f9c143321591', N'Bonpland', 536468, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'61be481b-f5a6-494c-a09d-f9ec7debb4d5', N'Villalonga', 826837, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'21ae9114-6bcb-42a4-9010-fa0b9362d331', N'La Merced', 174468, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0850bb71-7884-4162-a3f1-fa0f07406426', N'Venado Tuerto', 640551, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c8670c6b-f767-43bb-ac40-fa25a5532208', N'Villa General Mitre', 963134, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0f5ba3e4-203a-4b17-9028-fa3a54499adb', N'3a. Seccion', 875963, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c57d4143-d0a9-45dc-b148-fa3f6a833b35', N'Virrey Del Pino', 815041, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cc008e11-8920-4834-ab6c-fa45c7d5489d', N'Amadores', 132886, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fbb2dc60-dbaf-46cd-a625-fa4879fb287f', N'Aconquija', 796093, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd99261b0-c0fb-4108-a466-fa5da43abf3a', N'Abra Grande', 751204, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3b1241db-7e63-4487-8ecf-fa5e3b97b959', N'Luis Palacios', 206577, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e7efde9a-8058-4a2b-8c75-fa6fefa23b04', N'San Martin', 772624, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'720b1cf4-f6f7-45f2-a27a-fa7d1de183d1', N'Villa Centenario', 491584, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f26c41bb-8b8d-41f9-a73c-fa9273cf6dc6', N'El Divisorio', 548220, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'67261a2b-2d19-457e-845e-faa09e685c91', N'Esperanza', 53432, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f7fe1b51-e3ec-4cd2-a76b-faa5dc2c84de', N'Goldney', 52391, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c35273ab-ed93-430a-b55c-fabb7612ddf1', N'Rosario Del Tala', 476951, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'489609cb-4fb9-4b06-9e16-fac1c79f6a1b', N'Barrio Los Bosquecitos', 347253, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fed24721-7fb1-4847-ba56-fad8b2dc1a1f', N'San Victor', 169481, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e9a96f00-e2a1-4b41-8a37-fade78165000', N'Juan Llerena', 656713, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ee81715b-ddb6-4c49-8686-fae948513457', N'Valle Grande', 215840, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a8db16f4-c142-4e14-8f89-fae9fee45916', N'Mendiolaza', 73414, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4464821a-7782-43b5-8a0d-fafee3b5a1e0', N'La Silleta', 555383, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4dde5038-15fe-4fe5-8631-fb02bff8c467', N'Barrancas', 493369, 15)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ab26afa-df7b-495f-9778-fb14019629d4', N'Embarcacion', 300404, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e5ee0a23-2f62-4695-96aa-fb18e73c1736', N'Oratorio', 37257, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e2b837dd-7af8-4ca8-8ad0-fb32e353d8cd', N'Rapelli', 387686, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'af22c971-e8e3-4001-ae5f-fb4627dd29d9', N'Gualjaina', 340684, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd3f22140-8ecf-4aa2-a076-fb52492358b5', N'Pontaut', 30546, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f7d9d49-c94e-4e7a-8a74-fb583ed7dcbc', N'Colonia Iturraspe', 358503, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'281a0369-9599-409a-a402-fb5dcc209a3a', N'Pomancillo Oeste', 988477, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'fe55b644-28d8-475e-b11b-fb6cc0353237', N'Albarellos', 617490, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1c41dfc2-a0da-44e0-a152-fb772d01fd29', N'Porton Negro', 372013, 9)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0eace4f6-a689-42c8-bf71-fb7c598d3583', N'Piquirenda', 167411, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f59b92b-39aa-4071-bfe3-fb7d4956e712', N'San Antonio', 295118, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3469ef7a-80f2-48db-b7c0-fb7ebda1c64b', N'Saira', 530137, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'f28c44cb-e5f2-4b64-b0bb-fb8412a5ffa9', N'El Ceibal', 46076, 10)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'c95e8eec-3e8c-45ca-814d-fb85a09f5cd8', N'Colonia Julia Y Echarren', 596077, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd18062cd-95e2-40d2-a226-fb869d11fe57', N'Coronel Martinez De Hoz', 285582, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2733a1af-3c05-4a12-a5f7-fb9d8e5f3ecb', N'Tornquist', 984750, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ff785284-270a-46e9-98ab-fba65387bfbd', N'Santa Teresita', 840736, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6c6038be-af41-4071-a10f-fbb39d5c2bd3', N'Flores', 141323, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'80983be8-a16b-4d3b-80f5-fbbfbada2245', N'La Mision', 172272, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2ae7c3b9-0a20-48c5-bddc-fbca009bdb31', N'Jacinto L. Arauz', 214061, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'890aff6a-cb6a-445d-8c2d-fbcec3c3e4a6', N'El Volcan', 188714, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1f364501-e847-4c55-84f3-fbcf029d53a5', N'Villa Trinidad', 613698, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5ca9e783-7dfb-4d49-86ae-fbd58c188026', N'Villa Lia', 587479, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4879a781-e369-4e4c-ae05-fbdcf2fb0a58', N'La Sabana', 808777, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9690ffbc-6918-4043-a0ee-fbe0c6d6d454', N'Villa Pastora', 704907, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ca61f377-704f-48db-bef3-fc343f2e4316', N'Pampa Blanca', 216635, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'78e44932-97a0-4e1e-b66f-fc3e2c056083', N'Simbolar', 509113, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'd0c72add-a871-47c9-bf9f-fc457b006f33', N'Nucleo I', 729275, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'0af07348-671d-401b-93f7-fc4cb77fd979', N'Angeloni', 96746, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b27966d5-1c77-40b6-82d3-fca94c3e9081', N'Villa San Agustin', 720310, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e578e6f9-ca48-4e54-b65e-fca9d64a1c1e', N'Itin', 259654, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8f3629db-f918-4b43-a2cf-fcb5c8d85c32', N'Pozo Nuevo', 98233, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'6d271390-9e5f-4656-ab8a-fcc6254142b0', N'Real Del Padre', 804985, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'7179caea-ec36-4964-a3ce-fcd86fe007cb', N'El Foyel', 651940, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'76c8cf1a-8180-445d-b420-fcfc2d07cd07', N'Concepcion De La Sierra', 197785, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'46c4241d-bdd1-4757-becf-fd0438dea4d2', N'El Hoyo', 570080, 4)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'73c35d2b-ec37-40c8-af6a-fd1f17be7bca', N'San Martin', 625754, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'deb15526-f3cb-4002-9e4f-fd29a5a68766', N'Puerta De San Jose', 640443, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5b183229-7656-47f6-871e-fd367a40a418', N'Alto Verde', 95383, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3f227d49-1800-4845-9e98-fd4a00088b13', N'Cululu', 306315, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'810dfe34-fbdf-4631-8a85-fd732b4a0975', N'Tilimuqui', 830378, 12)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'b7d85951-fba9-403a-914c-fd892631aa78', N'Mosmota', 408975, 19)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9095119b-ba85-47d3-a279-fd9d4a03b129', N'Paso Viejo', 97618, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'43d30a07-ecfc-48d3-88b8-fdbcffac6bf6', N'Monte Leña', 389451, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'23d63cee-0f34-4fc0-9ba0-fdced25a9d3b', N'Virginia', 180892, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e45c0e1c-a3c5-4593-90fd-fded4e9d9114', N'Villa General Savio', 413148, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3e3fdaf5-e560-46af-834e-fdf39d06b1ba', N'Villa Santa Eugenia', 773741, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9ee9c44d-2d2e-44ed-ad8d-fdfa2c60d738', N'La Candelaria', 432578, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5852abed-f328-4759-a000-fe0eb958e768', N'El Fiscal', 987693, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'de0411d5-2ede-47df-bfaa-fe1711e1aacd', N'San Carlos Norte', 761082, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e9826e1-da34-4d68-9df9-fe3cc45191ef', N'San Jose', 159557, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'8e64b36c-e3bc-4004-a592-fe456a8d58a2', N'Villa El Chacay', 941515, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'446d36b3-9743-45f0-8e69-fe4617bcbb7d', N'Jardin America', 491223, 14)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'9953012f-9f70-4ae5-a114-fe84b3c64633', N'Pampayasta Sur', 597147, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86af0908-e34c-4fe7-8ce0-fe85c9a31cae', N'Italo', 21798, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'513e4211-efdd-44bd-93e0-fe9b86a2472d', N'Almafuerte', 346804, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'eb83acf5-828d-4e70-afd3-fea22a423f76', N'Colonia Bossi', 781369, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4d6e1445-70db-4ef8-a5c0-feb8691a9e14', N'Lamarque', 501031, 16)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2809f0c6-ae0f-4891-905a-febb5f4cf3e9', N'Turdera', 119911, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'4b14c69d-6431-4d51-9402-fec5569f6c2e', N'Huaycama', 776323, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'ae2e35e5-27c3-4c67-b63d-fec85a0fe52b', N'Quebracho Herrado', 890593, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3ca87444-7a85-4aee-b284-fedc02f458f7', N'Balneario San Cayetano', 750723, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'cbd72b84-9ef5-4dec-a2bc-feee282dc763', N'Las Tapias', 31760, 18)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'951b4b9a-555d-4409-9f76-ff13994ee1d5', N'Puerto Eva Peron', 62318, 3)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'3d93b8f8-ae68-428f-99ae-ff316a576d08', N'Villa Santa Rita', 572676, 5)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'771871a0-b46d-427b-a1cf-ff3adfd7fcef', N'Dragones', 977057, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'86678da5-8c34-4308-bde0-ff3c1fe1d7a3', N'Las Esquinas', 235875, 2)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'1a1377f8-cd38-429e-bb01-ff3f9404b7fb', N'Las Mojarras', 224296, 6)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'72756c50-43e9-47a0-a20a-ff67b43a4e5d', N'La Cumbre', 829921, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5384342b-3b48-4b1a-8c9c-ff756bb02e4b', N'La Paz', 496562, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'a5b0c44b-3679-447f-90ab-ff7821b1f676', N'Juan a. De La Pe¥a', 560662, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5c1a22ac-086f-448f-bd52-ff785c04d813', N'Argentina', 552783, 22)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'91c3ea92-01d1-457b-b899-ff7a8920fd0b', N'Arroyo Ceibal', 783183, 21)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'65d6d420-4405-4c54-8780-ff9560ce28f3', N'Colonia Ensayo', 75271, 8)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'785705d9-195d-40b6-9715-ff97e4ed4a08', N'Concepcion', 700066, 7)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5d0612bf-63cc-44ad-8ea5-ffd290d19a32', N'La Capilla', 51104, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'5e3af075-978f-48cf-a9b1-ffd8fb90210e', N'Barrio San Cayetano', 325933, 13)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'398e4372-5b47-4856-8dbc-ffdc902909bb', N'San Antonio De Los Cobres', 69048, 17)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'2fdc422b-242f-44ab-91cd-ffe83e0408b0', N'Medanos', 380299, 1)
GO
INSERT [dbo].[Cities] ([ID], [Name], [PostalCode], [ProvinceID]) VALUES (N'e04be6c0-6755-4ddc-bd13-fff4cdc39c90', N'Fuentes', 180614, 21)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'bed4f2ac-cace-46e5-8efb-2b9473ed8f39', N'César', N'Farías', N'43660647', CAST(N'1977-08-02T17:51:15.6460102' AS DateTime2), 46, N'266970d9-e8dd-4af0-bccf-b3fa23b15e06', N'11-1451-8425', N'Municipio Repúplica de Chile 10 Puerta 307', N'e8efb3e3-0e8d-450f-8c5e-9ba0cc9de55c', 17)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'5927353f-cb99-48ea-aeeb-53a8f842ad52', N'Timoteo', N'Leyva', N'26424251', CAST(N'1982-01-21T09:35:41.5901690' AS DateTime2), 41, N'fb89c15b-ba75-4a63-8e32-573e421327e3', N'11-6518-5412', N'Camino Francisco I. Madero 508', N'17ade794-9c6a-4e85-9ce7-3ca111fb9582', 3)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'a7956a4a-169d-4053-9c7a-7674a928e6ab', N'Estefanía', N'Alvarez', N'25182329', CAST(N'1963-01-26T12:40:57.3668044' AS DateTime2), 60, N'c7743ef6-8195-4204-86b3-eb688390d40b', N'11-8318-3586', N'Urbanización Isabel la Católica s/n. Edificio 1', N'72246b2c-881e-45a6-90b3-46ebabba5c59', 2)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'be2693cb-cbfb-406e-88d1-a1730dc61e05', N'Mario', N'Escalante', N'19200387', CAST(N'2007-05-10T17:24:55.9524744' AS DateTime2), 16, N'ef0bdcfa-c694-4975-8c1b-13a34a707d8a', N'11-7176-1255', N'Rampa Cuahutemoc 851', N'ea7ea02a-ad8a-4b73-bb1f-c534be6faf50', 1)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'0ae5b242-f394-4a7f-98f8-abdc616c259d', N'Natalia', N'Madrid', N'22549198', CAST(N'1970-04-06T13:16:35.4599616' AS DateTime2), 53, N'cbc9bc39-bfa2-4206-ab0b-1b24c0125445', N'11-1266-1841', N'Calleja Calimaya 9667', N'ffbad65f-441e-4482-ad58-e76b99fc4969', 14)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'da5da8d4-7498-4a87-a190-be042528f097', N'Rosa', N'Zayas', N'12667219', CAST(N'1957-10-10T21:41:05.4289004' AS DateTime2), 66, N'658864c5-29d6-4016-9d88-5a0e7fed6d90', N'11-4088-9692', N'Colonia San Miguel 8 Puerta 197', N'6775ab20-9db9-4014-9ac5-0ed5dad3bcb3', 1)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'c127b937-3aca-4a6e-a875-e811a9200cbe', N'Isaac', N'Benavídez', N'33966724', CAST(N'1971-03-20T11:55:40.6624942' AS DateTime2), 52, N'ed36cb19-3130-4279-b6cc-9199d27241e8', N'11-8372-2896', N'Ronda Paola Rascón s/n.', N'1c96c489-dac9-47e7-84c7-190dd2568d76', 21)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'0b75ec22-4120-4985-ba24-eafd637776f7', N'Paola', N'Badillo', N'10909156', CAST(N'1985-05-16T23:43:31.0992368' AS DateTime2), 38, N'ed36cb19-3130-4279-b6cc-9199d27241e8', N'11-9165-9823', N'Explanada Reina 736', N'b30f731c-93f6-45b1-aabd-cb3c284e1529', 24)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'fc52f3df-4123-4a26-8749-f5fe94cd9716', N'Yaretzi', N'Madrigal', N'22595339', CAST(N'1928-07-08T08:59:15.1356202' AS DateTime2), 95, N'ed36cb19-3130-4279-b6cc-9199d27241e8', N'11-2569-0465', N'Bajada Eje Central, 34', N'0382f5f4-bf2f-48d3-871f-dd5e857f28e3', 6)
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [DNI], [Birthdate], [Age], [HealtcareProviderID], [PhoneNumber], [Address], [CityID], [ProvinceID]) VALUES (N'b698f2c1-b667-45d4-932d-fbe2a850e082', N'Laura', N'Sotelo', N'25053104', CAST(N'1993-12-13T00:27:18.4648700' AS DateTime2), 30, N'0035c3f9-1839-402b-9e71-cc6a1e1e0c72', N'11-9230-2219', N'Carretera Andrea, 8 Esc. 603', N'eceafe80-7645-4426-a10e-cc0fb588ad0c', 4)
GO
SET IDENTITY_INSERT [dbo].[DosageForms] ON 
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (1, N'Aerosol')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (2, N'Capsula con cubierta enterica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (3, N'Capsula de liberacion prolongada')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (4, N'Comprimido con cubierta simple')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (5, N'Comprimido con cubierta enterica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (6, N'Comprimido de liberacion prolongada')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (7, N'Crema')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (8, N'Emulsion')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (9, N'Extracto')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (10, N'Gel')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (11, N'Pellets')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (12, N'Inyectable')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (13, N'Ovulos')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (14, N'Pasta')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (15, N'Pastilla')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (16, N'Polvo')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (17, N'Pomada')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (18, N'Solucion oftalmica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (19, N'Suspension oftalmica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (20, N'Ungüento oftalmico')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (21, N'Sistema de liberacion transdermico')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (22, N'Sistema de liberacion ocular')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (23, N'Sistema de liberacion intrauterino')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (24, N'Solucion oral')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (25, N'Solucion oftálmica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (26, N'Solucion tópica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (27, N'Solucion ótica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (28, N'Tintura')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (29, N'Supositorio')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (30, N'Suspension oral')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (31, N'Suspension tópica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (32, N'Suspension ótica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (33, N'Suspension oftálmica')
GO
INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (34, N'Ungüento')
GO
SET IDENTITY_INSERT [dbo].[DosageForms] OFF
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'ef0bdcfa-c694-4975-8c1b-13a34a707d8a', N'Swiss Medical', 1)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'cbc9bc39-bfa2-4206-ab0b-1b24c0125445', N'Prevencion Salud', 1)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'159b45e2-2bbd-4508-a351-24a85ca212c1', N'Union Personal', 0)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'fb89c15b-ba75-4a63-8e32-573e421327e3', N'Galeno', 1)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'658864c5-29d6-4016-9d88-5a0e7fed6d90', N'OSDE', 1)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'ed36cb19-3130-4279-b6cc-9199d27241e8', N'OMINT', 1)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'266970d9-e8dd-4af0-bccf-b3fa23b15e06', N'Sancor Salud', 1)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'0035c3f9-1839-402b-9e71-cc6a1e1e0c72', N'Medicus', 1)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'b2a06ed2-d219-4cbf-abc9-cd7629bd2359', N'PAMI', 0)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'6f20d14b-0cea-4c0a-a4a5-d642eee6741f', N'OSPACA', 0)
GO
INSERT [dbo].[HealthcareProviders] ([ID], [Name], [IsActive]) VALUES (N'c7743ef6-8195-4204-86b3-eb688390d40b', N'Avalian', 1)
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'c973e03a-e0bb-4078-9456-114d63f4bfe1', N'Fecofar')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'eff071cc-1aa9-4d00-9313-25256aebee97', N'Sanofi-aventis')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'59a46f3f-9bd5-47b2-9e58-2ff6dda3a99b', N'Lazar')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'8e7cf64f-cba9-4036-b62e-391cc1902bf3', N'Omicron')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'caf3c49d-b446-4fa9-9ee1-3a80c2dfa105', N'Sidus')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'735329c6-a364-4a8f-af89-3bca362f27ca', N'Gador')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'f29264c9-66d9-4710-8ca3-5b3df3a933c9', N'Austral')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'decbd442-d7eb-40b5-8609-5cfd94f65eba', N'Bago')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'3eb5e26c-fb9c-4ddf-beea-63f3bd4b04d9', N'Fabra')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'01c392c7-6fd6-471f-90ad-657010687eab', N'Opella')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'583e210f-df69-4de6-bd4c-69d2a414726a', N'Raffo')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'Elea')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'24add440-b541-4332-8d7d-6f7a1cdf2860', N'Casasco')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'ebd022c7-33f1-4458-97db-7008122c4121', N'Mar')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'29bc5918-4678-4a78-adae-77085a93bd3b', N'Richet')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'eb7d7077-cc0e-4b71-92ab-78d3bda649ac', N'Klonal')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'19ae8005-792a-4b39-accb-83534d040c35', N'Gezzi')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'd1d1bd8c-ccc2-487c-9142-92be59e9b5fa', N'Lafedar')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'615b3682-78a8-4610-b422-9ae1c72e09b9', N'Ronnet')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'7911f3fd-bf4c-4ffc-b614-9ff7c2c01be1', N'Siegfried')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'b6e5f21e-98f4-4d54-ba3c-aaad5f50b67d', N'Baliarda')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'e55a0f02-07c8-44f1-8c40-ab94cc622121', N'Labsa')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'd2eed63b-4ec3-460f-866a-c0b45df1a681', N'Eczane')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'dc0749e9-3f8d-4922-b1ae-c36bb18db90c', N'Pfizer')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'bc1838c2-398f-4f02-9dba-c60f14892439', N'Cassara')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'bf3ca4e1-d8be-4b12-885e-c889adb91abe', N'Bayer')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'30973cf8-7a92-4cfc-96eb-c9e9ac4ce588', N'Bernabo')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'cf5d0111-b380-4174-b8d6-d419c03b8adf', N'Andromaco')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'af4d9481-e510-4b3b-af23-e1d49f57145c', N'Duncan')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'b2466ac3-0de2-46e4-883c-e9976c3a8765', N'Savant Generic')
GO
INSERT [dbo].[Laboratories] ([ID], [Name]) VALUES (N'8cd3b9cc-296d-41a7-ad24-eed6bf18b3c4', N'S.Chobet')
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'0581efd7-c40a-4549-a0fa-0590ef97b191', N'970114', N'Claritromicina Richet', N'29bc5918-4678-4a78-adae-77085a93bd3b', N'dedef976-7839-4ae6-b06d-264194949a9e', 5, CAST(5050.6500 AS Decimal(19, 4)), 16, 500, 3)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'eb758fcf-c70a-4e9e-82a6-074753d0afab', N'732275', N'Losartan Richet', N'29bc5918-4678-4a78-adae-77085a93bd3b', N'84a9d779-01ad-47e0-8c5f-a0490fce692b', 5, CAST(3711.0000 AS Decimal(19, 4)), 30, 100, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'c5e99ea6-4256-4376-8b92-0be06697423e', N'229501', N'Dolten', N'dc0749e9-3f8d-4922-b1ae-c36bb18db90c', N'c3f3bbd8-9f17-44b8-8340-be92ed23b4be', 4, CAST(2115.9100 AS Decimal(19, 4)), 10, 20, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'3c22207f-ad4b-4e53-9290-0d219925f28a', N'817959', N'Aesim 200', N'f29264c9-66d9-4710-8ca3-5b3df3a933c9', N'88f96bbc-cd27-40b2-a1e9-dd20ca2426bb', 5, CAST(1680.3600 AS Decimal(19, 4)), 20, 200, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'b99881a4-ace4-45f5-8201-0d6455c649e4', N'905709', N'Furosemida', N'c973e03a-e0bb-4078-9456-114d63f4bfe1', N'c7b8ab68-cbbd-4cd0-b108-1cf58c413eb5', 4, CAST(1806.5000 AS Decimal(19, 4)), 30, 40, 8)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'782ef58b-2558-49bc-8cd1-0e1fc697bcd9', N'820298', N'Acerpes', N'7911f3fd-bf4c-4ffc-b614-9ff7c2c01be1', N'4f5c932d-ed69-4321-be5e-d3222be8c7e7', 4, CAST(2896.6500 AS Decimal(19, 4)), 20, 400, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'dac30f4b-1f0f-4254-9a98-11563b549657', N'818235', N'Cefalexina Fabra', N'3eb5e26c-fb9c-4ddf-beea-63f3bd4b04d9', N'd53ba60d-f09d-4a1a-8d63-d2ae03c85525', 5, CAST(3796.8200 AS Decimal(19, 4)), 16, 1000, 12)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'50102676-3edd-47d5-bb60-11586d6ebb35', N'993465', N'Azibiotic 500', N'b6e5f21e-98f4-4d54-ba3c-aaad5f50b67d', N'05a23fb0-7442-4844-8cd8-7fc18d62dab2', 5, CAST(4340.4000 AS Decimal(19, 4)), 7, 500, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'c82b92f8-99e9-4eda-b93f-1508ac0c98f1', N'219623', N'Geniol', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'd6ad61eb-22e9-4f74-8f2f-66468a3114d8', 6, CAST(682.1200 AS Decimal(19, 4)), 16, 500, 20)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'5d4a613e-fc29-4bfa-9727-1695011a77b5', N'440542', N'Amodormin', N'8e7cf64f-cba9-4036-b62e-391cc1902bf3', N'e334746b-440c-49b1-99ba-ccf2d59d0e8f', 2, CAST(1145.7700 AS Decimal(19, 4)), 10, 50, 15)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'ca21dc2c-3c7c-4c00-b737-1e686528d2be', N'216319', N'Aspirina 100', N'bf3ca4e1-d8be-4b12-885e-c889adb91abe', N'd7060fec-ca61-48f8-b52a-14a866e6bc5f', 5, CAST(444.9300 AS Decimal(19, 4)), 20, 100, 10)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'677d1c1a-bb7a-4d41-aa0d-21b2c0c7888e', N'712694', N'Ecaprilat', N'59a46f3f-9bd5-47b2-9e58-2ff6dda3a99b', N'98f0a3ca-4532-4685-9c4a-37ab5813ee7d', 5, CAST(2848.5700 AS Decimal(19, 4)), 100, 10, 10)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'da45bf27-3952-4403-add7-24a421c934a6', N'897850', N'Decadron 0,5mg', N'caf3c49d-b446-4fa9-9ee1-3a80c2dfa105', N'a6788e07-5886-4db6-8ed6-cf2d68c42b6c', 4, CAST(3905.3700 AS Decimal(19, 4)), 30, 5, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'55b615d7-fefe-4d00-95ae-26a3cf04d9da', N'578808', N'Benadryl', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'e334746b-440c-49b1-99ba-ccf2d59d0e8f', 2, CAST(4018.6000 AS Decimal(19, 4)), 30, 50, 10)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'b6c1acdd-1bff-49d2-9294-27c9016f4cc3', N'712824', N'Azitrona Klonal', N'eb7d7077-cc0e-4b71-92ab-78d3bda649ac', N'05a23fb0-7442-4844-8cd8-7fc18d62dab2', 5, CAST(1382.3800 AS Decimal(19, 4)), 3, 500, 14)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'4f7290bd-f59e-4575-b78c-2e9d9dccd54f', N'857632', N'Benadryl 24', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'def635ff-51cf-4a88-861d-c75d617e3bb2', 5, CAST(844.0400 AS Decimal(19, 4)), 10, 10, 15)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'9803f6b6-bfa8-453f-8e93-308d67f7b501', N'773633', N'Losartan Labsa', N'e55a0f02-07c8-44f1-8c40-ab94cc622121', N'84a9d779-01ad-47e0-8c5f-a0490fce692b', 5, CAST(2191.5800 AS Decimal(19, 4)), 30, 100, 1)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'59bc4415-2b95-446b-a351-351b5d3022cc', N'804188', N'Clindan B', N'bc1838c2-398f-4f02-9dba-c60f14892439', N'e93cf382-0ba3-44bd-a833-fabdd8cd3bf2', 10, CAST(2966.5700 AS Decimal(19, 4)), 1, 30000, 8)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'159ffb63-7f5e-4813-8afb-36569815abbd', N'245322', N'Buscapina Duo', N'01c392c7-6fd6-471f-90ad-657010687eab', N'7f281f39-4c39-472a-9b79-d04953b9cc8b', 4, CAST(7066.1700 AS Decimal(19, 4)), 60, 10, 20)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'4af963b7-71f6-48d8-9169-3a84df2db436', N'910581', N'Azibiotic 500', N'b6e5f21e-98f4-4d54-ba3c-aaad5f50b67d', N'05a23fb0-7442-4844-8cd8-7fc18d62dab2', 5, CAST(2716.2700 AS Decimal(19, 4)), 3, 500, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'572690b1-59c8-40f1-a7f6-3a96837c8175', N'932219', N'Clindamicina Duncan', N'af4d9481-e510-4b3b-af23-e1d49f57145c', N'e93cf382-0ba3-44bd-a833-fabdd8cd3bf2', 2, CAST(2245.6800 AS Decimal(19, 4)), 16, 300, 4)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'e9d387aa-dc85-40d6-91c2-3ed520a96da7', N'595093', N'Cetron', N'583e210f-df69-4de6-bd4c-69d2a414726a', N'384e5070-aae8-4b3a-a27c-34746076d0dd', 2, CAST(10726.9100 AS Decimal(19, 4)), 10, 8, 3)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'e6b6bfa9-8cb4-4d22-bcf5-3eda301cec99', N'751032', N'Fabotensil', N'b2466ac3-0de2-46e4-883c-e9976c3a8765', N'98f0a3ca-4532-4685-9c4a-37ab5813ee7d', 5, CAST(696.6300 AS Decimal(19, 4)), 60, 10, 13)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'6f8d73e0-cc8c-46cc-a77b-4c7147ab1aff', N'445368', N'Duprac', N'b2466ac3-0de2-46e4-883c-e9976c3a8765', N'c3f3bbd8-9f17-44b8-8340-be92ed23b4be', 4, CAST(2140.0000 AS Decimal(19, 4)), 90, 10, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'cc741489-79c8-4066-9753-4d22896a5e49', N'980726', N'Hidrocortisona Klonal', N'eb7d7077-cc0e-4b71-92ab-78d3bda649ac', N'ae6bd89f-c919-46de-a5f9-9ba0692b67a2', 7, CAST(1167.9200 AS Decimal(19, 4)), 1, 15000, 13)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'8f775f60-20ff-46f5-aa3a-4e82d58a2531', N'741813', N'Bromhetos', N'd1d1bd8c-ccc2-487c-9142-92be59e9b5fa', N'85333ee5-0f1c-4dba-bb78-a6ff5c275c3d', 24, CAST(1570.6200 AS Decimal(19, 4)), 1, 120, 10)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'f0874751-b814-4f5b-a47e-5167d49b371c', N'814211', N'Errolon', N'7911f3fd-bf4c-4ffc-b614-9ff7c2c01be1', N'c7b8ab68-cbbd-4cd0-b108-1cf58c413eb5', 4, CAST(5016.0800 AS Decimal(19, 4)), 50, 40, 9)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'9a894c13-8402-40ff-a726-53c000c9a174', N'529947', N'Aerotina', N'583e210f-df69-4de6-bd4c-69d2a414726a', N'def635ff-51cf-4a88-861d-c75d617e3bb2', 5, CAST(2333.3700 AS Decimal(19, 4)), 30, 10, 10)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'd980928e-afe2-42ac-9cd6-55c0f71c8263', N'721116', N'Amixen 500', N'30973cf8-7a92-4cfc-96eb-c9e9ac4ce588', N'57a439c7-aa38-411d-84e1-0c10ac98cffe', 5, CAST(1085.6400 AS Decimal(19, 4)), 16, 500, 13)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'944e5e70-c9a4-4c50-af4b-58482801e125', N'850119', N'Aeroxina', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'dedef976-7839-4ae6-b06d-264194949a9e', 5, CAST(5622.0800 AS Decimal(19, 4)), 16, 500, 4)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'aea205b0-7e22-4f8f-803e-597368ccbe10', N'879629', N'Pulmosan', N'19ae8005-792a-4b39-accb-83534d040c35', N'85333ee5-0f1c-4dba-bb78-a6ff5c275c3d', 24, CAST(2199.9000 AS Decimal(19, 4)), 1, 120, 2)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'a023f639-0f57-4ef0-a7c7-5985f3db4b23', N'788356', N'Acerpes 5%', N'7911f3fd-bf4c-4ffc-b614-9ff7c2c01be1', N'4f5c932d-ed69-4321-be5e-d3222be8c7e7', 7, CAST(1280.8900 AS Decimal(19, 4)), 1, 5000, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'54d86c34-261c-46bc-9d99-5d690dc23905', N'927733', N'Ronelax', N'615b3682-78a8-4610-b422-9ae1c72e09b9', N'074038f0-e5c2-4685-a734-35f8ce9f14e1', 30, CAST(2105.8400 AS Decimal(19, 4)), 1, 120, 2)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'173658d4-26cc-41e7-ab67-5e5f40da3d4f', N'876923', N'Colpofilin', N'59a46f3f-9bd5-47b2-9e58-2ff6dda3a99b', N'a8131d08-52b8-496e-acb7-a264dad5e7b6', 5, CAST(2090.4100 AS Decimal(19, 4)), 20, 500, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'171ca326-10b0-430c-b24c-638d3d4e30b6', N'535140', N'Acloxigenac', N'd2eed63b-4ec3-460f-866a-c0b45df1a681', N'7d32580b-c9b1-421c-9db1-0a29b3225bf0', 5, CAST(385.3400 AS Decimal(19, 4)), 10, 50, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'c6dee3d4-bbfb-4223-9873-6ba7ba4b7dac', N'997679', N'Lactulon', N'59a46f3f-9bd5-47b2-9e58-2ff6dda3a99b', N'074038f0-e5c2-4685-a734-35f8ce9f14e1', 30, CAST(1777.2700 AS Decimal(19, 4)), 16, 10000, 3)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'77588370-4f34-44c9-8231-6cb49ee9ad56', N'882419', N'Ondansetron Fabra', N'3eb5e26c-fb9c-4ddf-beea-63f3bd4b04d9', N'384e5070-aae8-4b3a-a27c-34746076d0dd', 4, CAST(1489357.0000 AS Decimal(19, 4)), 10, 8, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'9a8978b5-9104-4320-9530-7761a18606ca', N'988048', N'Klosartan', N'eb7d7077-cc0e-4b71-92ab-78d3bda649ac', N'84a9d779-01ad-47e0-8c5f-a0490fce692b', 5, CAST(3957.2800 AS Decimal(19, 4)), 30, 100, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'61817f8d-87a0-40a4-b2e7-77aa011bdfb4', N'866072', N'Clindan 300', N'bc1838c2-398f-4f02-9dba-c60f14892439', N'e93cf382-0ba3-44bd-a833-fabdd8cd3bf2', 2, CAST(2416.5700 AS Decimal(19, 4)), 16, 300, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'972c7c1b-8f39-49bb-90fd-78f15321ab4b', N'769776', N'Kolkin', N'af4d9481-e510-4b3b-af23-e1d49f57145c', N'c7b8ab68-cbbd-4cd0-b108-1cf58c413eb5', 4, CAST(1778.8700 AS Decimal(19, 4)), 50, 40, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'3edf1f4c-1347-4f1d-b067-7d234e82b096', N'940300', N'Amixen 750', N'ebd022c7-33f1-4458-97db-7008122c4121', N'57a439c7-aa38-411d-84e1-0c10ac98cffe', 4, CAST(1349.7300 AS Decimal(19, 4)), 14, 875, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'2369db42-3450-474f-9ad1-80f9e6c50f7f', N'712426', N'Crema de Bismuto Chobet con Pectina', N'8cd3b9cc-296d-41a7-ad24-eed6bf18b3c4', N'4353baa7-98a7-4684-8a51-9c75c0697097', 30, CAST(4539.9400 AS Decimal(19, 4)), 1, 240, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'530985cc-c904-42a8-8fd6-84f3b9a04636', N'877234', N'Geniol 1000', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'd6ad61eb-22e9-4f74-8f2f-66468a3114d8', 3, CAST(230642.0000 AS Decimal(19, 4)), 50, 1000, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'862c1f0a-69f0-4a14-8513-87291c2bb05e', N'897679', N'Duo-decadron', N'caf3c49d-b446-4fa9-9ee1-3a80c2dfa105', N'a6788e07-5886-4db6-8ed6-cf2d68c42b6c', 12, CAST(5632.0900 AS Decimal(19, 4)), 1, 2, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'c0409597-3c1c-405f-a26f-91fd3423a693', N'847929', N'Kloviracil 5%', N'eb7d7077-cc0e-4b71-92ab-78d3bda649ac', N'4f5c932d-ed69-4321-be5e-d3222be8c7e7', 7, CAST(1041.9600 AS Decimal(19, 4)), 1, 10000, 11)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'd52eba90-fcd9-419f-953f-971de81ad894', N'300024', N'Minicam', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'9ab61a6c-435e-437f-979f-82d795e5329a', 4, CAST(956.5200 AS Decimal(19, 4)), 10, 2, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'e9feca7a-dcf6-4019-af5b-988aed4f8f82', N'964285', N'Cefalexina Argentia', N'7911f3fd-bf4c-4ffc-b614-9ff7c2c01be1', N'd53ba60d-f09d-4a1a-8d63-d2ae03c85525', 5, CAST(2590.3300 AS Decimal(19, 4)), 24, 500, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'b44979e7-d1b6-47a7-b035-98f5e66e1b69', N'598627', N'Actron 600 Rapida Accion', N'bf3ca4e1-d8be-4b12-885e-c889adb91abe', N'3821d167-5401-4cf5-8311-520ff1330372', 3, CAST(1220.3700 AS Decimal(19, 4)), 10, 600, 12)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'e728c461-2dfd-439d-b8cf-9fb4145d2349', N'981285', N'Simvastatina Fabra', N'3eb5e26c-fb9c-4ddf-beea-63f3bd4b04d9', N'c411626d-e8d5-4fd9-9585-b437cca48246', 5, CAST(3996.3800 AS Decimal(19, 4)), 30, 10, 4)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'529b2e28-8e20-48b1-af24-a38f2f0f9c55', N'784931', N'Butefina', N'b2466ac3-0de2-46e4-883c-e9976c3a8765', N'd53ba60d-f09d-4a1a-8d63-d2ae03c85525', 5, CAST(1129.0000 AS Decimal(19, 4)), 16, 500, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'd2fb2848-6726-4e4d-a58c-a88b6945962a', N'331577', N'Bronquisedan Max', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'85333ee5-0f1c-4dba-bb78-a6ff5c275c3d', 24, CAST(2314.2600 AS Decimal(19, 4)), 1, 120, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'b9c8a8b8-9b0c-49d4-8e55-a8b7199dbcdf', N'312234', N'Buscapina Perlas', N'01c392c7-6fd6-471f-90ad-657010687eab', N'7f281f39-4c39-472a-9b79-d04953b9cc8b', 3, CAST(4043.6100 AS Decimal(19, 4)), 50, 10, 15)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'160ac7d8-8252-4333-9527-a9080f910bf4', N'930526', N'Nuevapina', N'b2466ac3-0de2-46e4-883c-e9976c3a8765', N'd7060fec-ca61-48f8-b52a-14a866e6bc5f', 4, CAST(129.0000 AS Decimal(19, 4)), 28, 100, 8)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'e4ca77c9-537c-4983-8918-ae20c69fb254', N'777794', N'Claricina', N'd1d1bd8c-ccc2-487c-9142-92be59e9b5fa', N'dedef976-7839-4ae6-b06d-264194949a9e', 5, CAST(4660.1600 AS Decimal(19, 4)), 16, 500, 2)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'7b988b20-d425-4d58-be19-b1afb93eb10c', N'819875', N'Dexalaf', N'd1d1bd8c-ccc2-487c-9142-92be59e9b5fa', N'a6788e07-5886-4db6-8ed6-cf2d68c42b6c', 4, CAST(1893.1500 AS Decimal(19, 4)), 20, 5, 9)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'f561cc01-f723-43f7-b16d-bf09ce23efd5', N'741485', N'Azitrona Klonal', N'eb7d7077-cc0e-4b71-92ab-78d3bda649ac', N'05a23fb0-7442-4844-8cd8-7fc18d62dab2', 5, CAST(2022.7600 AS Decimal(19, 4)), 6, 500, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'7ddc81a4-a4d2-4229-beee-bf142b33b9a1', N'998103', N'Afebril Forte', N'decbd442-d7eb-40b5-8609-5cfd94f65eba', N'3821d167-5401-4cf5-8311-520ff1330372', 30, CAST(1019.0000 AS Decimal(19, 4)), 100, 40, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'e83af47c-dc60-4382-aafc-bfc5dfdcf57d', N'832448', N'Alfacort 1%', N'bc1838c2-398f-4f02-9dba-c60f14892439', N'ae6bd89f-c919-46de-a5f9-9ba0692b67a2', 7, CAST(1931.4200 AS Decimal(19, 4)), 1, 30000, 13)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'5468731a-dd58-401f-8747-bfd9a1f2433f', N'845707', N'Flagyl', N'eff071cc-1aa9-4d00-9313-25256aebee97', N'a8131d08-52b8-496e-acb7-a264dad5e7b6', 13, CAST(2792.3400 AS Decimal(19, 4)), 10, 500, 4)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'7fe494bf-df04-4980-9bb8-c02cee950eb5', N'789187', N'Lanx', N'c0346a3d-bcb4-4615-b827-6ddd3dae25d1', N'4b6fe688-5c21-406e-9e66-bb155fff84a0', 4, CAST(5179.9900 AS Decimal(19, 4)), 30, 100, 11)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'806dd2fd-7533-466c-9897-c7f28b408f71', N'990297', N'Enalapril Richet', N'29bc5918-4678-4a78-adae-77085a93bd3b', N'98f0a3ca-4532-4685-9c4a-37ab5813ee7d', 5, CAST(1978.4600 AS Decimal(19, 4)), 50, 10, 14)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'e46fc852-55f8-479c-82b8-cf9d6f14752c', N'895114', N'Crema de Bismuto Chobet con Pectina', N'8cd3b9cc-296d-41a7-ad24-eed6bf18b3c4', N'4353baa7-98a7-4684-8a51-9c75c0697097', 30, CAST(2287.2800 AS Decimal(19, 4)), 1, 120, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'5fe1fb70-56ac-452c-80ab-d1e2d6f1f6c9', N'817959', N'Reliveran', N'735329c6-a364-4a8f-af89-3bca362f27ca', N'5517b64f-c060-4507-be82-48ab78b7eab4', 4, CAST(1379.5100 AS Decimal(19, 4)), 20, 10, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'2be95824-23f8-4cf6-8d2f-d27ebceb90ec', N'369813', N'Blokium', N'24add440-b541-4332-8d7d-6f7a1cdf2860', N'7d32580b-c9b1-421c-9db1-0a29b3225bf0', 4, CAST(2980.2500 AS Decimal(19, 4)), 15, 100, 3)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'35348306-a8fd-4d48-b5ad-d7449d600af0', N'997679', N'Lovopren', N'd2eed63b-4ec3-460f-866a-c0b45df1a681', N'9ab61a6c-435e-437f-979f-82d795e5329a', 5, CAST(637.7700 AS Decimal(19, 4)), 10, 2, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'a0852d3e-b9fb-4c07-b52c-dd84e77f86c6', N'842629', N'Amixen 750', N'30973cf8-7a92-4cfc-96eb-c9e9ac4ce588', N'57a439c7-aa38-411d-84e1-0c10ac98cffe', 5, CAST(2042.4800 AS Decimal(19, 4)), 16, 750, 2)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'7ac97d49-c3d8-464a-98c3-e378c021f86f', N'917846', N'Aldactone A', N'dc0749e9-3f8d-4922-b1ae-c36bb18db90c', N'4b6fe688-5c21-406e-9e66-bb155fff84a0', 4, CAST(7623.6600 AS Decimal(19, 4)), 60, 100, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'1c199b62-7446-4e64-9010-e3e6be79a573', N'911828', N'Azibiotic 500', N'b6e5f21e-98f4-4d54-ba3c-aaad5f50b67d', N'05a23fb0-7442-4844-8cd8-7fc18d62dab2', 5, CAST(3033.8600 AS Decimal(19, 4)), 5, 500, 4)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'97adb605-685d-429b-98ba-e5e274a7b7f4', N'878780', N'Bigetric', N'24add440-b541-4332-8d7d-6f7a1cdf2860', N'638baecb-e3fe-4a54-b3b4-a4b97601fe31', 5, CAST(1820.6100 AS Decimal(19, 4)), 20, 10, 4)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'3e641ab9-803c-426c-b26f-e66456db6dfe', N'955399', N'Espimax', N'eb7d7077-cc0e-4b71-92ab-78d3bda649ac', N'4b6fe688-5c21-406e-9e66-bb155fff84a0', 4, CAST(2909.6400 AS Decimal(19, 4)), 30, 100, 7)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'11608757-206f-4852-91ef-ebcaced6ff1c', N'699148', N'Factor Ag 200', N'24add440-b541-4332-8d7d-6f7a1cdf2860', N'88f96bbc-cd27-40b2-a1e9-dd20ca2426bb', 5, CAST(1801.1900 AS Decimal(19, 4)), 20, 200, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'91cabd7d-fe93-49ba-9189-ef45526bfa67', N'751281', N'Simvastatina Fabra', N'3eb5e26c-fb9c-4ddf-beea-63f3bd4b04d9', N'c411626d-e8d5-4fd9-9585-b437cca48246', 5, CAST(5254.2800 AS Decimal(19, 4)), 30, 20, 8)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'81f22076-98f6-47e7-b9d2-f837a9ade54e', N'958035', N'Dermacort', N'cf5d0111-b380-4174-b8d6-d419c03b8adf', N'ae6bd89f-c919-46de-a5f9-9ba0692b67a2', 7, CAST(2184.0000 AS Decimal(19, 4)), 1, 15000, 9)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'53007526-5fa2-4b59-b8d6-fa8e8897bc5f', N'804791', N'Colpofilin Max', N'59a46f3f-9bd5-47b2-9e58-2ff6dda3a99b', N'a8131d08-52b8-496e-acb7-a264dad5e7b6', 13, CAST(1875.6400 AS Decimal(19, 4)), 7, 750, 6)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'8d2ef4e0-e306-4525-8e5c-fa9fa7a6132b', N'249602', N'Estocalm', N'd2eed63b-4ec3-460f-866a-c0b45df1a681', N'638baecb-e3fe-4a54-b3b4-a4b97601fe31', 5, CAST(2901.6300 AS Decimal(19, 4)), 50, 10, 5)
GO
INSERT [dbo].[Products] ([ID], [UPC], [TradeName], [LaboratoryID], [ActiveCompoundID], [DosageFormID], [Price], [Container], [Dosage], [CurrentStock]) VALUES (N'29ab7851-f5d8-4b81-a454-fdd4d71e2bd5', N'906061', N'Primperil', N'd1d1bd8c-ccc2-487c-9142-92be59e9b5fa', N'5517b64f-c060-4507-be82-48ab78b7eab4', 4, CAST(336.5600 AS Decimal(19, 4)), 20, 10, 5)
GO
INSERT [dbo].[Providers] ([ID], [Name], [PointOfContact], [Address], [CUIT], [CityID], [ProvinceID], [CreateDate]) VALUES (N'c55bcf65-9683-4976-a3ce-9492ff21f4f8', N'Paredes e Hijos', N'Emmanuel Kamat', N'Paseo María Luisa Pantoja 335 Puerta 355', N'48-30458461-2', N'ebee40c2-cb6e-4c0e-a2dd-6cb0965a2bcc', 6, CAST(N'2017-12-10T20:20:18.4621542' AS DateTime2))
GO
INSERT [dbo].[Providers] ([ID], [Name], [PointOfContact], [Address], [CUIT], [CityID], [ProvinceID], [CreateDate]) VALUES (N'b045cd5e-47f1-44e7-9dc3-ba98271e0b33', N'Viera S.A.', N'Elizabeth Alicea', N'Rambla José Miguel Reynoso, 59', N'64-13091312-9', N'3fb68430-3b92-4d66-9d93-03e011fced56', 10, CAST(N'2020-04-19T05:46:53.9982371' AS DateTime2))
GO
INSERT [dbo].[Providers] ([ID], [Name], [PointOfContact], [Address], [CUIT], [CityID], [ProvinceID], [CreateDate]) VALUES (N'f85fcc90-a09b-4ff7-9e2e-c1215465adae', N'Adorno S.L.', N'Carolina Alvarez', N'Sección Eduardo Santillán 93', N'51-89491013-5', N'ba7fa368-84b2-4715-a297-26440a5ed0ea', 19, CAST(N'2021-06-02T12:00:43.6405449' AS DateTime2))
GO
INSERT [dbo].[Providers] ([ID], [Name], [PointOfContact], [Address], [CUIT], [CityID], [ProvinceID], [CreateDate]) VALUES (N'167d1491-fff2-4390-ade5-c165fa76e5c3', N'Cruz S.L.', N'Elisa Solano', N'Jardines Naranjo 5 Esc. 028', N'01-94361907-3', N'35ed321c-a045-491b-97af-273d3f92fcec', 21, CAST(N'2022-07-18T10:18:41.6786327' AS DateTime2))
GO
INSERT [dbo].[Providers] ([ID], [Name], [PointOfContact], [Address], [CUIT], [CityID], [ProvinceID], [CreateDate]) VALUES (N'ee40cf1e-238a-49ef-910b-cab6372bd794', N'Regalado S.A.', N'José Emilio Amador', N'Lugar Zacatlán 4', N'09-01059172-4', N'659923b9-5037-4259-9d22-ca1a68f11b2e', 1, CAST(N'2021-03-07T07:57:57.3985618' AS DateTime2))
GO
INSERT [dbo].[Providers] ([ID], [Name], [PointOfContact], [Address], [CUIT], [CityID], [ProvinceID], [CreateDate]) VALUES (N'37f7259e-c80d-486f-b37c-de0f854452aa', N'Hernandes Hermanos', N'Marisol Carvajal', N'Parque Polotitlan 657 Puerta 563', N'88-21628789-4', N'3e417563-1637-4caa-9ae5-153727583bb9', 6, CAST(N'2018-08-21T23:29:27.0842945' AS DateTime2))
GO
INSERT [dbo].[Providers] ([ID], [Name], [PointOfContact], [Address], [CUIT], [CityID], [ProvinceID], [CreateDate]) VALUES (N'6eb673d0-840c-4049-9110-fa10e3983c97', N'Vega S.A.', N'Marco Antonio Domínquez', N'Bloque Repúplica de Chile 6 Puerta 835', N'89-59453370-0', N'0c575747-e26a-46e2-891a-c55c97fd5541', 6, CAST(N'2014-04-07T18:33:12.3865804' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Provinces] ON 
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (2, N'Catamarca')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (3, N'Chaco')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (4, N'Chubut')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (5, N'Ciudad Autónoma de Buenos Aires')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (6, N'Córdoba')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (7, N'Corrientes')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (8, N'Entre Ríos')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (9, N'Formosa')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (10, N'Jujuy')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (11, N'La Pampa')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (12, N'La Rioja')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (13, N'Mendoza')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (14, N'Misiones')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (15, N'Neuquén')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (16, N'Río Negro')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (17, N'Salta')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (18, N'San Juan')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (19, N'San Luis')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (20, N'Santa Cruz')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (21, N'Santa Fe')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (22, N'Santiago del Estero')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (23, N'Tierra del Fuego')
GO
INSERT [dbo].[Provinces] ([ID], [Name]) VALUES (24, N'Tucumán')
GO
SET IDENTITY_INSERT [dbo].[Provinces] OFF
GO
SET IDENTITY_INSERT [dbo].[TherapeuticEffects] ON 
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (1, N'Antipiretico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (2, N'Analgesico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (3, N'Antiinflamatorio')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (4, N'Antiemetico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (5, N'Antivertiginoso')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (6, N'Antiflatulento')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (7, N'Antidiarreico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (8, N'Antiespasmodico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (9, N'Digestivo')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (10, N'Laxante')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (11, N'Antihistaminico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (12, N'Expectorante')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (13, N'Corticoide')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (14, N'Hipotensor')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (15, N'Hipolipemiante')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (16, N'Antiinfeccioso Local')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (17, N'Diuretico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (18, N'Antibiotico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (19, N'Antimicotico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (20, N'Antiviral')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (21, N'Antianemico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (22, N'Antiseptico')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (23, N'Desinfectante')
GO
INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (24, N'Anestesico')
GO
SET IDENTITY_INSERT [dbo].[TherapeuticEffects] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionStatuses] ON 
GO
INSERT [dbo].[TransactionStatuses] ([ID], [Name]) VALUES (1, N'En Proceso')
GO
INSERT [dbo].[TransactionStatuses] ([ID], [Name]) VALUES (2, N'Aceptada')
GO
INSERT [dbo].[TransactionStatuses] ([ID], [Name]) VALUES (3, N'En Transito')
GO
INSERT [dbo].[TransactionStatuses] ([ID], [Name]) VALUES (4, N'Recibida')
GO
INSERT [dbo].[TransactionStatuses] ([ID], [Name]) VALUES (5, N'Cancelada')
GO
SET IDENTITY_INSERT [dbo].[TransactionStatuses] OFF
GO
ALTER TABLE [dbo].[ActiveCompounds] ADD  CONSTRAINT [DF_ActiveCompounds_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Cities] ADD  CONSTRAINT [DF_Cities_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[HealthcareProviders] ADD  CONSTRAINT [DF_HealthcareProviders_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Laboratories] ADD  CONSTRAINT [DF_Laboratories_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Providers] ADD  CONSTRAINT [DF_Providers_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[ActiveCompounds]  WITH CHECK ADD  CONSTRAINT [FK_ActiveCompounds_TherapeuticEffects] FOREIGN KEY([TherapeuticEffectID])
REFERENCES [dbo].[TherapeuticEffects] ([ID])
GO
ALTER TABLE [dbo].[ActiveCompounds] CHECK CONSTRAINT [FK_ActiveCompounds_TherapeuticEffects]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Provinces] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Provinces] ([ID])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Provinces]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Cities]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_HealthcareProviders] FOREIGN KEY([HealtcareProviderID])
REFERENCES [dbo].[HealthcareProviders] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_HealthcareProviders]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Provinces] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Provinces] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Provinces]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Orders]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Providers] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Providers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransactionStatuses] FOREIGN KEY([TransactionStatusID])
REFERENCES [dbo].[TransactionStatuses] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransactionStatuses]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ActiveCompounds] FOREIGN KEY([ActiveCompoundID])
REFERENCES [dbo].[ActiveCompounds] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ActiveCompounds]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_DosageForms] FOREIGN KEY([DosageFormID])
REFERENCES [dbo].[DosageForms] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_DosageForms]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Laboratories] FOREIGN KEY([LaboratoryID])
REFERENCES [dbo].[Laboratories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Laboratories]
GO
ALTER TABLE [dbo].[Providers]  WITH CHECK ADD  CONSTRAINT [FK_Providers_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([ID])
GO
ALTER TABLE [dbo].[Providers] CHECK CONSTRAINT [FK_Providers_Cities]
GO
ALTER TABLE [dbo].[Providers]  WITH CHECK ADD  CONSTRAINT [FK_Providers_Provinces] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Provinces] ([ID])
GO
ALTER TABLE [dbo].[Providers] CHECK CONSTRAINT [FK_Providers_Provinces]
GO
ALTER TABLE [dbo].[SaleProducts]  WITH CHECK ADD  CONSTRAINT [FK_SaleProducts_Products1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[SaleProducts] CHECK CONSTRAINT [FK_SaleProducts_Products1]
GO
ALTER TABLE [dbo].[SaleProducts]  WITH CHECK ADD  CONSTRAINT [FK_SaleProducts_Sales1] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sales] ([ID])
GO
ALTER TABLE [dbo].[SaleProducts] CHECK CONSTRAINT [FK_SaleProducts_Sales1]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Customers]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_TransactionStatuses] FOREIGN KEY([TransactionStatusID])
REFERENCES [dbo].[TransactionStatuses] ([ID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_TransactionStatuses]
GO
USE [master]
GO
ALTER DATABASE [SejmetDB] SET  READ_WRITE 
GO
