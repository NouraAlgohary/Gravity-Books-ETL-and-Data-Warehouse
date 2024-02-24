USE [DWH_Gravity_Books]
GO

/****** Object:  Table [dbo].[DimBook]    Script Date: 1/17/2024 9:01:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimBook](
	[book_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[book_id_BK] [int] NOT NULL,
	[title] [varchar](400) NULL,
	[isbn13] [varchar](13) NULL,
	[num_pages] [int] NULL,
	[publication_date] [date] NULL,
	[language_code] [varchar](8) NULL,
	[language_name] [varchar](50) NULL,
	[publisher_name] [varchar](400) NULL,
	[author_name] [varchar](400) NULL,
	[source_system_code] [tinyint] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
	[language_id] [int] NULL,
	[author_id] [int] NULL,
	[publisher_id] [int] NULL,
 CONSTRAINT [PK_DimBook] PRIMARY KEY CLUSTERED 
(
	[book_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


