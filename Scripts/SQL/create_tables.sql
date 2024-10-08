create schema posey;

CREATE TABLE posey.accounts (
	id integer,
	name bpchar,
	website bpchar,
	lat numeric(11,8),
	long numeric(11,8),
	primary_poc bpchar,
	sales_rep_id integer
);

CREATE TABLE posey.sales_reps (
	id integer,
	name bpchar,
	region_id integer
);

CREATE TABLE posey.web_events (
	id integer,
	account_id integer,
	occurred_at timestamp,
	channel bpchar
);



CREATE TABLE posey.region (
	id integer,
	name bpchar
);

CREATE TABLE orders (
	id integer,
	account_id integer,
	occurred_at timestamp,
	standard_qty integer,
	gloss_qty integer,
	poster_qty integer,
	total integer,
	standard_amt_usd numeric(10,2),
	gloss_amt_usd numeric(10,2),
	poster_amt_usd numeric(10,2),
	total_amt_usd numeric(10,2)
);