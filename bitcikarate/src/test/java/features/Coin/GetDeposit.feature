Feature: GetDeposit

  Background:
    Given url baseURI

  Scenario: CoinGetDeposit
    And path 'api/Coin/GetDeposit'
    And param coinId = 29
    And header apitoken = apiToken
    And header authorization = generalToken
    When method get
    Then status 200
    * match response.CoinChainNetworkList[0].CoinChainNetworkId == 29
    * match response.CoinChainNetworkList[0].ChainNetworkName == 'Bitci'
    * match response.CoinChainNetworkList[0].ChainNetworkCode == 'BRC20'

  Scenario: Bitcitryvarliklarimgetdeposit
    * def bitcitryvarliklarim = call read('classpath:features/FinanceState/GetFinanceState.feature@@varlilarimbitcitrybalance')
    * def tamsayibitcitrykullanilabirbakiyevarliklarim = bitcitryvarliklarim.tamsayibitcitrykullanilabirbakiye
    And path 'api/Coin/GetDeposit'
    And param coinId = 29
    And header apitoken = apiToken
    And header authorization = generalToken
    When method get
    Then status 200
    * def  bitcitrybalancegetdeposit = response.CoinBalancePrice
    * def  bitcitrybalancegetdeposittamsayi = Math.floor(bitcitrybalancegetdeposit)
    * match bitcitrybalancegetdeposittamsayi == tamsayibitcitrykullanilabirbakiyevarliklarim
    #Bu senaryoda Varlıklarım sayfasında bulunan Bitci Kullanılabilir TRY bakiyesi ile
  #Coin çekme Bitci sayfasındaki kullanılabilir Bitci Try miktarı eşit mi diye kontrol sağlanmıştır.






