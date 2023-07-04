Feature: Islem gecmisi

  Background: Islem Gecmisi
	* url baseURI
	* header apitoken = apiToken
	* header authorization = generalToken
	* path 'api/Order/CompletedOrders'


  Scenario: Kullanıcı islem gemisini  görebilmeli
	* def requestBody = read('classpath:model/Order/CompletedOrdersV2.json')
	* requestBody.CoinId = 29
	* requestBody.CurrencyId = 1
	* requestBody.TimeScale = 1
	* requestBody.PagerDto.Size = 50
	* requestBody.PagerDto.Page = 1
	* request requestBody
	* print requestBody
	* method post
	* status 200
	* print response