
   -- 1.List the names of all products in the producto table.
    SELECT nombre FROM producto;
    
    -- 2.List the names and prices of all products in the producto table.
    SELECT nombre, precio FROM producto;
    
    -- 3.List all columns of the producto table.
    SELECT * FROM producto;
   
   -- 4.List the product names, price in euros, and price in US dollars (USD).
    SELECT nombre,
    precio AS precio_euro,
    ROUND(precio * 1.07,2) AS precio_dolar
    FROM producto;
    
    -- 5.List the product names, price in euros, and price in US dollars (USD). Use the following aliases for the columns: product name, euros, dollars.
    SELECT nombre AS nombre_producto,
    precio AS euro,
    ROUND(precio * 1.07,2) AS dolar
    FROM producto;
   
   -- 6.List the names and prices of all products in the producto table, converting the names to uppercase.
    SELECT UPPER(nombre),
    precio
    FROM producto;
  
  -- 7.List the names and prices of all products in the producto table, converting the names to lowercase.
    SELECT LOWER(nombre),
    precio
    FROM producto;
    
    -- 8.List the name of all manufacturers in one column, and in another column get the first two characters of the manufacturer name in uppercase.
     SELECT nombre,
     UPPER(LEFT(nombre,2)) AS iniciales
     FROM fabricante;
   
   -- 9.List the names and prices of all products in the producto table, rounding the price value.
    SELECT nombre,
    ROUND(precio,1) AS precio_redondo
    FROM producto;
   
   -- 10.List the names and prices of all products in the producto table, truncating the price value to show it without any decimal places.
    SELECT nombre,
    TRUNCATE(precio ,0) AS precio_redondo
    FROM producto;
    
    -- 11.List the codes of manufacturers that have products in the producto table.
    SELECT codigo_fabricante FROM producto;
   
   -- 12.List the codes of manufacturers that have products in the producto table, removing duplicate codes.
     SELECT DISTINCT codigo_fabricante FROM producto;
    
    -- 13.List the manufacturer names sorted in ascending order.
    SELECT nombre FROM fabricante
    ORDER BY nombre ASC;
    
    -- 14.List the manufacturer names sorted in descending order.
    SELECT nombre FROM fabricante
    ORDER BY nombre DESC;
   
    -- 15. List the product names sorted first by name in ascending order and second by price in descending order.
	SELECT nombre, 
    precio 
    FROM producto
    ORDER BY nombre ASC, precio DESC;
    
-- 16.Return a list with the first 5 rows of the fabricante table.

	SELECT * FROM fabricante LIMIT 5;

-- 17.Return a list with 2 rows starting from the fourth row of the fabricante table. The fourth row should also be included in the response.

	SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. List the name and price of the cheapest product. (Use only the ORDER BY and LIMIT clauses). NOTE: You cannot use MIN(price) here, you would need GROUP BY.

	SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
	
-- 19.List the name and price of the most expensive product. (Use only the ORDER BY and LIMIT clauses). NOTE: You cannot use MAX(price) here, you would need GROUP BY.

	SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
    
-- 20.List the name of all products from the manufacturer whose manufacturer code equals 2.

	SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. Return a list with the product name, price, and manufacturer name of all products in the database.

	SELECT p.nombre,
    p.precio,
    f.nombre 
    FROM producto p 
    INNER JOIN fabricante f 
    ON p.codigo_fabricante = f.codigo;

-- 22.Return a list with the product name, price, and manufacturer name of all products in the database. Sort the result by manufacturer name in alphabetical order.

	SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC; 

-- 23.Return a list with the product code, product name, manufacturer code, and manufacturer name of all products in the database.

	SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24.Return the product name, its price, and the name of its manufacturer, for the cheapest product.

	SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

-- 25.Return the product name, its price, and the name of its manufacturer, for the most expensive product.

	SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

-- 26.Return a list of all products from the manufacturer Lenovo.

	SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo  WHERE f.nombre = 'Lenovo'; 

-- 27.Return a list of all products from the manufacturer Crucial that have a price greater than €200.

	SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo  WHERE f.nombre = 'Crucial' AND p.precio > 200; 

-- 28.Return a list of all products from manufacturers Asus, Hewlett-Packard, and Seagate. Without using the IN operator.

	SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo  WHERE f.nombre = 'Asus'OR  f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate'; 

-- 29. Return a list of all products from manufacturers Asus, Hewlett-Packard, and Seagate. Using the IN operator.

	SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo  WHERE f.nombre IN('Asus','Hewlett-Packard','Seagate'); 

-- 30.Return a list with the name and price of all products from manufacturers whose name ends with the vowel e.

	SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';


-- 31.Return a list with the name and price of all products whose manufacturer name contains the character w in its name.

	SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
    
-- 32.Return a list with the product name, price, and manufacturer name of all products that have a price greater than or equal to €180. Sort the result first by price (in descending order) and second by name (in ascending order).

	SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- 33.Return a list with the code and name of manufacturers, only those manufacturers that have associated products in the database.

	SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 34.Return a list of all manufacturers that exist in the database, together with the products each of them has. The list should also show those manufacturers that have no associated products.

	SELECT DISTINCT f.*,p.* FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35.Return a list where only those manufacturers that have no associated products appear.

	SELECT DISTINCT f.* FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

-- 36.Return all products from the manufacturer Lenovo. (Without using INNER JOIN).

	SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 37.Return all data of products that have the same price as the most expensive product from manufacturer Lenovo. (Without using INNER JOIN).

	SELECT * FROM producto WHERE precio = (SELECT precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1);

