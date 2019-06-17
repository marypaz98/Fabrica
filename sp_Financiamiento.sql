USE [Fabrica]
GO
/****** Object:  StoredProcedure [dbo].[spAgregarExtra]    Script Date: 17/6/2019 1:11:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


creatE OR ALTER procedure [dbo].[spFinanciamiento] @idSucursal int, @idCliente int
as
BEGIN
	if @idSucursal=1
		Select placa from Sucursal_1.dbo.ClientexFinanciamiento CxF
		inner join Sucursal_1.dbo.FinanciamientoxVenta FxV on FxV.idFinanciamiento=CxF.idFinanciamiento
		inner join Sucursal_1.dbo.VentaxCliente VxC on VxC.idVenta=FxV.idVenta and VxC.idCliente=@idCliente
		inner join Sucursal_1.dbo.AutxSucxVentxCli ASVC on ASVC.idVentaxCliente=VxC.idVentaxCliente
		inner join Sucursal_1.dbo.
 	if @idSucursal=2
		Select tasaInteres from Sucursal_2.dbo.ClientexFinanciamiento CxF
		inner join  Sucursal_2.dbo.Financiamiento F  on F.idFinanciamiento= CxF.idFinanciamiento
		where CxF.idCliente=@idCliente 
	if @idSucursal=3
		Select tasaInteres from Sucursal_3.dbo.ClientexFinanciamiento CxF
		inner join  Sucursal_3.dbo.Financiamiento F  on F.idFinanciamiento= CxF.idFinanciamiento
		where CxF.idCliente=@idCliente 
END
