SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertAccount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertAccount]
	-- Add the parameters for the stored procedure here
@AccountNo varchar(15),@AccountName varchar(50),@AccountTypeId int,@ParentAccountId int,@IsActive bit,@OpeningBalance decimal(18, 2),@CreatedDate varchar(50),@UpdatedBy int,@UpdatedOn varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Account(AccountNo,AccountName,AccountTypeId,ParentAccountId,IsActive,OpeningBalance,CreatedDate,UpdatedBy,UpdatedOn)values(@AccountNo,@AccountName,@AccountTypeId,@ParentAccountId,@IsActive,@OpeningBalance,@CreatedDate,@UpdatedBy,@UpdatedOn)
Select @@Identity
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllInvoiceNo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllInvoiceNo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT InvoiceID From Invoice
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateProduct]
	-- Add the parameters for the stored procedure here
@ProductId int,@Pname nvarchar(150),@size nvarchar(50),@categoryId int,@barcodeId nvarchar(50)
,@sale_Price decimal(18, 0),@purchase_Price decimal(18, 0),@limit int,@discount decimal(18,0)
,@reorderqty int,@qty int,@discounted decimal(18,0),@GST bit

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	
	Update Product Set
	ProductName=@Pname,
	Size_=@size,
	ProductTypeID=@categoryId,
	BarcodeID=@barcodeId,
	sale_Price=@sale_Price,
	purchase_price=@purchase_Price,
	Limit=@limit,
	Discount=@discount,
	ReorderQty=@reorderqty,
	GST=@GST
	Where PID=@ProductId
Update ProductDiscount Set
	Qty=@qty,Discount=@discounted
Where PID=@ProductId

END







' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllDiscountNames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllDiscountNames]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Discount
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertItemLineDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertItemLineDetail]
	-- Add the parameters for the stored procedure here
	@ItemlineID int,
	@SourceID int,
	@DestinatationID int,
	@ProductID int,
	@Quantity int,
	@UnitPrice decimal,
	@StdDiscount decimal,
	@ExDiscount decimal,
	@GST decimal



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into ItemLineDetail (ItemlineID,SourceID,DestinationID,ProductID,Quantity,Unitprice,Stddiscount,Exdiscount,GST)
VALUES (@ItemLineID,@SourceID,@DestinatationID,@ProductID,@Quantity,@UnitPrice,@Stddiscount,@ExDiscount,@Gst)

Select @@Identity
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetProductWithPriceAgainstBarcode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetProductWithPriceAgainstBarcode]
	-- Add the parameters for the stored procedure here
	@barcode varchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductName,sale_price As UnitPrice,Discount from product where BarcodeID=@barcode
END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertPurchaseProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertPurchaseProduct]
	-- Add the parameters for the stored procedure here
	@fkPurId int ,@unitprice decimal(18,0) ,@qty int,@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Insert into PurchaseProducts(PurchaseID,UnitPrice,Quantity,ProductID)Values(@fkPurId,@unitprice,@qty,@ProductId)
Select @@Identity
END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateClient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[UpdateClient] 
	-- Add the parameters for the stored procedure here
	@ClientId int,@ClientName nvarchar(50),@Fax nvarchar(20),@Email nvarchar(20),@ClientTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Update Client Set
[Name]=@ClientName,
Fax=@Fax,
Email=@Email,
CTypeID=@ClientTypeId
Where CID=@ClientId 
END







' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateTotalOfSaleProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateTotalOfSaleProduct]
	-- Add the parameters for the stored procedure here
	@total decimal(18,0),@inv_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Update Invoice Set Total=@total Where InvoiceID=@inv_id
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateVendorType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spUpdateVendorType] 
	-- Add the parameters for the stored procedure here
	@VId int,
	@Vtype nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update VendorType Set
	VendorTypes=@Vtype
	Where VendorTypeId=@VId
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertClient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertClient] 
	-- Add the parameters for the stored procedure here
	@ClientName nvarchar(50),@Fax nvarchar(20),@Email nvarchar(20),@ClientTypeID int,@accountid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO Client([Name],Fax,Email,CTypeID,AccountId)Values(@ClientName,@Fax,@Email,@ClientTypeID,@accountid)
SELECT @@Identity
END








' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteVendorType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spDeleteVendorType] 
	-- Add the parameters for the stored procedure here
	@VId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete From VendorType 
	Where VendorTypeId=@VId
END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertPurchaseDiscountDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertPurchaseDiscountDetail]
	-- Add the parameters for the stored procedure here
@pid int,@PDID int,@DID int,@value decimal(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT into PurchaseDiscountDetail(ProductId,PDID,DID,Valuess)Values(@pid,@PDID,@DID,@value)
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertPurchaseDiscount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertPurchaseDiscount]
	-- Add the parameters for the stored procedure here
@PID int,@DID int,@value decimal(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT into PurchaseDiscount(PID,DID,Valuess)Values(@PID,@DID,@value)
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertINTOInvoiceDiscount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertINTOInvoiceDiscount]
	-- Add the parameters for the stored procedure here
@invoice_id int, @did int, @value decimal(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into InvoiceDiscount(InvoiceID,DID,Amt)values(@invoice_id,@did,@value)
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetSalePriceofSelectedProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSalePriceofSelectedProduct] 
	-- Add the parameters for the stored procedure here
	@pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sale_price from Product where PID=@pid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertInvoiceDiscountDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertInvoiceDiscountDetail]
	-- Add the parameters for the stored procedure here
@pro_id int,@sale_id int,@did int,@value decimal(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Insert into InvoiceDetailDiscount(ProductID,InvoiceID,DID,D_Amt)values(@pro_id,@sale_id,@did,@value)
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetPurchasesFromPurchaseNo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPurchasesFromPurchaseNo] 
	-- Add the parameters for the stored procedure here
	@purchaseno int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT p.vendorid,v.vendorname,pp.productid,ppp.productname,pp.quantity,pp.unitprice,p.paytype,p.total,p.payed,p.due from purchase p,purchaseproducts pp,Vendor v,Product ppp where p.purchaseid=pp.purchaseid and p.vendorid=v.vendorid and pp.productid=ppp.pid and p.purchaseid=28
END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllMake]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetAllMake]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from ProductMake
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetPurchaseNo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[spGetPurchaseNo] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PurchaseID From Purchase
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllClasses]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[spGetAllClasses]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from ProductClass
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllPurchaseProductNo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllPurchaseProductNo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT productid from purchaseproducts
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetPurchaseProductUnitPrice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPurchaseProductUnitPrice] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT unitprice from purchaseproducts
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetPurchasePriceofSelectedProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPurchasePriceofSelectedProduct] 
	-- Add the parameters for the stored procedure here
	@pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT purchase_price from Product where PID=@pid
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTrialBalance]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTrialBalance]
	-- Add the parameters for the stored procedure here
	(@Date datetime)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	


Declare @tb1 Table
(
AccountNo int ,
Dr decimal(18,2),
Cr decimal(18,2)
) 

Insert into @tb1
Select JD.AccountNo,SUM(JD.Dr),SUM(JD.Cr) from JDetail JD where Jd.Date like @Date group by JD.AccountNo

Select tb.AccountNo,Acc.AccountName,
tb.Dr as Dr,tb.Cr as Cr
from @tb1 tb,Account Acc where tb.AccountNo=Acc.AccountNo 



--Select tb.AccountNo,Acc.AccountName,
--''Dr''=Case when Sign(tb.Diff)=1 then tb.Diff else 0 end,
--''Cr''= Case when Sign(tb.Diff)=-1 then (tb.Diff*-1) else 0 end 
--from @tb1 tb,Account Acc where tb.AccountNo=Acc.AccountNo 
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getincome]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[getincome]
AS
select sum(dr),sum(cr),jdetail.accountno
from jdetail
join account on account.accountno=jdetail.accountno
join accounttype on accounttype.accounttypeid=account.accounttypeid
where accounttype.isincome=1
group by jdetail.accountno' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getincomestatement]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getincomestatement]
	-- Add the parameters for the stored procedure here
    @startdate datetime,
	@enddate datetime

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	


Declare @Income Table
(
balance decimal(18,2),
AccountName varchar(50),
AccountType varchar(50)
)

