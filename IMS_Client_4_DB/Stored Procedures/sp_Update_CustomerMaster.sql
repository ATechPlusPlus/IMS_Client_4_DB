-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <11th DEC 2020>
-- Update date: <>
-- Description:	<Description,,>
-- =============================================
--EXEC [dbo].SPR_Update_Company 0,0,0,0,0,0
CREATE PROCEDURE [dbo].sp_Update_CustomerMaster
@CustomerID INT=0
,@CustomerName NVarChar(MAX)=0
,@PhoneNo NVarChar(MAX)=0
,@EmailID VarChar(MAX)=0
,@Address VarChar(MAX)=0
,@UpdatedBy INT=0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=CONCAT(@CustomerID,',',@CustomerName,',',@PhoneNo,',',@EmailID,',',@Address,',',@UpdatedBy)

	BEGIN TRANSACTION

	UPDATE tblCustomerMaster
	SET CustomerName=@CustomerName,PhoneNo=@PhoneNo,EmailID=@EmailID
	,[Address]=@Address,UpdatedBy=@UpdatedBy,UpdatedOn=GETDATE()
	WHERE CustomerID=@CustomerID

	COMMIT

	END TRY

	BEGIN CATCH
	
	ROLLBACK

	INSERT [dbo].[ERROR_Log]
	(
	ERR_NUMBER
	, ERR_SEVERITY
	, ERR_STATE
	, ERR_LINE
	, ERR_MESSAGE
	, ERR_PROCEDURE
	, PARAMERES
	)
	SELECT  
	ERROR_NUMBER() 
	,ERROR_SEVERITY() 
	,ERROR_STATE() 
	,ERROR_LINE()
	,ERROR_MESSAGE()
	,ERROR_PROCEDURE()
	,@PARAMERES
	
	END CATCH

END