USE [Fabrica]
GO
/****** Object:  StoredProcedure [dbo].[registrarUsuario]    Script Date: 17/6/2019 12:43:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[registrarUsuario] (@usuario varchar(20), @contrasenna varchar(20), @ubicacion nvarchar(MAX), 
@nombre varchar(20), @apellido1 varchar(20), @apellido2 varchar(20), @cedula int, @edad int)
as
begin
	begin try
		declare @pubicacion geometry,@msj varchar(MAX)
		if @edad >= 18
		begin
			set @pubicacion=geometry::STGeomFromText(@ubicacion,0)
			set transaction isolation level read uncommitted
			begin transaction

			Insert into Cliente(nombre, apellido1, apellido2, cedula, edad)
			values (@nombre, @apellido1, @apellido2, @cedula, @edad)
			Insert into ClienteUbicacion (usuario, contrasenna, ubicacion)
			values(@usuario,@contrasenna, @pubicacion)
			commit
			set @msj = 'Usuario registrado con exito'
			Select @msj
		end
		else
			set @msj = 'Debe ser mayor de edad para poder usar la aplicación'
			
	end try
	begin catch
		declare @errorMsg varchar(100) = 'Ha ocurrido un error al registrar el usuario'
		print('ERROR:'+@errorMsg)
		select @errorMsg
		return -1*@@ERROR
	end catch
end
