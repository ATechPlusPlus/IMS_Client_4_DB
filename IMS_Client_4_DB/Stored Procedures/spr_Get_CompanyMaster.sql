-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <11th DEC 2020>
-- Update date: <>
-- Description:	<Description,,>
-- =============================================
--EXEC [dbo].[SPR_Get_Company]
CREATE PROCEDURE [dbo].[spr_Get_CompanyMaster]
@CompanyName NVARCHAR(MAX)='0',
@MobileNo NVARCHAR(13)='0'
AS
BEGIN
	
	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES = concat(@CompanyName,',',@MobileNo) 

	SET NOCOUNT ON;
	IF @CompanyName = '0' AND @MobileNo = 0
	BEGIN

	    SELECT CompanyID,CompanyName,[Address],MobileNo,EmailID
	    ,(CASE IsDefault WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' END) IsDefault
	    ,IsDefault [DefaultValue],CompanyLogo
	    FROM dbo.tblCompanyMaster ORDER BY CompanyName

	END

	ELSE
	BEGIN
	
	    SELECT CompanyID,CompanyName,[Address],MobileNo,EmailID
	    ,(CASE IsDefault WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' END) IsDefault
	    ,IsDefault [DefaultValue],CompanyLogo
	    FROM dbo.tblCompanyMaster
		WHERE 
		CompanyName LIKE ''+IIF(@CompanyName='0',CompanyName,@CompanyName)+'%' 
		AND MobileNo LIKE ''+IIF(@MobileNo='0',MobileNo,@MobileNo)+'%'
		--AND MobileNo = IIF(@MobileNo=0,MobileNo,@MobileNo)
		ORDER BY CompanyName

	END
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