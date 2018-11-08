-- 1. Insertar un Director del departamento 40 (Operaciones) indicando en la
-- sentencia un valor para todos los campos (null para comisión).
INSERT INTO curso.empleados (numero,nombre,puesto,jefe,fechaAlta,salario,comision,dnumero) 
VALUES (99,'Pepe','Director',null,NOW(),6000,null,40);
-- 	2. Insertar un nuevo empleado del departamento 40 indicando solo el valor
-- de los campos obligatorios (el jefe será el empleado anterior).
INSERT INTO curso.empleados (numero,nombre,puesto,jefe,fechaAlta,salario,dnumero) 
VALUES (98,'Juan','Empleado',99,NOW(),6000,40);

-- 3. Intentar insertar un departamento con número igual a 30.
INSERT INTO curso.departamentos
VALUES (30,'RRHH','Malaga');

-- 4. Insertar un nuevo departamento de Ventas en Salamanca con número 50, a
-- partir del departamento de Ventas que ya existe (departamento 30).
INSERT INTO departamentos
 SELECT 50, nombre,'Salamanca' 
 FROM departamentos
 WHERE numero=30;

-- 5. Poner una comisión de 100 € a los empleados de Contabilidad.
UPDATE curso.empleados e
JOIN curso.departamentos d ON d.numero=e.dnumero
SET  e.salario = e.salario+e.salario*0.1
WHERE d.nombre='contabilidad';

-- 6. Subir la comisión de los empleados de Ventas en un 2% por cada año
--  trabajado.
UPDATE curso.empleados e
JOIN curso.departamentos d ON d.numero=e.dnumero
SET  e.comision = e.comision + e.comision * 0.02 * TIMESTAMPDIFF(YEAR,e.fechaAlta,NOW())
WHERE d.nombre='ventas' AND e.comision IS NOT NULL;
-- 7. Eliminar al director del departamento 40.
DELETE FROM curso.empleados
WHERE puesto = 'director' AND dnumero = 40;
-- 8. Intentar eliminar el departamento 40.
DELETE FROM curso.departamentos
WHERE numero = 40;
-- 9. Eliminar los empleados del departamento 40.
DELETE FROM curso.empleados
WHERE dnumero = 40;
-- 10.Intentar eliminar el departamento 40.
DELETE FROM curso.departamentos
WHERE numero = 40;