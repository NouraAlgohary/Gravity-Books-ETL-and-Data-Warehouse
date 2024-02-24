USE [DWH_Gravity_Books]
GO

/****** Object:  Table [dbo].[FactOrder]    Script Date: 1/18/2024 7:36:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactOrder](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[orderBK] [int] NULL,
	[lineBK] [int] NULL,
	[bookSK] [int] NULL,
	[customerSK] [int] NULL,
	[shippingMethodSK] [int] NULL,
	[DateSK] [int] NULL,
	[books_price] [decimal](5, 2) NULL,
	[shipping_cost] [decimal](5, 2) NULL,
	[OrderReceivedDate] [datetime] NULL,
	[OrderReceived] [varchar](20) NULL,
	[PendingDeliveryDate] [datetime] NULL,
	[PendingDelivery] [varchar](20) NULL,
	[DeliveryInProgressDate] [datetime] NULL,
	[DeliveryInProgress] [varchar](20) NULL,
	[DeliveredDate] [datetime] NULL,
	[Delivered] [varchar](20) NULL,
	[CancelledDate] [datetime] NULL,
	[Cancelled] [varchar](20) NULL,
	[ReturnedDate] [datetime] NULL,
	[Returned] [varchar](20) NULL,
	[source_system_code] [tinyint] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_FactOrder] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactOrder] ADD  CONSTRAINT [DF_FactOrder_created_at]  DEFAULT (getdate()) FOR [created_at]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_FactOrder_DimBook] FOREIGN KEY([bookSK])
REFERENCES [dbo].[DimBook] ([book_id_SK])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_FactOrder_DimBook]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_FactOrder_DimCustomer] FOREIGN KEY([customerSK])
REFERENCES [dbo].[DimCustomer] ([customerSK])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_FactOrder_DimCustomer]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_FactOrder_DimDate] FOREIGN KEY([DateSK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_FactOrder_DimDate]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_FactOrder_DimShippingMethod] FOREIGN KEY([shippingMethodSK])
REFERENCES [dbo].[DimShippingMethod] ([methodSK])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_FactOrder_DimShippingMethod]
GO