insert into @Income
Select Sum(JD.Cr)-Sum(JD.Dr) as ''Balance'',accountname,accounttype  from Jdetail JD
inner join Account A on A.AccountNo=JD.AccountNo
inner join AccountType AT on A.AccountTypeID=AT.AccountTypeID
where (A.AccountTypeID=1001 or A.AccountTypeID=1000) and (JD.Date>=@startdate and JD.Date<=@enddate)
group by a.accountname,at.accounttype

--select * from @Income

Declare  @Expense Table
(
balance decimal(18,2),
AccountName varchar(50),
AccountType varchar(50)
)

Insert into @Expense
Select Sum(JD.Dr)-Sum(JD.Cr) as ''Balance'' ,A.AccountName,AT.AccountType from Jdetail JD
inner join Account A on A.AccountNo=JD.AccountNo
inner join AccountType AT on A.AccountTypeID=AT.AccountTypeID
where (A.AccountTypeID=1002 or A.AccountTypeID=1003) and (JD.date>=@startdate and JD.date<=@enddate)
group by A.AccountName,AT.AccountType

--select * from @expense

Declare  @Cogs Table
(
balance decimal(18,2),
AccountName varchar(50),
AccountType varchar(50)
)

Insert into @Cogs
Select Sum(JD.Dr)-Sum(JD.Cr) as ''Balance'' ,A.AccountName,AT.AccountType from Jdetail JD
inner join Account A on A.AccountNo=JD.AccountNo
inner join AccountType AT on A.AccountTypeID=AT.AccountTypeID
where (A.AccountTypeID=1004) and (JD.date>=@startdate and JD.date<=@enddate)
group by A.AccountName,AT.AccountType

--select * from @Cogs

Declare @Total table
(
balance decimal(18,2),
Accountname varchar(50),
AccountType varchar(50)
)

Insert into @Total
Select * from @Income
UNION ALL 
Select * from @COGS
UNION ALL
Select * from @Expense

Select * from @Total

IF 
(SELECT SIGN(Sum(A)) as ''Net Income''  
FROM 
(SELECT (Select sum(balance) from @Income) AS A   
UNION 
 SELECT (Select -sum(balance) from @Cogs) AS t1
UNION 
 SELECT (Select -sum(balance) from @Expense)) AS t1)=-1
 
(SELECT ''(''+convert(varchar,(Sum(A)*-1))+'')'' as ''Net Income''  
FROM 
(SELECT (Select sum(balance) from @Income) AS A   
UNION 
 SELECT (Select -sum(balance) from @Cogs) AS t1
UNION 
 SELECT (Select -sum(balance) from @Expense)) AS t1)

ELSE

(SELECT Sum(A) as ''Net Income''  
FROM 
(SELECT (Select sum(balance) from @Income) AS A   
UNION 
 SELECT (Select -sum(balance) from @Cogs) AS t1
UNION 
 SELECT (Select -sum(balance) from @Expense)) AS t1)
--Select sum(balance) as ''Net Income'' from @Total
 
END








' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateSaleComplete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateSaleComplete]
	-- Add the parameters for the stored procedure here
@Date nvarchar(50),@Total decimal(18,0),@Payed decimal(18,0),@Due decimal(18,0),@cid int,@InvoiceID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Update Invoice Set Date=@Date,Total=@Total,Payed=@Payed,Due=@Due,CID=@cid
Where InvoiceID=@InvoiceID
END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ledger]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[ledger]
	@startdate datetime,
	@enddate datetime
as 
declare @tab1 table(
Id int NOT NULL IDENTITY (1, 1),
debit decimal(18,2),
date varchar(50),
accountno int,
accountname varchar(50)
)
insert into @tab1
select dr,date,jdetail.accountno,accountname
from Jdetail
join account on account.accountno=jdetail.accountno
where dr<>0 --and date >=@startdate and date<=@enddate
order by accountno,date

declare @tab2 table
(
Id int NOT NULL IDENTITY (1, 1),
credit decimal(18,2),
date varchar(50),
accountno int,
accountname varchar(50)
)
insert into @tab2
select cr,date,jdetail.accountno,accountname
from Jdetail
join account on account.accountno=jdetail.accountno
where cr<>0 --and date >=@startdate and date<=@enddate
order by accountno,date

declare @tab3 table
(
balance decimal(18,2),
accountno int
)
insert into @tab3
select sum(dr-cr),accountno
from jdetail
group by accountno

declare @tab4 table
(
accountno int,
debitbal decimal(18,2),
creditbal decimal(18,2)
)
insert into @tab4
select accountno,
''debitbal''=case when sign(balance)=1
then balance
end,
''creditbal''=case when sign(balance)=-1
then balance*1
end
from @tab3



select * from @tab1 --where accountno=1002
select * from @tab2 --where accountno=1002
select * from @tab4

--Select * from @tab1 t1 right join @tab2 t2
--on t1.id=t2.id   
--where t1.accountno=1002 
	' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateSaleDiscountComplete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateSaleDiscountComplete] 
	-- Add the parameters for the stored procedure here
 @value decimal(18,0),@DID int,@InvoiceID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update InvoiceDiscount Set Amt=@value 
Where InvoiceID=@InvoiceID AND DID=@DID
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updateJDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[updateJDetail] 
	-- Add the parameters for the stored procedure here
@Memo varchar(45),
@Dr decimal,
@Cr decimal,
@Accountno int,
@Jdetailid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Jdetail set Memo=@Memo,AccountNo=@Accountno,Dr=@Dr,Cr=@Cr where Jdetailid=@Jdetailid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetPurchasePriceFromProductID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPurchasePriceFromProductID]  
	-- Add the parameters for the stored procedure here
@productId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT purchase_price from Product where PID=@productId
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetMaxClientId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetMaxClientId] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT max(cid) From client
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertJournalEntryDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertJournalEntryDetail]
	-- Add the parameters for the stored procedure here
@VoucherNo int,@datetme varchar(50),@AccountNo varchar(50),@JEntryId int,@Memo varchar(255),@Dr decimal(18,2),@Cr decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into JDetail(VoucherNo,Date,AccountNo,JEntryId,Memo,Dr,Cr)values(@VoucherNo,@datetme,@AccountNo,@JEntryId,@Memo,@Dr,@Cr)
Select @@Identity 
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertProductDiscount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertProductDiscount]
	-- Add the parameters for the stored procedure here
	@qty int,@discount decimal(18,0),@pid int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into ProductDiscount(Qty,Discount,PID)values(@qty,@discount,@pid)
select @@Identity
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateProductDiscount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateProductDiscount]
	-- Add the parameters for the stored procedure here
@qty int,@discount decimal(18,0),@pid int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Update ProductDiscount Set
	Qty=@qty,
	Discount=@discount
Where PID=@pid
    -- Insert statements for procedure here
	
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertVendorType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertVendorType] 
	-- Add the parameters for the stored procedure here
	@Vtype nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into VendorType(VendorTypes)Values(@Vtype)
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAccountIdFromClient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAccountIdFromClient] 
	-- Add the parameters for the stored procedure here
@ven_id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select a.accountno from client c
	inner join Account A
	on c.accountid=A.accountid
	where CID=@ven_id	
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetBarcodeFromProductId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetBarcodeFromProductId]
	-- Add the parameters for the stored procedure here
	@pid int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT barcodeid from Product where PID=@pid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetDiscountFromProductId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetDiscountFromProductId]
	-- Add the parameters for the stored procedure here
	@pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT discount from product where pid=@pid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertPurchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertPurchase] 
	-- Add the parameters for the stored procedure here
	@Date_ datetime,@VendorID int,@Total decimal(18,0),@Payed decimal(18,0),@Due decimal(18,0),@paytype nvarchar(50),@ref int,@check nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Insert into Purchase(Date,VendorID,Total,Payed,Due,PayType,refno,CheckNo)Values(@Date_,@VendorID,@Total,@Payed,@Due,@paytype,@ref,@check)
	Select @@Identity
END





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetvendorTypes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetvendorTypes] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From VendorType
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllVendorTypesNames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllVendorTypesNames] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT VendorTypes From VendorType
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteVendor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeleteVendor] 
	-- Add the parameters for the stored procedure here
	@VendorId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete From VendorAddress Where VendorId=@VendorId
	Delete From VendorPhone Where VendorId=@VendorId
	Delete From Vendor Where VendorId=@VendorId
END







' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deletevendorinfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[deletevendorinfo]
AS

