USE [master]
GO
/****** Object:  Database [Silownia]    Script Date: 04.01.2025 18:38:06 ******/
CREATE DATABASE [Silownia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bibilioteka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bibilioteka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bibilioteka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bibilioteka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Silownia] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Silownia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Silownia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Silownia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Silownia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Silownia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Silownia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Silownia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Silownia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Silownia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Silownia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Silownia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Silownia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Silownia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Silownia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Silownia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Silownia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Silownia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Silownia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Silownia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Silownia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Silownia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Silownia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Silownia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Silownia] SET RECOVERY FULL 
GO
ALTER DATABASE [Silownia] SET  MULTI_USER 
GO
ALTER DATABASE [Silownia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Silownia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Silownia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Silownia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Silownia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Silownia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Silownia', N'ON'
GO
ALTER DATABASE [Silownia] SET QUERY_STORE = ON
GO
ALTER DATABASE [Silownia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Silownia]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 04.01.2025 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NULL,
	[TrainerID] [int] NULL,
	[Schedule] [datetime] NULL,
	[MaxParticipants] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 04.01.2025 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 04.01.2025 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[JoinDate] [date] NULL,
	[MembershipType] [varchar](90) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 04.01.2025 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NULL,
	[PaymentAmount] [decimal](10, 2) NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentMethod] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerRatings]    Script Date: 04.01.2025 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerRatings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[TrainerID] [int] NULL,
	[MemberID] [int] NULL,
	[Rating] [int] NULL,
	[RatingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 04.01.2025 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[TrainerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Specialization] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([TrainerID])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Member]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[TrainerRatings]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[TrainerRatings]  WITH CHECK ADD FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([TrainerID])
GO
USE [master]
GO
ALTER DATABASE [Silownia] SET  READ_WRITE 
GO
