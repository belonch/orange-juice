/* 
    This is stored procedure that randomly generates some number of 
    quantity ordering scenarios.  It does this using all constraints that
    do not involve computing of a scenario, which are (1) the quantity we
    need to order, and (2) the quantities available from each supplier.

    This could be smartened up with some creative thinking.  The only 
    clever thing being done at this time is to square each random number
    (which lies between 0 and 1) before applying it to a quantity so that
    the generated results are biased on the low side, knowing that we will 
    require a mix of several blends and that not all blends will be used at
    one time.
*/

CREATE OR REPLACE FUNCTION create_random_quantities (p_max_quantity integer, p_passes integer)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
--
DECLARE l_results           VARCHAR(500) := '' ;
DECLARE l_passes            INTEGER := 0;
DECLARE l_rows              INTEGER := 0;
DECLARE l_cutoff_timestamp  TIMESTAMP WITH TIME ZONE;
--
BEGIN
LOOP
	insert into random_quantities
	(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, tq)
	with 
	iterations as
	(
	SELECT generate_series(1,100000) as iteration
	),
	random_variations as
	(
	select trunc(random()^2 * q1) as r1,
	       trunc(random()^2 * q2) as r2,
	       trunc(random()^2 * q3) as r3,
	       trunc(random()^2 * q4) as r4,
	       trunc(random()^2 * q5) as r5,
	       trunc(random()^2 * q6) as r6,
	       trunc(random()^2 * q7) as r7,
	       trunc(random()^2 * q8) as r8,
	       trunc(random()^2 * q9) as r9,
	       trunc(random()^2 * q10) as r10,
	       trunc(random()^2 * q11) as r11
	from available_quantities, iterations
	),
	aggregated_variations as
	(
	select r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11,
	       r1 + r2 + r3 + r4 + r5 + r6 + r7 + r8 + r9 + r10 + r11 as total_quantity
	  from random_variations
	)
	select * from aggregated_variations
	 where total_quantity = 600 ;
	 
    l_passes := l_passes + 1;
    
    EXIT WHEN l_passes >= p_passes;
END LOOP;
--
SELECT count(*) INTO l_rows FROM random_quantities;

RETURN 'Done. Made ' || l_passes::varchar || ' passes.  Random quantities produced: ' || l_rows::varchar ;
--
END;
$function$
