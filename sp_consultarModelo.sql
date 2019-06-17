create procedure [dbo].[verAutosDisponibles](@idSucursal int)
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

create procedure consultarModelo(@idSucursal int,@idCliente int)
as
begin
	CREATE TABLE #TempTable
	( id int identity(1,1) NOT NULL PRIMARY KEY,
	placa varchar NULL,
	precioBase money NULL,
	anno int NULL,
	color varchar NULL,
	marca varchar NULL,
	cantidadPasajeros int NULL,
	nPuertas int NULL,
	idTipo int NOT NULL,
	idCombusTible int NOT NULL
	);
	INSERT INTO #TempTable Exec dbo.verAutosDisponibls @idSucursal=@idSucursal
	if EXISTS(Select id from #TempTable)
	begin
		Select 1
	end
	else
		drop table #TempTable
		CREATE TABLE #TempTable1
		( id int identity(1,1) NOT NULL PRIMARY KEY,
		placa varchar NULL,
		precioBase money NULL,
		anno int NULL,
		color varchar NULL,
		marca varchar NULL,
		cantidadPasajeros int NULL,
		nPuertas int NULL,
		idTipo int NOT NULL,
		idCombusTible int NOT NULL
		);
		--INSERT INTO #TempTable1 Exec dbo.verAutosDisponibls @idSucursal=1
		declare @ubicacionCliente geometry,@distancia1 int, @ubicacionSucursal1 geometry, @datos varchar(MAX)
		declare @ubicacionSucursal2 geometry, @ubicacionSucursal3 geometry, @distancia2 int, @distancia3 int, @nombre varchar(20)
		Select @ubicacionCliente= ubicacion from ClienteUbicacion where idCliente=@idCliente
		Select @ubicacionSucursal1 = ubicacion from Sucursal_1.dbo.SucursalUbicacion
		Select @ubicacionSucursal2 = ubicacion from Sucursal_2.dbo.SucursalUbicacion
		Select @ubicacionSucursal3 = ubicacion from Sucursal_3.dbo.SucursalUbicacion
		set @distancia1 = @ubicacionCliente.STDistance(@ubicacionSucursal1)
		set @distancia2 = @ubicacionCliente.STDistance(@ubicacionSucursal2)
		set @distancia3= @ubicacionCliente.STDistance(@ubicacionSucursal3)
		if ((@distancia1<@distancia2) and (@distancia1<@distancia3))
		begin
			INSERT INTO #TempTable1 Exec dbo.verAutosDisponibles @idSucursal=1
			if (EXISTS(Select id from #TempTable1))
				BEGIN
					SET @datos= 'Dirijase a la sucursal 1'
					Select @datos
				END
		end
		if((@distancia2<@distancia1)and(@distancia2<@distancia3))
		begin
			INSERT INTO #TempTable1 Exec dbo.VerAutosDisponibles @idSucursal=2
			if(EXISTS(Select id from #TempTable1))
				begin
					set @datos = 'Dirijase a la sucursal 2'
					Select @datos
				end
		end
		if((@distancia3<@distancia1)and (@distancia3<@distancia2))
		begin
			Insert into #TempTable1 Exec VerAutosDisponibles @idSucursal=3
			if(EXISTS(Select id from #TempTable1))
				begin
					set @datos = 'Dirijase a la sucursal 3'
					Select @datos
				end
		end
		
		 


end