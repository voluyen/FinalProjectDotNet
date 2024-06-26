USE [master]
GO
/****** Object:  Database [MyDatabase]    Script Date: 5/30/2024 6:07:39 PM ******/
CREATE DATABASE [MyDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [MyDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [MyDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyDatabase', N'ON'
GO
ALTER DATABASE [MyDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyDatabase]
GO
/****** Object:  Table [dbo].[AboutUs]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AboutUs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[job_id] [int] NOT NULL,
	[candidate_id] [int] NOT NULL,
	[cover_letter] [nvarchar](max) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerBottom]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerBottom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BannerBottom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[order] [int] NOT NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[full_name] [nvarchar](max) NOT NULL,
	[avatar] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[date_create] [date] NOT NULL,
	[birthdate] [date] NULL,
	[phone_number] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[resume] [nvarchar](max) NULL,
	[skills] [nvarchar](max) NULL,
	[experience] [nvarchar](max) NULL,
 CONSTRAINT [PK_Candidates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[info] [nvarchar](50) NOT NULL,
	[icon] [nvarchar](max) NOT NULL,
	[order] [int] NOT NULL,
	[hide] [bit] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[date] [datetime] NOT NULL,
	[order] [int] NOT NULL,
	[hide] [bit] NOT NULL,
	[link] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follows]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follows](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[link] [nvarchar](max) NOT NULL,
	[order] [int] NOT NULL,
	[hide] [bit] NOT NULL,
	[icon] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Follows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_recruiter] [int] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[requirements] [nvarchar](max) NOT NULL,
	[id_category] [int] NOT NULL,
	[location] [int] NOT NULL,
	[salary] [decimal](18, 0) NOT NULL,
	[date_posted] [date] NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[link] [nvarchar](max) NOT NULL,
	[meta] [nvarchar](50) NOT NULL,
	[hide] [bit] NOT NULL,
	[order] [int] NOT NULL,
	[datebegin] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MidService]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MidService](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[order] [int] NOT NULL,
	[hide] [bit] NOT NULL,
 CONSTRAINT [PK_MidService] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[order] [int] NOT NULL,
	[hide] [bit] NOT NULL,
	[link] [nvarchar](max) NOT NULL,
	[date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiters]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[full_name] [nvarchar](max) NOT NULL,
	[avatar] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[date_create] [date] NOT NULL,
	[company_name] [nvarchar](max) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[website] [nvarchar](max) NULL,
 CONSTRAINT [PK_Recruiters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[order] [int] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testimonials]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testimonials](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[avatar] [nvarchar](max) NOT NULL,
	[order] [int] NOT NULL,
	[hide] [bit] NOT NULL,
 CONSTRAINT [PK_Testimonials] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VietnamProvinces]    Script Date: 5/30/2024 6:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VietnamProvinces](
	[ProvinceID] [int] NOT NULL,
	[ProvinceName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AboutUs] ON 

INSERT [dbo].[AboutUs] ([id], [title], [description], [img]) VALUES (1, N'Employment opportunities for Professionals', N'Pellentesque convallis diam consequat magna vulputate malesuada. Cras a ornare elit. Nulla viverra pharetra sem, eget pulvinar neque pharetra ac.<br>

Lorem Ipsum convallis diam consequat magna vulputate malesuada. Cras a ornare elit. Nulla viverra pharetra sem, eget pulvinar neque pharetra ac.', N'Images/ab.png')
SET IDENTITY_INSERT [dbo].[AboutUs] OFF
GO
SET IDENTITY_INSERT [dbo].[BannerBottom] ON 

INSERT [dbo].[BannerBottom] ([id], [img], [description]) VALUES (1, N'Images/banner4.jpg', N'Whether we play a large or small role, by working together we achieve our objectives.')
SET IDENTITY_INSERT [dbo].[BannerBottom] OFF
GO
SET IDENTITY_INSERT [dbo].[Banners] ON 

INSERT [dbo].[Banners] ([id], [img], [order]) VALUES (1, N'Images/banner1.jpg', 1)
INSERT [dbo].[Banners] ([id], [img], [order]) VALUES (2, N'Images/banner1.jpg', 2)
INSERT [dbo].[Banners] ([id], [img], [order]) VALUES (3, N'Images/banner3.jpg', 3)
SET IDENTITY_INSERT [dbo].[Banners] OFF
GO
SET IDENTITY_INSERT [dbo].[Candidates] ON 

INSERT [dbo].[Candidates] ([id], [username], [password], [full_name], [avatar], [email], [date_create], [birthdate], [phone_number], [address], [resume], [skills], [experience]) VALUES (1, N'baesad', N'AQAAAAEAACcQAAAAELqtGCI0+8j0wsLfN0QnSIMWVAeiURtN/L2R7412QWQcnawuDvwW7Sajcy+3c/X+0w==', N'Vo Luyen', N'/Avatars/avt.png', N'voluyenpr@gmail.com', CAST(N'2024-05-30' AS Date), CAST(N'2003-12-25' AS Date), NULL, NULL, N'', NULL, NULL)
INSERT [dbo].[Candidates] ([id], [username], [password], [full_name], [avatar], [email], [date_create], [birthdate], [phone_number], [address], [resume], [skills], [experience]) VALUES (2, N'voluyen', N'AQAAAAEAACcQAAAAEBvR7RrGY3T8t8BA4O+JYqgJGQHT9FxsXNR+KuEGQ6SSC/K194ORtv48/fZKxR83lQ==', N'Võ Luyện', N'/Avatars/avt.png', N'voluyenpr@gmail.com', CAST(N'2024-05-30' AS Date), CAST(N'2003-12-25' AS Date), N'0123456789', N'Hồ Chí Minh', N'', N'Thuyết trình, tư duy phản biện', NULL)
INSERT [dbo].[Candidates] ([id], [username], [password], [full_name], [avatar], [email], [date_create], [birthdate], [phone_number], [address], [resume], [skills], [experience]) VALUES (4, N'voluyen123', N'AQAAAAEAACcQAAAAEPk2wiH3UPi48OuRkD04lnxhCVB3BPudqh7kuMn4bVWhcnFQyGOLoFUYg/z2pbN7CA==', N'Võ Luyện', N'/Avatars/avt.png', N'voluyenpr@gmail.com', CAST(N'2024-05-30' AS Date), CAST(N'2003-12-25' AS Date), N'0123456789', NULL, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Candidates] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([id], [name]) VALUES (1, N'IT')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (2, N'Data Science')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (3, N'Business Analyst')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (4, N'Database Administration')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (5, N'Web Development')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (41, N'Sales')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (42, N'Marketing')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (43, N'Customer Service')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (44, N'Finance')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (45, N'Human Resources')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (46, N'Accounting')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (47, N'Hospitality')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (48, N'Education')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (49, N'Healthcare')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (50, N'Retail')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([id], [type], [info], [icon], [order], [hide]) VALUES (1, N'Location', N'Tân Phong, Quận 7, Thành phố Hồ Chí Minh', N'fa fa-map-marker', 1, 0)
INSERT [dbo].[Contacts] ([id], [type], [info], [icon], [order], [hide]) VALUES (2, N'Email', N'voluyenpr@gmail.com', N'fa fa-envelope', 2, 0)
INSERT [dbo].[Contacts] ([id], [type], [info], [icon], [order], [hide]) VALUES (3, N'Telephone', N'+09187 8088 9436', N'fa fa-phone', 3, 0)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (1, N'Event 1 Title', N'Event 1 Description', CAST(N'2024-03-25T00:00:00.000' AS DateTime), 1, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (2, N'Event 2 Title', N'Event 2 Description', CAST(N'2024-03-26T00:00:00.000' AS DateTime), 2, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (3, N'Event 3 Title', N'Event 3 Description', CAST(N'2024-03-27T00:00:00.000' AS DateTime), 3, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (4, N'Event 4 Title', N'Event 4 Description', CAST(N'2024-03-28T00:00:00.000' AS DateTime), 4, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (5, N'Event 5 Title', N'Event 5 Description', CAST(N'2024-03-29T00:00:00.000' AS DateTime), 5, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (6, N'Event 6 Title', N'Event 6 Description', CAST(N'2024-03-30T00:00:00.000' AS DateTime), 6, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (7, N'Event 7 Title', N'Event 7 Description', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 7, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (8, N'Event 8 Title', N'Event 8 Description', CAST(N'2024-04-01T00:00:00.000' AS DateTime), 8, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (9, N'Event 9 Title', N'Event 9 Description', CAST(N'2024-04-02T00:00:00.000' AS DateTime), 9, 0, N'#')
INSERT [dbo].[Events] ([id], [title], [description], [date], [order], [hide], [link]) VALUES (10, N'Event 10 Title', N'Event 10 Description', CAST(N'2024-04-03T00:00:00.000' AS DateTime), 10, 0, N'#')
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Follows] ON 

INSERT [dbo].[Follows] ([id], [type], [link], [order], [hide], [icon]) VALUES (1, N'Facebook', N'#', 1, 0, N'/Images/facebook.png')
INSERT [dbo].[Follows] ([id], [type], [link], [order], [hide], [icon]) VALUES (2, N'Twitter', N'#', 2, 0, N'/Images/twitter.png')
INSERT [dbo].[Follows] ([id], [type], [link], [order], [hide], [icon]) VALUES (3, N'Instagram', N'#', 3, 0, N'/Images/instagram.png')
SET IDENTITY_INSERT [dbo].[Follows] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([id], [id_recruiter], [title], [description], [requirements], [id_category], [location], [salary], [date_posted], [is_active]) VALUES (1, 1, N'Kỹ sư AI', N' ', N' ', 1, 1, CAST(1000 AS Decimal(18, 0)), CAST(N'2024-05-30' AS Date), 1)
INSERT [dbo].[Jobs] ([id], [id_recruiter], [title], [description], [requirements], [id_category], [location], [salary], [date_posted], [is_active]) VALUES (2, 2, N'nhân viên sale', N'#', N'#', 41, 1, CAST(1200 AS Decimal(18, 0)), CAST(N'2024-05-30' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Home', N'/Home/Index', N'Home Page', 0, 1, CAST(N'2024-03-20T01:05:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Professionals', N'#', N'Professional Page', 0, 4, CAST(N'2024-03-24T00:00:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Jobs', N'/jobs', N'Jobs Page', 0, 2, CAST(N'2024-03-20T01:05:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Events', N'/events', N'Events Page', 0, 3, CAST(N'2024-03-20T01:05:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Contact', N'/contact', N'Contact Page', 0, 5, CAST(N'2024-03-20T01:05:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MidService] ON 

INSERT [dbo].[MidService] ([id], [title], [description], [order], [hide]) VALUES (1, N'Assumenda Est Cliche Voluptate', N'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 0)
INSERT [dbo].[MidService] ([id], [title], [description], [order], [hide]) VALUES (2, N'Itaque Earum Rerum', N'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2, 0)
INSERT [dbo].[MidService] ([id], [title], [description], [order], [hide]) VALUES (3, N'Autem Accusamus Terry Qui', N'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
', 3, 0)
SET IDENTITY_INSERT [dbo].[MidService] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [content], [order], [hide], [link], [date]) VALUES (2, N'Lorem ipsum neque vulputate', 1, 0, N'#', CAST(N'2024-03-20T01:05:00' AS SmallDateTime))
INSERT [dbo].[News] ([id], [content], [order], [hide], [link], [date]) VALUES (6, N'Dolor amet sed quam vitae', 2, 0, N'#', CAST(N'2024-03-20T01:05:00' AS SmallDateTime))
INSERT [dbo].[News] ([id], [content], [order], [hide], [link], [date]) VALUES (10, N' Lorem ipsum neque, vulputate', 3, 0, N'#', CAST(N'2024-03-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[News] ([id], [content], [order], [hide], [link], [date]) VALUES (12, N'Dolor amet sed quam vitae', 4, 0, N'#', CAST(N'2024-03-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[News] ([id], [content], [order], [hide], [link], [date]) VALUES (13, N' Lorem ipsum neque, vulputate', 5, 0, N'#', CAST(N'2024-03-21T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Recruiters] ON 

INSERT [dbo].[Recruiters] ([id], [username], [password], [full_name], [avatar], [email], [date_create], [company_name], [phone], [address], [website]) VALUES (1, N'baesad', N'AQAAAAEAACcQAAAAEOyeR5Rgam2bcZ/iiQR8Ok7EP+nbq8tEf0pQFQ99B8EFH29S4i36s61haDDPV5LW/Q==', N'Võ Luyện', N'/Avatars/avt.png', N'voluyenpr@gmail.com', CAST(N'2024-05-30' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Recruiters] ([id], [username], [password], [full_name], [avatar], [email], [date_create], [company_name], [phone], [address], [website]) VALUES (2, N'baesad123', N'AQAAAAEAACcQAAAAEJIPADG5sSddTE7sKoQBxaSOzFC86IrXjZEkL12CNrHHD/Z4trSX+Z00wDQFBAG1bw==', N'Võ Luyện', N'/Avatars/avt.png', N'voluyenpr@gmail.com', CAST(N'2024-05-30' AS Date), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Recruiters] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([id], [name], [order]) VALUES (1, N'IDENTIFY NEED & DEVELOP POSITION DESCRIPTION', 1)
INSERT [dbo].[Services] ([id], [name], [order]) VALUES (2, N'RECRUITMENT PLANNING', 2)
INSERT [dbo].[Services] ([id], [name], [order]) VALUES (3, N'SOURCING & ADVERTISING', 3)
INSERT [dbo].[Services] ([id], [name], [order]) VALUES (4, N'ASSESS & INTERVIEW CANDIDATES', 4)
INSERT [dbo].[Services] ([id], [name], [order]) VALUES (5, N'ONBOARDING FOR SUCCESS', 5)
INSERT [dbo].[Services] ([id], [name], [order]) VALUES (6, N'OFFER FOR STUDENT EMPLOYMENT', 6)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Testimonials] ON 

INSERT [dbo].[Testimonials] ([id], [name], [description], [avatar], [order], [hide]) VALUES (1, N'Dan Adams
', N'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus,Morbi viverra congue nisi vel pulvinar posuere sapien eros. omnis voluptas.', N'Images/test1.jpg', 1, 0)
INSERT [dbo].[Testimonials] ([id], [name], [description], [avatar], [order], [hide]) VALUES (2, N'Jessica Doe', N'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus,Morbi viverra congue nisi vel pulvinar posuere sapien eros. omnis voluptas.', N'Images/test2.jpg', 2, 0)
INSERT [dbo].[Testimonials] ([id], [name], [description], [avatar], [order], [hide]) VALUES (5, N'Michael Doe', N'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus,Morbi viverra congue nisi vel pulvinar posuere sapien eros. omnis voluptas.', N'Images/test3.jpg', 3, 0)
SET IDENTITY_INSERT [dbo].[Testimonials] OFF
GO
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (1, N'An Giang')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (2, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (3, N'Bắc Giang')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (4, N'Bắc Kạn')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (5, N'Bạc Liêu')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (6, N'Bắc Ninh')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (7, N'Bến Tre')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (8, N'Bình Định')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (9, N'Bình Dương')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (10, N'Bình Phước')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (11, N'Bình Thuận')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (12, N'Cà Mau')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (13, N'Cao Bằng')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (14, N'Đắk Lắk')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (15, N'Đắk Nông')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (16, N'Điện Biên')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (17, N'Đồng Nai')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (18, N'Đồng Tháp')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (19, N'Gia Lai')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (20, N'Hà Giang')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (21, N'Hà Nam')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (22, N'Hà Nội')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (23, N'Hà Tĩnh')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (24, N'Hải Dương')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (25, N'Hải Phòng')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (26, N'Hậu Giang')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (27, N'Hòa Bình')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (28, N'Thừa Thiên Huế')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (29, N'Tiền Giang')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (30, N'Thái Bình')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (31, N'Thái Nguyên')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (32, N'Thanh Hóa')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (33, N'Quảng Bình')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (34, N'Quảng Nam')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (35, N'Quảng Ngãi')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (36, N'Quảng Ninh')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (37, N'Quảng Trị')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (38, N'Kon Tum')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (39, N'Lai Châu')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (40, N'Lâm Đồng')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (41, N'Lạng Sơn')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (42, N'Lào Cai')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (43, N'Long An')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (44, N'Nam Định')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (45, N'Nghệ An')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (46, N'Ninh Bình')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (47, N'Ninh Thuận')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (48, N'Phú Thọ')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (49, N'Phú Yên')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (50, N'Sóc Trăng')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (51, N'Sơn La')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (52, N'Tây Ninh')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (53, N'Thái Bình')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (54, N'Thái Nguyên')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (55, N'Thanh Hóa')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (56, N'Thừa Thiên Huế')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (57, N'Tiền Giang')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (58, N'Trà Vinh')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (59, N'Tuyên Quang')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (60, N'Vĩnh Long')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (61, N'Vĩnh Phúc')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (62, N'Yên Bái')
INSERT [dbo].[VietnamProvinces] ([ProvinceID], [ProvinceName]) VALUES (63, N'Tp. Hồ Chí Minh')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Candidates]    Script Date: 5/30/2024 6:07:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Candidates] ON [dbo].[Candidates]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Recruiters]    Script Date: 5/30/2024 6:07:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Recruiters] ON [dbo].[Recruiters]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Candidates] FOREIGN KEY([id])
REFERENCES [dbo].[Candidates] ([id])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Candidates]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Jobs] FOREIGN KEY([job_id])
REFERENCES [dbo].[Jobs] ([id])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Jobs]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Categorys] FOREIGN KEY([id_category])
REFERENCES [dbo].[Categorys] ([id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Categorys]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Recruiters] FOREIGN KEY([id_recruiter])
REFERENCES [dbo].[Recruiters] ([id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Recruiters]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_VietnamProvinces] FOREIGN KEY([location])
REFERENCES [dbo].[VietnamProvinces] ([ProvinceID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_VietnamProvinces]
GO
USE [master]
GO
ALTER DATABASE [MyDatabase] SET  READ_WRITE 
GO