delete from purchasediscountdetail
delete from purchaseproducts
delete from purchasediscount
delete from purchase
delete from vendoraddress
delete from vendorphone
delete from vendor
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateVendorPhone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spUpdateVendorPhone] 
	-- Add the parameters for the stored procedure here
@VendorId int,@VPhone nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update VendorPhone Set
VendorID=@VendorId,
VendorPhone=@VPhone
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllVendorInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllVendorInformation]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/*select v.VendorName,v.Fax,v.Email,v.Web,vt.VendorTypes,v.VendorId From vendor v,VendorType vt where  v.VendorTypeId=vt.VendorTypeId*/
SELECT     dbo.Vendor.VendorID, dbo.Vendor.VendorName, dbo.VendorPhone.VendorPhone, dbo.VendorAddress.VendorAddress, dbo.Vendor.Fax, dbo.Vendor.Email, 
                      dbo.Vendor.Web, dbo.VendorType.VendorTypes
FROM         dbo.Vendor INNER JOIN
                      dbo.VendorAddress ON dbo.Vendor.VendorID = dbo.VendorAddress.VendorID INNER JOIN
                      dbo.VendorPhone ON dbo.Vendor.VendorID = dbo.VendorPhone.VendorID INNER JOIN
                      dbo.VendorType ON dbo.Vendor.VendorTypeID = dbo.VendorType.VendorTypeID
END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertVendorPhone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertVendorPhone] 
	-- Add the parameters for the stored procedure here
@VendorId int,@VPhone nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO VendorPhone(VendorID,VendorPhone)VALUES(@VendorId,@VPhone)
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteProduct]
	-- Add the parameters for the stored procedure here
@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

Delete from ProductAttribute where PID=@ProductID
Delete from Product_Variant where ProductID=@ProductID
Delete from Product where PID=@ProductID
END










' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertProductVariant]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spInsertProductVariant]
	-- Add the parameters for the stored procedure here
	@ProductID int,@VariantID int,@Quantity decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ProductVariant (ProductID,VariantID,Quantity)
	VALUES (@ProductID,@VariantID,@Quantity)
	Select @@Identity
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteProductVariant]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteProductVariant]
	-- Add the parameters for the stored procedure here
	@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete FROM ProductVariant 
	Where ProductID=@ProductID
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[viewpurchases]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE procedure [dbo].[viewpurchases]
@startdate datetime,
@enddate datetime,
@purchaseid int=null,
@vendorid int=null,
@productid int=null

AS


SELECT     dbo.purchaseproducts.productid,dbo.Product.ProductName, dbo.PurchaseProducts.UnitPrice, dbo.PurchaseProducts.Quantity,convert(varchar(50),dbo.Purchase.Date,107) as ''Date'', dbo.Purchase.Total, 
                      dbo.Purchase.Payed, dbo.Purchase.Due, dbo.Purchase.PurchaseID,dbo.vendor.vendorname,dbo.purchase.vendorid
FROM         dbo.Purchase INNER JOIN
                      dbo.PurchaseProducts ON dbo.Purchase.PurchaseID = dbo.PurchaseProducts.PurchaseID INNER JOIN
                      dbo.Product ON dbo.PurchaseProducts.ProductID = dbo.Product.PID INNER JOIN
						dbo.vendor ON dbo.purchase.vendorid=dbo.vendor.vendorid
where		
	(dbo.purchase.date>=@startdate and dbo.purchase.date<=@enddate)
	and		dbo.purchase.purchaseid=isnull(@purchaseid,dbo.purchase.purchaseid) 
	and		dbo.purchase.vendorid=isnull(@vendorid,dbo.purchase.vendorid) 
	and		dbo.purchaseproducts.productid=isnull(@productid,dbo.purchaseproducts.productid)

order by	dbo.vendor.vendorid,dbo.purchase.purchaseid










' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllProductAttributes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProductAttributes]
	-- Add the parameters for the stored procedure here
	@Pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     dbo.ProductAttribute.AID, dbo.Attribute.Attribute AttributeName, dbo.ProductAttribute.AValue AttributeValue
FROM         dbo.Attribute INNER JOIN
                      dbo.ProductAttribute ON dbo.Attribute.AID = dbo.ProductAttribute.AID
WHERE     (dbo.ProductAttribute.PID = @PID)
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteProductAttribute]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteProductAttribute]
	-- Add the parameters for the stored procedure here
@pid int ,@aid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF NOT EXISTS(Select * From Inventory WHERE ProductID=@pid)
	BEGIN
	DELETE From ProductAttribute Where PID=@pid And AID=@aid
	END
ELSE
	BEGIN
RAISERROR(''This Product cannot be deleted.'',11,1)
	END
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertProductAttributes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertProductAttributes] 
	-- Add the parameters for the stored procedure here
	@aid int ,@pid int ,@Value nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ProductAttribute(AID,PID,AValue)Values(@aid,@pid,@Value)
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateProductAttribute]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateProductAttribute]
	-- Add the parameters for the stored procedure here
	@aid int ,@pid int ,@Value nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here	
	INSERT INTO ProductAttribute(AID,PID,AValue)Values(@aid,@pid,@Value)
END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteAllProductAttribute]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create Procedure [dbo].[spDeleteAllProductAttribute]
@PID int
AS
Delete from ProductAttribute
Where PID=@PID


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertItemLine]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertItemLine]
	-- Add the parameters for the stored procedure here
	@PayTypeID int,
	@Change decimal,
	@Due decimal,
	@ClientID int,
	@VendorID int,
	@Chequeno varchar(50),
	@Remarks varchar(50),
	@ItemLineTypeID int,
	@StdDiscount decimal,
	@ExDiscount decimal,
	@Gst decimal,
	@Closedatetime datetime,
	@Opendatetime datetime,
	@Total decimal,
	@Payed decimal,
	@Closed bit


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into ItemLine (PayTypeID,Total,Payed,Change,Due,ClientID,VendorID,Chequeno,Remarks,ItemlineTypeID,StdDiscount,ExDiscount,GST,CloseDatetime,OpenDatetime,Closed)
VALUES (@PayTypeID,@Total,@Payed,@Change,@Due,@ClientID,@VendorID,@Chequeno,@Remarks,@ItemLineTypeID,@StdDiscount,@ExDiscount,@GST,@Closedatetime,@Opendatetime,@Closed)
Select @@Identity
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewAllSales]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ViewAllSales]
	@ItemLineTypeID int=null,
	@Username varchar(50)=null,
	@Name varchar(50)=null,
	@TotalAmount decimal=null,
	@Change decimal=null,
	@Paid decimal=null,
	@Client varchar(50)=null,
	@OpenDatetime datetime=null,
	@CloseDatetime datetime=null,
	@Location varchar(50)=null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT DISTINCT    
Itemline.ItemLineID AS InvoiceID,
ROUND (Itemline.Total,2) AS [Total Amount], 
ROUND (Itemline.Change,2) AS [Change], 
ROUND (Itemline.Payed,2) AS Paid, 
Client.Name AS Client, 
Itemline.OpenDatetime, 
Itemline.CloseDatetime, 
Users.UserName, 
Location.Name
FROM    
Client INNER JOIN Itemline ON Client.ClientID = Itemline.ClientID  AND Client.[Name] like ISNULL(@Client,Client.Name)
INNER JOIN  ItemlineDetail ON Itemline.ItemLineID = ItemlineDetail.ItemLineID 
RIGHT JOIN  Users ON Itemline.CreatedBy = Users.UID  AND Users.Username like ISNULL(@Username,Users.Username)
INNER JOIN  Location ON ItemlineDetail.SourceID = Location.LocationID AND Location.Name like ISNULL(@Location,Location.Name)
INNER JOIN ItemLineType on Itemline.ItemlineTypeID=ItemLineType.ItemlineTypeID 
WHERE ItemlineType.ItemlineTypeid=1 

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetBalanceSheet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBalanceSheet] 
	-- Add the parameters for the stored procedure here
	@startdate datetime,
	@enddate datetime
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare  @tb1 Table
(
AccountNo varchar(20),
DB decimal (18,2),
CR decimal (18,2)
)
Declare  @tb2 Table
(
AccountNo varchar(20),
AccountName varchar(50),
Bal decimal (18,2)
)
Declare  @tb3 Table
(
AccountNo varchar(20),
AccountName varchar(50),
AccountTypeid int,
AccountType varchar(50),
AccountTypeD varchar(50),
Bal decimal (18,2)
)

