USE [master]
GO
/****** Object:  Database [UniversityDB]    Script Date: 18-Jan-16 1:39:47 PM ******/
CREATE DATABASE [UniversityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityDB]
GO
/****** Object:  StoredProcedure [dbo].[spAddStudent]    Script Date: 18-Jan-16 1:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddStudent]
@Name nvarchar(50),
@RegNo nvarchar(50),
@Address nvarchar(50),
@Phone nvarchar(50),
@Email nvarchar(50),
@DepartmentId int
AS
BEGIN
INSERT INTO t_Students VALUES(@Name,@RegNo,@Address,@Phone,@Email,@DepartmentId);
END

GO
/****** Object:  StoredProcedure [dbo].[spGetStudentInformationWithDepartment]    Script Date: 18-Jan-16 1:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudentInformationWithDepartment]
AS
BEGIN

SELECT s.Id,s.Name,s.RegNo,s.Address,s.Phone,s.Email,d.Name as Department FROM t_Students s INNER JOIN t_Departments d ON s.DepartmentId=d.DepartmentId
END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateStudentInformation]    Script Date: 18-Jan-16 1:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateStudentInformation]
@StudentId int,
@Name nvarchar(50),
@RegNo nvarchar(50),
@Address nvarchar(50),
@Phone nvarchar(50),
@Email nvarchar(50)
AS
BEGIN 
UPDATE t_Students SET Name=@Name,RegNo=@RegNo,Address=@Address,Phone=@Phone,Email=@Email WHERE Id=@StudentId
END

GO
/****** Object:  StoredProcedure [dbo].[stDeleteStudentInforamtion]    Script Date: 18-Jan-16 1:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[stDeleteStudentInforamtion]
@StudentId int
AS
BEGIN
DELETE FROM t_Students WHERE Id=@StudentId	
END

GO
/****** Object:  Table [dbo].[t_Departments]    Script Date: 18-Jan-16 1:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Students]    Script Date: 18-Jan-16 1:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[RegNo] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_t_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[t_Departments] ON 

INSERT [dbo].[t_Departments] ([DepartmentId], [Code], [Name]) VALUES (1, N'14', N'CSE')
INSERT [dbo].[t_Departments] ([DepartmentId], [Code], [Name]) VALUES (2, N'15', N'ICE')
INSERT [dbo].[t_Departments] ([DepartmentId], [Code], [Name]) VALUES (3, N'16', N'AECE')
SET IDENTITY_INSERT [dbo].[t_Departments] OFF
SET IDENTITY_INSERT [dbo].[t_Students] ON 

INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (3, N'Md.Abdus Salam', N'1156', N'Nilphamari', N'01520102680', N'salamcseiu21@gmail.com', 1)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (4, N'Mizanur Rahman', N'1153', N'Kurigram', N'017584625', N'mizan@gmail.com', 2)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (5, N'Jabir Hasan', N'1165', N'Cuyadanga', N'1258479633', N'jabir@gamil.com', 3)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (7, N'Noyon Miah', N'2584', N'Nilphamari', N'25843699', N'abdussalamcseiu10@gmail.com', 1)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (8, N'Noyon Miah', N'3695', N'Nilphamari', N'01740147407', N'noyon@gmail.com', 1)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (9, N'Shohana Khatun', N'1669', N'Dhaka', N'01724587485', N'sohana@gmail.com', 3)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (10, N'Sharmin Naher', N'1157', N'Kushtia', N'01724587485', N'putulcse@yahoo.com', 1)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (11, N'Saurave Haque', N'1198', N'Naogon', N'01724587485', N'sauravecse@gmail.com', 3)
INSERT [dbo].[t_Students] ([Id], [Name], [RegNo], [Address], [Phone], [Email], [DepartmentId]) VALUES (12, N'Kamal Hossain', N'1234', N'Meherpur', N'322', N'kamalcse@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[t_Students] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_Departments]    Script Date: 18-Jan-16 1:39:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_Departments] ON [dbo].[t_Departments]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_Departments_1]    Script Date: 18-Jan-16 1:39:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_Departments_1] ON [dbo].[t_Departments]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_Students]    Script Date: 18-Jan-16 1:39:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_Students] ON [dbo].[t_Students]
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Students]  WITH CHECK ADD  CONSTRAINT [FK_t_Students_t_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[t_Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[t_Students] CHECK CONSTRAINT [FK_t_Students_t_Departments]
GO
USE [master]
GO
ALTER DATABASE [UniversityDB] SET  READ_WRITE 
GO
