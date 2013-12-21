orange-juice
============

SQL-based solution (using PostgreSQL) to the Coca Cola Orange Juice Optimization problem.

## Background

The Coca Cola Orange Juice Optimzation problem was publicized in 2012 as an interesting real-life optimization problem.

The gist of the problem is that commercial orange juice needs to be consisent in flavour, acidity, and color.  Otherwise, consumers will not develop brand loyalty, etc.  Oranges, however, are grown all over the world.  They are seasonal, and vary widely by species.  So an orange juice producer achieves a consistent product by **blending** various juices together in such a way that the end result is a consistent product.

See [This Businessweek article for some background](http://www.businessweek.com/articles/2013-01-31/coke-engineers-its-orange-juice-with-an-algorithm).

John Foreman's book, [Data Smart](http://books.google.com/books?id=IfTpAQAAQBAJ&pg=PA119&lpg=PA119&dq=orange+juice+blending+model+optimization&source=bl&ots=32_O3ZAXkQ&sig=LA3aQduyuHCqn3D05S0CEmJP7NY&hl=en&sa=X&ei=48a0UqSQKMvqoATK9IHgAQ&ved=0CF8Q6AEwBg#v=onepage&q=orange%20juice%20blending%20model%20optimization&f=false) describes this problem in detail and provides an **Excel-based** solution (no, really!  Nice work there.)

Scientists have quantified the following variables that help balance blends:

1. acidity
2. brix-acid ratio
3. astringency
4. color

In the problem scenario, there are 11 distinct types juices that can be purchased as ingredients.  They come from all over the world and vary widely in cost and physical characteristics.

So, the optimization problem involves selecting the blend that meets all the product constraints that is the **lowest cost** (the optimzation metric).

## Why SQL?

I like solving data science problems in SQL, particularly PostgreSQL.  Partly is because that is what I know.  Partly because this is a great platform for productionizing and scaling this solution.  **SQL? Scaling? Yes!**  

I tested this in a puny AWS micro instance of Postgres.  With a database with gobs of memory, fast disk, and a overnight window of processing, you could evaluate every **4.7 * 10-to-the-26th power** possibility.  Short of that, you need to be able to tell the computer when enough is enough.

SQL-based solutions are also very **transparent**.  They translate well to English, and you can save intermediate results for reporting or to validate what you are doing.

SQL-based solutions are productionizable because they integrate well with corporate data and can be scripted as well having UIs built on top of them.

My biggest reason for using SQL-based solutions is that I can save and study **intermediate results**.  Doing this often reveals either **flaws** in my model, or **stimulates new ideas** for perfecting the solution.

## Solution

This solution is a **prototype**, but has all the basic parts of a production solution.  The most prototypical aspect is that there is a lot of code that looks reduandant (for instance, flattening each dataset for each of the 11 varieties).  In a production implementation, this code would be generated or replaced with something more dynamic.

For the prototype, I simply created files **oranges_1.sql** through **oranges_4.sql** that are run in sequence.   The step that builds the testing scenarios (oranges_3.sql) can be configured to do as little or a much as you want, based on how fast of a system you have and how much time you have.  You get a **pretty good** result with a smallish sample.

### oranges_1

Load the source data into a table called "varietals"

### oranges_2

Create a single-row table that contains the max possible quantity to choose from each source.  Limit to either the quantity available from the source or the max we need for one purchase.

The parameter "quantity_needed" is set to control that.  The basic assumption is that the varietals table will be kept up to date month-to-month, which is a completly reasonable assumption.

Then create the table "random_quantities" that will be used to capture all the quantity scenarios we want to test for optimzation.

Create the stored procedure "create_random_quantities" as a way to produce some number of scenarios.  That number depends on how much computing resources we have, how patient we are, and, in general, how much time we have.  For initial testing we can quickly create a small number of scenarios.  For rigorous testing, we want to identify a large number.  As described above, if we have time and/or resources, we could evaluate every **4.7 * 10-to-the-26th power** possibility.  Short of that, you need to be invent a more clever solution to tell the computer when enough is enough.

`Hand-wave!` If I were to productionize this, this is the main area I would focus on to make this faster and smarter.

### oranges_3

Generate some random testing scenarios.  Parm 1 = total quantity needed for one purchase.  Parm 2 = number of 100K-row iterations to produce to identify scenarios to test.

### oranges_4

Test each scenario, and sort by total cost.  The top row is the optima
based on the scenarios you are testing.

I love the botton of this SQL statement because the WHERE clause has all the business constraints in plain, readable SQL.