Insert into @tb1
Select JDetail.AccountNo,Sum(Jdetail.Dr),Sum(JDetail.Cr)
 from JDetail 
where JDetail.date >=@startdate and Jdetail.date <=@enddate
 Group by JDetail.AccountNo

Insert into @tb2
Select t.AccountNo,Acc.AccountName,(t.DB-t.CR)
from @tb1 t,Account  Acc where Acc.AccountNo=t.AccountNo 
and Acc.AccountTypeid>=1005 and Acc.AccountTypeid<=1010
UNION ALL
Select t.AccountNo,Acc.AccountName,(t.Cr-t.DB)
from @tb1 t,Account  Acc where Acc.AccountNo=t.AccountNo 
and Acc.AccountTypeid>=1011 and Acc.AccountTypeid<=1015


Insert into @tb3
Select t.AccountNo,t.AccountName,Act.AccountTypeid,Act.AccountType,Act.Detail,t.Bal 
from @tb2 t,AccountType Act,Account Acc
 where t.AccountNo=Acc.AccountNo and Acc.AccountTypeId=Act.AccountTypeId and Act.IsIncome<>1

Update  @tb3 set bal=(bal)
where accounttypeid=1015

 

IF EXISTS(Select 1 from @tb3)
Insert into @tb3 (AccountNo,AccountName,AccountTypeid,AccountType,AccountTypeD,Bal)
values (000,''Retain Earning'',1015,''Equity'',''Liabilities and Equity'',dbo.func_getincomestatment(@startdate,@enddate))
   



select * from @tb3


END











' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getledger]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE procedure [dbo].[getledger]
	@iAccountID varchar(20)=Null,
	@startdate datetime,
	@enddate datetime
AS 



Declare @tblAccountData Table
(
	JentryID int,
	JDetailID int,
	JAccountID varchar(20)
)

Declare @tblMultiAccount Table
(
	JentryID int,	
	VoucherNo int,
	NoRow int --,
--	SUMDB decimal (18,2),
--	SUMCR decimal (18,2)
)

Declare @tblJounralAcc Table
(
	JentryID int,	
	AccountNo varchar(20),
	VoucherNo int,
	NoRow int ,
	DB decimal (18,2),
	CR decimal (18,2),
	Diff decimal (18,2)
)


Insert into @tblAccountData
select JE.JEntryID, 0 ,''1002'' --, JD.JDetailID,JD.AccountNo
 from Jentry JE inner join JDetail JD ON JE.JentryID = JD.JEntryID 
where (@iAccountID is NULL or JD.AccountNo =@iAccountID)
and JD.Date>=@startdate and JD.Date <=@enddate 
Group by JE.JEntryID

--Select ''@tblAccountData''
--Select * from @tblAccountData

Insert into @tblMultiAccount
select JE.JEntryID, JD.VoucherNo, count(1) 
 from JEntry JE inner join @tblAccountData AD on JE.JEntryId = AD.JEntryID
inner join JDetail jd on jd.jentryid = je.jentryid 
group by JE.JentryID, VoucherNo

--Select ''@tblMultiAccount''
--select * from @tblMultiAccount


Insert Into @tblJounralAcc 
Select JD.JentryID, JD.AccountNo, JD.VoucherNo, MC.NoRow,Sum(DR) DR, Sum(Cr) CR,Sum(DR) - Sum(Cr) Diff
from JDetail JD inner join @tblMultiAccount MC 
	on JD.VoucherNo = MC.VoucherNo and JD.JEntryID = MC.JentryID
and (JD.AccountNo = @iAccountID or @iAccountID is null) and JD.Date>=@startdate and JD.Date <=@enddate 
group by JD.JentryId, JD.AccountNo, JD.VoucherNo, MC.NoRow 



Select finaltable.*,convert(varchar, date, 106) as ''Date1'',Acc.Accountname as ''AccountName'',
''CAccountname''=Case when Acc2.Accountname IS NULL
then
''Multiple''
Else
Acc2.Accountname
END

from

(Select t1.*,date,JD.accountno as ''CAcc'' from @tblJounralAcc t1
inner join Jdetail JD
on t1.voucherno=JD.voucherno 
and t1.accountno<>JD.accountno
where noROW=2
UNION ALL
Select Distinct t1.*, convert(varchar, date, 106),''''from @tblJounralAcc t1
inner join Jdetail JD
on t1.voucherno=JD.voucherno 
and t1.accountno<>JD.accountno
where noROW>2) finaltable
inner join Account Acc
on Acc.accountno=finaltable.accountno
left join Account Acc2
on Acc2.accountno=finaltable.CAcc



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gettrial]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE procedure [dbo].[gettrial]
	@startdate datetime,
	@enddate datetime
AS
declare @tab1 table
(
debit decimal(18,2),
credit decimal(18,2),
account varchar(20),
balance decimal(18,2),
accountname varchar(50)
)
insert into @tab1
select sum(dr),sum(cr),jdetail.accountno,sum(dr)-sum(cr),accountname 
from jdetail
join account on account.accountno=jdetail.accountno
where date>=@startdate and date<=@enddate
group by jdetail.accountno,account.accountname

select accountname as ''AccountTitle'' ,account as ''Account No.'', 
''Debit''=case when sign(balance)=1
then balance 
end,
''Credit''=case when sign(balance)=-1
then balance*-1
end
from @tab1
--where balance<>0
ORDER BY ''Credit'',''Debit'' asc





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllProductType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


Create PROCEDURE [dbo].[spGetAllProductType]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from ProductType
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllProductsInformaton]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProductsInformaton] 
	-- Add the parameters for the stored procedure here

@ProductID int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT     Product.PID, Product.BarcodeID as ''BarCode'', Product.ProductName as ''Name'', Product.Size_ as ''Size'', ProductCategory.ProductType as ''Category'', ProductClass.Class as ''Class'', ProductMake.Make, Product.sale_Price as ''Retail Price'', 
                      Product.purchase_price as ''Purchase Price'', Product.ReorderQty
FROM         Product INNER JOIN
                      ProductCategory ON Product.CategoryID = ProductCategory.ProductTypeID INNER JOIN
                      ProductClass ON Product.ClassID = ProductClass.ClassID INNER JOIN
                      ProductMake ON Product.MakeID = ProductMake.MakeID INNER JOIN
                      ProductType ON Product.ProductTypeID = ProductType.ProductTypeID


Where Product.PID=ISNULL(@ProductID,dbo.Product.PID)
END








' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertJournalEntry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertJournalEntry] 
	-- Add the parameters for the stored procedure here
	@date varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into JEntry(Date)values(@date)
Select @@Identity
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAccountRegister]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAccountRegister]
	-- Add the parameters for the stored procedure here
	@AccountNo varchar(15)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

    -- Insert statements for procedure here
	--select * from jentry
--select * from Jdetail

--select * from Jentry JE inner join JDetail JD ON JE.JentryID = JD.JEntryID 
--where JD.AccountNo = 1005





Declare @tblAccountData Table
(
	JentryID int,
	JDetailID int,
	JAccountID varchar(15)
)

Declare @tblMultiAccount Table
(
	JentryID int,	
	VoucherNo int,
	NoRow int --,
--	SUMDB decimal (18,2),
--	SUMCR decimal (18,2)
)

Declare @tblJounralAcc Table
(
	JentryID int,	
	AccountNo varchar(15),
	VoucherNo int,
	NoRow int ,
	DB decimal (18,2),
	CR decimal (18,2),
	Diff decimal (18,2)
)


Insert into @tblAccountData
select JE.JEntryID, 0, @Accountno --, JD.JDetailID,JD.AccountNo
 from Jentry JE inner join JDetail JD ON JE.JentryID = JD.JEntryID 
where JD.AccountNo = @Accountno

Group by JE.JEntryID

--Select ''@tblAccountData''
--Select * from @tblAccountData

Insert into @tblMultiAccount
select JE.JEntryID, JD.VoucherNo, count(1) 
 from JEntry JE inner join @tblAccountData AD on JE.JEntryId = AD.JEntryID
inner join JDetail jd on jd.jentryid = je.jentryid 
group by JE.JentryID, VoucherNo

--Select ''@tblMultiAccount''
--select * from @tblMultiAccount


Insert Into @tblJounralAcc 
Select JD.JentryID, JD.AccountNo, JD.VoucherNo, MC.NoRow,Sum(DR) DR, Sum(Cr) CR,Sum(DR) - Sum(Cr) Diff
from JDetail JD inner join @tblMultiAccount MC 
	on JD.VoucherNo = MC.VoucherNo and JD.JEntryID = MC.JentryID
and JD.AccountNo = @Accountno
group by JD.JentryId, JD.AccountNo, JD.VoucherNo, MC.NoRow 

Select finaltable.date,finaltable.Jentryid,finaltable.accountno,finaltable.voucherno,finaltable.Norow,finaltable.Db,finaltable.Cr,finaltable.Diff,
''Account''=Case when Acc2.Accountname IS NULL
then
''Multiple''
Else
Acc2.Accountname
END

from

(Select t1.*,date,JD.accountno as ''CAcc'' from @tblJounralAcc t1
inner join Jdetail JD
on t1.voucherno=JD.voucherno 
and t1.accountno<>JD.accountno
where noROW=2
UNION ALL
Select Distinct t1.*,date,'''' from @tblJounralAcc t1
inner join Jdetail JD
on t1.voucherno=JD.voucherno 
and t1.accountno<>JD.accountno
where noROW>2) finaltable
inner join Account Acc
on Acc.accountno=finaltable.accountno
left join Account Acc2
on Acc2.accountno=finaltable.CAcc



