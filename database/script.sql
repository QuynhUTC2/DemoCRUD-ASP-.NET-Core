USE [DemoCRUD]
GO
/****** Object:  Table [dbo].[tbl_Employee1]    Script Date: 3/22/2021 2:19:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employee1](
	[Sr_no] [int] IDENTITY(1,1) NOT NULL,
	[Emp_name] [nchar](10) NOT NULL,
	[City] [nchar](10) NULL,
	[STATE] [nchar](10) NULL,
	[Country] [nchar](10) NULL,
	[Deparment] [nchar](10) NULL,
	[Flag] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_Employee1] PRIMARY KEY CLUSTERED 
(
	[Sr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee1] ON 

INSERT [dbo].[tbl_Employee1] ([Sr_no], [Emp_name], [City], [STATE], [Country], [Deparment], [Flag]) VALUES (1, N'Quynh     ', N'Phan Rang ', N'Ninh Thuan', N'Viet nam  ', N'12546     ', NULL)
INSERT [dbo].[tbl_Employee1] ([Sr_no], [Emp_name], [City], [STATE], [Country], [Deparment], [Flag]) VALUES (2, N'Quynh     ', N'Hiep Binh Chanh ', N'Thu Duc', N'Viet nam  ', N'6648513     ', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Employee1] OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_Employee]    Script Date: 3/22/2021 2:19:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Employee]
@Sr_no int, @Emp_name nvarchar(500),
@City nvarchar(500), @STATE nvarchar(500),
@Country nvarchar(500), @Department nvarchar(500),
@flag nvarchar(50)

as begin
	if(@flag = 'insert')
	begin
		insert into dbo.tbl_Employee1
		( Emp_name, City, STATE, Country, Deparment)
		values
		(@Emp_name, @City, @STATE, @Country, @Department)
	end

	else if (@flag = 'update')
	begin
		update dbo.tbl_Employee1 set
			Emp_name=@Emp_name, City=@City, STATE=@STATE,
			Country=@Country, Deparment=@Department
		where Sr_no=@Sr_no
	end

	else if( @flag = 'delete')
	begin
		delete from tbl_Employee1
		where Sr_no=@Sr_no
	end

	else if(@flag = 'getid')
	begin
		select * from tbl_Employee1
		where Sr_no=@Sr_no
	end

	else if(@flag = 'get')
	begin
		select * from tbl_Employee1
	end
end
GO
