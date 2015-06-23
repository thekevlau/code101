1. Which laptop models are shown in the Product relation?
SELECT DISTINCT(Model)
FROM Product
WHERE Type = laptop;

2. Find the set of all manufacturers ordered alphabetically.
SELECT DISTINCT(Manufacturer)
FROM Product
ORDER BY DESC; # is there an alpha order?
# all data types are by default order-able


3. Which computer models appear in the database?
SELECT Model
FROM Product
WHERE Type = pc OR Type = laptop;

OR --> (below is a better idea lol)

SELECT DISTINCT(Model)
FROM Computer;


4. Which computer models use 256 MB of RAM?
SELECT Model
FROM Computer
WHERE Computer.RAM = 256;

5. Which computer models cost less than $1100?
SELECT Model
FROM Computer
WHERE Price < 1100;

6. Which laptop models have a HD of at least 50 GB and cost less than $1400?
SELECT Model
FROM Computer
INNER JOIN Product USING Model
WHERE Product.Type = "laptop" Computer.HD >= 50 AND Price < 1400;

7. Which laser printer models can print color documents?
SELECT Model
FROM Printer
WHERE Printer.Type = laser AND Printer.Color = true;

8. Which laptop models that have more than 256 MB of RAM
are produced by manufacturer D?
SELECT Computer.Model
FROM Product
INNER JOIN Computer USING Model
WHERE Product.Type = laptop AND Computer.RAM > 256 AND Product.Manufacturer = D;

9. Which computer models that have more than 256 MB of RAM
are produced by manufacturer D?
SELECT Computer.Model
FROM Product
INNER JOIN Computer USING Model
WHERE Computer.RAM > 256 AND Product.Manufacturer = D;

10. Which laptop models cost less than $1200?
SELECT Computer.Model
FROM Product
INNER JOIN Computer USING Model
WHERE Product.Type = laptop AND Computer.Price < 1200;

11. Which manufacturers produce personal computers and printers?
SELECT DISTINCT Manufacturer
FROM Product
WHERE Type = pc OR Type = printer;

12. Which manufacturers produce all the product types?
SELECT Manufacturer
FROM Product
GROUP BY Manufacturer
HAVING COUNT(DISTINCT Type) = 3;

13. Which manufacturers supply only personal computers?

SELECT distinct manufacturers
FROM Product
WHERE Type ='pc'



with pcs AS (
    SELECT Manufacturer, Model
    FROM Product
    WHERE Type = 'pc'
),




with not_pcs AS (
    SELECT Manufacturer
    FROM Product
    WHERE Type != 'pc'
    GROUP BY Manufacturer
)
SELECT Product.Manufacturer
FROM Product
WHERE Manufacturer NOT IN not_pcs;

ALSO:

select all of the ones that ONLY have one type
intersect
SELECT all of the ones that are only type= PC


# sub query with Type != pc, outer left join it together ...

EXCEPT; IS NOT IN

HAVING SUM(Type) = 'pc';

HAVING Type = 'pc';
# HAVING MAX(TYPE) = 'pc';
# the case where manufacturers sell PCs, but other things as well!


# HAVING Type = pc .... i dont think this is right, but why?


14. Which manufacturers supply only one type of product?
SELECT Manufactuer
FROM Product
GROUP BY Manufactuer
HAVING COUNT(DISTINCT Type) = 1;



15. You want to buy: #think about how to intersect, instead of JOINS? which is more efficient? why?
• a personal computer with at least 1024 MB of RAM and a CD with 56x, and
• a laptop with a screen larger than 1500, and
• a printer cheaper than $300
all produced by the same manufacturer. Which manufacturers should you consider?

with computers AS (
    SELECT distinct Manufacturer
    FROM Computer
    INNER JOIN Product USING Model
    WHERE Product.Type = pc AND RAM > 1024 AND CD = 56x;
),
laptops AS (
    SELECT distinct Manufactuer
    FROM Computer
    INNER JOIN Product USING Model
    WHERE Product.Type = laptop AND Computer.Screen > 15;
),
printers AS (
    SELECT distinct Manufacturer
    FROM Printer
    INNER JOIN Product USING Model
    WHERE Price < 300;
)
SELECT c.Manufacturer
FROM computers c
INNER JOIN laptops l USING Manufacturer
INNER JOIN printers p USING Manufacturer
;




