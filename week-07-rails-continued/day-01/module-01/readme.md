# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro SQL
#### In which we suffer through SQL to appreciate Active Record


## What is a Relational Database (RDB)?

Relational databases were invented in the 1970's as a way to structure data so that it can be queried by "relational algebra." The basic idea of relational model, though, was to use collections of data (Tables) where each database manages Relations among the data in various tables. Each table is organized like a spreadsheet with a Row (also known as "record") for each data item and with attributes of those items arranged in Columns.


**Authors Table**

| `id` | `first_name` | `last_name` | `year_of_birth` | `year_of_death` |
| :---  | :---  | :---  | :---  | :---  |
| 1 | Rudyard | Kipling | 1865 | 1936 |
| 2 | Lewis | Carroll | 1832 | 1892 |
| 3 | H.G.  | Wells |  1866 | 1946  |

**Books Table**

| `id` | `title` | `publication_year` | `isbn` | `author_id` |
| :---  | :---  | :---  | :---  | :---  |
| 1 | The Jungle Book | 1894 | 9788497896696 | 1 |
| 2 | Alice's Adventures in Wonderland | 1865 | 9781552465707 | 2 |
| 3 | Rikki-Tikki-Tavi | 1894 | 1484123689 | 1 |
| 4 | Through the Looking-Glass | 1871 | 9781489500182 | 2 |
| 5 | The Time Machine |  1895  | 9781423794417 | 3 |

**Primary Key:** The primary key of a relational table uniquely identifies each record in the table. This column is automatically assigned a btree index in Postgres.

## What is SQL?

SQL, Structured Query Language, is a specialized language used to create, manipulate, and query tables in relational databases.

- Data Definition Language
	- Define and update database's structure
	- CREATE, ALTER, RENAME, DROP, TRUNCATE
	- Data Types
	- Constraints

- Data Manipulation Language
	- CRUD data within the database
	- SELECT, INSERT, UPDATE, DELETE, ORDER BY
	- UPSERT (attempts an UPDATE, or on failure, INSERT) is part of SQL 3 but not yet in Postgres
	- Queries
	- Aggregation: GROUP BY, SUM, AVG, MIN
- Data Control Language (beyond our scope)
	- GRANT access to parts of the table

## Creating and Modifying RDB Structure

# Database Setup

Let's create our first relational database (RDB) using the Terminal.

  `createdb practice`

Then let's connect to it by name so we can practice our SQL.

  `psql practice`

In your Terminal, you should see a prompt like the following:

  `practice=#`

To quit/exit the database console, type:

  `\q`

**Console Tips**

* Don't forget to close your SQL Commands with a semi-colon (";")!
* If you see `practice-#` you're stuck in the middle of inputting a sql command (and likely forgot the trailing semi-colon). Just type `ctrl+c` to start fresh.

# Workflow Setup

To save your progress on the in-class examples and the challenges, I suggest creating files that store your SQL commands. To run a `.sql` file, use the following command in your terminal:

  `psql -f <file_name>`

To run a sql file against a specific database, use:

  `psql -f <file_name> -d <database_name>`

You can also create (and destroy) tables from within a SQL file. At the top of your SQL file, I suggest you write the following:

```sql
DROP DATABASE IF EXISTS database_name;
CREATE DATABASE database_name;
```

Feel free to use the `pqsl` console to try out the following. Once you're comfortable with it, try using a `.sql` file.

