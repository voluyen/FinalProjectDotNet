-- SQLINES DEMO *** rated by MySQL Workbench
-- SQLINES DEMO *** 13 2024
-- SQLINES DEMO ***    Version: 1.0
-- SQLINES DEMO *** orward Engineering

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'; */

-- SQLINES DEMO *** ------------------------------------
-- Sc... SQLINES DEMO ***
-- SQLINES DEMO *** ------------------------------------

-- SQLINES DEMO *** ------------------------------------
-- Sc... SQLINES DEMO ***
-- SQLINES DEMO *** ------------------------------------
USE master;
go
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'mydb')
BEGIN
    CREATE DATABASE mydb;
END;
go
USE mydb;
go

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** egorys`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE dbo.Categorys (
  id INT NOT NULL IDENTITY,
  name NVARCHAR(45) NULL,
  PRIMARY KEY (id)
);

go
-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ruiters`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE dbo.Recruiters (
  id INT NOT NULL IDENTITY,
  name NVARCHAR(45) NOT NULL,
  email NVARCHAR(45) NOT NULL,
  company NVARCHAR(45) NOT NULL,
  location NVARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT email_UNIQUE UNIQUE (email ASC)
);
go

-- SQLINES DEMO *** ------------------------------------
-- Ta... SQLINES DEMO ***
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE dbo.Jobs (
  id INT NOT NULL IDENTITY,
  title NVARCHAR(45) NOT NULL,
  description NVARCHAR(45) NOT NULL,
  id_category INT NOT NULL,
  location NVARCHAR(45) NOT NULL,
  salary DECIMAL(18, 2) NOT NULL,
  date_posted DATETIME2(0) NOT NULL,
  is_active BIT NOT NULL,
  recruiter_id INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Jobs_Categorys FOREIGN KEY (id_category)
    REFERENCES dbo.Categorys (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Jobs_Recruiters FOREIGN KEY (recruiter_id)
    REFERENCES dbo.Recruiters (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

go
-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** didates`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE dbo.Candidates (
  id INT NOT NULL IDENTITY,
  name NVARCHAR(45) NOT NULL,
  email NVARCHAR(45) NOT NULL,
  phone NVARCHAR(45) NOT NULL,
  resume NVARCHAR(45) NULL,
  skills NVARCHAR(45) NULL,
  experience NVARCHAR(45) NULL,
  PRIMARY KEY (id),
  CONSTRAINT email_unique_constraint UNIQUE (email ASC),
  CONSTRAINT phone_unique_constraint UNIQUE (phone ASC)
);

go
-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** lications`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE dbo.Applications (
  id INT NOT NULL IDENTITY,
  job_id INT NOT NULL,
  candidate_id INT NOT NULL,
  cover_letter NVARCHAR(45) NOT NULL,
  date DATETIME2(0) NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Applications_Jobs FOREIGN KEY (job_id)
    REFERENCES dbo.Jobs (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Applications_Candidates FOREIGN KEY (candidate_id)
    REFERENCES dbo.Candidates (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
GO
/****** Object:  Table [dbo].[menu]    Script Date: 02/04/2018 3:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go
CREATE INDEX job_idx ON dbo.Applications (job_id ASC);
CREATE INDEX candidate_idx ON dbo.Applications (candidate_id ASC);

go
/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */


INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Home', NULL, N'home', 1, 2, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Service', NULL, N'services', 1, 3, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Job', NULL, N'jobs', 1, 4, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Events', NULL, N'events', 1, 5, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Professional', NULL, N'professional', 1, 6, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (6, N'Contact', NULL, N'contact', 1, 7, CAST(N'2018-03-09 00:00:00' AS SmallDateTime))
