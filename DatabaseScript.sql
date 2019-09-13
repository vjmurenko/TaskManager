USE [TaskManager]
GO
/****** Object:  Table [dbo].[Complexity]    Script Date: 13.09.2019 8:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complexity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NOT NULL,
 CONSTRAINT [PK_Complexity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13.09.2019 8:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Phone] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13.09.2019 8:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Task]    Script Date: 13.09.2019 8:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[ComplexityId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Complexity] ON 

INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (1, 1)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (2, 2)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (3, 3)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (4, 5)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (5, 8)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (6, 13)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (7, 20)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (8, 40)
INSERT [dbo].[Complexity] ([Id], [Name]) VALUES (9, 100)
SET IDENTITY_INSERT [dbo].[Complexity] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Phone]) VALUES (1, N'Иванов  С.П.', N'+71111111111')
INSERT [dbo].[Employee] ([Id], [Name], [Phone]) VALUES (2, N'Петров Г.Д.', N'+72222222222')
INSERT [dbo].[Employee] ([Id], [Name], [Phone]) VALUES (3, N'Гончаров С.С.', N'+73333333333')
INSERT [dbo].[Employee] ([Id], [Name], [Phone]) VALUES (4, N'Сидоров А.Г.', N'+74444444444')
INSERT [dbo].[Employee] ([Id], [Name], [Phone]) VALUES (5, N'Семенов В.Е.', N'+75555555555')
INSERT [dbo].[Employee] ([Id], [Name], [Phone]) VALUES (6, N'Максимов Д.И.', N'+79999999999')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Not started')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'In process')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Completed')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (4, N'Postponed')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (1, N'Cook', N'dinner', 2, CAST(N'2019-03-14' AS Date), CAST(N'2019-03-15' AS Date), 2, 4)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (2, N'Cook', N'breakfast', 4, CAST(N'2019-04-15' AS Date), CAST(N'2019-04-16' AS Date), 4, 1)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (3, N'Wash', N'plates', 5, CAST(N'2019-05-16' AS Date), CAST(N'2019-05-17' AS Date), 5, 2)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (4, N'Clean', N'House', 7, CAST(N'2019-05-01' AS Date), CAST(N'2019-05-05' AS Date), 1, 3)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (5, N'Dry', N'Dry all clothes', 3, CAST(N'2019-05-04' AS Date), CAST(N'2019-05-08' AS Date), 6, 3)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (6, N'Clean', N'Wipe off the dust', 4, CAST(N'2019-06-03' AS Date), CAST(N'2019-06-29' AS Date), 4, 2)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (7, N'Check', N'homework', 1, CAST(N'2019-06-06' AS Date), CAST(N'2019-06-08' AS Date), 3, 4)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (8, N'Read', N'Re-read books', 4, CAST(N'2019-03-01' AS Date), CAST(N'2019-03-05' AS Date), 3, 4)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (9, N'Write', N'letters', 3, CAST(N'2019-04-05' AS Date), CAST(N'2019-05-01' AS Date), 3, 1)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (11, N'Write', N'book', 7, CAST(N'2019-04-05' AS Date), CAST(N'2019-12-12' AS Date), 3, 3)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (12, N'Dry', N'clothes', 4, CAST(N'2019-01-01' AS Date), CAST(N'2019-04-02' AS Date), 4, 3)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (13, N'Ride', N'bike', 1, CAST(N'2019-01-02' AS Date), CAST(N'2019-02-03' AS Date), 2, 1)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (15, N'Wash', N'dishes', 5, CAST(N'2019-04-03' AS Date), CAST(N'2019-05-03' AS Date), 3, 2)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (16, N'Get', N'money', 2, CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), 4, 3)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (17, N'Get', N'task', 1, CAST(N'2019-02-01' AS Date), CAST(N'2019-02-04' AS Date), 4, 1)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (18, N'Receive', N'letter', 1, CAST(N'2019-03-03' AS Date), CAST(N'2019-04-02' AS Date), 5, 3)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (19, N'Give', N'car', 5, CAST(N'2019-05-02' AS Date), CAST(N'2019-06-03' AS Date), 6, 1)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (20, N'Send', N'email', 2, CAST(N'2019-06-03' AS Date), CAST(N'2019-07-04' AS Date), 3, 1)
INSERT [dbo].[Task] ([Id], [Name], [Description], [ComplexityId], [StartDate], [EndDate], [EmployeeId], [StatusId]) VALUES (21, N'Clean', N'Shoes', 1, CAST(N'2019-09-22' AS Date), CAST(N'2019-09-21' AS Date), 6, 3)
SET IDENTITY_INSERT [dbo].[Task] OFF
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Complexity] FOREIGN KEY([ComplexityId])
REFERENCES [dbo].[Complexity] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Complexity]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Employee]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Status]
GO
