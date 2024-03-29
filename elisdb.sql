USE [master]
GO
/****** Object:  Database [eLIS]    Script Date: 2/16/2024 2:07:07 PM ******/
CREATE DATABASE [eLIS]
GO
ALTER DATABASE [eLIS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eLIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eLIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eLIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eLIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eLIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eLIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [eLIS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eLIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eLIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eLIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eLIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eLIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eLIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eLIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eLIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eLIS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eLIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eLIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eLIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eLIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eLIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eLIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eLIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eLIS] SET RECOVERY FULL 
GO
ALTER DATABASE [eLIS] SET  MULTI_USER 
GO
ALTER DATABASE [eLIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eLIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eLIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eLIS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eLIS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eLIS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eLIS', N'ON'
GO
ALTER DATABASE [eLIS] SET QUERY_STORE = ON
GO
ALTER DATABASE [eLIS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [eLIS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [text] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link] [text] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [text] NULL,
	[contact_email] [varchar](50) NULL,
	[contact_phone] [varchar](20) NULL,
	[address] [text] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [text] NULL,
	[link] [text] NOT NULL,
	[duration] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
	[provider_id] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCategory]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_CourseCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [text] NULL,
	[origin_url] [varchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registed]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[company_id] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Registed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rollnumber] [varchar](50) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[hiredate] [datetime] NOT NULL,
	[address] [text] NOT NULL,
	[role] [varchar](50) NOT NULL,
	[is_active] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[company_id] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCourse]    Script Date: 2/16/2024 2:07:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCourse](
	[user_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[year] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[course_type] [varchar](50) NOT NULL,
	[submit_status] [varchar](50) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[certificate_id] [int] NULL,
 CONSTRAINT [PK_UserCourse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_User]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Provider] FOREIGN KEY([provider_id])
REFERENCES [dbo].[Provider] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Provider]
GO
ALTER TABLE [dbo].[CourseCategory]  WITH CHECK ADD  CONSTRAINT [FK_CourseCategory_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[CourseCategory] CHECK CONSTRAINT [FK_CourseCategory_Category]
GO
ALTER TABLE [dbo].[CourseCategory]  WITH CHECK ADD  CONSTRAINT [FK_CourseCategory_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[CourseCategory] CHECK CONSTRAINT [FK_CourseCategory_Course]
GO
ALTER TABLE [dbo].[Registed]  WITH CHECK ADD  CONSTRAINT [FK_Registed_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Registed] CHECK CONSTRAINT [FK_Registed_Company]
GO
ALTER TABLE [dbo].[Registed]  WITH CHECK ADD  CONSTRAINT [FK_Registed_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Registed] CHECK CONSTRAINT [FK_Registed_Course]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Company]
GO
ALTER TABLE [dbo].[UserCourse]  WITH CHECK ADD  CONSTRAINT [FK_UserCourse_Certificate] FOREIGN KEY([certificate_id])
REFERENCES [dbo].[Certificate] ([id])
GO
ALTER TABLE [dbo].[UserCourse] CHECK CONSTRAINT [FK_UserCourse_Certificate]
GO
ALTER TABLE [dbo].[UserCourse]  WITH CHECK ADD  CONSTRAINT [FK_UserCourse_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[UserCourse] CHECK CONSTRAINT [FK_UserCourse_Course]
GO
ALTER TABLE [dbo].[UserCourse]  WITH CHECK ADD  CONSTRAINT [FK_UserCourse_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UserCourse] CHECK CONSTRAINT [FK_UserCourse_User]
GO
USE [master]
GO
ALTER DATABASE [eLIS] SET  READ_WRITE 
GO
