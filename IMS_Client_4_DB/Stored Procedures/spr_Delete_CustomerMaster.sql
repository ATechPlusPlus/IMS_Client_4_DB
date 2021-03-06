﻿-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <11th DEC 2020>
-- Update date: <>
-- Description:	<Description,,>
-- =============================================
--EXEC [dbo].SPR_Delete_Company 0,0,0,0,0,0
CREATE PROCEDURE [dbo].spr_Delete_CustomerMaster
@CustomerID INT=0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=@CustomerID

	BEGIN TRANSACTION

	DELETE FROM tblCustomerMaster WHERE CustomerID=@CustomerID

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