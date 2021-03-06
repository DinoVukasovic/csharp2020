USE [Posudba]
GO
/****** Object:  Table [dbo].[Cd_Dvd]    Script Date: 3/28/2020 1:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cd_Dvd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](50) NOT NULL,
	[vrsta] [bit] NOT NULL,
 CONSTRAINT [PK_Cd_Dvd] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posudbe]    Script Date: 3/28/2020 1:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posudbe](
	[prijatelji_id] [int] NOT NULL,
	[cd_dvd_id] [int] NOT NULL,
	[datum_posudbe] [date] NOT NULL,
	[datum_povratka] [date] NULL,
 CONSTRAINT [PK_Posudbe] PRIMARY KEY CLUSTERED 
(
	[prijatelji_id] ASC,
	[cd_dvd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prijatelji]    Script Date: 3/28/2020 1:05:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prijatelji](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NULL,
	[prezime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Prijatelji] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Posudbe]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Cd_Dvd] FOREIGN KEY([cd_dvd_id])
REFERENCES [dbo].[Cd_Dvd] ([id])
GO
ALTER TABLE [dbo].[Posudbe] CHECK CONSTRAINT [FK_Posudbe_Cd_Dvd]
GO
ALTER TABLE [dbo].[Posudbe]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Prijatelji] FOREIGN KEY([prijatelji_id])
REFERENCES [dbo].[Prijatelji] ([id])
GO
ALTER TABLE [dbo].[Posudbe] CHECK CONSTRAINT [FK_Posudbe_Prijatelji]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DVD=0 CD=1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cd_Dvd', @level2type=N'COLUMN',@level2name=N'vrsta'
GO
