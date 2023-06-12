Feature: Active Orders

  Background:
    Given url baseURI

  Scenario: Get Active Orders Positive
    And param pair = 'BITCI_TRY'
    And path 'api/Order/ActiveOrders'
    And header apitoken = apiToken
    And header authorization = generalToken
    When method get
    Then status 200
    * def number = Java.type('helpers.RandomNumber').getRandom()
    * print number
    * def data = response[number]
    * def CoinId = data.CoinId
    * def CurrencyId = data.CurrencyId
    * match  CoinId == 29
    * match CurrencyId == 1


  Scenario: Wrong Pair Active Orders
    And param pair = 'BITCI_TR'
    And path 'api/Order/ActiveOrders'
    And header apitoken = apiToken
    And header authorization = generalToken
    When method get
    Then status 204

  Scenario: Hatalı Api Token Active Orders
    And param pair = 'BITCI_TRY'
    And path 'api/Order/ActiveOrders'
    And header apitoken = 'asadkjadka'
    And header authorization = generalToken
    When method get
    Then status 400

  Scenario:  Api Token Göndermeden Active Orders
    And param pair = 'BITCI_TRY'
    And path 'api/Order/ActiveOrders'
    And header authorization = generalToken
    When method get
    Then status 403

  Scenario: Auth Olmadan Active Orders
    And param pair = 'BITCI_TRY'
    And path 'api/Order/ActiveOrders'
    And header apitoken = apiToken
    When method get
    Then status 200





