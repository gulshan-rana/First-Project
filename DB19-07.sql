USE [master]
GO
/****** Object:  Database [Project1]    Script Date: 19-07-2019 PM 01:07:53 ******/
CREATE DATABASE [Project1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Project1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project1] SET  MULTI_USER 
GO
ALTER DATABASE [Project1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Project1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Project1]
GO
/****** Object:  Table [dbo].[CityName]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityName](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](60) NULL,
	[StateID] [int] NULL,
 CONSTRAINT [PK_CityName] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countrytable]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countrytable](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
 CONSTRAINT [PK_Countrytable] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginP]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginP](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](60) NULL,
	[LastName] [varchar](60) NULL,
	[EmailAddress] [varchar](60) NULL,
	[Password] [varchar](60) NULL,
	[Address] [varchar](400) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[RollID] [int] NULL,
	[CountryID] [int] NULL,
	[StateID] [int] NULL,
	[CityID] [int] NULL,
	[Photo] [varchar](400) NULL,
 CONSTRAINT [PK_LoginP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RollTable]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RollTable](
	[RollID] [int] IDENTITY(1,1) NOT NULL,
	[RollName] [varchar](60) NULL,
 CONSTRAINT [PK_RollTable] PRIMARY KEY CLUSTERED 
(
	[RollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatesName]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatesName](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_StatesName] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAttendence]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAttendence](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CheckIN] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[UserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__UserAtte__3213E83FC15FC887] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CityName] ON 

INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (1, N'Ropar', 1)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (2, N'Jalandhar', 1)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (3, N'Una', 2)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (4, N'Shimla', 2)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (5, N'Manchester City', 3)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (6, N'London City', 4)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (7, N'Victoria City', 5)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (8, N'Queensland City	', 6)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (9, N'Northwest Territories City', 7)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (10, N'Yukon City', 8)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (11, N'California City', 9)
INSERT [dbo].[CityName] ([CityID], [CityName], [StateID]) VALUES (12, N'Florida City', 10)
SET IDENTITY_INSERT [dbo].[CityName] OFF
SET IDENTITY_INSERT [dbo].[Countrytable] ON 

INSERT [dbo].[Countrytable] ([CountryID], [CountryName]) VALUES (1, N'India')
INSERT [dbo].[Countrytable] ([CountryID], [CountryName]) VALUES (2, N'England')
INSERT [dbo].[Countrytable] ([CountryID], [CountryName]) VALUES (3, N'Australia')
INSERT [dbo].[Countrytable] ([CountryID], [CountryName]) VALUES (4, N'Canada')
INSERT [dbo].[Countrytable] ([CountryID], [CountryName]) VALUES (5, N'U.S.A')
SET IDENTITY_INSERT [dbo].[Countrytable] OFF
SET IDENTITY_INSERT [dbo].[LoginP] ON 

INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (1, N'Gushan', N'Rana', N'Gulshan@Gmail.com', N'123456', N'Mohali', N'1234464545', 1, 1, 1, 1, NULL)
INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (5, N'Student12', N'Student3', N'Student3@Emailadress.com', N'123456', N'Mohali', N'4561321564', 2, 1, 1, 2, N'Jellyfish.jpg')
INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (6, N'Test1', N'Test1', N'test1@gmail.com', N'123456', N'Mohali', N'4561321564', 2, 1, 2, 4, N'')
INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (7, N'Raksh', N'Singh', N'rakesh@gmail.com', N'123456', N'', N'', 2, 0, 0, 0, N'')
INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (9, N'Aman', N'Singh', N'Aman@Gmail.Com', N'123456', N'Null', N'', 2, 0, 0, 0, N'')
INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (10, N'Deepak', N'Kumar', N'Deepak@Gmail.com', N'123456', N'mohali', N'8699385647', 2, 1, 1, 1, N'')
INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (11, N'Aman', N'Singh', N'Student35@Emailadress.com', N'12121212', N'', N'', 2, 0, 0, 0, N'')
INSERT [dbo].[LoginP] ([id], [FirstName], [LastName], [EmailAddress], [Password], [Address], [PhoneNumber], [RollID], [CountryID], [StateID], [CityID], [Photo]) VALUES (12, N'Ashish', N'Bamel', N'Student111@gmail.com', N'123456', NULL, NULL, NULL, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[LoginP] OFF
SET IDENTITY_INSERT [dbo].[RollTable] ON 

INSERT [dbo].[RollTable] ([RollID], [RollName]) VALUES (1, N'Admin')
INSERT [dbo].[RollTable] ([RollID], [RollName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[RollTable] OFF
SET IDENTITY_INSERT [dbo].[StatesName] ON 

INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (1, N'Punjab', 1)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (2, N'Himachal', 1)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (3, N'Manchester', 2)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (4, N'London', 2)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (5, N'Victoria', 3)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (6, N'Queensland	', 3)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (7, N'Northwest Territories', 4)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (8, N'Yukon', 4)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (9, N'California', 5)
INSERT [dbo].[StatesName] ([StateID], [StateName], [CountryID]) VALUES (10, N'Florida', 5)
SET IDENTITY_INSERT [dbo].[StatesName] OFF
SET IDENTITY_INSERT [dbo].[UserAttendence] ON 

INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1, CAST(N'2019-07-11 13:22:17.650' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (2, CAST(N'2019-07-11 17:45:31.830' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (3, CAST(N'2019-07-11 17:46:23.083' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (4, CAST(N'2019-07-11 17:49:32.223' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (5, NULL, CAST(N'2019-07-12 13:43:10.187' AS DateTime), NULL, NULL)
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (6, CAST(N'2019-07-11 17:50:45.417' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (7, NULL, CAST(N'2019-07-12 13:43:10.187' AS DateTime), NULL, NULL)
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (8, CAST(N'2019-07-11 18:57:32.483' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (9, CAST(N'2019-07-12 11:28:32.123' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (10, CAST(N'2019-07-12 11:31:23.560' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (11, CAST(N'2019-07-12 11:35:03.493' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (12, CAST(N'2019-07-12 11:54:45.090' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (13, CAST(N'2019-07-12 11:58:31.357' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (14, CAST(N'2019-07-12 12:00:08.093' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (15, CAST(N'2019-07-12 12:29:42.950' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (16, CAST(N'2019-07-12 12:30:58.643' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (17, CAST(N'2019-07-12 12:58:33.240' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (18, CAST(N'2019-07-12 13:31:08.590' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (19, CAST(N'2019-07-12 13:32:29.993' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (20, CAST(N'2019-07-12 13:33:41.053' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (21, CAST(N'2019-07-12 13:43:01.413' AS DateTime), CAST(N'2019-07-12 13:43:10.187' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (22, CAST(N'2019-07-12 16:06:20.290' AS DateTime), CAST(N'2019-07-12 16:58:01.470' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (23, CAST(N'2019-07-12 17:16:38.283' AS DateTime), CAST(N'2019-07-12 17:16:56.013' AS DateTime), 5, CAST(N'2019-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (24, CAST(N'2019-07-13 16:48:19.720' AS DateTime), NULL, 0, CAST(N'2019-07-13 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (25, CAST(N'2019-07-13 17:58:40.680' AS DateTime), CAST(N'2019-07-13 18:00:28.473' AS DateTime), 5, CAST(N'2019-07-13 00:00:00.000' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (26, CAST(N'2019-07-15 10:23:28.077' AS DateTime), CAST(N'2019-07-15 15:07:06.943' AS DateTime), 5, CAST(N'2019-07-15 10:23:28.077' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (27, CAST(N'2019-07-15 12:52:05.773' AS DateTime), NULL, 7, CAST(N'2019-07-15 12:52:05.773' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (28, CAST(N'2019-07-15 12:52:10.567' AS DateTime), CAST(N'2019-07-15 12:52:31.993' AS DateTime), 7, CAST(N'2019-07-15 12:52:10.567' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (29, CAST(N'2019-07-15 13:39:41.310' AS DateTime), CAST(N'2019-07-15 14:35:38.943' AS DateTime), 9, CAST(N'2019-07-15 13:39:41.310' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (30, CAST(N'2019-07-16 10:24:28.647' AS DateTime), CAST(N'2019-07-16 10:25:44.783' AS DateTime), 5, CAST(N'2019-07-16 10:24:28.647' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1030, CAST(N'2019-07-18 15:22:56.713' AS DateTime), CAST(N'2019-07-18 15:23:31.097' AS DateTime), 5, CAST(N'2019-07-18 15:22:56.713' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1031, CAST(N'2019-07-18 15:28:32.413' AS DateTime), NULL, 5, CAST(N'2019-07-18 15:28:32.413' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1032, CAST(N'2019-07-18 15:28:42.107' AS DateTime), NULL, 5, CAST(N'2019-07-18 15:28:42.107' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1033, CAST(N'2019-07-18 15:29:05.817' AS DateTime), CAST(N'2019-07-18 15:35:53.090' AS DateTime), 5, CAST(N'2019-07-18 15:29:05.817' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1034, CAST(N'2019-07-18 16:52:52.837' AS DateTime), CAST(N'2019-07-18 16:53:23.760' AS DateTime), 5, CAST(N'2019-07-18 16:52:52.837' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1035, CAST(N'2019-07-18 16:53:29.530' AS DateTime), NULL, 5, CAST(N'2019-07-18 16:53:29.530' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1036, CAST(N'2019-07-18 16:54:09.080' AS DateTime), NULL, 5, CAST(N'2019-07-18 16:54:09.080' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1037, CAST(N'2019-07-18 17:03:08.550' AS DateTime), CAST(N'2019-07-18 17:03:32.107' AS DateTime), 5, CAST(N'2019-07-18 17:03:09.253' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1038, CAST(N'2019-07-18 17:03:49.463' AS DateTime), NULL, 5, CAST(N'2019-07-18 17:03:49.463' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1039, CAST(N'2019-07-18 17:04:49.627' AS DateTime), CAST(N'2019-07-18 17:50:41.017' AS DateTime), 5, CAST(N'2019-07-18 17:04:49.627' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1040, CAST(N'2019-07-18 17:56:46.110' AS DateTime), NULL, 5, CAST(N'2019-07-18 17:56:46.920' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1041, CAST(N'2019-07-18 18:00:00.863' AS DateTime), CAST(N'2019-07-18 18:15:36.920' AS DateTime), 5, CAST(N'2019-07-18 18:00:00.863' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1042, CAST(N'2019-07-18 18:25:32.743' AS DateTime), NULL, 5, CAST(N'2019-07-18 18:25:32.743' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1043, CAST(N'2019-07-18 18:27:00.917' AS DateTime), CAST(N'2019-07-18 19:12:20.897' AS DateTime), 5, CAST(N'2019-07-18 18:27:00.917' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1044, CAST(N'2019-07-19 10:56:30.653' AS DateTime), CAST(N'2019-07-19 11:00:32.330' AS DateTime), 5, CAST(N'2019-07-19 10:56:30.747' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1045, CAST(N'2019-07-19 11:06:11.400' AS DateTime), CAST(N'2019-07-19 11:07:49.883' AS DateTime), 5, CAST(N'2019-07-19 11:06:11.400' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1046, CAST(N'2019-07-19 11:07:53.667' AS DateTime), CAST(N'2019-07-19 11:09:55.780' AS DateTime), 5, CAST(N'2019-07-19 11:07:53.667' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1047, CAST(N'2019-07-19 12:43:52.007' AS DateTime), CAST(N'2019-07-19 12:54:09.183' AS DateTime), 6, CAST(N'2019-07-19 12:43:52.007' AS DateTime))
INSERT [dbo].[UserAttendence] ([id], [CheckIN], [CheckOut], [UserID], [CreatedDate]) VALUES (1048, CAST(N'2019-07-19 13:03:52.000' AS DateTime), CAST(N'2019-07-19 13:04:12.773' AS DateTime), 5, CAST(N'2019-07-19 13:03:52.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserAttendence] OFF
ALTER TABLE [dbo].[LoginP]  WITH CHECK ADD  CONSTRAINT [FK_LoginP_RollTable] FOREIGN KEY([RollID])
REFERENCES [dbo].[RollTable] ([RollID])
GO
ALTER TABLE [dbo].[LoginP] CHECK CONSTRAINT [FK_LoginP_RollTable]
GO
ALTER TABLE [dbo].[RollTable]  WITH CHECK ADD  CONSTRAINT [FK_RollTable_RollTable] FOREIGN KEY([RollID])
REFERENCES [dbo].[RollTable] ([RollID])
GO
ALTER TABLE [dbo].[RollTable] CHECK CONSTRAINT [FK_RollTable_RollTable]
GO
/****** Object:  StoredProcedure [dbo].[AdminAttendenceShow]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AdminAttendenceShow]
@id  int
as begin
Select UserAttendence.CheckIN,UserAttendence.CheckOut,UserAttendence.UserID From
(UserAttendence
inner join LoginP on UserAttendence.UserID=LoginP.id)
Where UserAttendence.UserID=@id;
end
GO
/****** Object:  StoredProcedure [dbo].[AdminAttendenceShownew]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AdminAttendenceShownew]
@DDName  Varchar='',
@id  int,
@SearchFrom  datetime='' ,
@Searchto datetime=''
as begin
if(isnull(@id,'')<>'')
begin
Select UserAttendence.CheckIN,UserAttendence.CheckOut,UserAttendence.UserID From
(UserAttendence
inner join LoginP on UserAttendence.UserID=LoginP.id)
Where UserID=@id;
if( ISNULL( @id,'')<>'')
begin
Select * From UserAttendence where UserID=@id and CONVERT(varchar(20),CreatedDate) Between CONVERT(varchar(20),@Searchto) and CONVERT(varchar(20), @SearchFrom)
end
else
begin
Select * From UserAttendence where CONVERT(varchar(20),CreatedDate) Between CONVERT(varchar(20),@Searchto) and CONVERT(varchar(20), @SearchFrom)
end
end
else
begin
Select * From UserAttendence
end
end
GO
/****** Object:  StoredProcedure [dbo].[AdminSearchDate]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[AdminSearchDate]
@id          int,
@Searchto    Datetime='',
@SearchFrom  Datetime=''
as begin
if( ISNULL( @id,'')<>'')
begin
Select * From UserAttendence where UserID=@id and CONVERT(varchar(20),CreatedDate) Between CONVERT(varchar(20),@Searchto) and CONVERT(varchar(20), @SearchFrom)
end
else
begin
Select * From UserAttendence where CONVERT(varchar(20),CreatedDate) Between CONVERT(varchar(20),@Searchto) and CONVERT(varchar(20), @SearchFrom)
end
end
GO
/****** Object:  StoredProcedure [dbo].[AttendenceCheckout]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AttendenceCheckout]

@id  int,
@CheckOut datetime

as Begin
declare @LoginId int 
begin

select @LoginId=MAX(id) from UserAttendence where UserID=@id


 end
  begin
Update UserAttendence set CheckOut=@CheckOut where id=@LoginId
end
end
GO
/****** Object:  StoredProcedure [dbo].[AttendenceCheckout1]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[AttendenceCheckout1]

@id  int,
@CheckOut datetime

as Begin
declare @LoginId int 
begin

 set @LoginId =(select MAX(id) from UserAttendence where UserID=@id)
 select @LoginId

 

end
end
GO
/****** Object:  StoredProcedure [dbo].[DDLogIn]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DDLogIn]
as Begin 
Select LoginP.id,LoginP.FirstName,LoginP.LastName,LoginP.EmailAddress,LoginP.Password,LoginP.Address,LoginP.PhoneNumber,LoginP.RollID,LoginP.CountryID,LoginP.StateID,LoginP.CityID,LoginP.Photo,Countrytable.CountryID,Countrytable.CountryName,StatesName.StateID,StatesName.StateName,StatesName.CountryID,CityName.CityID,CityName.CityName,CityName.StateID,RollTable.RollID,RollTable.RollName From
((((LoginP
inner join RollTable on LoginP.RollID=RollTable.RollID)
inner join Countrytable on LoginP.CountryID=Countrytable.CountryID)
inner join StatesName on LoginP.StateID=StatesName.StateID)
inner join CityName on LoginP.CityID=CityName.CityID)
where LoginP.RollID=2

end
GO
/****** Object:  StoredProcedure [dbo].[DeleteLoginP]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[DeleteLoginP]
(
@id int
)
as Begin
delete From LoginP
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[SearchData]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SearchData]
(
@SearchFrom dateTime ='',
@Searchto    datetime='',
@UserID int 
)
as
begin
if (isnull(@SearchFrom,'')<>'' and  isnull(@Searchto ,'')<>'')
begin
--select * from UserAttendence where UserID=@UserID and  CONVERT(varchar(20), CreatedDate) BETWEEN  CONVERT(varchar(20),'2019-07-11') AND  CONVERT(varchar(20),  '2019-07-13')

select * from UserAttendence where UserID=@UserID and  CONVERT(varchar(20), CreatedDate) BETWEEN  CONVERT(varchar(20),@Searchto) AND  CONVERT(varchar(20),  @SearchFrom)
end
else
begin
select * from UserAttendence where UserID=@UserID 
end
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateData]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateData]
(
@id          int,
@FirstName   varchar(60),
@LastName    varchar(60),
@EmailAddress varchar(60),
@Password     varchar(60),
@Address    varchar(400),
@PhoneNumber varchar(20),
@RollID      int,
@CountryID   int,
@StateID     int,
@CityID      int,
@Photo      varchar(400)
)
as Begin
update LoginP Set
FirstName=@FirstName,
LastName=@LastName,
EmailAddress=@EmailAddress,
Password=@Password,
Address=@Address,
PhoneNumber=@PhoneNumber,
RollID=@RollID,
CountryID=@CountryID,
StateID=@StateID,
CityID=@CityID,
Photo=@Photo
Where id=@id
End

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDetails]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UpdateUserDetails]
(
@id              int,
@FirstName       varchar(60),
@LastName        varchar(60),
@EmailAddress    varchar(60),
@Password        varchar(60),
@Address         varchar(400),
@PhoneNumber     varchar(20),
@RollID          int,
@CountryID       int,
@StateID         int,
@CityID          int,
@Photo           varchar(400)
)
as begin 
update LoginP Set
FirstName=@FirstName,
LastName=@LastName,
EmailAddress=@EmailAddress,
Password=@Password,
Address=@Address,
PhoneNumber=@PhoneNumber,
RollID=@RollID,
CountryID=@CountryID,
StateID=@StateID,
CityID=@CityID,
Photo=@Photo
Where id=@id
end

GO
/****** Object:  StoredProcedure [dbo].[UserProcedure]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UserProcedure]

@id int

as Begin 
Select LoginP.id,LoginP.FirstName,LoginP.LastName,LoginP.EmailAddress,LoginP.Password,LoginP.Address,LoginP.PhoneNumber,LoginP.RollID,LoginP.CountryID,LoginP.StateID,LoginP.CityID,LoginP.Photo,Countrytable.CountryID,Countrytable.CountryName,StatesName.StateID,StatesName.StateName,StatesName.CountryID,CityName.CityID,CityName.CityName,CityName.StateID,RollTable.RollID,RollTable.RollName From
((((LoginP
inner join RollTable on LoginP.RollID=RollTable.RollID)
inner join Countrytable on LoginP.CountryID=Countrytable.CountryID)
inner join StatesName on LoginP.StateID=StatesName.StateID)
inner join CityName on LoginP.CityID=CityName.CityID)  
Where id=@id

end

GO
/****** Object:  StoredProcedure [dbo].[UserProcedure1]    Script Date: 19-07-2019 PM 01:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UserProcedure1]
@id int
as begin 
 Select LoginP.id,LoginP.FirstName,LoginP.LastName,LoginP.EmailAddress,LoginP.Password,LoginP.Address,LoginP.PhoneNumber,LoginP.RollID,LoginP.CountryID,LoginP.StateID,LoginP.CityID,LoginP.Photo,Countrytable.CountryName,StatesName.StateName,CityName.CityName,RollTable.RollName From
 LoginP
left join RollTable on LoginP.RollID=RollTable.RollID
left join Countrytable on LoginP.CountryID=Countrytable.CountryID
left join StatesName on LoginP.StateID=StatesName.StateID
left join CityName on LoginP.CityID=CityName.CityID
Where id=@id
end

GO
USE [master]
GO
ALTER DATABASE [Project1] SET  READ_WRITE 
GO
