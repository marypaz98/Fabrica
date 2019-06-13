create procedure registrarUsuario (@usuario varchar(20), @contrasenna varchar(20), @ubicacion geometry, 
@nombre varchar(20), @apellido1 varchar(20), @apellido2 varchar(20), @cedula int, @edad int)
as
begin
	begin try
		set transaction isolation level read uncommitted
		begin transaction

		Insert into Cliente(nombre, apellido1, apellido2, cedula, edad)
		values (@nombre, @apellido1, @apellido2, @cedula, @edad)
		Insert into ClienteUbicacion (usuario, contrasenna, ubicacion)
		values(@usuario,@contrasenna, @ubicacion)
		commit
	end try
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
end

--declare @g geometry
--set @g=geometry::STGeomFromText
--(  'POLYGON((2 -1, 2 1, 3 1, 3 -1, 2 -1))', 0)
--exec registrarUsuario @usuario='hola', @contrasenna='adios', @ubicacion=@g, @nombre='nose',@apellido1='jaja', @apellido2='jeje',
--@cedula='132433', @edad='1213'
