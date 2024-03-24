USE [master]
GO
USE [MyDatabase]
GO
/****** Object:  Table [dbo].[AboutUs]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Applications]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[BannerBottom]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Banners]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Candidates]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Categorys]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Follows]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Jobs]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[MidService]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Recruiters]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Services]    Script Date: 3/24/2024 8:35:31 PM ******/
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
/****** Object:  Table [dbo].[Testimonials]    Script Date: 3/24/2024 8:35:31 PM ******/
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

INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (1, N'John Doe', N'john.doe@email.com', N'123-456-7890', N'Resume content', N'SQL, Python', N'5 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (2, N'Jane Smith', N'jane.smith@email.com', N'987-654-3210', N'Resume content', N'Java, JavaScript', N'3 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (3, N'Bob Johnson', N'bob.johnson@email.com', N'555-123-4567', N'Resume content', N'C#, .NET', N'7 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (4, N'Alice Brown', N'alice.brown@email.com', N'111-222-3333', N'Resume content', N'PHP, HTML, CSS', N'4 years experience')
INSERT [dbo].[Candidates] ([id], [name], [email], [phone], [resume], [skills], [experience]) VALUES (5, N'Charlie White', N'charlie.white@email.com', N'999-888-7777', N'Resume content', N'Ruby, Rails', N'2 years experience')
SET IDENTITY_INSERT [dbo].[Candidates] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([id], [name]) VALUES (1, N'IT')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (2, N'Data Science')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (3, N'Business Analyst')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (4, N'Database Administration')
INSERT [dbo].[Categorys] ([id], [name]) VALUES (5, N'Web Development')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([id], [type], [info], [icon], [order], [hide]) VALUES (1, N'location', N'Tân Phong, Quận 7, Thành phố Hồ Chí Minh', N'fa fa-map-marker', 1, 0)
INSERT [dbo].[Contacts] ([id], [type], [info], [icon], [order], [hide]) VALUES (2, N'email', N'voluyenpr@gmail.com', N'fa fa-envelope', 2, 0)
INSERT [dbo].[Contacts] ([id], [type], [info], [icon], [order], [hide]) VALUES (3, N'phone number', N'+09187 8088 9436', N'fa fa-phone', 3, 0)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Follows] ON 

INSERT [dbo].[Follows] ([id], [type], [link], [order], [hide], [icon]) VALUES (1, N'Facebook', N'#', 1, 0, N'/Images/facebook.png')
INSERT [dbo].[Follows] ([id], [type], [link], [order], [hide], [icon]) VALUES (2, N'Twitter', N'#', 2, 0, N'/Images/twitter.png')
INSERT [dbo].[Follows] ([id], [type], [link], [order], [hide], [icon]) VALUES (3, N'Instagram', N'#', 3, 0, N'/Images/instagram.png')
SET IDENTITY_INSERT [dbo].[Follows] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Home', N'/home', N'Home Page', 0, 1, CAST(N'2024-03-20T01:05:00' AS SmallDateTime))
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Professional', N'#', N'Professional Page', 0, 4, CAST(N'2024-03-24T00:00:00' AS SmallDateTime))
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
