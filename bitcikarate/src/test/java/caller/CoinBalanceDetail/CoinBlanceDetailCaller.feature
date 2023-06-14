Feature: CoinBalanceDetail

  Background:
    Given url baseURI
    And path 'api/Coin/CoinBalanceDetail'
    And header apitoken = apiToken
    And header authorization = generalToken2


  @coinbalancedetail_caller
  Scenario: Customer CoinBalanceDetail Info
    * def RequestBody = {"CoinId": 29,"CurrencyId": 1}
    And request RequestBody
    When method post
    Then status 200
  #  * print response
  #  * print RequestBody

