Feature: Trades

  Background:
    Given url baseURI


  Scenario: Market gecmisi dogrulama

    * def CreateResponsee = call read('classpath:features/Order/ActiveOrders.feature')
    * def ActualPrice = CreateResponsee.response[0].Price
    * def CreateResponse = call read('classpath:features/Order/OrderCreate.feature@gerceklesenalısemri')
    * def Data = CreateResponse.dataa
    And path '/api/Order/Trades'
    And param pair = 'BITCI_TRY'
    And header apitoken = apiToken
    When method get
    Then status 200
    * def ExpectedPrice = response[0].Price
    * print ActualPrice
    * print ExpectedPrice
    * match ActualPrice == ExpectedPrice