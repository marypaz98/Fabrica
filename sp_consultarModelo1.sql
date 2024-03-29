USE [Sucursal_3]
GO
/****** Object:  StoredProcedure [dbo].[consultarCarros]    Script Date: 17/6/2019 2:09:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[consultarCarros]
@marca varchar(20) = null,
@precioIni money = null,
@precioFin money = null,
@color varchar(20) = null,
@cantidadPasajeros int = null,
@puertas int = null,
@año int = null

as
begin
	
	select marca,precioBase,color,cantidadPasajeros,nPuertas as puertas,anno as año from Fabrica.dbo.Caracteristicas as FC,Fabrica.dbo.Automovil as FA
	inner join Sucursal_3.dbo.AutomovilxSucursal on Sucursal_3.dbo.AutomovilxSucursal.idAutomovil = FA.idAutomovil
	where FC.marca = isnull(@marca,FC.marca) and FA.precioBase between isnull(@precioIni,FA.precioBase) and isnull(@precioFin,FA.precioBase) and FC.color = isnull(@color,FC.color) and
	FC.cantidadPasajeros = isnull(@cantidadPasajeros,FC.cantidadPasajeros) and FC.nPuertas = isnull(@puertas,FC.nPuertas) and FA.anno = isnull(@año,FA.anno)
	group by marca,anno,color,nPuertas,cantidadPasajeros,precioBase
end
go
create or alter procedure consultarModelo(@marca varchar(20),@anno int, @idCliente int)
as
begin
	CREATE TABLE #TempTable
	( id int identity(1,1) NOT NULL PRIMARY KEY,
	marca varchar NULL,
	precioBase money NULL,
	color varchar NULL,
	cantidadPasajeros int NULL,
	nPuertas int NULL,
	anno int NULL,
	);
	INSERT INTO #TempTable Exec consultarCarros @marca=@marca, @año=@anno
	if EXISTS(Select id from #TempTable)
	begin
		Select 1
	end
	else
		drop table #TempTable
		CREATE TABLE #TempTable1
		( id int identity(1,1) NOT NULL PRIMARY KEY,
		marca varchar NULL,
		precioBase money NULL,
		color varchar NULL,
		cantidadPasajeros int NULL,
		nPuertas int NULL,
		anno int NULL,
		);
		--INSERT INTO #TempTable1 Exec dbo.verAutosDisponibls @idSucursal=1
		declare @ubicacionCliente geometry,@distancia1 float, @ubicacionSucursal1 geometry, @datos varchar(MAX)
		declare @ubicacionSucursal2 geometry, @ubicacionSucursal3 geometry, @distancia2 float, @distancia3 float, @nombre varchar(20)
		Select @ubicacionCliente= ubicacion from Fabrica.dbo.ClienteUbicacion where idCliente=@idCliente
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
		else if((@distancia2<@distancia1)and(@distancia2<@distancia3))
		begin
			INSERT INTO #TempTable1 Exec dbo.VerAutosDisponibles @idSucursal=2
			if(EXISTS(Select id from #TempTable1))
				begin
					set @datos = 'Dirijase a la sucursal 2'
					Select @datos
				end
		end
		else if((@distancia3<@distancia1)and (@distancia3<@distancia2))
		begin
			Insert into #TempTable1 Exec VerAutosDisponibles @idSucursal=3
			if(EXISTS(Select id from #TempTable1))
				begin
					set @datos = 'Dirijase a la sucursal 3'
					Select @datos
				end
		end
		else
			Select -1
end