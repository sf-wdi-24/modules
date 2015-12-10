# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> SQL Continued

# SQL Continued (JOINS)

| Objectives |
| :--- |
| `INSERT` information using SQL syntax. |
| `JOIN` two different sets of information based on some commonality. |
| `EXPLAIN` a query plan to diagnose issues in your queries. |

## SQL++

<img src="https://cloud.githubusercontent.com/assets/1329385/11722978/c87e6106-9f20-11e5-9c01-6294e9b919bd.gif">

Let's go over what you've learned.

1. <details>
  <summary>Create a table named `tacos` with a serial `id` column and a `BOOLEAN` column named `spicy`.</summary>

  ```SQL
  CREATE TABLE tacos (
    id SERIAL PRIMARY KEY,
    spicy BOOLEAN);
  ```
</details>

1. <details>
  <summary>Use a command to describe that tables structure.</summary>

  **NOTE** this only works with PostgreSQL.
  ```SQL
  \d tacos
  ```
</details>

1. <details>
  <summary>Make a `spicy` taco.</summary>

  ```SQL
  INSERT INTO tacos (spicy) VALUES (TRUE);
  ```
</details>

1. <details>
  <summary>Find all the tacos in your table.</summary>

  ```SQL
  SELECT id, spicy FROM tacos;
  ```
</details>

That's it for review. I hope you remember everything perfectly and never make a mistake.

An example of someone who made a mistake can be found <a href="http://dbareactions.com/post/101404927746/when-i-meet-the-now-former-admin-who-caused-the" target="_blank">here</a>.

## Joins

Each table in a relational database is considered a relation. All of the table's data is naturally related by single set of attributes defined for it. However, in order to be relational, we need to be able to make queries between relations or tables of data.

**JOINS** are our means of implementing queries that combine data and show results from multiple tables.

There are many kinds of joins, based on how you want to combine data.

![](https://raw.githubusercontent.com/sf-wdi-18/notes/master/lectures/week-07/day-1-intro-sql/dawn-simple-queries/images/join.png)

## Foreign Key

To implement a JOIN between two tables, one of our tables must have a **foreign key**. A foreign key is a field in one table that uniquely identifies a row of another table. We use the foreign key to **establish and enforce a link between the data in two tables**.

The foreign key always goes on the table with the data that belongs to data from another table. In the example below, a person **has_many** pets, and a pet **belongs_to** a person. The foreign key `person_id` goes on the `pets` table to indicate which person the pet belongs to.

![](https://raw.githubusercontent.com/sf-wdi-18/notes/master/lectures/week-07/day-1-intro-sql/dawn-simple-queries/images/primary_foreign_key.png)

## Implementing JOINS

Using our `practice` database, let's set up a relationship between a `people` table and a `pets` table.

```sql
$ psql

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

A cross JOIN shows all possible combinations of data between the two tables.

```sql
SELECT * FROM people
CROSS JOIN pets
WHERE people.id = 1;
```

## Challenges

Head over to the <a href="https://github.com/sf-wdi-19-20/w7_apartment_lab_sql" target="_blank">apartment lab</a> for the challenges! Fork and clone the repo to get started.
