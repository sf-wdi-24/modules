# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> SQL Continued

# SQL Continued (JOINS)

| Objectives |
| :--- |
| `INSERT` information using SQL syntax. |
| `JOIN` two different sets of information based on some commonality. |
| `EXPLAIN` a query plan to diagnose issues in your queries. |

## SQL++

<img src="https://cloud.githubusercontent.com/assets/1329385/11722978/c87e6106-9f20-11e5-9c01-6294e9b919bd.gif">

Let's go over what we've learned.

Make sure you're connected to your `practice` db.

1. <details>
  <summary>Create a table named `tacos` with a serial `id` column and a `BOOLEAN` column named `spicy`.</summary>

  ```sql
  CREATE TABLE tacos (
    id SERIAL PRIMARY KEY,
    spicy BOOLEAN);
  ```
</details>

1. <details>
  <summary>Use a command to describe that tables structure.</summary>

  **NOTE** this only works with PostgreSQL.
  ```sql
  \d tacos
  ```
</details>

1. <details>
  <summary>Make a `spicy` taco.</summary>

  ```sql
  INSERT INTO tacos (spicy) VALUES (TRUE);
  ```
</details>

1. <details>
  <summary>Find all the tacos in your table.</summary>

  ```sql
  SELECT id, spicy FROM tacos;
  ```
</details>

That's it for review. I hope you remember everything perfectly and never make a mistake.

<details>
  <summary>Let's destroy the `tacos` database and don't destroy anything else!</summary>

  ```sql
  DROP TABLE tacos;
  ```
</details>

<a href="http://dbareactions.com/post/101404927746/when-i-meet-the-now-former-admin-who-caused-the" target="_blank">This is what happens when you destroy something else.</a>.

## Joins

We've seen these before with different terminology.

<details>
  <summary>Can you think of a place where we used joins before?</summary>

  Maybe Mongo references?
</details>

With Mongo references we were able to connect two different collections via a shared piece of information. That shared piece of information was the ID of the object in the other collection.

<a href="https://github.com/sf-wdi-24/modules/tree/master/week-04-associated-data-and-users/day-01/module-02" target="_blank">Mongo Reference Refresher</a>

Mongo isn't designed for these types of relationships but relational databases are. Guess what we're using? RDMS...

In SQL we have access to many types of operations to connect two types of objects. These are called `JOIN` operations.

Here are some join types which are commonly used.