END






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetJournalEntryDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetJournalEntryDetail] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     dbo.JDetail.JDetailId, dbo.JDetail.VoucherNo, dbo.JDetail.Date, dbo.JDetail.AccountNo, dbo.JDetail.JEntryId, dbo.JDetail.Memo, dbo.JDetail.Dr, dbo.JDetail.Cr
FROM         dbo.JDetail INNER JOIN
                      dbo.JEntry ON dbo.JDetail.JEntryId = dbo.JEntry.JEntryId 
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateInventoryAfterSales]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateInventoryAfterSales]
	-- Add the parameters for the stored procedure here
@ProductID int,@Quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF EXISTS(Select * From Inventory WHERE ProductID=@ProductID)
	BEGIN
    Update Inventory Set Quantity=(Select Quantity from inventory where productid=@productID)-@Quantity
where ProductID=@ProductID
	END
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetQuantity_Product]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetQuantity_Product]
	-- Add the parameters for the stored procedure here
	@pid int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Quantity From Inventory Where ProductID=@pid
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertInventory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertInventory] 
@ProductID int, @Quantity int,@ItemLineDetailID int,@LocationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF NOT EXISTS(Select * From Inventory WHERE ProductID=@ProductID)
	BEGIN
    Insert into Inventory(ProductID,ItemlineDetailID,LocationID,Quantity)Values(@ProductID,@ItemLineDetailID,@LocationID,@Quantity)
Select @@Identity
	END
ELSE
	BEGIN
		Update Inventory Set Quantity=(Select Quantity from inventory where productid=@productID)+@Quantity
where ProductID=@ProductID
	END
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetProductQuantityFromInventory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetProductQuantityFromInventory] 
	-- Add the parameters for the stored procedure here
	@Pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Quantity from Inventory where ProductID=@Pid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViewInventory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Procedure [dbo].[ViewInventory]
@ProductID int=null ,
@ProductTypeID int =null,
@ProductName varchar(50) =null
as
SELECT     dbo.Inventory.ProductID, dbo.Product.ProductName, dbo.ProductCategory.ProductType, dbo.Product.BarcodeID, 
                      dbo.Inventory.Quantity, dbo.Product.purchase_price, dbo.Product.sale_Price
FROM         dbo.Inventory INNER JOIN
                      dbo.Product ON dbo.Inventory.ProductID = dbo.Product.PID INNER JOIN
                      dbo.ProductCategory ON dbo.Product.ProductTypeID = dbo.ProductCategory.ProductTypeID
WHERE 
			dbo.Inventory.ProductID = ISNULL(@ProductID, dbo.Inventory.ProductID)AND
			dbo.Product.ProductTypeID= ISNull (@ProductTypeID, dbo.Product.ProductTypeID) AND
			dbo.Product.ProductName like ISNull (''%''+@ProductName+''%'', dbo.Product.ProductName)







' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spAlertForQuantity_Stock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAlertForQuantity_Stock]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     dbo.Product.ProductName, dbo.Inventory.Quantity, dbo.Product.Limit
FROM         dbo.Inventory INNER JOIN
                      dbo.Product ON dbo.Inventory.ProductID = dbo.Product.PID AND dbo.Inventory.Quantity < dbo.Product.Limit
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateBarcode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spUpdateBarcode]
	-- Add the parameters for the stored procedure here
@barCodeId int,
@barcode int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Update Barcode Set 
BarcodeNo=@barcode
Where BarcodeId=@barCodeId

END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertBarcode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertBarcode]
	-- Add the parameters for the stored procedure here
@barcode int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Insert into Barcode(BarcodeNo)Values(@barcode)
Select @@Identity
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertProduct]
	-- Add the parameters for the stored procedure here
@Pname varchar(100),
@size varchar(50),
@categoryId int,
@barcode varchar(50),
@sale_Price decimal(18, 0),
@purchase_Price decimal(18, 0),
@limit int,
@gst varchar(50),
@discount decimal(18,0),
@reorderqty int,
@ParentID int,
@MakeID int,
@ProductTypeID int ,
@ClassID int,
@ReorderLevel int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Insert into Product(ProductName,Size_,CategoryID,BarcodeID,sale_Price,purchase_price,Limit,GST,Discount,ReorderQty,ParentProductID,MakeID,ProductTypeID,ClassID,Reorderlevel)
Values(@Pname,@size,@categoryId,@barcode,@sale_Price,@purchase_Price,@limit,@gst,@discount,@reorderqty,@ParentID,@MakeID,@ProductTypeID,@ClassID,@ReorderLevel)
Select @@Identity
END










' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetMaxID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create Procedure [dbo].[spGetMaxID]
As
Begin
Select Max(PID)+1 from Product
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertVendorAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertVendorAddress]
	-- Add the parameters for the stored procedure here
@VendorId int,@VAddress nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO VendorAddress(VendorID,VendorAddress)VALUES(@VendorId,@VAddress)
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateVendorAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spUpdateVendorAddress]
	-- Add the parameters for the stored procedure here
@VendorId int,@VAddress nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update VendorAddress Set
	VendorID=@VendorId,
	VendorAddress=@VAddress
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateProductCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateProductCategory]
	-- Add the parameters for the stored procedure here
	@ProductTypeId int,@category nvarchar(50),@headid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
Update ProductCategory Set ProductType=@category,HeadCategoryID=@headid Where ProductTypeId=@ProductTypeId

END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSearchProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure [dbo].[spSearchProduct]

@PName varchar(50)=null,
@Ptype varchar(50)=null,
@Barcode varchar(50)=null,
@purchasePrice varchar(50)=null,
@salePrice varchar(50)=null,
@limit varchar (50)=null

As


Select PID as ProductID,ProductName,ProductType,BarcodeID,purchase_price as ''PurchasePrice'',sale_Price as ''SalePrice'',Limit from Product
inner join ProductCategory 
on Product.ProductTypeID=ProductCategory.ProductTypeID
where 
(ProductName like ''%''+@PName+''%'' or @PName IS NULL )and
(ProductType like ''%''+@Ptype+''%'' or @Ptype IS NULL )and
(BarcodeID like ''%''+@Barcode+''%'' or @Barcode IS NULL )and
(purchase_price like ''%''+@purchasePrice+''%'' or @purchasePrice IS NULL )and
(sale_Price like ''%''+@salePrice+''%'' or @salePrice IS NULL )and
(Limit like ''%''+@limit+''%'' or @limit IS NULL )

---(Gender like ''%''+@Gender+''%'' or @Gender IS NULL )and
---(pkClassificationid =@Class or @Class IS NULL )and
---(Blacklist =@BlackList or @BlackList IS NULL )and
---(EmergencyNo like ''%''+@EmergencyNo+''%'' or @EmergencyNo IS NULL)and
---(Email like ''%''+@Email+''%'' or @Email IS NULL)and 
---(Rating=@Rating or @Rating IS NULL)




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateP_Category]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateP_Category]
	-- Add the parameters for the stored procedure here
	@ProductTypeId int,@category nvarchar(50),@Description nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
Update ProductCategory Set ProductType=@category,Description=@Description Where ProductTypeId=@ProductTypeId

END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllProductCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProductCategory]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductType,Description,ProductTypeID From ProductCategory
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteProductCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spDeleteProductCategory]
	-- Add the parameters for the stored procedure here
	@ProductTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
