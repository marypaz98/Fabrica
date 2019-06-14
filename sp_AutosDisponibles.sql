--Se ven las caracteristicas principales de los automoviles disponibles si el usuario desea ver
--fotos y extras debe seleccionar un automovil
create procedure verAutosDisponibles(@idSucursal int)
as
begin
if @idSucursal=1
	Select placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_1].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
if @idSucursal=2
	Select placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_2].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica	
if @idSucursal=3
	Select placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_3].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
end
GO
create procedure verFotosAutosDisponibles(@idAutomovil int)
as
BEGIN
	Select foto 
	from FotoxAutomovil FA
	inner join Foto F on F.idFoto= FA.idFoto
	where idAutomovil=@idAutomovil
END
go
create procedure verExtrasAutosDisponibles(@idAutomovil int)
as
BEGIN
	Select nombre, precio
	from ExtraxAutomovil EX 
	inner join Extra E on E.idExtra= EX.idExtra
	where idAutomovil=@idAutomovil
END