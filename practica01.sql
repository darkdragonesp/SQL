-- @autor Francisco Molina Sanchez
-- 1. Todos los datos de los departamentos.
SELECT * FROM curso.departamentos;
-- 2. El nombre, puesto y salario de todos los empleados, por orden
-- alfabético.
SELECT e.nombre, e.puesto, e.salario FROM curso.empleados e;
-- 3. Contar el número de empleados.
SELECT COUNT(*) numEmpleados FROM curso.empleados;
-- 4. Nombre de los distintos puestos de trabajo.
SELECT DISTINCT e.puesto FROM curso.empleados e; 
-- 5. Contar el número de puestos de trabajos distintos.
SELECT COUNT(DISTINCT e.puesto) numPuestos FROM curso.empleados e; 
-- 6. Datos de los empleados cuyo nombre acabe en ‘z’.
SELECT * FROM curso.empleados e WHERE e.nombre LIKE '%z'; 
-- 7. Datos de los empleados que ganen más de 2000 y menos de 4000.
SELECT * FROM curso.empleados e WHERE e.salario>2000 AND e.salario<4000;
-- 8. Nombre de los empleados que empezaron a trabajar en el 81
SELECT * FROM curso.empleados e WHERE e.fechaAlta>=YEAR('1981-01-01 00:00:00');
-- 9. Salario de los empleados, y salario resultante si se incrementa un 10%.
SELECT e.salario, e.salario+e.salario*0.1 FROM curso.empleados e;
-- 10.Nombre y departamento de los empleados sin comisión.
SELECT e.nombre,  d.nombre
	FROM curso.empleados e 
    JOIN curso.departamentos d ON e.dnumero=d.numero
	WHERE e.comision IS NULL;
-- 11.Datos de los empleados y de sus departamentos.
SELECT *
	FROM curso.empleados e 
    JOIN curso.departamentos d ON e.dnumero=d.numero;
-- 12.Todos los empleados que no son del departamento de Ventas.
SELECT * 
	FROM curso.empleados e 
    JOIN curso.departamentos d ON e.dnumero=d.numero
    WHERE d.nombre <>'ventas';
-- 13.Nombre de cada empleado, y el nombre de su jefe.
SELECT e.nombre, j.nombre
	FROM curso.empleados e 
    JOIN curso.empleados j ON e.jefe=j.numero;
-- 14.Nombre y número de meses que llevan trabajando los empleados de
-- Sevilla.
SELECT e.nombre, TIMESTAMPDIFF(MONTH,e.fechaAlta,NOW()) 'Meses'
	FROM curso.empleados e
    JOIN curso.departamentos d ON e.dnumero=d.numero
    WHERE d.ciudad = 'sevilla';
-- 15.Nombre, puesto y un mensaje ‘Sin comisión’ si no tiene comisión, o
-- ‘Con comisión: XXX’ si tiene comisión (XXX es la comisión).
SELECT e.nombre, e.puesto, 'Sin comision' 
	FROM curso.empleados e
    WHERE e.comision IS NULL
UNION
	SELECT  e.nombre, e.puesto, CONCAT('Con comision:',e.comision) 
    FROM curso.empleados e
    WHERE e.comision IS NOT NULL;
-- 16.Obtener los 5 empleados con menor sueldo.
SELECT *
	FROM curso.empleados e
    ORDER BY e.salario 
    LIMIT 5;
-- 17.Nombre de cada departamento y la media de sus sueldos.
SELECT d.nombre, AVG(e.salario)
	FROM curso.departamentos d
    JOIN curso.empleados e ON e.dnumero=d.numero
    GROUP BY e.dnumero;
-- 18.Media de los sueldos de los departamentos Ventas y Contabilidad.
SELECT d.nombre, AVG(e.salario)
	FROM curso.departamentos d
    JOIN curso.empleados e ON e.dnumero=d.numero
    GROUP BY e.dnumero
    HAVING d.nombre ='ventas' OR d.nombre='contabilidad';
-- 19.Nombre de cada departamento cuyo número de empleados es mayor a
-- dos.
SELECT d.nombre, COUNT(e.numero)
	FROM curso.departamentos d
    JOIN curso.empleados e ON e.dnumero=d.numero
    GROUP BY e.dnumero
    HAVING COUNT(e.numero)>2;
-- 20.Nombre de los empleados que tienen un sueldo igual al máximo de cada
-- departamento.
SELECT e.nombre, e.salario
	FROM curso.empleados e
	WHERE (e.dnumero, e.salario) IN
        (SELECT e.dnumero,MAX(e.salario)
		FROM curso.empleados e
        GROUP BY e.dnumero)
        ;
        
