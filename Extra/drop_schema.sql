
drop trigger fixCustomerHistoryData on dimCustomer; 
drop function fixCustomerHistoryData();

drop trigger fixAccountHistoryData on dimAccount; 
drop function fixAccountHistoryData();

drop table audittable;
drop table factholdings;
drop table factcashbalances;
drop table dimtrade;
drop table dimaccount;
drop table dimbroker;
drop table factmarkethistory;
drop table factwatches;
drop table dimsecurity;
drop table financial;
drop table dimcompany;
drop table prospect;
drop table dimDate;
drop table diMessages;
drop table dimtime;
drop table dimtradeforexperiment;
drop table industry;
drop table statustype;
drop table taxrate;
drop table tradetype;
drop table dimCustomer;



truncate table audittable cascade;
truncate table factholdings cascade;
truncate table factcashbalances cascade;
truncate table dimtrade cascade;
truncate table dimaccount cascade;
truncate table dimbroker cascade;
truncate table factmarkethistory cascade;
truncate table factwatches cascade;
truncate table dimsecurity cascade;
truncate table financial cascade;
truncate table dimcompany cascade;
truncate table prospect cascade;
truncate table dimDate cascade;
truncate table diMessages cascade;
truncate table dimtime cascade;
truncate table dimtradeforexperiment cascade;
truncate table industry cascade;
truncate table statustype cascade;
truncate table taxrate cascade;
truncate table tradetype cascade;
truncate table dimCustomer cascade;