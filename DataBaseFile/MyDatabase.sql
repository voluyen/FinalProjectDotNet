USE [master]
GO

USE master;
GO
ALTER DATABASE [MyDatabase]
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE [MyDatabase];
/****** Object:  Database [MyDatabase]    Script Date: 2/27/2024 7:45:50 AM ******/
CREATE DATABASE [MyDatabase]
 CONTAINMENT = NONE
GO
ALTER DATABASE [MyDatabase] SET COMPATIBILITY_LEVEL = 160
GO

USE [MyDatabase]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 2/27/2024 7:45:50 AM ******/
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
/****** Object:  Table [dbo].[Candidates]    Script Date: 2/27/2024 7:45:50 AM ******/
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
/****** Object:  Table [dbo].[Categorys]    Script Date: 2/27/2024 7:45:50 AM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 2/27/2024 7:45:50 AM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 2/27/2024 7:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiters]    Script Date: 2/27/2024 7:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiters](
	[id] [int] NOT NULL,
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

USE [MyDatabase];

-- Add data to [dbo].[Categorys] table
INSERT INTO [dbo].[Categorys] (name)
VALUES
('IT'),
('Data Science'),
('Business Analyst'),
('Database Administration'),
('Web Development');


-- Add data to [dbo].[Recruiters] table
INSERT INTO [dbo].[Recruiters] (name, email, company, location)
VALUES
('Recruiter A', 'recruiterA@email.com', 'Company A', 'City X'),
('Recruiter B', 'recruiterB@email.com', 'Company B', 'City Y'),
('Recruiter C', 'recruiterC@email.com', 'Company C', 'City Z'),
('Recruiter D', 'recruiterD@email.com', 'Company D', 'City W'),
('Recruiter E', 'recruiterE@email.com', 'Company E', 'City V');

-- Add data to [dbo].[Candidates] table
INSERT INTO [dbo].[Candidates] (name, email, phone, resume, skills, experience)
VALUES
('John Doe', 'john.doe@email.com', '123-456-7890', 'Resume content', 'SQL, Python', '5 years experience'),
('Jane Smith', 'jane.smith@email.com', '987-654-3210', 'Resume content', 'Java, JavaScript', '3 years experience'),
('Bob Johnson', 'bob.johnson@email.com', '555-123-4567', 'Resume content', 'C#, .NET', '7 years experience'),
('Alice Brown', 'alice.brown@email.com', '111-222-3333', 'Resume content', 'PHP, HTML, CSS', '4 years experience'),
('Charlie White', 'charlie.white@email.com', '999-888-7777', 'Resume content', 'Ruby, Rails', '2 years experience');

-- Add data to [dbo].[Jobs] table
INSERT INTO [dbo].[Jobs] (title, description, id_category, location, salary, date_posted, is_active, id_recruiter)
VALUES
('Software Developer', 'Job description', 1, 'City A', 80000, GETDATE(), 1, 1),
('Data Scientist', 'Job description', 2, 'City B', 90000, GETDATE(), 1, 2),
('System Analyst', 'Job description', 1, 'City C', 75000, GETDATE(), 1, 1),
('Database Administrator', 'Job description', 1, 'City D', 85000, GETDATE(), 1, 2),
('Web Developer', 'Job description', 2, 'City E', 70000, GETDATE(), 1, 1);

-- Add data to [dbo].[Applications] table
INSERT INTO [dbo].[Applications] (job_id, candidate_id, cover_letter, date)
VALUES
(1, 1, 'Cover letter content', GETDATE()),
(2, 2, 'Cover letter content', GETDATE()),
(3, 3, 'Cover letter content', GETDATE()),
(4, 4, 'Cover letter content', GETDATE()),
(5, 5, 'Cover letter content', GETDATE());
GO
SET IDENTITY_INSERT [dbo].[menu] ON 
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Home', NULL, N'home', 1, 2, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Service', NULL, N'services', 1, 3, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Job', NULL, N'jobs', 1, 4, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Events', NULL, N'events', 1, 5, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Professional', NULL, N'professional', 1, 6, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (6, N'Contact', NULL, N'contact', 1, 7, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[menu] OFF
GO