Delete From ProductCategory 
Where ProductTypeId=@ProductTypeId

END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllSaleProductsRespectToInvoiceNo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllSaleProductsRespectToInvoiceNo]
	-- Add the parameters for the stored procedure here
@invoiceNo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select p.PID,p.ProductName,pt.ProductType,id.UnitPrice,id.Quantity,i.Total,i.Payed,i.Due From Product p,ProductCategory pt,InvoiceDetail id,Invoice i where p.ProductTypeID=pt.ProductTypeID AND id.ProductID=p.PID AND i.InvoiceID=id.InvoiceID AND i.InvoiceID=@invoiceNo
END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertProductCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertProductCategory]
	-- Add the parameters for the stored procedure here
	@category nvarchar(50),@description nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
Insert into ProductCategory(ProductType,Description)Values(@category,@description)
Select @@Identity
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateClientType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spUpdateClientType] 
	-- Add the parameters for the stored procedure here
	@CLientTypeId int,
	@Clienttype nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update ClientType Set TypeName=@Clienttype Where CTypeId=@CLientTypeId
END





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllClient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllClient] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Select *
From Client c,ClientType ct,ClientAddress ca,ClientPhone cp
Where c.ClientID=ca.ClientID AND c.ClientID=cp.ClientID AND c.CTypeId=ct.CTypeId
END









' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllClientInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllClientInformation]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     dbo.Client.CID as ''BookerNo'',dbo.Client.[Name] as ''BookerName'',dbo.Client.fax as ''FaxNo'',dbo.Client.Email as''EmailAddress'',
dbo.ClientType.TypeName as ''Area'',
dbo.ClientAddress.CAddress as ''BookerAddress'',
dbo.ClientPhone.CPhone as ''BookerPhone''
           
FROM         dbo.Client INNER JOIN
                      dbo.ClientAddress ON dbo.Client.CID = dbo.ClientAddress.CID INNER JOIN
                      dbo.ClientPhone ON dbo.Client.CID = dbo.ClientPhone.CID INNER JOIN
                      dbo.ClientType ON dbo.Client.CTypeID = dbo.ClientType.CTypeId
END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteClientType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spDeleteClientType] 
	-- Add the parameters for the stored procedure here
	@CLientTypeId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete From ClientType
	Where CTypeId=@ClientTypeId
END






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertClientType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertClientType]
	-- Add the parameters for the stored procedure here
@clientype	nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT into ClientType(TypeName)Values(@clientype)
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertClientType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertClientType]
	-- Add the parameters for the stored procedure here
@clientype	nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT into ClientType(TypeName)Values(@clientype)
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetClientTypes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetClientTypes] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CTypeID as ''AreaNo'',TypeName as ''AreaName'' From ClientType
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteClientDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spDeleteClientDetails]
	-- Add the parameters for the stored procedure here
	@ClientId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DELETE From ClientAddress Where CID=@ClientId
DELETE From ClientPhone Where CID=@ClientId
	DELETE From Client Where CID=@ClientId
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteclient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[deleteclient]
AS

delete from invoicedetaildiscount
delete from invoicedetail
delete from invoicediscount
delete from invoice
delete from clientaddress
delete from clientphone
delete from client
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateClientAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spUpdateClientAddress]
	-- Add the parameters for the stored procedure here
@ClientId int,@ClientAddress nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update ClientAddress Set 
	CAddress=@ClientAddress
	Where CID=@ClientId
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertClientAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spInsertClientAddress]
	-- Add the parameters for the stored procedure here
@ClientId int,@ClientAddress nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ClientAddress(CID,CAddress)VALUES(@ClientId,@ClientAddress)
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertClientPhone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spInsertClientPhone] 
	-- Add the parameters for the stored procedure here
@ClientId int,@ClientPhone nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ClientPhone(CID,CPhone)VALUES(@ClientId,@ClientPhone)
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateClientPhone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spUpdateClientPhone] 
	-- Add the parameters for the stored procedure here
@ClientId int,@ClientPhone nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update ClientPhone Set 
	CPhone=@ClientPhone
	Where CID=@ClientId
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetSaleProductsForSaleReturn]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSaleProductsForSaleReturn] 
	-- Add the parameters for the stored procedure here
@InvoiceId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     dbo.Invoice.InvoiceID, dbo.Invoice.Date, dbo.Invoice.PayType, dbo.Invoice.Total, dbo.Invoice.Payed, dbo.Invoice.Due, dbo.Invoice.CID, dbo.Client.Name, 
                      dbo.Discount.DID, dbo.Discount.Name AS TotalDiscount, dbo.InvoiceDiscount.Amt
FROM         dbo.Invoice INNER JOIN
                      dbo.Client ON dbo.Invoice.CID = dbo.Client.CID INNER JOIN
                      dbo.InvoiceDiscount ON dbo.Invoice.InvoiceID = dbo.InvoiceDiscount.InvoiceID INNER JOIN
                      dbo.Discount ON dbo.InvoiceDiscount.DID = dbo.Discount.DID
WHERE     (dbo.Invoice.InvoiceID = @InvoiceId)




SELECT     dbo.Product.PID, dbo.Product.ProductName, dbo.InvoiceDetail.Quantity, dbo.InvoiceDetail.UnitPrice
FROM         dbo.InvoiceDetail  INNER JOIN
                      dbo.Product ON dbo.InvoiceDetail.ProductID = dbo.Product.PID
WHERE     (dbo.InvoiceDetail.InvoiceID = @InvoiceId)

END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertUserRights]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertUserRights] 
	-- Add the parameters for the stored procedure here
	@PID int,@UTID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into UserRights(PID,UTID)Values(@PID,@UTID)
Select @@Identity
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateUserRights]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateUserRights] 
	-- Add the parameters for the stored procedure here
	@utid int,@usert nvarchar(50),@pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE UserTypes SET UserType=@usert Where UTID=@utid
    UPDATE UserRights SET PID=@pid Where UTID=@utid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllPagesForEdit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure [dbo].[spGetAllPagesForEdit]
@UTID int

As

/*SELECT
tab.PID,tab.AllPages ,Assigned=CASE 
WHEN (tab.PageAddress IS NULL)
THEN ''false''
ELSE
''true''
END
FROM 
(SELECT P.PageID,P.PageAddress as ''AllPages'',t.PageAddress FROM Pages P
Left Join
(SELECT P.* from UserPages P 
inner join UserRights PU 
on PU.PID=P.PID
where PU.UTID=8) t*/

SELECT
tab.PID,tab.AllPages ,Assigned=CASE 
WHEN (tab.PageName IS NULL)
THEN ''false''
ELSE
''true''
END
FROM
(SELECT P.PID,P.PageName as ''AllPages'',t.PageName FROM UserPages P
Left Join
(SELECT P.* from UserPages P 
inner join UserRights PU 
on PU.PID=P.PID
where PU.UTID=@UTID) t
on t.PID = P.PID) tab


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllPages]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure [dbo].[spGetAllPages]
@UTID int

As

/*SELECT
tab.PID,tab.AllPages ,Assigned=CASE 
WHEN (tab.PageAddress IS NULL)
THEN ''false''
ELSE
''true''
END
FROM 
(SELECT P.PageID,P.PageAddress as ''AllPages'',t.PageAddress FROM Pages P
Left Join
(SELECT P.* from UserPages P 
inner join UserRights PU 
on PU.PID=P.PID
where PU.UTID=8) t*/

SELECT
tab.PID,tab.AllPages ,Assigned=CASE 
WHEN (tab.PageName IS NULL)
THEN ''false''
ELSE
''true''
END
FROM
(SELECT P.PID,P.PageName as ''AllPages'',t.PageName FROM UserPages P
Left Join
(SELECT P.* from UserPages P 
inner join UserRights PU 
on PU.PID=P.PID
where PU.UTID=@UTID) t
on t.PID = P.PID) tab


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateUserRightsAndType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateUserRightsAndType] 
	-- Add the parameters for the stored procedure here
	@utid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Delete From UserTypes where UTID=@utid
Delete From UserRights where UTID=@utid
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetUserPagesFromPageId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUserPagesFromPageId] 
	-- Add the parameters for the stored procedure here
@pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PageName from UserPages where PID=@pid
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAllUserPages]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllUserPages] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from UserPages
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteUserType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteUserType]
	-- Add the parameters for the stored procedure here
