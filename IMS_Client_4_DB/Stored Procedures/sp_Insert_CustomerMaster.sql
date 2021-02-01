CREATE PROCEDURE [dbo].[sp_Insert_CustomerMaster]
@CustomerName NVarChar(MAX)=0
,@PhoneNo NVarChar(MAX)=0
,@EmailID VarChar(MAX)=0
,@Address VarChar(MAX)=0
,@CreatedBy INT=0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=CONCAT(@CustomerName,',',@PhoneNo,',',@EmailID,',',@Address,',',@CreatedBy)

	BEGIN TRANSACTION

	INSERT tblCustomerMaster
	(
		CustomerName,PhoneNo,EmailID,[Address],CreatedBy
	)
	VALUES
	(
		@CustomerName,@PhoneNo,@EmailID,@Address,@CreatedBy
	)

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