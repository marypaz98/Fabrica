create procedure verHorarioSucursal (@idSucursal int)
as
begin
if @idSucursal=1 	
	Select horaEntrada as entrada, horaEntrada as salida from [Sucursal_1].[dbo].[Sucursal] S
	
if @idSucursal=2
	Select horaEntrada as entrada, horaSalida as salida from [Sucursal_2].[dbo].[Sucursal]
	
if @idSucursal=3
	Select horaEntrada as entrada, horaSalida as salida from [Sucursal_3].[dbo].[Sucursal] 
	
end
GO
create procedure verEmpleadosSucursal (@idSucursal int)
as
begin
if @idSucursal=1
	Select nombre, apellido1, apellido2 from [Sucursal_1].[dbo].[Empleado]
if @idSucursal=2
	Select nombre, apellido1, apellido2 from [Sucursal_2].[dbo].[Empleado]
if @idSucursal=3
	Select nombre, apellido1, apellido2 from [Sucursal_3].[dbo].[Empleado]
END