@utid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete From UserTypes Where UTID=@utid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertUsertype]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertUsertype] 
	-- Add the parameters for the stored procedure here
	@usertype nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into UserTypes(UserType)Values(@usertype)
Select @@Identity
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateUserType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateUserType]
	-- Add the parameters for the stored procedure here
	@usertype nvarchar(50),@utid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update UserTypes SET UserType=@usertype where UTID=@utid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCheckUserNameANDPass]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCheckUserNameANDPass]
	-- Add the parameters for the stored procedure here
@utid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Users.username,Users.password from Users,UserTypes where Users.UTID = dbo.UserTypes.UTID And UserTypes.UTID =@utid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetPurchaseProductsForReturn]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPurchaseProductsForReturn]
	-- Add the parameters for the stored procedure here
	@PurchaseId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     dbo.Purchase.PurchaseID, dbo.Purchase.Date, dbo.Purchase.Total, dbo.Purchase.Payed, dbo.Purchase.Due, dbo.Purchase.PayType, dbo.Purchase.refno, 
                      dbo.Purchase.CheckNo, dbo.Vendor.VendorName, dbo.PurchaseDiscount.Valuess
FROM         dbo.Purchase INNER JOIN
                      dbo.PurchaseDiscount ON dbo.Purchase.PurchaseID = dbo.PurchaseDiscount.PID INNER JOIN
                      dbo.Vendor ON dbo.Purchase.VendorID = dbo.Vendor.VendorID
WHERE     (dbo.Purchase.PurchaseID = @PurchaseId)

SELECT     dbo.Product.PID, dbo.Product.ProductName, dbo.PurchaseProducts.UnitPrice, dbo.PurchaseProducts.Quantity, dbo.PurchaseProducts.PurchaseID
FROM         dbo.Product INNER JOIN
                      dbo.PurchaseProducts ON dbo.Product.PID = dbo.PurchaseProducts.ProductID
Where      (dbo.PurchaseProducts.PurchaseID=@PurchaseId)

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateSaleProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSaleProducts] 
	-- Add the parameters for the stored procedure here
	@qty int, @Inv_Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Update InvoiceDetail Set Quantity=@qty Where InvoiceID=@Inv_Id
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viewsales]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[Viewsales]
@startdate datetime,
@enddate datetime,
@invoiceID int,
@Clientid int,
@productid int


AS

declare @tb1 table
(
InvoiceID int,
Date varchar(50),
PaymentMethod varchar(50),
Customer varchar(50),
Gtotal decimal(18,2),
TDiscount decimal(18,2),
Netamount decimal(18,2),
Paid decimal(18,2),
Due decimal(18,2)
)
declare @tb2 table
(
Item varchar(50),
Quantity int,
Price decimal(18,2),
Total decimal(18,2),
Discount decimal(18,2),
sno int IDENTITY 
)
insert into @tb2
Select productname,quantity,unitprice,TotalPrice-sum(d_amt),sum(d_amt) as ''Discount'' from
(select product.productname,invoicedetail.quantity,invoicedetail.unitprice,
invoicedetail.quantity*invoicedetail.unitprice as ''TotalPrice'',
d_Amt from invoicedetaildiscount 
inner join invoicedetail on invoicedetaildiscount.invoiceid=invoicedetail.invoiceid 
and invoicedetaildiscount.productid=invoicedetail.productid
and invoicedetail.productid=isnull(@productid,invoicedetail.productid)
inner join invoice on invoice.invoiceid=invoicedetail.invoiceid
and invoice.invoiceid=isnull(@invoiceid,invoice.invoiceid)
and invoice.cid=isnull(@clientid,invoice.cid)
join product on product.pid=invoicedetail.productid 

where (invoice.date>=@startdate and invoice.date<=@enddate)) t 
		 
group by productname,quantity,unitprice,Totalprice


insert into @tb1
select distinct invoice.invoiceid,invoice.date,invoice.paytype,client.name,invoice.total,
(Select sum(amt) from invoiceDiscount where (invoice.date>=@startdate and invoice.date<=@enddate) and
		invoice.invoiceid=isnull(@invoiceid,invoice.invoiceid) and
		 invoice.cid=isnull(@clientid,invoice.cid)),invoice.total-
((Select sum(amt) from invoiceDiscount where (invoice.date>=@startdate and invoice.date<=@enddate) and
		invoice.invoiceid=isnull(@invoiceid,invoice.invoiceid) and
		 invoice.cid=isnull(@clientid,invoice.cid))+(Select sum(discount) from @tb2)),
invoice.payed,invoice.due
from invoice
join client on client.cid=invoice.cid
and client.cid=ISNULL(@clientid,client.cid)
join invoicedetail on invoicedetail.invoiceid=invoice.invoiceid
join product on product.pid=invoicedetail.productid
and product.pid=isnull(@productid,product.pid	)
--join invoicediscount on invoicediscount.invoiceid=invoice.invoiceid
where (invoice.date>=@startdate and invoice.date<=@enddate) 
and invoice.invoiceid=isnull(@invoiceid,invoice.invoiceid)	
select * from @tb1

--join invoice on invoice.invoiceID=invoicedetail.invoiceid
--join invoicediscount on invoicediscount.invoiceID=invoicedetail.invoiceid
--join discount on discount.did=invoicediscount.did
--join invoicedetaildiscount on invoicedetaildiscount.did=discount.did 





select * from @tb2

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertSaleProductDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertSaleProductDetails]
	-- Add the parameters for the stored procedure here
@InvoiceID int,@Quantity int,@UnitPrice decimal(18,0),@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	Insert into InvoiceDetail(InvoiceID,Quantity,UnitPrice,ProductID)Values(@InvoiceID,@Quantity,@UnitPrice,@ProductID)
Select @@Identity
END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateSaleDetailComplete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateSaleDetailComplete]
	-- Add the parameters for the stored procedure here
	@InvoiceID int,@Quantity int,@UnitPrice decimal(18,0),@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update InvoiceDetail Set Quantity=@Quantity,UnitPrice=@UnitPrice,ProductID=@ProductID
Where InvoiceID=@InvoiceID AND ProductId=@ProductID
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertSaleProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertSaleProducts] 
	-- Add the parameters for the stored procedure here
@PayType nvarchar(50),@Total decimal(18,0),@Payed decimal(18,0),@Due decimal(18,0),@cid int,
@CheckNo nvarchar(50),@UpdateBy int,@UpdateOn varchar(50),@CounterID int,@OpenTime varchar(50),@CloseTime varchar(50),
@Remarks varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Invoice(PayType,Total,Payed,Change,CID,CheckNo,UpdateBy,UpdateOn,CounterID,OpenTime,CloseTime,Remarks)
Values(@PayType,@Total,@Payed,@Due,@cid,@CheckNo,@UpdateBy,@UpdateOn,@CounterID,@OpenTime,@CloseTime,@Remarks)
Select @@Identity
END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAccountIdFromVendor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAccountIdFromVendor] 
	-- Add the parameters for the stored procedure here
@ven_id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select A.accountno from Vendor V
	inner join Account A
	on V.Accountid=A.Accountid
	where V.Vendorid=@ven_id

END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetMaxVendorId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetMaxVendorId]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select max(vendorid) from vendor
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateVendor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[UpdateVendor] 
	-- Add the parameters for the stored procedure here
	@VendorId int,@VendorName nvarchar(50),@Fax nvarchar(20),@Email nvarchar(20),@Web nvarchar(20),@VendorTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Update Vendor Set
VendorName=@VendorName,
Fax=@Fax,
Email=@Email,
Web=@Web,
VendorTypeID=@VendorTypeID
Where VendorId=@VendorId
END






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertVendor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertVendor] 
	-- Add the parameters for the stored procedure here
	@VendorName nvarchar(50),@Fax nvarchar(20),@Email nvarchar(20),@Web nvarchar(20),@VendorTypeID int,@accountId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO Vendor(VendorName,Fax,Email,Web,VendorTypeID,AccountId)Values(@VendorName,@Fax,@Email,@Web,@VendorTypeID,@accountId)
SELECT @@Identity
END






' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteUser] 
	-- Add the parameters for the stored procedure here
