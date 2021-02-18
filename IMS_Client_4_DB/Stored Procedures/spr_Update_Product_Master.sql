CREATE PROCEDURE [dbo].[spr_Update_Product_Master]
@ProductID INT=0
,@Barcodes NVarChar(50)=0
,@ProductName NVarChar(MAX)=0
,@Weight VarChar(50)=0
,@Packs INT=0
,@UnitPrice DECIMAL(18,3)=0
,@CartonPrice DECIMAL(18,3)=0
,@ActiveStatus VarChar(MAX)=0
,@UpdatedBy INT=0


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=CONCAT(@ProductID,',',@Barcodes,',',@ProductName,',',@Weight,',',@Packs,',',@UnitPrice,',',@CartonPrice,',',@ActiveStatus,',',@UpdatedBy)

	BEGIN TRANSACTION

	UPDATE tblProductMaster
	SET Barcodes=@Barcodes,ProductName=@ProductName,[Weight]=@Weight,Packs=@Packs,UnitPrice=@UnitPrice
	,CartonPrice=@CartonPrice,ActiveStatus=@ActiveStatus,UpdatedBy=@UpdatedBy,UpdatedOn=GETDATE()
	WHERE ProductID=@ProductID

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