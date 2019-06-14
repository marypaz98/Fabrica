create procedure realizarPedidoSucursal1(@idSucursal int, @idAutomovil int, @idCliente int, @fechaPedido date, @fechaEntrega date)
as
BEGIN
	begin try
		declare @idAutomovilxSucursal int
		Select @idAutomovilxSucursal=idAutomovilxSucursal from [Sucursal_1].[dbo].AutomovilxSucursal 
		where idAutomovil= @idAutomovil and idSucursal=@idSucursal
		set transaction isolation level read uncommitted
		begin transaction
		Insert into PedidoSucursal1
		Select 1, @idAutomovilxSucursal, @idCliente, @fechaPedido,@fechaEntrega,0 --O significa no despachado	
		commit 
	END TRY
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
END
go
create procedure realizarPedidoSucursal2(@idSucursal int, @idAutomovil int, @idCliente int, @fechaPedido date, @fechaEntrega date)
as
BEGIN
	begin try
		declare @idAutomovilxSucursal int
		Select @idAutomovilxSucursal=idAutomovilxSucursal from [Sucursal_2].[dbo].AutomovilxSucursal 
		where idAutomovil= @idAutomovil and idSucursal=@idSucursal
		set transaction isolation level read uncommitted
		begin transaction
		Insert into PedidoSucursal2
		Select 1, @idAutomovilxSucursal, @idCliente, @fechaPedido,@fechaEntrega,0 --O significa no despachado	
		commit 
	END TRY
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
END
GO
create procedure realizarPedidoSucursal3(@idSucursal int, @idAutomovil int, @idCliente int, @fechaPedido date, @fechaEntrega date)
as
BEGIN
	begin try
		declare @idAutomovilxSucursal int
		Select @idAutomovilxSucursal=idAutomovilxSucursal from [Sucursal_2].[dbo].AutomovilxSucursal 
		where idAutomovil= @idAutomovil and idSucursal=@idSucursal
		set transaction isolation level read uncommitted
		begin transaction
		Insert into PedidoSucursal3
		Select 1, @idAutomovilxSucursal, @idCliente, @fechaPedido,@fechaEntrega,0 --O significa no despachado	
		commit 
	END TRY
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
END
go
create procedure pedirFabrica (@pidSucursal int, @pidAutomovil int, @pidCliente int, @pfechaPedido date, @pfechaEntrega date)
as
BEGIN
	if @pidSucursal=1 
		exec realizarPedidoSucursal1 @idSucursal= @pidSucursal, @idCliente=@pidCliente, @idAutomovil=@pidAutomovil, @fechaPedido=@pfechaPedido, @fechaEntrega=@pfechaEntrega
	else
		begin
			if @pidSucursal=2
				exec realizarPedidoSucursal2 @idSucursal= @pidSucursal,@idCliente=@pidCliente, @idAutomovil=@pidAutomovil, @fechaPedido=@pfechaPedido, @fechaEntrega=@pfechaEntrega
			else
			exec realizarPedidoSucursal3 @idSucursal= @pidSucursal,@idCliente=@pidCliente, @idAutomovil=@pidAutomovil, @fechaPedido=@pfechaPedido, @fechaEntrega=@pfechaEntrega
		end
END
GO

