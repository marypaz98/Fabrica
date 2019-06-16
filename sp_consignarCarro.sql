create procedure sp_ConsignarCarro(@idSucursal int,@idTipoAutomovil int, @idTipoCombustible int, @placa varchar(20), @precioBase money, @anno int, @color varchar(20),@marca varchar(20),
@cantidadPasajeros int, @nPuertas int)
as
begin
	begin try
		declare @idCaracteristica int, @idAutomovil int
		begin transaction 
			Insert into Automovil(idTipoAutomovil, idTipoCombustible,placa,precioBase,consignacion,anno)
			values(@idTipoAutomovil,@idTipoCombustible,@placa,@precioBase,1,@anno)
		commit transaction
		set @idAutomovil = IDENT_CURRENT('Automovil')
		begin transaction
			Insert into Caracteristicas(color,marca,cantidadPasajeros,nPuertas)
			values(@color,@marca,@cantidadPasajeros,@nPuertas)
		commit transaction
		set @idCaracteristica = IDENT_CURRENT('Caracteristicas')
		begin transaction
			Insert into CaracteristicasxAutomovil(idCaracteristica,idAutomovil)
			values(@idCaracteristica,@idAutomovil)
		commit transaction
		if @idSucursal=1
			begin transaction
				Insert into Sucursal_1.dbo.AutomovilxSucursal(idAutomovil,idSucursal)
				values(@idAutomovil,@idSucursal)
			commit transaction
		if @idSucursal=2
			begin transaction
				Insert into Sucursal_2.dbo.AutomovilxSucursal(idAutomovil,idSucursal)
				values (@idAutomovil,@idSucursal)
			commit transaction
		if @idSucursal=3
			begin transaction
				Insert into Sucursal_3.dbo.AutomovilxSucursal(idAutomovil,idSucursal)
				values(@idAutomovil,@idSucursal)
			commit transaction
	end try
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
end
GO
create procedure sp_AgregarFoto(@idAutomovil int, @foto image)
as
begin
	begin try
		declare @idFoto INT
		begin transaction
			Insert into Foto(foto)
			values (@foto)
		commit transaction
		set @idFoto=IDENT_CURRENT('Foto')
		begin transaction
			Insert into FotoxAutomovil(idAutomovil,idFoto)
			values(@idAutomovil,@idFoto)
		commit transaction
	end try
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
end