# do sequential JOINS happen simultaneously?
SELECT DISTINCT Product.Manufacturer
FROM Product
INNER JOIN Computer USING Model
WHERE Product.Type = pc AND Computer.RAM > 1024 AND Computer.CD = 56x
INNER JOIN Computer USING Model
WHERE Product.Type = laptop AND Computer.Screen > 15
INNER JOIN Printer
WHERE Printer.Price < 300
GROUP BY Product.Manufacturer;



^ ERROR. not how innerjoins work :(









16. What HD sizes are common to at least 2 computers?
SELECT HD
FROM Computer
GROUP BY HD
HAVING COUNT(Model) > 2;


17. Which manufacturers sell more than one computer that
has a processor speed of less than 3 GHz?
SELECT Product.Manufacturer
FROM Product
WHERE Computer.Speed < 3
INNER JOIN Computer USING Model
GROUP BY Product.Manufacturer
HAVING COUNT(Product.Manufacturer) > 1;


18. Which manufacturers sell the fastest computers?
# general case where I do not know fastest speed
SELECT DISTINCT Product.Manufacturer
FROM Product
INNER JOIN Computer USING (Model)
WHERE Speed = max(Speed)
# ^ verify if this is legit...it does not compile for me
# instead doing:
# WHERE Speed = (SELECT MAX(Speed) FROM Computer)
# works, however this is basically a subquery.....so efficiency????? any way to not subquery?
GROUP BY Manufacturer;



# if I know the speed, then I can just do:
SELECT Product.Manufacturer
FROM Product
INNER JOIN Computer
WHERE Speed

GROUP BY Product.Manufacturer
HAVING


19. Which manufacturers do not sell laptops?
SELECT DISTINCT Manufacturer
FROM Product
EXCEPT
SELECT DISTINCT Manufacturer
FROM Product
WHERE Type = laptop;

# INCORRECT. does not account for case where manufacturer does laptop AND something else.
SELECT DISTINCT Manufacturer
FROM Product
WHERE Type != laptop




20. Which manufacturers offer at least 2 laptop models?
SELECT Manufacturer
FROM Product
WHERE Type = laptop
GROUP BY Manufacturer
HAVING COUNT(Model) >= 2;


21. Which manufacturers offer exactly 3 types of personal computers?
SELECT Manufacturer
FROM Product
WHERE Type = pc
GROUP BY Manufacturer
HAVING COUNT(Model) = 3;

22. You need to buy: # I can intersect this too, probably
• a computer that has
– at least 1024 MB of RAM,
– a processor speed of 3 GHz or 3.5 GHz,
– a HD of at least 160 GB, and
• a color printer.
Which manufacturers can offer you this combination and at what total price?


with computers AS (
    SELECT Computer.Model, Computer.Price, Product.Manufacturer
    FROM Computer
    INNER JOIN Product USING Model
    WHERE RAM >= 1024 AND (Speed = 3 OR Speed = 3.5) AND HD >= 160
),
printers AS (
    SELECT Computer.Model, Computer.Price, Product.Manufacturer
    FROM Printer
    INNER JOIN Product
    WHERE Color = 'true'
)
SELECT computers.Manufacturer, (computers.Price + printers.Price) AS total_cost
FROM computers
CROSS JOIN printers
WHERE computers.Manufacturer = printers.Manufacturers;



# old version
# WHY DOES THIS NOT WORK ?!?!?!?!?!
--> because after your first inner join, you basically have one row left. then you try to inner join again,
-- only this time there are no more commonalities, so you are left with an empty table to return.

with computers AS (
    SELECT Model, Price
    FROM Computer
    WHERE RAM > 1024 AND (Speed = 3 OR Speed = 3.5) AND HD >= 160
),
printers AS (
    SELECT Model, Price
    FROM Printer
    WHERE Color = 'true'
)
SELECT Product.Manufacturer, (SUM(computers.Price) + SUM(printers.Price)) AS total_cost
FROM Product
INNER JOIN computers USING (Model)
INNER JOIN printers USING (Model)
GROUP BY Product.Manufacturer;



# can we do two inner joins one after the other? I think so right, but they happen successively
INNER JOIN computers USING (Model)
INNER JOIN printers USING (Model)
GROUP BY Product.Manufacturer;


