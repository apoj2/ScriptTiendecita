CREATE DATABASE TIENDECITA
GO
USE TIENDECITA
GO
CREATE TABLE Clientes(
IdCliente int primary key identity(1,1),
Identificacion varchar(15),
ApellidosCliente varchar(25),
NombreCliente varchar(25),
CelularCliente varchar(12),
DireccionCliente varchar(20),
CiudadCliente varchar (15),

)
CREATE TABLE Productos(
IdProducto int primary key identity(1,1),
NombreProducto varchar(15),
TipoDeProducto varchar(20),
CantidadEnStock smallint,
Precio int,
Iva smallint
)
CREATE TABLE Factura(
IdFactura int primary key identity(1,1),
IdCliente int,
IdProducto int,
FechaDeCompra date,
CantidadDeProducto smallint,
Descuento int
foreign key (IdCliente) references Clientes(IdCliente),
foreign key (IdProducto) references Productos(IdProducto)
)
create or alter  procedure usp_InsertarClientes 
@Identificacion varchar(15),
@ApellidosCliente varchar(25),
@NombreCliente varchar(25),
@CelularCliente varchar(12),
@DireccionCliente varchar(20),
@CiudadCliente varchar (15)
as
begin
insert into Clientes(Identificacion,ApellidosCliente,NombreCliente,CelularCliente,DireccionCliente,CiudadCliente)
       VALUES(@Identificacion,@ApellidosCliente,@NombreCliente,@CelularCliente,@DireccionCliente,@CiudadCliente)
end

exec usp_InsertarClientes '21619618','Tobon Perez','Dora Maria','3206567895','crr90c#76db20','Medellin'
 
exec usp_InsertarClientes '1020103090','Tobon Perez','Angel','3206368873','crr90c#76db20','Medellin'
exec usp_InsertarClientes '1020103090','Armando Mesas','Juan','3213677896','crr76c#65hg92','Copacabana'

select * from Clientes


create or alter  procedure usp_ActualizarClientes 
@Identificacion varchar(15),
@ApellidosCliente varchar(25),
@NombreCliente varchar(25),
@CelularCliente varchar(12),
@DireccionCliente varchar(20),
@CiudadCliente varchar (15)
as
begin
update Clientes
set Identificacion=@Identificacion,ApellidosCliente=@ApellidosCliente,NombreCliente=@NombreCliente,CelularCliente=@CelularCliente,DireccionCliente=@DireccionCliente,CiudadCliente=@CiudadCliente
where Identificacion='1020103090'
end

exec usp_ActualizarClientes'1020103090','Tobon Perez','Angel','3206368873','crr90c#76db20','Medellin'

select*from Clientes

create or alter  procedure usp_EliminarClientes 
@Identificacion varchar(15),
@ApellidosCliente varchar(25),
@NombreCliente varchar(25),
@CelularCliente varchar(12),
@DireccionCliente varchar(20),
@CiudadCliente varchar (15)
as
begin
Delete from Clientes
where Identificacion = '1020103090'
end
 
exec usp_EliminarClientes '1020103090','Tobon Perez','Angel','3206368873','crr90c#76db20','Medellin'

select*from Clientes

create or alter  procedure usp_InsertarProductos
@NombreProducto varchar(15),
@TipoDeProducto varchar(20),
@CantidadEnStock smallint,
@Precio int,
@Iva smallint
as
begin
insert into Productos(NombreProducto,TipoDeProducto,CantidadEnStock,Precio,Iva)
       VALUES(@NombreProducto,@TipoDeProducto,@CantidadEnStock,@Precio,@Iva)
end

exec

select * from Clientes


create or alter  procedure usp_ActualizarProductos
@Identificacion varchar(15),
@ApellidosCliente varchar(25),
@NombreCliente varchar(25),
@CelularCliente varchar(12),
@DireccionCliente varchar(20),
@CiudadCliente varchar (15)
as
begin
update Clientes
set Identificacion=@Identificacion,ApellidosCliente=@ApellidosCliente,NombreCliente=@NombreCliente,CelularCliente=@CelularCliente,DireccionCliente=@DireccionCliente,CiudadCliente=@CiudadCliente
where Identificacion='1020103090'
end

exec usp_ActualizarClientes'1020103090','Tobon Perez','Angel','3206368873','crr90c#76db20','Medellin'

select*from Clientes

create or alter  procedure usp_EliminarProductos
@Identificacion varchar(15),
@ApellidosCliente varchar(25),
@NombreCliente varchar(25),
@CelularCliente varchar(12),
@DireccionCliente varchar(20),
@CiudadCliente varchar (15)
as
begin
Delete from Clientes
where Identificacion = '1020103090'
end
 
exec usp_EliminarClientes '1020103090','Tobon Perez','Angel','3206368873','crr90c#76db20','Medellin'

select*from Clientes

create or alter proc caregoria_existe
@Identificacion varchar(15),
@ApellidosCliente varchar(25),
@NombreCliente varchar(25),
@CelularCliente varchar(12),
@DireccionCliente varchar(20),
@CiudadCliente varchar (15)
as
 
 if exists (select Identificacion from Clientes where Identificacion = @Identificacion)
 begin
   update Clientes
   set Identificacion=@Identificacion,ApellidosCliente=@ApellidosCliente,NombreCliente=@NombreCliente,CelularCliente=@CelularCliente,DireccionCliente=@DireccionCliente,CiudadCliente=@CiudadCliente
   where Identificacion=@Identificacion
 end
 else
 begin

   print 'cliente no existe'
   insert into Clientes(Identificacion,ApellidosCliente,NombreCliente,CelularCliente,DireccionCliente,CiudadCliente)
       VALUES(@Identificacion,@ApellidosCliente,@NombreCliente,@CelularCliente,@DireccionCliente,@CiudadCliente)

 end

 exec caregoria_existe '21619618','Tobon Perez','carla mnaria','329999968873','crr90c#76db20','pereira'
 
 
 select*from Clientes

 exec caregoria_existe '102010301490','arenas taborda','juan','3002018246941','crra90c#765dbv56','Bogota'

  select*from Clientes

