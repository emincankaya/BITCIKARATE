Feature: CoinBalanceDetail

  Background:
    Given url baseURI
    And path 'api/Coin/CoinBalanceDetail'
    And header apitoken = apiToken



  @coinbalancedetail_caller
  Scenario: Customer CoinBalanceDetail Info
    And header authorization = generalToken
    * def RequestBody = {"CoinId": 29,"CurrencyId": 1}
    And request RequestBody
    When method post
    Then status 200
  @coinbalancedetail_caller2
  Scenario: Customer CoinBalanceDetail Info
    And header authorization = generalToken2
    * def RequestBody = {"CoinId": 29,"CurrencyId": 1}
    And request RequestBody
    When method post
    Then status 200
   #* print response
  #  * print RequestBody