![](https://raw.githubusercontent.com/sf-wdi-18/notes/master/lectures/week-07/day-1-intro-sql/dawn-simple-queries/images/join.png)

### Explain Joins

Let's all take 5 minutes and describe a usage of at least one type of join operation.

## Foreign Key

To implement a `JOIN` between two tables, one of our tables must have a **foreign key**. A foreign key is a field in one table that uniquely identifies a row of another table. We use the foreign key to **establish and enforce a link between the data in two tables**.

The foreign key always goes on the table with the data that belongs to data from another table. In the example below, a person **has_many** pets, and a pet **belongs_to** a person. The foreign key `person_id` goes on the `pets` table to indicate which person the pet belongs to.

![](https://raw.githubusercontent.com/sf-wdi-18/notes/master/lectures/week-07/day-1-intro-sql/dawn-simple-queries/images/primary_foreign_key.png)

## Implementing JOINS

Using our `practice` database, let's set up a relationship between a `people` table and a `pets` table.

```sql
psql

# connect to our `practice` database
\c practice

# show all tables in our `practice` database
\dt

CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER
);

CREATE TABLE pets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  breed VARCHAR(255),
  person_id INTEGER REFERENCES people
);

INSERT INTO people (name, age)
  VALUES ('Zed', 37);

INSERT INTO people (name, age)
  VALUES ('Bobby', 7);

INSERT INTO people (name, age)
  VALUES ('Cindy', 14);

INSERT INTO pets (name, breed, age, person_id)
  VALUES ('Fluffy', 'Unicorn', 1000, 1);

INSERT INTO pets (name, breed, age, person_id)
  VALUES ('Rocko', 'Dog', 4, 2);

INSERT INTO pets (name, breed, age, person_id)
  VALUES ('Gigantor', 'Robot', 25, 1);

INSERT INTO pets (name, breed, age, person_id)
  VALUES ('Goldy', 'Fish', 1, null);
```

### Let's try some `JOINS` operations

For each of these `JOIN` operations, we need to answer three questions using proper technical phrasing.

1. What is the output?
2. Why do we see it?
3. Why would we use this type of operation?

#### Inner JOIN

```sql
SELECT * FROM people
INNER JOIN pets
ON people.id = pets.person_id;

SELECT people.name, pets.name from people
INNER JOIN pets
ON people.id = pets.person_id;
```

#### Full Outer JOIN

```sql
SELECT * FROM people
FULL OUTER JOIN pets
ON people.id = pets.person_id;
```

#### Left Outer JOIN

```sql
SELECT * FROM people
LEFT OUTER JOIN pets
ON people.id = pets.person_id;
```

#### Right Outer JOIN

```sql
SELECT * FROM people
RIGHT OUTER JOIN pets
ON people.id = pets.person_id;
```  

#### Left Outer JOIN with Where  

```sql
SELECT * FROM people
LEFT OUTER JOIN pets
ON people.id = pets.person_id
WHERE pets.breed = 'Unicorn';
```

#### Cross JOIN

```sql
SELECT * FROM people
CROSS JOIN pets
WHERE people.id = 1;
```

## Indexes

If your table is small then you're done but this is rarely the case.

As your table gets larger we need to tune the performance for our usage. We do this by adding indexes in many cases.

We've seen this before with how we've created or changed data structures to make them quicker to create, read, update or delete information.

### How do we know that an index is needed?

Let's ask PostgreSQL to `EXPLAIN` what it intends on doing when we ask for information.

```sql
EXPLAIN ANALYZE SELECT * FROM PEOPLE WHERE age=7;
```

Wow, that's some interesting information. Let's break it apart.

A sample response to that command may look like the following:

```
practice=# EXPLAIN ANALYZE SELECT * FROM PEOPLE WHERE age=7;
                                            QUERY PLAN                                             
---------------------------------------------------------------------------------------------------
 Seq Scan on people  (cost=0.00..11.75 rows=1 width=524) (actual time=0.007..0.008 rows=1 loops=1)
   Filter: (age = 7)
   Rows Removed by Filter: 2
 Total runtime: 0.022 ms
(4 rows)
```

The `EXPLAIN` procedure will list out the steps it'll take and indent over the next step. The information which is most important to us at this moment is the first procedure `Seq Scan` which is short for Sequential Scan aka "Full Table Scan".

Full Table Scan means that in order to find the answer we are looking for, we'll have to look at every row of the database. What is the Big O notation for this type of lookup?

When you see a sequential scan and the cost is high, we may be able to improve things by making an index.

### Create an index

Before we create an index, let's put in a bunch of people using a complex SQL query.

Do you understand how this works?

```sql
INSERT INTO people (name, age)
  SELECT (
    SELECT name FROM people ORDER BY random() LIMIT 1) AS name,
    FLOOR(RANDOM() * 120) AS age FROM generate_series(1, 10000);
```

Now let's create our index so we can find people by age quickly.

```sql
CREATE INDEX people_age_idx ON people (age);
```

<details>
  <summary>Repeat the `EXPLAIN` you did before.</summary>

  ```sql
  EXPLAIN ANALYZE SELECT * FROM PEOPLE WHERE age=7 LIMIT 1;
  ```
</details>

What's different?

```
practice=# EXPLAIN ANALYZE SELECT * FROM PEOPLE WHERE age=7;
                                                      QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on people  (cost=4.30..11.18 rows=2 width=13) (actual time=0.036..0.038 rows=2 loops=1)
   Recheck Cond: (age = 7)
   ->  Bitmap Index Scan on people_age_idx  (cost=0.00..4.30 rows=2 width=0) (actual time=0.029..0.029 rows=2 loops=1)
         Index Cond: (age = 7)
 Total runtime: 0.067 ms
(5 rows)
```

There are two important pieces of information.

1. Our index is used `... Index Scan on people_age_idx ...`.
1. The total runtime of the operation `Total runtime: 0.067 ms`.

Let's compare after we remove the index.

```sql
DROP INDEX people_age_idx;
```

Explain again...

```
practice=# EXPLAIN ANALYZE SELECT * FROM PEOPLE WHERE age=7;
                                            QUERY PLAN                                             
---------------------------------------------------------------------------------------------------
 Seq Scan on people  (cost=0.00..180.04 rows=2 width=13) (actual time=0.011..1.562 rows=2 loops=1)
   Filter: (age = 7)
   Rows Removed by Filter: 10001
 Total runtime: 1.580 ms
(4 rows)
```

Yikes, `Total runtime: 1.580 ms`. That's ~24 times slower than with our index.

## Challenges

OK enough of this. Let's play with SQL on our own.

Fork, clone and try to complete <a href="https://github.com/sf-wdi-24/w7_apartment_lab_sql" target="_blank">today's lab</a>.
