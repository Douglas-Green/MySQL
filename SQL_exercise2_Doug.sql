/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
SELECT p.Name, p.CategoryID
FROM products p
INNER JOIN categories c ON p.CategoryID = c.CategoryID
WHERE c.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS ProductName, p.Price, r.Rating, r.Comment
FROM products p
JOIN reviews r ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
/*  SOME CAVEAT WITH THIS ONE IS THAT THERE WAS A TIE, SO I MISSED THAT THOUGH I DID GET THE 37 WHICH WAS THE ANSWER */
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(s.Quantity) AS TotalQuantitySold
FROM employees e
JOIN sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalQuantitySold DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.NAME
FROM categories
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games";
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name AS "Album", SUM(s.Quantity) AS "Sold",
 SUM(s.Quantity * s.PricePerUnit) AS "Revenue"
 FROM products p
 Join sales s ON p.ProductID = s.ProductID
 WHERE p.name = "Eagles: Hotel California"
 GROUP BY p.Name;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT Name, Reviewer, Rating, Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE Name LIKE '%Visio%TV%' AND Rating = 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.employeeID, e.FirstName, e.LastName, p.Name, SUM(s.quantity) AS total_quantity_sold
FROM employees e 
JOIN sales s ON e.employeeID = s.EmployeeID
JOIN products p ON s.ProductID = p.productID
GROUP BY e.employeeID, e.FirstName, e.LastName, p.Name
ORDER BY e.employeeID, p.Name;
