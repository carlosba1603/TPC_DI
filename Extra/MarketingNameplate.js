var MarketingNameplate;
var classified = false;

function parse(tag) {
	if(classified){
		MarketingNameplate = MarketingNameplate + ' + ' + tag;
	} else {
		MarketingNameplate = tag;
	}
	classified = true;
}

if((NetWorth > 1000000) || (Income > 200000)) { parse('HighValue'); } 

if((NumberChildren > 3) || (NumberCreditCards > 5)) { parse('Expenses'); } 

if(Age > 45) { parse('Boomer'); } 

if((Income > 50000) || (CreditRating < 600) || (NetWorth < 100000)) { parse('MoneyAlert'); } 

if((NumberCars > 3) || (NumberCreditCards > 7)) { parse('Spender'); } 

if((Age < 25) && (NetWorth > 1000000)) { parse('Inherited'); }