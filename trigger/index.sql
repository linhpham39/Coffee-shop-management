create index if not exists ix_date_order_btree on orders using btree (date)

-- test on f_potential_customer
-- test on f_least_take_order_emps(date, date)