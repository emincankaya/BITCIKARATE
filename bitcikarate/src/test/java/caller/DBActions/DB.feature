Feature:Customer Balances

  Scenario: Update Customer Coin Balance
	* def query = "update CustomerCoinBalance set Balance=0.002 where CoinId=88 and CustomerId=606944"
	* def  DbConnection = Java.type('helpers.DBUtils')
	* def connect = DbConnection.createConnection()
	* DbConnection.executeQuery(query)