-- 38.List the name of the most expensive product from manufacturer Lenovo.

	SELECT nombre FROM producto WHERE precio = (SELECT precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1);

-- 39.List the name of the cheapest product from manufacturer Hewlett-Packard.

	SELECT nombre FROM producto WHERE precio = (SELECT precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') ORDER BY precio ASC LIMIT 1);

-- 40.Return all products in the database that have a price greater than or equal to the most expensive product from manufacturer Lenovo.

	SELECT * FROM producto WHERE precio >= (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 41.List all products from manufacturer Asus that have a price higher than the average price of all its products.

	SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

-- University Database

-- 42.Return a list with the first surname, second surname, and name of all students. The list should be alphabetically sorted in ascending order by first surname, second surname, and name.

	SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 43.Find the name and both surnames of students who have not registered their phone number in the database.

	SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.tipo = 'alumno' AND telefono IS NULL;

-- 44.Return the list of students who were born in 1999.

	SELECT * FROM persona p WHERE p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = 1999; 

-- 45.Return the list of professors who have not registered their phone number in the database and whose NIF ends in K.

	SELECT * FROM persona p WHERE p.tipo = 'profesor' AND telefono IS NULL AND p.nif LIKE '%k';

-- 46.Return the list of subjects taught in the first quarter, in the third year of the degree with identifier 7.

	SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 47. Return a list of professors together with the name of the department they are linked to. The list should return four columns: first surname, second surname, name, and department name. The result should be sorted alphabetically in ascending order by surnames and name.

	SELECT p.apellido1, p.apellido2, p.nombre,d.nombre FROM persona p INNER JOIN profesor prof ON p.id = prof.id_profesor INNER JOIN departamento d ON prof.id_departamento = d.id ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
    
-- 48.Return a list with the subject name, start year, and end year of the school year for the student with NIF 26902806M.

	SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM curso_escolar c INNER JOIN alumno_se_matricula_asignatura matri ON c.id = matri.id_curso_escolar INNER JOIN persona p ON matri.id_alumno = p.id  INNER JOIN asignatura a ON matri.id_asignatura = a.id WHERE p.nif = '26902806M';

-- 49.Return a list with the name of all departments that have professors who teach some subject in the Degree in Computer Engineering (Plan 2015).

	SELECT DISTINCT d.nombre FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento INNER JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id_grado = 4;

-- 50. Return a list with all students who have enrolled in some subject during the 2018/2019 school year.
	SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno JOIN curso_escolar c ON m.id_curso_escolar = c.id WHERE p.tipo = 'alumno' AND c.anyo_inicio = 2018 AND c.anyo_fin = 2019;
-- **Solve the following 6 queries using LEFT JOIN and RIGHT JOIN clauses:**

-- 51.Return a list with the names of all professors and the departments they are linked to. The list should also show those professors who have no department associated. 
-- The list should return four columns: department name, first surname, second surname, and professor name. The result should be sorted alphabetically in ascending order by department name, surnames, and name.
	
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre AS nombre_profesor FROM persona p INNER JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 52.Return a list with professors who are not associated with a department.

SELECT d.nombre AS departamento FROM departamento d LEFT JOIN profesor prof ON d.id = prof.id_departamento WHERE prof.id_profesor IS NULL;

-- 53.Return a list with departments that have no professors associated.

SELECT p.nombre FROM persona p JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- 54.Return a list with professors who do not teach any subject.

SELECT p.nombre FROM persona p JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- 55. Return a list with subjects that do not have a professor assigned.

SELECT a.nombre FROM profesor p RIGHT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE p.id_profesor IS NULL;

-- 56. Return a list with all departments that have not taught subjects in any school year.

SELECT d.nombre FROM departamento d LEFT JOIN ( SELECT DISTINCT prof.id_departamento FROM profesor prof INNER JOIN asignatura a ON prof.id_profesor = a.id_profesor) AS departamento_con_asignatura ON d.id = departamento_con_asignatura.id_departamento WHERE departamento_con_asignatura.id_departamento IS NULL;


-- **Summary Queries:**

-- 57. Return the total number of students there are.

SELECT COUNT(*) AS numero_alumnos FROM persona WHERE tipo = 'alumno';

-- 58.Calculate how many students were born in 1999.

SELECT COUNT(*) AS numero_alumnos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 59.Calculate how many professors there are in each department. The result should only show two columns: one with the department name and another with the number of professors in that department. 
-- The result should only include departments that have professors associated and should be sorted in descending order by the number of professors.

SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS num_profesores_departamento FROM profesor p JOIN departamento d ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY num_profesores_departamento DESC;

-- 60.Return a list with all departments and the number of professors in each of them. Note that there may be departments that have no professors associated. These departments should also appear in the list.

SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS num_profesores_departamento FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY num_profesores_departamento DESC;

-- 61.Return a list with the name of all existing degrees in the database and the number of subjects each has. Note that there may be degrees that have no subjects associated. 
-- These degrees should also appear in the list. The result should be sorted in descending order by the number of subjects.

SELECT g.nombre AS nombre_grado, COUNT(a.id_grado) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id ORDER BY numero_asignaturas DESC;

-- 62.Return a list with the name of all existing degrees in the database and the number of subjects each has, for degrees that have more than 40 associated subjects.

SELECT g.nombre, COUNT(a.id_grado) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING num_asignaturas > 40; 
