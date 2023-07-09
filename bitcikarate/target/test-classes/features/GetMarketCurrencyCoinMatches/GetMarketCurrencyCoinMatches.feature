Feature: GetMarketCurrencyCoinMatches
  Background: Islem Gecmisi
	* url baseURI



 # And def codeCheck = status == 'PayOrderStatusEnum.Completed' ? "true" : "false"
  Scenario: Açık market kontrolü
	* path 'api/Order/GetMarketCurrencyCoinMatches'
	* header apitoken = apiToken
	* header authorization = generalToken
	* param LanguageCode = 'tr'
	* param resource = 'tr'
	* method post
	* def glft = {"ExchangeId":'#string',"CurrencyId":2010,"IsActive":'#boolean',"CurrencyCode":'#string',"IsCryptoCurrency":'#boolean',"CoinId":'#number',"Default":'#boolean',"IsMarketOpen":true,"Name":'#string',"CoinTrackingEnabled":'#boolean'}
	* def try = {"ExchangeId":'#string',"CurrencyId":1,"IsActive":'#boolean',"CurrencyCode":'#string',"IsCryptoCurrency":'#boolean',"CoinId":null,"Default":'#boolean',"IsMarketOpen":true,"Name":'#string',"CoinTrackingEnabled":'#boolean'}
	* def usdt = {"ExchangeId":'#string',"CurrencyId":2008,"IsActive":'#boolean',"CurrencyCode":'#string',"IsCryptoCurrency":'#boolean',"CoinId":'#number',"Default":'#boolean',"IsMarketOpen":true,"Name":'#string',"CoinTrackingEnabled":'#boolean'}
	* def bitci = {"ExchangeId":'#string',"CurrencyId":2007,"IsActive":'#boolean',"CurrencyCode":'#string',"IsCryptoCurrency":'#boolean',"CoinId":'#number',"Default":'#boolean',"IsMarketOpen":false,"Name":'#string',"CoinTrackingEnabled":'#boolean'}
	* match response.CurrencyList contains glft
	* match response.CurrencyList contains try
	* match response.CurrencyList contains usdt
	* match response.CurrencyList contains bitci
	* status 200







