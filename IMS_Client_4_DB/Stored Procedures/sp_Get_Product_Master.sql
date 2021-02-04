-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <14th MARCH 2020>
-- Update date: <06th AUGUST 2020>
-- Description:	<Description,,>
-- =============================================
--EXEC Get_Product_Master 'b',3
CREATE PROCEDURE [dbo].[sp_Get_Product_Master]
@ProductName NVARCHAR(100)='0'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES = @ProductName
	
	SET NOCOUNT ON;

	SELECT ProductID,Barcodes,ProductName,[Weight],Packs,UnitPrice,CartonPrice,
	(CASE ActiveStatus WHEN 1 THEN 'Active' WHEN 0 THEN 'InActive' END) ActiveStatus
	FROM dbo.tblProductMaster WITH(NOLOCK)
	
	
	END TRY

	BEGIN CATCH
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
