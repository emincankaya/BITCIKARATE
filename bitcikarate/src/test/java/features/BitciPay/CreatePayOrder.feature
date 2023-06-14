Feature: User can create payment

  Background:variables
	Given url baseURI
	And header apitoken = apiToken
	* def payCodeResponse = callonce read('classpath:features/BitciPay/CreatePayCode.feature')
	* def payCode = payCodeResponse.response.Data.TransactionCode

  @bitciPayInfo
  Scenario: User should be able to get BitciPayment code
	* path 'api/CryptoPay/pay'
	And header authorization = generalToken
	* param TransactionCode = payCode
	* param LanguageCode = 'tr'
	* method Get
	* status 200
	* assert response.Data.TransactionCode == payCode

  @bitciPayOdeme
  Scenario: User should be able to Pay using BitciPay
	* path 'api/CryptoPay/pay'
	And header authorization = generalToken2
	* def requestBody = read('classpath:model/BitciPay/CryptoPay.json')
	* requestBody.TransactionCode = payCode
	* request requestBody
	* method post
	* status 200

  Scenario: Kullanıcı gelen ödemeleri görebilmeli
	* path 'api/CryptoPay/incomes'
	And header authorization = generalToken
	* param LanguageCode = 'tr'
	* method get
	* def status = response.PayOrders[0].PayOrderStatusEnum
	And def codeCheck = status == 'PayOrderStatusEnum.Completed' ? "true" : "false"
	And def payOrderStatusEnumCheck = response.PayOrders[0].TransactionCode == payCode ? "true" : "false"
	* match codeCheck == payOrderStatusEnumCheck

  Scenario: Kullanıcı yaptığı ödemeleri görebilmeli
	* path 'api/CryptoPay/payments'
	And header authorization = generalToken2
	* param LanguageCode = 'tr'
	* method get
	* def status = response.PayOrders[0].PayOrderStatusEnum
	And def codeCheck = status == 'PayOrderStatusEnum.Completed' ? "true" : "false"
	And def payOrderStatusEnumCheck = response.PayOrders[0].TransactionCode == payCode ? "true" : "false"
	* match codeCheck == payOrderStatusEnumCheck

  Scenario:Kullanıcı ödeme yaptığında bakiyesi ödeme miktarı kadar azalmalı
	* def balance = call read('classpath:caller/CoinBalanceDetail/CoinBlanceDetailCaller.feature@coinbalancedetail_caller2')
	* def balanceBefore = balance.response.CoinBalance
	* def paymentforAmount = call read('classpath:features/BitciPay/CreatePayOrder.feature@bitciPayInfo')
	* def paymentAmount = paymentforAmount.response.Data.Total
	* call read('classpath:features/BitciPay/CreatePayOrder.feature@bitciPayOdeme')
	* def balanceForAfter = call read('classpath:caller/CoinBalanceDetail/CoinBlanceDetailCaller.feature@coinbalancedetail_caller2')
	* def balanceAfter = balanceForAfter.response.CoinBalance
	* assert (balanceBefore-balanceAfter) == paymentAmount


  Scenario: Kullanıcı yeterli bakiyesi olmadığında ödeme yapamamalı
	* path 'api/CryptoPay/createPayOrder'
	* header authorization = generalToken
	* def requestBody = read('classpath:model/BitciPay/CreatePayOrder.json')
	* requestBody.Total = 1000000
	* request requestBody
	* method post
	* def code = response.Data.TransactionCode
	* path 'api/CryptoPay/pay'
	* header authorization = generalToken2
	* header apitoken = apiToken
	* def payReq = read('classpath:model/BitciPay/CryptoPay.json')
	* payReq.TransactionCode = code
	* request payReq
	* method post
	* status 200
	* match response.Message == 'Bu işlem için yeterli bakiyeniz bulunmamaktadır'







    






