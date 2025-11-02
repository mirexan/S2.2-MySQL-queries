# S2.2-SQL Queries

## 📄 Description

This project focuses on practicing SQL query skills. It involves working with two provided databases, **Tienda** (Store) and **Universidad** (University), and solving a comprehensive list of queries for each.

The `Tienda` and `Universidad` databases schemas and data must be loaded from the provided `.sql` files, each database
schema is stored in "schema_" directory.

---

## Exercise 01 - Tienda 🏪 (Store)

Design and populate a database with the following schema, then solve the required queries.

### Schema

* `fabricante`
	* `codigo` INT PRIMARY KEY
	* `nombre` VARCHAR(100)
* `producto`
	* `codigo` INT PRIMARY KEY
	* `nombre` VARCHAR(100)
	* `precio` DOUBLE
	* `codigo_fabricante` INT
* **Relationship:** `producto.codigo_fabricante` (FK) references `fabricante.codigo` (PK).

### Queries

1.  List the names of all products in the `producto` table.
2.  List the names and prices of all products in the `producto` table.
3.  List all columns of the `producto` table.
4.  List the product names, price in euros, and price in US dollars (USD).
5.  List the product names, price in euros, and price in US dollars (USD). Use the following aliases for the columns: `nombre de producto`, `euros`, `dólares`.
6.  List the names and prices of all products, converting the names to uppercase.
7.  List the names and prices of all products, converting the names to lowercase.
8.  List the name of all manufacturers in one column, and in another column get the first two characters of the manufacturer name in uppercase.
9.  List the names and prices of all products, rounding the price value.
10. List the names and prices of all products, truncating the price value to show it without any decimal places.
11. List the codes of manufacturers that have products in the `producto` table.
12. List the codes of manufacturers that have products in the `producto` table, removing duplicate codes.
13. List the manufacturer names sorted in ascending order.
14. List the manufacturer names sorted in descending order.
15. List the product names sorted first by name in ascending order and second by price in descending order.
16. Return a list with the first 5 rows of the `fabricante` table.
17. Return a list with 2 rows starting from the fourth row of the `fabricante` table. The fourth row should also be included.
18. List the name and price of the cheapest product. (Use only `ORDER BY` and `LIMIT`).
19. List the name and price of the most expensive product. (Use only `ORDER BY` and `LIMIT`).
20. List the name of all products from the manufacturer whose code is 2.
21. Return a list with the product name, price, and manufacturer name of all products.
22. Return a list with the product name, price, and manufacturer name, sorted by manufacturer name (alphabetically).
23. Return a list with the product code, product name, manufacturer code, and manufacturer name.
24. Return the name, price, and manufacturer of the cheapest product.
25. Return the name, price, and manufacturer of the most expensive product.
26. Return a list of all products from the manufacturer Lenovo.
27. Return a list of all products from the manufacturer Crucial that have a price greater than €200.
28. Return a list of all products from manufacturers Asus, Hewlett-Packard, and Seagate (Without using `IN`).
29. Return a list of all products from manufacturers Asus, Hewlett-Packard, and Seagate (Using `IN`).
30. Return a list with the name and price of all products from manufacturers whose name ends with the vowel 'e'.
31. Return a list with the name and price of all products whose manufacturer name contains the character 'w'.
32. Return a list with the product name, price, and manufacturer name of all products with a price >= €180. Sort by price (desc) and then name (asc).
33. Return a list with the code and name of manufacturers that have associated products.
34. Return a list of all manufacturers, along with their products. The list **must** show manufacturers that have no associated products.
35. Return a list showing **only** those manufacturers that have no associated products.
36. Return all products from the manufacturer Lenovo. (Without using `INNER JOIN`).
37. Return all data of products that have the same price as the most expensive product from Lenovo. (Without `INNER JOIN`).
38. List the name of the most expensive product from manufacturer Lenovo.
39. List the name of the cheapest product from manufacturer Hewlett-Packard.
40. Return all products that have a price greater than or equal to the most expensive product from Lenovo.
41. List all products from Asus that have a price higher than the average price of all its products.

---

## Exercise 02 - Universidad 🎓 (University)

Load the database from the `schema_universidad.sql` file. Visualize the E-R diagram and execute the following queries.

### Basic Queries

42. Return a list with the first surname, second surname, and name of all students. Sorted alphabetically by first surname, second surname, and name.
43. Find the name and both surnames of students who have not registered their phone number.
44. Return the list of students who were born in 1999.
45. Return the list of professors who have not registered their phone number and whose NIF ends in 'K'.
46. Return the list of subjects taught in the first quarter, in the third year of the degree with identifier 7.
47. Return a list of professors (first surname, second surname, name) along with their department name. Sorted alphabetically by surname and name.
48. Return a list with the subject name, start year, and end year of the school year for the student with NIF `26902806M`.
49. Return a list with the name of all departments that have professors who teach any subject in the 'Grado en Ingeniería Informática (Plan 2015)'.
50. Return a list with all students who have enrolled in any subject during the 2018/2019 school year.

### `JOIN` Queries (LEFT / RIGHT)

51. Return a list with the names of all professors and their departments. The list **must** also show professors who have no associated department. (Columns: department name, surname1, surname2, name). Sorted alphabetically.
52. Return a list of professors who are not associated with a department.
53. Return a list of departments that have no associated professors.
54. Return a list of professors who do not teach any subject.
55. Return a list of subjects that do not have an assigned professor.
56. Return a list of all departments that have not taught subjects in any school year.

### Summary Queries (Aggregate)

57. Return the total number of students.
58. Calculate how many students were born in 1999.
59. Calculate how many professors are in each department. (Columns: department name, professor count). Only include departments that have professors. Sorted by count (desc).
60. Return a list of all departments and the number of professors in each. **Must** include departments that do not have associated professors.
66. Return a list with the name of all degrees and the number of subjects each has. **Must** include degrees that do not have associated subjects. Sorted by subject count (desc).
62. Return a list of degrees and their subject count, **only** for degrees that have more than 40 associated subjects.
63. Return a list showing the degree name, subject type, and the total sum of credits for that type.
64. Return a list showing how many students enrolled in each school year. (Columns: start year, student count).
65. Return a list of subjects taught by each professor. **Must** include professors who teach zero subjects. (Columns: id, name, surname1, surname2, subject count). Sorted by subject count (desc).
66. Return all data for the youngest student.
67. Return a list of professors who have an associated department but do **not** teach any subject.

---

## 🏆 Evaluation Criteria

* **Level 1:** Complete 37 correct queries (at least 20 must be from the University database).
* **Level 2:** Complete between 37 and 56 correct queries (at least 20 must be from the University database).
* **Level 3:** Complete more than 56 correct queries (at least 20 must be from the University database).

---

## 💻 Used technologies

* MySQL Workbench
* Git

## 📋 Requirements

* MySQL 8

## 🛠️ Install

1.  Clone this repo: `https://github.com/mirexan/S2.2-MySQL-queries.git`
2.  Start MySQL Workbench and connect to a local server.
3.  Open, load, and execute the SQL script for the `schema_tienda.sql` database to create and fill the tienda database.
4.  Open, load, and execute the `schema_universidad.sql` script to create and fill the university database.
5.  Execute the required queries from the lists above to validate the project, you can execute each line with `ctrl + enter`.