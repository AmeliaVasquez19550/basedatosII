/*
1.  Scenario: Reporte de clientes (Antonio Quiej)
Given: El due�o del negocio requiere conocer a sus clientes
When: requiera la informaci�n
Then: un reporte deber�a mostrar el nombre, direcci�n, tel�fono y nit
And: debe estar ordenado por nombre 
And: debe estar filtrado por las ventas del a�o 2016.
*/






/*
2.  Scenario: Reporte de art�culos (David Fernandez)
Given: El due�o del negocio requiere un listado de productos
When: requiera la informaci�n
Then: deber�a mostrar el c�digo, nombre, precio, costo, existencia y marca 
And: debe mostrar el recuento de ventas
And: debe estar ordenado por marca y nombre de art�culo.
*/

-- Soluciones





/*
3.  Scenario: Reporte de ventas (Allan y David)
Given: el due�o de un negocio requiere informaci�n de las ventas
When: requiera la informaci�n
Then: deber�a mostrar la fecha, nit, cliente, total de venta, numero de productos vendidos 
And: debe mostrar la fecha de ultima venta del �ltimo trimestre por cliente
And: debe estar ordenado por A�o, mes y d�a.
*/

 
	

/* 
4.  Scenario: Reporte detallado de utilidad por productos (David Vazquez)
Given: el due�o de un negocio requiere conocer la utilidad bruta. 
When: requiera la informaci�n
Then: deber�a mostrar el nombre del producto, utilidad bruta.
And: debe estar ordenado por nombre de producto.
*/




/*
5.  Scenario: Reporte detallado de utilidad por marca (Eloina Carrillo)
Given: el due�o de un negocio requiere conocer la utilidad bruta  por marca
When: requiera la informaci�n
Then: deber�a mostrar el a�o, el nombre la marca, utilidad bruta.
And: debe estar ordenado por a�o en forma descendente y por nombre de marca en forma ascendente.
And: debe estar agrupado por a�o y nombre de marca.
*/




/*
6.  Scenario: Frecuencia de ventas por cliente. (Guillermo Pisqui)
Given: el due�o de un negocio requiere la frecuencia de ventas por cliente
When: requiera la informaci�n
Then: debe mostrar el nombre del cliente y la frecuencia de ventas seg�n la fecha.
And: debe estar ordenado por la frecuencia de menor a mayor.
*/





/*
7.   Scenario: Reporte de ventas por departamento y municipio (Julio Gil)
Given: el due�o de un negocio requiere conocer las ventas por departamento y municipio.
When: solicite el reporte filtrado por uno o varios departamentos 
And: por uno o varios municipios
And: por una fecha de inicio y final
Then: los datos del reporte deben mostrar las columnas siguientes 
| columnas 				|
| cantidad de productos vendidos 	|
| promedio de productos vendidos 	|
| total de ventas en quetzales 		|
| promedio de ventas en quetzales 	|
And: los resultados deben estar listados en orden descendente por los datos del total de ventas en quetzales.
*/






/*
8.  Scenario: Ventas de producto por color (Alan Alvarez)
Given: el due�o de un negocio requiere conocer las ventas por departamento y municipio.
When: solicite el reporte filtrado por ninguno o varios departamentos 
And: por una fecha de inicio y final
And: por ninguno o varios colores
Then: los datos del reporte deben mostrar las columnas siguientes 
| Columnas 				|
| Color 				|
| Departamento 			|
| Mes 					|
| Recuento de productos vendidos 	|
*/





/*
9.  Scenario: Reporte de utilidad bruta (Daniel Estupe)
Given: el due�o de un negocio requiere informaci�n de las ventas
When: requiera la informaci�n
Then: deber�a mostrar el a�o, mes, ingresos, egresos y utilidad bruta 
And: debe estar ordenado por a�o y mes
And: debe ser posible filtrar por ninguno o varios a�os y por ninguno o varios meses
*/

declare @consulta varchar(max)
declare @anhos varchar(50)
declare @meses varchar(50)

select @anhos = '2016'
select @meses = '2'

set @consulta = 'select year(fecha) as A�o,
					   datename(month, fecha) as Mes,
					   sum(sd.costoTotal) as Ingresos,
					   sum(sd.cantidad * p.costo) as Egresos,
					   sum(costoTotal - cantidad * p.costo) as Utilidad_Bruta
				from Salida s
				inner join SalidaDetalle sd on sd.idSalida = s.idSalida
				inner join Productos p on p.id = sd.idProducto
				where (len('+ @anhos + ') > 0) 
				and (len(' + @meses + ') > 0)
				and (year(fecha) in (' + @anhos + ')) 
				and month(fecha) in (' + @meses + ')
				group by year(fecha), datename(month, fecha), month(fecha)
				order by A�o desc, month(fecha) asc'
exec(@consulta)






/*
10.  Scenario: Reporte de utilidad bruta por departamento (Hans Batres)
Given: el due�o de un negocio requiere informaci�n de las ventas
When: requiera la informaci�n
Then: deber�a mostrar el departamento, ingresos, egresos y utilidad bruta 
And: debe estar ordenado por departamento
And: debe ser posible filtrar por ninguno o varios departamentos
*/





/*
11.  Scenario: Reporte de proveedores (Francisco Ramirez)
Given: El due�o del negocio requiere conocer a sus proveedores
When: requiera la informaci�n
Then: un reporte deber�a mostrar el nombre del proveedor, direcci�n, tel�fono, nit, fecha de primera compra, fecha de �ltima compra, frecuencia de compra promedio 
And: debe estar ordenado por nombre
And: debe estar filtrado por uno o varios meses y uno o varios a�os
*/




/*
12.  Scenario: Reporte de proveedores por producto (Alermo Galindo)
Given: El due�o del negocio requiere conocer a sus proveedores
When: requiera la informaci�n
Then: un reporte deber�a mostrar el nombre del proveedor y los �ltimos cinco productos comprados con su costo (Q), cantidad (#) y total compra (Q)
And: debe estar ordenado por nombre
And: debe estar filtrado por uno o varios proveedores y uno o varios productos
*/






