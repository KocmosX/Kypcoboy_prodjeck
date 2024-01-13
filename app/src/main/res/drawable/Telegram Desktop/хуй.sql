USE [Airline]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Offices]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [FK_Session_Users]
GO
ALTER TABLE [dbo].[Schedules] DROP CONSTRAINT [FK_Schedule_Routes]
GO
ALTER TABLE [dbo].[Schedules] DROP CONSTRAINT [FK_Schedule_AirCraft]
GO
ALTER TABLE [dbo].[Routes] DROP CONSTRAINT [FK_Routes_Airports3]
GO
ALTER TABLE [dbo].[Routes] DROP CONSTRAINT [FK_Routes_Airports2]
GO
ALTER TABLE [dbo].[Offices] DROP CONSTRAINT [FK_Office_Country]
GO
ALTER TABLE [dbo].[Airports] DROP CONSTRAINT [FK_AirPort_Country]
GO
/****** Object:  Index [IX_Users]    Script Date: 13.01.2024 11:24:33 ******/
DROP INDEX [IX_Users] ON [dbo].[Users]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedules]') AND type in (N'U'))
DROP TABLE [dbo].[Schedules]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Routes]') AND type in (N'U'))
DROP TABLE [dbo].[Routes]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Offices]') AND type in (N'U'))
DROP TABLE [dbo].[Offices]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Countries]') AND type in (N'U'))
DROP TABLE [dbo].[Countries]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Airports]') AND type in (N'U'))
DROP TABLE [dbo].[Airports]
GO
/****** Object:  Table [dbo].[Aircrafts]    Script Date: 13.01.2024 11:24:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aircrafts]') AND type in (N'U'))
DROP TABLE [dbo].[Aircrafts]
GO
USE [master]
GO
/****** Object:  Database [Airline]    Script Date: 13.01.2024 11:24:33 ******/
DROP DATABASE [Airline]
GO
/****** Object:  Database [Airline]    Script Date: 13.01.2024 11:24:33 ******/
CREATE DATABASE [Airline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Airline', FILENAME = N'E:\MS SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\Airline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Airline_log', FILENAME = N'E:\MS SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\Airline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Airline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Airline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Airline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Airline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Airline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Airline] SET ARITHABORT OFF 
GO
ALTER DATABASE [Airline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Airline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Airline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Airline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Airline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Airline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Airline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Airline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Airline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Airline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Airline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Airline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Airline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Airline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Airline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Airline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Airline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Airline] SET RECOVERY FULL 
GO
ALTER DATABASE [Airline] SET  MULTI_USER 
GO
ALTER DATABASE [Airline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Airline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Airline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Airline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Airline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Airline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Airline', N'ON'
GO
ALTER DATABASE [Airline] SET QUERY_STORE = ON
GO
ALTER DATABASE [Airline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Airline]
GO
/****** Object:  Table [dbo].[Aircrafts]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircrafts](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MakeModel] [nvarchar](10) NULL,
	[TotalSeats] [int] NOT NULL,
	[EconomySeats] [int] NOT NULL,
	[BusinessSeats] [int] NOT NULL,
 CONSTRAINT [PK_AirPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[IATACode] [varchar](3) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_AirPort] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Contact] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartureAirportID] [int] NOT NULL,
	[ArrivalAirportID] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[FlightTime] [int] NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](5) NOT NULL,
	[AircraftID] [int] NOT NULL,
	[RouteID] [int] NOT NULL,
	[EconomyPrice] [money] NOT NULL,
	[Confirmed] [bit] NOT NULL,
	[FlightNumber] [nvarchar](10) NULL,
 CONSTRAINT [PK_Serivec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NULL,
	[Error] [varchar](500) NULL,
	[SystemCrash] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.01.2024 11:24:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[OfficeID] [int] NULL,
	[Email] [varchar](150) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Birthdate] [date] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Aircrafts] ([ID], [Name], [MakeModel], [TotalSeats], [EconomySeats], [BusinessSeats]) VALUES (1, N'Boeing 738', N'B738-1950', 176, 162, 12)
INSERT [dbo].[Aircrafts] ([ID], [Name], [MakeModel], [TotalSeats], [EconomySeats], [BusinessSeats]) VALUES (2, N'Boeing 739', N'B739-1954', 169, 96, 51)
GO
SET IDENTITY_INSERT [dbo].[Airports] ON 

INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (2, 185, N'AUH', N'Abu Dhabi')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (3, 52, N'CAI', N'Cairo')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (4, 13, N'BAH', N'Bahrain')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (5, 194, N'ADE', N'Aden')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (6, 142, N'DOH', N'Doha')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (7, 152, N'RUH', N'Riyadh')
SET IDENTITY_INSERT [dbo].[Airports] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ID], [Name]) VALUES (1, N'Afghanistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (2, N'Albania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (3, N'Algeria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (4, N'Andorra')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (5, N'Angola')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (6, N'Antigua & Deps')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (7, N'Argentina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (8, N'Armenia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (9, N'Australia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (10, N'Austria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (11, N'Azerbaijan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (12, N'Bahamas')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (13, N'Bahrain')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (14, N'Bangladesh')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (15, N'Barbados')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (16, N'Belarus')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (17, N'Belgium')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (18, N'Belize')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (19, N'Benin')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (20, N'Bhutan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (21, N'Bolivia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (22, N'Bosnia Herzegovina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (23, N'Botswana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (24, N'Brazil')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (25, N'Brunei')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (26, N'Bulgaria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (27, N'Burkina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (28, N'Burundi')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (29, N'Cambodia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (30, N'Cameroon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (31, N'Canada')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (32, N'Cape Verde')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (33, N'Central African Rep')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (34, N'Chad')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (35, N'Chile')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (36, N'China')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (37, N'Colombia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (38, N'Comoros')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (39, N'Congo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (40, N'Congo {Democratic Rep}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (41, N'Costa Rica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (42, N'Croatia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (43, N'Cuba')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (44, N'Cyprus')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (45, N'Czech Republic')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (46, N'Denmark')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (47, N'Djibouti')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (48, N'Dominica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (49, N'Dominican Republic')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (50, N'East Timor')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (51, N'Ecuador')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (52, N'Egypt')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (53, N'El Salvador')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (54, N'Equatorial Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (55, N'Eritrea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (56, N'Estonia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (57, N'Ethiopia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (58, N'Fiji')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (59, N'Finland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (60, N'France')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (61, N'Gabon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (62, N'Gambia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (63, N'Georgia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (64, N'Germany')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (65, N'Ghana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (66, N'Greece')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (67, N'Grenada')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (68, N'Guatemala')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (69, N'Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (70, N'Guinea-Bissau')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (71, N'Guyana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (72, N'Haiti')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (73, N'Honduras')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (74, N'Hungary')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (75, N'Iceland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (76, N'India')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (77, N'Indonesia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (78, N'Iran')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (79, N'Iraq')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (80, N'Ireland {Republic}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (81, N'Israel')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (82, N'Italy')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (83, N'Ivory Coast')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (84, N'Jamaica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (85, N'Japan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (86, N'Jordan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (87, N'Kazakhstan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (88, N'Kenya')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (89, N'Kiribati')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (90, N'Korea North')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (91, N'Korea South')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (92, N'Kosovo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (93, N'Kuwait')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (94, N'Kyrgyzstan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (95, N'Laos')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (96, N'Latvia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (97, N'Lebanon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (98, N'Lesotho')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (99, N'Liberia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (100, N'Libya')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (101, N'Liechtenstein')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (102, N'Lithuania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (103, N'Luxembourg')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (104, N'Macedonia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (105, N'Madagascar')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (106, N'Malawi')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (107, N'Malaysia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (108, N'Maldives')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (109, N'Mali')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (110, N'Malta')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (111, N'Marshall Islands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (112, N'Mauritania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (113, N'Mauritius')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (114, N'Mexico')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (115, N'Micronesia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (116, N'Moldova')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (117, N'Monaco')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (118, N'Mongolia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (119, N'Montenegro')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (120, N'Morocco')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (121, N'Mozambique')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (122, N'Myanmar, {Burma}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (123, N'Namibia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (124, N'Nauru')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (125, N'Nepal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (126, N'Netherlands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (127, N'New Zealand')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (128, N'Nicaragua')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (129, N'Niger')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (130, N'Nigeria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (131, N'Norway')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (132, N'Oman')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (133, N'Pakistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (134, N'Palau')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (135, N'Panama')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (136, N'Papua New Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (137, N'Paraguay')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (138, N'Peru')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (139, N'Philippines')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (140, N'Poland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (141, N'Portugal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (142, N'Qatar')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (143, N'Romania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (144, N'Russian Federation')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (145, N'Rwanda')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (146, N'St Kitts & Nevis')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (147, N'St Lucia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (148, N'Saint Vincent & the Grenadines')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (149, N'Samoa')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (150, N'San Marino')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (151, N'Sao Tome & Principe')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (152, N'Saudi Arabia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (153, N'Senegal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (154, N'Serbia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (155, N'Seychelles')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (156, N'Sierra Leone')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (157, N'Singapore')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (158, N'Slovakia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (159, N'Slovenia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (160, N'Solomon Islands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (161, N'Somalia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (162, N'South Africa')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (163, N'South Sudan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (164, N'Spain')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (165, N'Sri Lanka')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (166, N'Sudan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (167, N'Suriname')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (168, N'Swaziland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (169, N'Sweden')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (170, N'Switzerland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (171, N'Syria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (172, N'Taiwan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (173, N'Tajikistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (174, N'Tanzania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (175, N'Thailand')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (176, N'Togo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (177, N'Tonga')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (178, N'Trinidad & Tobago')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (179, N'Tunisia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (180, N'Turkey')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (181, N'Turkmenistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (182, N'Tuvalu')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (183, N'Uganda')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (184, N'Ukraine')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (185, N'United Arab Emirates')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (186, N'United Kingdom')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (187, N'United States')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (188, N'Uruguay')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (189, N'Uzbekistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (190, N'Vanuatu')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (191, N'Vatican City')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (192, N'Venezuela')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (193, N'Vietnam')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (194, N'Yemen')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (195, N'Zambia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (196, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Offices] ON 

INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (1, 185, N'Abu dhabi', N'638-757-8582
', N'MIchael Malki')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (3, 52, N'Cairo', N'252-224-8525', N'David Johns')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (4, 13, N'Bahrain', N'542-227-5825', N'Katie Ballmer')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (5, 142, N'Doha', N'758-278-9597', N'Ariel Levy')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (6, 152, N'Riyadh', N'285-285-1474', N'Andrew Hobart')
SET IDENTITY_INSERT [dbo].[Offices] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Title]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([ID], [Title]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (1, 2, 4, 453, 64)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (2, 4, 2, 455, 69)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (3, 2, 5, 1636, 152)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (5, 5, 2, 1632, 150)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (6, 2, 7, 807, 90)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (7, 7, 2, 810, 89)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (8, 2, 6, 325, 54)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (9, 6, 2, 325, 54)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (10, 6, 3, 2057, 183)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (11, 3, 6, 2050, 177)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (12, 2, 3, 2381, 264)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (13, 3, 2, 2385, 274)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (14, 2, 3, 2381, 208)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (15, 3, 2, 2381, 211)
SET IDENTITY_INSERT [dbo].[Routes] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1, CAST(N'2017-10-04' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 620.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (2, CAST(N'2017-10-04' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 590.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (3, CAST(N'2017-10-05' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 448.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (4, CAST(N'2017-10-05' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 500.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (5, CAST(N'2017-10-06' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 697.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (6, CAST(N'2017-10-06' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 504.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (7, CAST(N'2017-10-07' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 449.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (8, CAST(N'2017-10-07' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 405.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (9, CAST(N'2017-10-08' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 494.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (10, CAST(N'2017-10-08' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 429.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (11, CAST(N'2017-10-09' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 627.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (12, CAST(N'2017-10-09' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 545.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (13, CAST(N'2017-10-10' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 637.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (14, CAST(N'2017-10-10' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 489.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (15, CAST(N'2017-10-11' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 421.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (16, CAST(N'2017-10-11' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 476.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (17, CAST(N'2017-10-12' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 484.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (18, CAST(N'2017-10-12' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 440.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (19, CAST(N'2017-10-13' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 464.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (20, CAST(N'2017-10-13' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 661.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (21, CAST(N'2017-10-14' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 437.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (22, CAST(N'2017-10-14' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 493.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (23, CAST(N'2017-10-15' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 699.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (24, CAST(N'2017-10-15' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 608.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (25, CAST(N'2017-10-16' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 417.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (26, CAST(N'2017-10-16' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 577.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (27, CAST(N'2017-10-17' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 458.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (28, CAST(N'2017-10-17' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 429.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (29, CAST(N'2017-10-18' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 686.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (30, CAST(N'2017-10-18' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 692.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (31, CAST(N'2017-10-19' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 482.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (32, CAST(N'2017-10-19' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 612.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (33, CAST(N'2017-10-20' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 620.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (34, CAST(N'2017-10-20' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 432.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (35, CAST(N'2017-10-21' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 480.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (36, CAST(N'2017-10-21' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 582.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (37, CAST(N'2017-10-22' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 453.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (38, CAST(N'2017-10-22' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 537.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (39, CAST(N'2017-10-23' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 537.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (40, CAST(N'2017-10-23' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 578.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (41, CAST(N'2017-10-24' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 571.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (42, CAST(N'2017-10-24' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 532.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (43, CAST(N'2017-10-25' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 544.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (44, CAST(N'2017-10-25' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 634.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (45, CAST(N'2017-10-26' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 494.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (46, CAST(N'2017-10-26' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 625.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (47, CAST(N'2017-10-27' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 406.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (48, CAST(N'2017-10-27' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 578.0000, 1, N'50')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (49, CAST(N'2017-10-28' AS Date), CAST(N'17:00:00' AS Time), 1, 1, 537.0000, 1, N'49')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (50, CAST(N'2017-10-28' AS Date), CAST(N'21:09:00' AS Time), 1, 2, 440.0000, 1, N'50')
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (1, 1, CAST(N'2023-11-08T15:40:47.307' AS DateTime), NULL, N'234
', 0)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (80, 1, CAST(N'2023-11-29T14:39:43.253' AS DateTime), CAST(N'2023-11-29T14:40:23.630' AS DateTime), NULL, NULL)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (81, 1, CAST(N'2023-11-29T14:40:34.970' AS DateTime), CAST(N'2023-11-29T14:41:17.267' AS DateTime), NULL, NULL)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (82, 1, CAST(N'2023-11-29T14:41:50.910' AS DateTime), CAST(N'2023-11-29T14:53:10.490' AS DateTime), NULL, NULL)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (83, 1, CAST(N'2023-11-29T14:53:29.723' AS DateTime), CAST(N'2023-11-29T14:53:44.170' AS DateTime), NULL, NULL)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (1025, 1, CAST(N'2023-12-02T14:39:58.823' AS DateTime), CAST(N'2023-12-02T14:40:20.793' AS DateTime), NULL, NULL)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (1026, 1, CAST(N'2023-12-02T14:40:30.610' AS DateTime), NULL, N'rn554tyb54yb 45 
yrt
y try try
', 1)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (1027, 1, CAST(N'2023-12-02T14:41:33.580' AS DateTime), CAST(N'2023-12-02T14:43:18.620' AS DateTime), NULL, NULL)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (1028, 1, CAST(N'2023-12-02T14:52:25.333' AS DateTime), NULL, N'j.doe@amonic.com
', 0)
INSERT [dbo].[Session] ([ID], [ID_User], [TimeStart], [TimeEnd], [Error], [SystemCrash]) VALUES (1029, 1, CAST(N'2023-12-02T14:52:56.900' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (1, 1, 1, N'j.doe@amonic.com', N'202CB962AC59075B964B07152D234B70', N'John', N'DoeAbu dhabi Abu dhabi', NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (2, 2, 3, N'k.omar@amonic.com', N'BE3AC64E67E84198F03F45B661F2124A', N'Karim', N'OmarAbu dhabi Abu dhabi', NULL, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (3, 2, 4, N'h.saeed@amonic.com', N'7B7A53E239400A13BD6BE6C91C4F6C4E', N'Hannan', N'SaeedCairo Cairo', NULL, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (4, 1, 5, N'a.hobart@amonic.com', N'4D702022947B6FED64518D0D7CFC692D', N'Andrew2', N'HobartRiyadh Riyadh2', NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (5, 2, 3, N'k.anderson@amonic.com', N'E9DAE45EC08B498F7E1AF247757C9B35', N'Katrin', N'AndersonDoha Doha', CAST(N'1992-10-11' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (6, 2, 4, N'h.wyrick@amonic.com', N'4D2E7BD33C475784381A64E43E50922F', N'Hava', N'WyrickAbu dhabi Abu dhabi', CAST(N'1988-08-08' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (7, 2, 1, N'marie.horn@amonic.com', N'C5FE25896E49DDFE996DB7508CF00534', N'Marie', N'HornBahrain Bahrain', CAST(N'1981-06-04' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (8, 1, 3, N'm.osteen@amonic.com', N'0FBCE6C74FF376D18CB352E7FDC6273B', N'Milagros', N'OsteenAbu dhabi Abu dhabi', CAST(N'1991-03-02' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (9, 2, NULL, N'tankoman228@gmail.com', N'202CB962AC59075B964B07152D234B70', N'Stephan', N'Abu Ali Ibn Sina', CAST(N'2023-11-25' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (11, 2, 6, N'oleg_ovnovskiy2002@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'Oleg', N'Ovnovskiy', CAST(N'2023-12-01' AS Date), 0)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (12, 2, NULL, N'tanchik@gmail.com', N'B86C05240E1A30474D980F7BEE2B2D7C', N'NoNammy', N'Av Ig Anonimus', CAST(N'2000-06-01' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [OfficeID], [Email], [Password], [FirstName], [LastName], [Birthdate], [Active]) VALUES (1009, 2, 3, N'rwr', N'202CB962AC59075B964B07152D234B70', N'rtrtr', N'rttrtr', CAST(N'2023-10-01' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 13.01.2024 11:24:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airports]  WITH CHECK ADD  CONSTRAINT [FK_AirPort_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Airports] CHECK CONSTRAINT [FK_AirPort_Country]
GO
ALTER TABLE [dbo].[Offices]  WITH CHECK ADD  CONSTRAINT [FK_Office_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Offices] CHECK CONSTRAINT [FK_Office_Country]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Airports2] FOREIGN KEY([DepartureAirportID])
REFERENCES [dbo].[Airports] ([ID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Airports2]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Airports3] FOREIGN KEY([ArrivalAirportID])
REFERENCES [dbo].[Airports] ([ID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Airports3]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_AirCraft] FOREIGN KEY([AircraftID])
REFERENCES [dbo].[Aircrafts] ([ID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedule_AirCraft]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedule_Routes]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Offices] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Offices]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Airline] SET  READ_WRITE 
GO
