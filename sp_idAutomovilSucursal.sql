create procedure selectIdAutomovil (@idAutomovilxSucursal int, @idSucursal int)
AS
BEGIN
	if @idSucursal=1
		Select idAutomovil from Sucursal_1.dbo.AutomovilxSucursal AxS where AxS.idAutomovilxSucursal=@idAutomovilxSucursal
	else
		if @idSucursal=2
			Select idAutomovil from Sucursal_2.dbo.AutomovilxSucursal AxS where AxS.idAutomovilxSucursal=@idAutomovilxSucursal
		else
			if @idSucursal=3
				Select idAutomovil from Sucursal_3.dbo.AutomovilxSucursal AxS where AxS.idAutomovilxSucursal=@idAutomovilxSucursal
		
			 
END
go
create procedure SelectIdAutomovil1 (@placa varchar(20))
AS
BEGIN
	Select idAutomovil from Automovil where placa=@placa
			 
END
go
create procedure obtenerFinaciamiento(@idAutomovil int,@idSucursal int, @idCliente int)
as
begin
	if @idSucursal=1
		Select CF.idFinanciamiento from Sucursal_1.dbo.ClientexFinanciamiento CF
		inner join Sucursal_1.dbo.FinanciamientoxVenta FV on FV.idFinanciamiento=CF.idFinanciamiento
		inner join Sucursal_1.dbo.VentaxCliente CV on CV.idVenta = FV.idVenta
		inner join Sucursal_1.dbo.AutxSucxVentxCli ASVT on ASVT.idVentaxCliente = CV.idVentaxCliente
		inner join Sucursal_1.dbo.AutomovilxSucursal AxS on AxS.idAutomovilxSucursal = asvt.idAutomovilxSucursal and AxS.idAutomovil=@idAutomovil
		where CF.idCliente=@idCliente
	else if @idSucursal=2
			Select CF.idFinanciamiento from Sucursal_2.dbo.ClientexFinanciamiento CF
			inner join Sucursal_2.dbo.FinanciamientoxVenta FV on FV.idFinanciamiento=CF.idFinanciamiento
			inner join Sucursal_2.dbo.VentaxCliente CV on CV.idVenta = FV.idVenta
			inner join Sucursal_2.dbo.AutxSucxVentxCli ASVT on ASVT.idVentaxCliente = CV.idVentaxCliente
			inner join Sucursal_2.dbo.AutomovilxSucursal AxS on AxS.idAutomovilxSucursal = asvt.idAutomovilxSucursal and AxS.idAutomovil=@idAutomovil
			where CF.idCliente=@idCliente
		else if @idSucursal=3
			Select CF.idFinanciamiento from Sucursal_2.dbo.ClientexFinanciamiento CF
			inner join Sucursal_2.dbo.FinanciamientoxVenta FV on FV.idFinanciamiento=CF.idFinanciamiento
			inner join Sucursal_2.dbo.VentaxCliente CV on CV.idVenta = FV.idVenta
			inner join Sucursal_2.dbo.AutxSucxVentxCli ASVT on ASVT.idVentaxCliente = CV.idVentaxCliente
			inner join Sucursal_2.dbo.AutomovilxSucursal AxS on AxS.idAutomovilxSucursal = asvt.idAutomovilxSucursal and AxS.idAutomovil=@idAutomovil
			where CF.idCliente=@idCliente
			
end