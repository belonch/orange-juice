/* 
    Step two: Create a single-row table that contains the max possible quantity
    to chosse from each source.  Limit to either the quantity available from 
    the source or the max we need for one purchase.

    The parameter "quantity_needed" is set to control that.

    The basic assumption is that the varietals table will be kept up to date
    month-to-month, which is a completly reasonable assumption.

    Then create the table "random_quantities" that will be used to capture
    all the quantity scenarios we want to test for optimzation.

    Create the stored procedure "create_random_quantities" as a way to produce
    some number of scenarios.  That number depends on how much computing resources we 
    have, how patient we are, and, in general, how much time we have.  For initial
    testing we can quickly create a small number of scenarios.  For rigorous testing,
    we want to identify a large number.
*/

\set quantity_needed 600

drop table if exists available_quantities;

create table available_quantities
as
select max(case when varietal_id = 1 then LEAST(qty_available, :quantity_needed) else 0 end) as q1,
       max(case when varietal_id = 2 then LEAST(qty_available, :quantity_needed) else 0 end) as q2,
       max(case when varietal_id = 3 then LEAST(qty_available, :quantity_needed) else 0 end) as q3,
       max(case when varietal_id = 4 then LEAST(qty_available, :quantity_needed) else 0 end) as q4,
       max(case when varietal_id = 5 then LEAST(qty_available, :quantity_needed) else 0 end) as q5,
       max(case when varietal_id = 6 then LEAST(qty_available, :quantity_needed) else 0 end) as q6,
       max(case when varietal_id = 7 then LEAST(qty_available, :quantity_needed) else 0 end) as q7,
       max(case when varietal_id = 8 then LEAST(qty_available, :quantity_needed) else 0 end) as q8,
       max(case when varietal_id = 9 then LEAST(qty_available, :quantity_needed) else 0 end) as q9,
       max(case when varietal_id = 10 then LEAST(qty_available, :quantity_needed) else 0 end) as q10,
       max(case when varietal_id = 11 then LEAST(qty_available, :quantity_needed) else 0 end) as q11
from varietals;

vacuum analyze available_quantities;

drop table if exists random_quantities;

create table random_quantities
(
rqid    serial not null,
r1      numeric,
r2      numeric,
r3      numeric,
r4      numeric,
r5      numeric,
r6      numeric,
r7      numeric,
r8      numeric,
r9      numeric,
r10     numeric,
r11     numeric,
tq      numeric
);

\i create_random_quantities.sql