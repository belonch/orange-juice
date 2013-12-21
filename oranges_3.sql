/* 
    Generate some random testing scenarios.  Parm 1 = total quantity
    needed for one purchase.  Parm 2 = number of 100K-row iterations to 
    produce to identify scenarios to test.
*/

\timing on

SELECT create_random_quantities(600, 1000);

vacuum analyze random_quantities;
