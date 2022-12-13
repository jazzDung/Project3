--drop table if exists listing_companies cascade;
--drop table if exists stock_history cascade;
--drop table if exists income_statement cascade;
--drop table if exists balance_sheet cascade;
--drop table if exists cash_flow cascade;
--drop table if exists financial_ratio cascade;
--drop table if exists stock_intraday_transaction cascade;

CREATE TABLE IF NOT EXISTS listing_companies (
	id serial,
 	ticker varchar(8) unique,
 	exchange varchar(5),
 	short_name varchar(256),
 	industry_id double precision,
 	industry_idv2 integer,
 	industry varchar(256),
 	industry_en varchar(256),
 	established_year double precision,
 	no_employees double precision,
 	no_shareholders double precision,
 	foreign_percent double precision,
 	website varchar(256),
 	stock_rating double precision,
 	delta_in_week double precision,
 	delta_in_month double precision,
 	delta_in_year double precision,
 	outstanding_share double precision,
 	issue_share double precision,
 	company_type varchar(2),
 	PRIMARY KEY (id)
 );
 
 
CREATE TABLE IF NOT EXISTS stock_history (
 	ticker varchar(3),
 	time_stamp timestamp not null,
 	open double precision,
 	high double precision,
 	low double precision,
 	close double precision,
 	volume integer,
 	PRIMARY KEY (ticker, time_stamp),
 	FOREIGN KEY (ticker) REFERENCES listing_companies (ticker)
 );
 
 
CREATE TABLE IF NOT EXISTS income_statement (
 	ticker varchar(3),
 	year integer,
 	quarter integer,
 	revenue integer,
 	year_revenue_growth double precision,
 	quarter_revenue_growth double precision,
 	cost_of_good_sold double precision,
 	gross_profit double precision,
 	operation_expense integer,
 	operation_profit integer,
 	year_operation_profit_growth double precision,
 	quarter_operation_profit_growth double precision,
 	interest_expense double precision,
 	pre_tax_profit integer,
 	post_tax_profit integer,
 	share_holder_income integer,
 	year_share_holder_income_growth double precision,
 	quarter_share_holder_income_growth double precision,
 	invest_profit double precision,
 	service_profit double precision,
 	other_profit double precision,
 	provision_expense double precision,
 	operation_income double precision,
 	ebitda double precision,
 	PRIMARY KEY (ticker, year, quarter),
 	FOREIGN KEY (ticker) REFERENCES listing_companies (ticker)
 );
 
 
CREATE TABLE IF NOT EXISTS balance_sheet (
 	ticker varchar(3),
 	year integer,
 	quarter integer,
 	short_asset double precision,
 	cash integer,
 	short_invest double precision,
 	short_receivable double precision,
 	inventory double precision,
 	long_asset double precision,
 	fixed_asset integer,
 	asset integer,
 	debt integer,
 	short_debt double precision,
 	long_debt double precision,
 	equity integer,
 	capital integer,
 	central_bank_deposit double precision,
 	other_bank_deposit double precision,
 	other_bank_loan double precision,
 	stock_invest double precision,
 	customer_loan double precision,
 	bad_loan double precision,
 	provision double precision,
 	net_customer_loan double precision,
 	other_asset double precision,
 	other_bank_credit double precision,
 	owe_other_bank double precision,
 	owe_central_bank double precision,
 	valuable_paper double precision,
 	payable_interest double precision,
 	receivable_interest double precision,
 	deposit double precision,
 	other_debt integer,
 	fund double precision,
 	un_distributed_income double precision,
 	minor_share_holder_profit double precision,
 	payable integer,
 	PRIMARY KEY (ticker, year, quarter),
 	FOREIGN KEY (ticker) REFERENCES listing_companies (ticker)
 );
 
 
CREATE TABLE IF NOT EXISTS cash_flow (
 	ticker varchar(3),
 	year integer,
 	quarter integer,
 	invest_cost integer,
 	from_invest integer,
 	from_financial integer,
 	from_sale integer,
 	free_cash_flow double precision,
 	PRIMARY KEY (ticker, year, quarter),
 	FOREIGN KEY (ticker) REFERENCES listing_companies (ticker)
 );
 
 
CREATE TABLE IF NOT EXISTS financial_ratio (
 	ticker varchar(3),
 	year integer,
 	quarter integer,
 	price_to_earning double precision,
 	price_to_book double precision,
 	value_before_ebitda double precision,
 	dividend double precision,
 	roe double precision,
 	roa double precision,
 	days_receivable double precision,
 	days_inventory double precision,
 	days_payable double precision,
 	ebit_on_interest double precision,
 	earning_per_share integer,
 	book_value_per_share double precision,
 	interest_margin double precision,
 	non_interest_on_toi double precision,
 	bad_debt_percentage double precision,
 	provision_on_bad_debt double precision,
 	cost_of_financing double precision,
 	equity_on_total_asset double precision,
 	equity_on_loan double precision,
 	cost_to_income double precision,
 	equity_on_liability double precision,
 	current_payment double precision,
 	quick_payment double precision,
 	eps_change double precision,
 	ebitda_on_stock double precision,
 	gross_profit_margin double precision,
 	operating_profit_margin double precision,
 	post_tax_margin double precision,
 	debt_on_equity double precision,
 	debt_on_asset double precision,
 	debt_on_ebitda double precision,
 	short_on_long_debt double precision,
 	asset_on_equity double precision,
 	capital_balance double precision,
 	cash_on_equity double precision,
 	cash_on_capitalize double precision,
 	cash_circulation double precision,
 	revenue_on_work_capital double precision,
 	capex_on_fixed_asset double precision,
 	revenue_on_asset double precision,
 	post_tax_on_pre_tax double precision,
 	ebit_on_revenue double precision,
 	pre_tax_on_ebit double precision,
 	pre_provision_on_toi double precision,
 	post_tax_on_toi double precision,
 	loan_on_earn_asset double precision,
 	loan_on_asset double precision,
 	loan_on_deposit double precision,
 	deposit_on_earn_asset double precision,
 	bad_debt_on_asset double precision,
 	liquidity_on_liability double precision,
 	payable_on_equity double precision,
 	cancel_debt double precision,
 	ebitda_on_stock_change double precision,
 	book_value_per_share_change double precision,
 	credit_growth double precision,
 	PRIMARY KEY (ticker, year, quarter),
 	FOREIGN KEY (ticker) REFERENCES listing_companies (ticker)
 );
 
 
CREATE TABLE IF NOT EXISTS stock_intraday_transaction (
 	id serial,
 	price double precision,
 	volume integer,
 	cp double precision,
 	rcp double precision,
 	a varchar(2),
 	ba double precision,
 	sa double precision,
 	hl varchar(256),
 	pcp double precision,
 	time_stamp timestamp not null,
 	ticker varchar(3),
 	primary key (id, time_stamp),
 	FOREIGN KEY (ticker) REFERENCES listing_companies (ticker)
 );
 
 

 
 

 
 
