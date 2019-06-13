create procedure autenticarUsuario (@usuario varchar(20), @contrasenna varchar(20))
as
begin
	if EXISTS(Select usuario from ClienteUbicacion where usuario=@usuario and contrasenna=@contrasenna)
		Select idCliente from ClienteUbicacion where usuario=@usuario and contrasenna=@contrasenna
	else
		Select -1
end