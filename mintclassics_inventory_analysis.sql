#Mint Classics Inventory Analysis

#Question 1: Warehouse Distribution
USE mintclassics;
SELECT 
    w.warehouseName,
    COUNT(p.productCode) AS number_of_products
FROM warehouses w
JOIN products p
    ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseName
ORDER BY number_of_products DESC;
SELECT 
    w.warehouseName,
    SUM(p.quantityInStock) AS total_inventory
FROM warehouses w
JOIN products p
    ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseName
ORDER BY total_inventory DESC;

#Question 2: Inventory vs Sales
USE mintclassics;
SELECT 
p.productName,
p.quantityInStock,
coalesce(sum(od.quantityOrdered), 0) AS total_sold
FROM products p
LEFT JOIN orderdetails od
ON p.productCode = od.productCode
group by p.productName, p.quantityInStock
order by p.quantityInStock DESC;

#Question 3: Non-moving Products
use mintclassics;
SELECT 
    p.productName,
    p.quantityInStock
FROM products p
LEFT JOIN orderdetails od
    ON p.productCode = od.productCode
WHERE od.productCode IS NULL
ORDER BY p.quantityInStock DESC;