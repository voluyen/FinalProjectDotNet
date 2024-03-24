USE [master]
GO
/****** Object:  Database [MyDatabase]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[AboutUs]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Applications]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[BannerBottom]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Banners]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Candidates]    Script Date: 3/25/2024 1:00:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](max) NOT NULL,
	[resume] [nvarchar](max) NOT NULL,
	[skills] [nvarchar](max) NOT NULL,
	[experience] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Candidates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 3/25/2024 1:00:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Events]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Follows]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 3/25/2024 1:00:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[id_category] [int] NOT NULL,
	[location] [nvarchar](max) NOT NULL,
	[salary] [decimal](18, 0) NOT NULL,
	[date_posted] [datetime] NOT NULL,
	[is_active] [bit] NOT NULL,
	[id_recruiter] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[MidService]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Recruiters]    Script Date: 3/25/2024 1:00:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[company] [nvarchar](max) NOT NULL,
	[location] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Recruiters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 3/25/2024 1:00:35 AM ******/
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
/****** Object:  Table [dbo].[Testimonials]    Script Date: 3/25/2024 1:00:35 AM ******/
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

INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (1, N'John Doe', N'john.doe@email.com', N'123-456-7890', N'#', N'SQL, Python', N'5 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (2, N'Jane Smith', N'jane.smith@email.com', N'987-654-3210', N'#', N'Java, JavaScript', N'3 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (3, N'Bob Johnson', N'bob.johnson@email.com', N'555-123-4567', N'#', N'C#, .NET', N'7 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (4, N'Alice Brown', N'alice.brown@email.com', N'111-222-3333', N'#', N'PHP, HTML, CSS', N'4 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (5, N'Charlie White', N'charlie.white@email.com', N'999-888-7777', N'#', N'Ruby, Rails', N'2 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (41, N'Michael Johnson', N'michael@example.com', N'0999999999', N'#', N'C#, ASP.NET', N'2 years experience in backend development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (42, N'Emily Davis', N'emily@example.com', N'0999999999', N'#', N'HTML, CSS, JavaScript', N'1 year experience in front-end development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (43, N'Christopher Brown', N'chris@example.com', N'0999999999', N'#', N'PHP, MySQL', N'4 years experience in full-stack development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (44, N'Jessica Wilson', N'jessica@example.com', N'0999999999', N'#', N'React, Node.js', N'3 years experience in MERN stack development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (45, N'Daniel Martinez', N'daniel@example.com', N'0999999999', N'#', N'Swift, iOS development', N'2 years experience in mobile app development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (46, N'Sarah Taylor', N'sarah@example.com', N'0999999999', N'#', N'Ruby on Rails', N'5 years experience in web application development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (47, N'Ryan Garcia', N'ryan@example.com', N'0999999999', N'#', N'Angular, TypeScript', N'3 years experience in frontend development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (48, N'Olivia Lopez', N'olivia@example.com', N'0999999999', N'#', N'Vue.js, Vuex', N'2 years experience in Vue.js development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (49, N'Ethan Lee', N'ethan@example.com', N'0999999999', N'#', N'Django, Flask', N'4 years experience in Python web development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (50, N'Ava Harris', N'ava@example.com', N'0999999999', N'#', N'Node.js, Express.js', N'3 years experience in backend development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (51, N'Noah Clark', N'noah@example.com', N'0999999999', N'#', N'Java Spring, Hibernate', N'2 years experience in Java enterprise development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (52, N'Sophia Lewis', N'sophia@example.com', N'0999999999', N'#', N'ASP.NET Core, Entity Framework', N'3 years experience in .NET development')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (53, N'Logan King', N'logan@example.com', N'0999999999', N'#', N'React Native, Redux', N'2 years experience in mobile app development')
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

INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (30, N'Machine Learning Engineer', N'Job 1 Description', 1, N'Thành phố Hồ Chí Minh', CAST(50000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 31)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (31, N'Data Scientist', N'Job 2 Description', 2, N'Thành phố Hồ Chí Minh', CAST(60000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 32)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (32, N'IT Recruiter ', N'Job 3 Description', 3, N'Đà Nẵng', CAST(70000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 33)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (33, N'Python developer', N'Job 4 Description', 4, N'Hà Nội', CAST(80000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 34)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (34, N'Data Engineer', N'Job 5 Description', 5, N'Thành phố Hồ Chí Minh', CAST(90000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 35)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (35, N'Software Engineer', N'Job 6 Description', 41, N'Hà Nội', CAST(55000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 31)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (36, N'IT Engineer', N'Job 7 Description', 42, N'Cần Thơ', CAST(65000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 32)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (37, N'Job 8 Title', N'Job 8 Description', 43, N'Đà Nẵng', CAST(75000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 33)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (38, N'Job 9 Title', N'Job 9 Description', 44, N'Thành phố Hồ Chí Minh', CAST(85000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 34)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (39, N'Job 10 Title', N'Job 10 Description', 45, N'Location 10', CAST(95000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 35)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (40, N'Job 11 Title', N'Job 11 Description', 46, N'Location 11', CAST(60000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 31)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (41, N'Job 12 Title', N'Job 12 Description', 47, N'Location 12', CAST(70000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 32)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (42, N'Job 13 Title', N'Job 13 Description', 48, N'Location 13', CAST(80000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 33)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (43, N'Job 14 Title', N'Job 14 Description', 49, N'Location 14', CAST(90000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 34)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (44, N'Job 15 Title', N'Job 15 Description', 50, N'Location 15', CAST(100000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 35)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (45, N'Job 16 Title', N'Job 16 Description', 1, N'Location 16', CAST(55000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 31)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (46, N'Job 17 Title', N'Job 17 Description', 2, N'Location 17', CAST(65000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 32)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (47, N'Job 18 Title', N'Job 18 Description', 3, N'Location 18', CAST(75000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 33)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (48, N'Job 19 Title', N'Job 19 Description', 4, N'Location 19', CAST(85000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 34)
INSERT [dbo].[Jobs] ([id], [title], [description], [id_category], [location], [salary], [date_posted], [is_active], [id_recruiter]) VALUES (49, N'Job 20 Title', N'Job 20 Description', 5, N'Location 20', CAST(95000 AS Decimal(18, 0)), CAST(N'2024-03-24T23:43:11.443' AS DateTime), 1, 35)
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

INSERT [dbo].[Recruiters] ([id], [name], [email], [company], [location]) VALUES (31, N'Recruiter A', N'recruiterA@email.com', N'Company A', N'City X')
INSERT [dbo].[Recruiters] ([id], [name], [email], [company], [location]) VALUES (32, N'Recruiter B', N'recruiterB@email.com', N'Company B', N'City Y')
INSERT [dbo].[Recruiters] ([id], [name], [email], [company], [location]) VALUES (33, N'Recruiter C', N'recruiterC@email.com', N'Company C', N'City Z')
INSERT [dbo].[Recruiters] ([id], [name], [email], [company], [location]) VALUES (34, N'Recruiter D', N'recruiterD@email.com', N'Company D', N'City W')
INSERT [dbo].[Recruiters] ([id], [name], [email], [company], [location]) VALUES (35, N'Recruiter E', N'recruiterE@email.com', N'Company E', N'City V')
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
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Candidates] FOREIGN KEY([candidate_id])
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
USE [master]
GO
ALTER DATABASE [MyDatabase] SET  READ_WRITE 
GO
