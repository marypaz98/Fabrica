USE [Fabrica]
GO
/****** Object:  StoredProcedure [dbo].[spAgregarExtra]    Script Date: 17/6/2019 1:11:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


creatE OR ALTER procedure [dbo].[spAgregarExtraxAutomovil] @idAutomovil int, @idExra int
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into ExtraxAutomovil(idAutomovil,idExtra)
            values(@idAutomovil,@idExra);
            COMMIT
			Select 1
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = 'Se ha producido un error al intentar agregar el extra'
            print('ERROR:'+@errorMsg)
			Select @errorMsg
            return -1*@@ERROR
    END CATCH
END
