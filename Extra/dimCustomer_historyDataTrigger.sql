
CREATE FUNCTION fixCustomerHistoryData() RETURNS trigger AS $customer_stamp$
    BEGIN
	
		update dimCustomer d 
			set isCurrent = false, endDate = NEW.effectiveDate
		where d.isCurrent = true
		and d.customerid = NEW.customerid;
		
		RETURN NEW;
    END;
$customer_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER fixCustomerHistoryData BEFORE INSERT ON dimCustomer
    FOR EACH ROW EXECUTE PROCEDURE fixCustomerHistoryData();



CREATE FUNCTION fixAccountOnUpdateCustomer() RETURNS trigger AS $customer_stamp$
    BEGIN
	
		INSERT INTO dimAccount ( accountid, sk_brokerid, sk_customerid, status, accountdesc, taxstatus, iscurrent, batchid, effectivedate, enddate )
		(
			select accountid, sk_brokerid, NEW.sk_customerid, status, accountdesc, taxstatus, TRUE, batchid, NEW.effectivedate, NEW.enddate
			from dimAccount
			where sk_accountid = (  select max( sk_accountid )
									from dimAccount where sk_customerid = (	select max( sk_customerid )
																			from dimCustomer
																			where customerid = NEW.customerid
																			and iscurrent = false

									)
			)
		);
		
		RETURN NEW;
    END;
$customer_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER fixAccountOnUpdateCustomer AFTER INSERT ON dimCustomer
    FOR EACH ROW EXECUTE PROCEDURE fixAccountOnUpdateCustomer();





CREATE FUNCTION fixAccountHistoryData() RETURNS trigger AS $account_stamp$
    BEGIN
	
		update dimAccount d 
			set isCurrent = false, endDate = NEW.effectiveDate
		where d.isCurrent = true
		and d.accountid = NEW.accountid;
		
		RETURN NEW;
    END;
$account_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER fixAccountHistoryData BEFORE INSERT ON dimAccount
    FOR EACH ROW EXECUTE PROCEDURE fixAccountHistoryData();


