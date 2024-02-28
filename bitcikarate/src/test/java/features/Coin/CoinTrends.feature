Feature: CoinTrends

  Background:
    Given url baseURI

    Scenario: Coin Trends
      And path 'api/Coin/CoinTrends'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = { "CoinCode": "BITCI","CurrencyCode": "TRY"}
      And request RequestBody
      When method post
      Then status 200
     # * print response