@uid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete From [Users] where UID=@uid
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateUser] 
	-- Add the parameters for the stored procedure here
	@name nvarchar(50),@pass nvarchar(50),@utid int,@uid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Update [Users] Set UserName=@name,Password=@pass,UTID=@utid Where UID=@uid  
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertUser]
	-- Add the parameters for the stored procedure here
	@name nvarchar(50),@pass nvarchar(50),@utid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into [Users](UserName,Password,UTID)Values(@name,@pass,@utid)
Select @@Identity
END

' 
END
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ViewAllSales]
	@ItemLineTypeID int=null,
	@Username varchar(50)=null,
	@Name varchar(50)=null,
	@TotalAmount decimal=null,
	@Change decimal=null,
	@Paid decimal=null,
	@Client varchar(50)=null,
	@OpenDatetime datetime=null,
	@CloseDatetime datetime=null,
	@Location varchar(50)=null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT DISTINCT    
Itemline.ItemLineID AS InvoiceID,
ROUND (Itemline.Total,2) AS [Total Amount], 
ROUND (Itemline.Change,2) AS [Change], 
ROUND (Itemline.Payed,2) AS Paid,
Round(Itemline.StdDiscount,2) AS Discount, 
Client.Name AS Client, 
convert( varchar,Itemline.OpenDatetime,100) as OpenDatetime,
convert (varchar,Itemline.CloseDatetime,100)as CloseDatetime, 
Users.UserName, 
Location.Name as 'Location',
Status=Case When Itemline.Closed=1		
THEN 'Closed'
ELSE
'Open'
END 
FROM    
Client INNER JOIN Itemline ON Client.ClientID = Itemline.ClientID  AND Client.[Name] like ISNULL(@Client,Client.Name)
INNER JOIN  ItemlineDetail ON Itemline.ItemLineID = ItemlineDetail.ItemLineID 
RIGHT JOIN  Users ON Itemline.CreatedBy = Users.UID  AND Users.Username like ISNULL(@Username,Users.Username)
INNER JOIN  Location ON ItemlineDetail.SourceID = Location.LocationID AND Location.Name like ISNULL(@Location,Location.Name)
INNER JOIN ItemLineType on Itemline.ItemlineTypeID=ItemLineType.ItemlineTypeID 
WHERE ItemlineType.ItemlineTypeid=1 

END




set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spGetAllClientInformation]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     dbo.Client.ClientID as 'BookerNo',dbo.Client.[Name] as 'BookerName',dbo.Client.fax as 'FaxNo',dbo.Client.Email as'EmailAddress',
dbo.ClientType.TypeName as 'Area',
dbo.ClientAddress.CAddress as 'BookerAddress',
dbo.ClientPhone.CPhone as 'BookerPhone'
           
FROM         dbo.Client INNER JOIN
                      dbo.ClientAddress ON dbo.Client.ClientID = dbo.ClientAddress.ClientID INNER JOIN
                      dbo.ClientPhone ON dbo.Client.ClientID = dbo.ClientPhone.ClientID INNER JOIN
                      dbo.ClientType ON dbo.Client.CTypeID = dbo.ClientType.CTypeId
END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spGetAllClient] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Select *
From Client c,ClientType ct,ClientAddress ca,ClientPhone cp
Where c.ClientID=ca.ClientID AND c.ClientID=cp.ClientID AND c.CTypeId=ct.CTypeId
END










set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertItemLineDetail]
	-- Add the parameters for the stored procedure here
	@ItemlineID int,
	@SourceID int,
	@DestinatationID int,
	@ProductID int,
	@Quantity int,
	@UnitPrice decimal,
	@StdDiscount decimal,
	@ExDiscount decimal,
	@GST decimal



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into ItemLineDetail (ItemlineID,SourceID,DestinationID,ProductID,Quantity,Unitprice,Stddiscount,Exdiscount,GST)
VALUES (@ItemLineID,@SourceID,@DestinatationID,@ProductID,@Quantity,@UnitPrice,@Stddiscount,@ExDiscount,@Gst)

Select @@Identity
END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spInsertProduct]
	-- Add the parameters for the stored procedure here
@Pname varchar(100),
@size varchar(50),
@categoryId int,
@barcode varchar(50),
@sale_Price decimal(18, 0),
@purchase_Price decimal(18, 0),
@limit int,
@gst varchar(50),
@discount decimal(18,0),
@reorderqty int,
@ParentID int,
@MakeID int,
@ProductTypeID int ,
@ClassID int,
@ReorderLevel int,
@Generic varchar(50),
@OpeningStock decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Insert into Product(ProductName,Size_,CategoryID,BarcodeID,sale_Price,purchase_price,Limit,GST,Discount,ReorderQty,ParentProductID,MakeID,ProductTypeID,ClassID,Reorderlevel,Generic,OpeningStock)
Values(@Pname,@size,@categoryId,@barcode,@sale_Price,@purchase_Price,@limit,@gst,@discount,@reorderqty,@ParentID,@MakeID,@ProductTypeID,@ClassID,@ReorderLevel,@Generic,@OpeningStock)
Select @@Identity
END











GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spGetAllProductsInformaton] 
	-- Add the parameters for the stored procedure here

@ProductID int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT     ProductMake.Make, Product.PID,  Product.ProductName as 'Name', Product.Size_ as 'Size',Product.Generic as 'Generic',Product.BarcodeID as 'BarCode', ProductCategory.ProductType as 'Category', ProductClass.Class as 'Class', Product.sale_Price as 'Retail Price', 
                      Product.purchase_price as 'Trade Price', Product.ReorderQty,Product.OpeningStock
FROM         Product INNER JOIN
                      ProductCategory ON Product.CategoryID = ProductCategory.ProductTypeID INNER JOIN
                      ProductClass ON Product.ClassID = ProductClass.ClassID INNER JOIN
                      ProductMake ON Product.MakeID = ProductMake.MakeID INNER JOIN
                      ProductType ON Product.ProductTypeID = ProductType.ProductTypeID


Where Product.PID=ISNULL(@ProductID,dbo.Product.PID)
END
Create Procedure ViewPruchaseRegister
AS
SELECT    
 Itemline.InvoiceNo AS [Bill No],
 Vendor.VendorName,
Itemline.Total AS [Total Amount], 
PayType.PayType AS [Payment Mode],
Posted=Case
WHEN Itemline.Closed=1
THEN 'Yes'
ELSE 'No'
END
FROM         Itemline INNER JOIN
                      PayType ON Itemline.PayTypeID = PayType.PayTypeID INNER JOIN
                      Vendor ON Itemline.VendorID = Vendor.VendorID

WHERE Itemline.ItemlineTypeID=2


Create Procedure GetOpenInvoice
@ItemLineID int
AS

Select * from ItemLine
Where Closed=0 and ItemLineTypeID=1
and ItemLineID=@ItemlineID

Select ItemLineDetailID,BarCodeID as 'BarCode',ItemLineDetail.ProductID,Product.ProductName as 'Product',Quantity,UnitPrice,Quantity*UnitPrice as 'Total Amount'
from ItemLineDetail inner join Product on ItemLineDetail.ProductID=PID
Where ItemlineID=@ItemlineID

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spGetAllClientInformation]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here



SELECT     dbo.Client.ClientID,dbo.Client.[Name] as 'Name',dbo.ClientAddress.CAddress as 'Address',dbo.ClientPhone.CPhone as 'Phone No',dbo.Client.Email as 'Email'
,dbo.Client.fax as 'FaxNo',dbo.ClientType.TypeName as 'Type'
,dbo.Client.OpeningBalance
           
FROM         dbo.Client INNER JOIN
                      dbo.ClientAddress ON dbo.Client.ClientID = dbo.ClientAddress.ClientID INNER JOIN
                      dbo.ClientPhone ON dbo.Client.ClientID = dbo.ClientPhone.ClientID INNER JOIN
                      dbo.ClientType ON dbo.Client.CTypeID = dbo.ClientType.CTypeId
END


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spInsertProductClass]
	-- Add the parameters for the stored procedure here	
@pClass varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ProductClass (Class) VALUES (@pClass)
END




set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[spGetAllProductType]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from ProductType
END



set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spGetAllProductCategory]
	-- Add the parameters for the stored procedure here
@categoryID int =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pc1.ProductTypeID,pc1.ProductType as 'Category',pc1.Description,pc2.ProductType as 'ParentProduct'
From ProductCategory pc1
 left join  ProductCategory pc2
on pc2.ProductTypeID=pc1.headCategoryID 
where pc1.ProductTypeID = isnull(@categoryID,pc1.ProductTypeID) 
END





