If you would like to load, execute, and save `.sql` files in a safe, nurturing sandbox environment, head on over to this [online SQL interpreter](http://kripken.github.io/sql.js/GUI/). It's handy!

# Our First Table

Now let's try to create our first Table within the new database. Note: please feel free to shorten attribute names so they're easier to type.

```sql
CREATE TABLE author (
  id SERIAL primary key,
  firstName VARCHAR(255),
  year_of_birth INTEGER, /* also known as yob */
  year_of_death NUMERIC DEFAULT 'NaN',
  description TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now()
);
```
- `SERIAL TYPE`
- `Primary Key`
- `MORE DATA TYPES`


# Altering Tables and Columns

We can ALTER this table after is created.

```sql
ALTER TABLE author ADD COLUMN last_name varchar(255);
```
An author doesn't need a description column, so let's remove it.

```sql
ALTER TABLE author DROP COLUMN description;
```

Oops, Table names should always be plural. We'll fix the author table name.

```sql
ALTER TABLE author RENAME TO authors;
```

Oops, it looks like our firstName column is camelCased. All column names should be snake_case. We can also rename columns.

```sql
ALTER TABLE authors RENAME COLUMN firstName TO first_name;
```

Let's DROP our table!

```sql
DROP TABLE authors;
```

## Creating, Reading, Updating, and Deleting data in our RDB

The library's having a fundraiser! Here's another table we might have in the database:

```sql
CREATE TABLE products (
  id SERIAL primary key,
  name VARCHAR(255),
  price numeric NOT NULL DEFAULT 'NaN',
  quantity integer NOT NULL DEFAULT 0
)
```
# Inserting Data into RDB

How do we get data into a table? With INSERT!

```sql
INSERT INTO products
  (name, price, quantity)
  VALUES
  ('bookmark', 0.50, 200);
```

Let's add a few more items to our products table

```sql
'book cover', 2.00, 75
'book bag', 60.00, 15
'reading light', 25.00, 10
```

# Reading Data from RDB

To retrieve data from inside our database, we use the command SELECT.

```sql
SELECT * FROM products;
```

Let's look at only some attributes of each product.

```sql
SELECT name, price FROM products;
```

We can use ORDER BY to sort the selected items.

```sql
SELECT name FROM products ORDER BY price;
```

The WHERE keyword allows us to narrow down our query results. We can grab just the bookmark record.

```sql
SELECT * FROM products
  WHERE name = 'bookmark';
```

We can grab the more expensive items only.

```sql
SELECT * FROM products
  WHERE price > 20.00
  ORDER BY price;
```

We can even use regular expressions to find products with "book" at the start of their names.

```sql
SELECT * FROM products
  WHERE name LIKE 'book%';
```

# Updating Simple Data in the RDB

So far we've had a great time using SELECT to read data from our TABLE. We can also change data. Here comes our first sale, a bookmark!

```sql
UPDATE products
  SET quantity = quantity - 1
  WHERE name = 'bookmark';
```

Let's also correct the spelling of book bag to bookbag.

```sql
UPDATE products
  SET name = 'bookbag'
  WHERE name = 'book bag';
```

You might wonder why you don't see anything change after you update an entry. If you'd like, you can tell Postgres to return the modified record. It just isn't the standard behavior.

```sql
UPDATE products
  SET quantity = quantity - 1
  WHERE name = 'bookmark'
  RETURNING *;
```

# Deleting Simple Data from an RDB

Let's remove a row in our products table. Book covers don't sell that well.

```sql
DELETE FROM products
  WHERE name = 'book cover'
  RETURNING *;
```

We could also DELETE everything but the bookmarks with the <> (not equal) operator.

```sql
DELETE FROM products
  WHERE name <> 'bookmark';
```

You can DELETE everything from a table using

```sql
DELETE FROM products;
```

**Challenge**: Insert four items into the products table.

![Bobby Tables, at it again!](http://imgs.xkcd.com/comics/exploits_of_a_mom.png)


# ALIAS

You can make your queries easier to read using an alias. Aliases in SQL use the keyword AS.

```sql
SELECT * FROM products
  AS prod  -- alias for the products table
  WHERE prod.name = 'bookmark';
```

```sql  
SELECT name, price AS cost, quantity  -- alias for the price column only
  FROM products
  WHERE name = 'bookmark';
```
Note also that `--` starts a SQL comment.

# DISTINCT

We can use selection to filter out rows that aren't distinct. First, let's add duplicate bookbag records.

```sql
INSERT INTO products
  (name, price, quantity)
  VALUES
  ('bookbag', 50.00, 20),
  ('bookbag', 65.00, 10);
```

Then we'll select, looking for records with distinct names. Which of the bookbag records do you think will be selected?

```sql
SELECT DISTINCT ON (name) *
  FROM products;
```

# Aggregation

```
SELECT SUM(quantity) AS total_inventory_count from products;
SELECT name, MIN(price) AS lowest_avaialable_price
FROM products
GROUP BY name
ORDER BY lowest_avaialable_price;
```

# Challenges

1. Use SQL aggregators to get the total value of the inventory, calculated as the sum of the price*quantity for each item.

2. Create a books table based on the printed table above. It should have attributes for `id`, `title`, `pub_year`, `isbn`, and `author_id`. For now, just make the `author_id` an INTEGER.

3. Add the classic children's books from earlier in this readme into your books table.

4. The library wants to start selling off old books. Add a `book_id` attribute to the products table so that the library can store books as inventory.

5. Insert the books from your books table into your products table. Make up a price and quantity for them.

# Stretch Challenges

1.  Find the inventory value of each book, and sort the records by inventory value, in descending order.

2.  Find the inventory value of the books by Lewis Caroll.
