Feature: Get Customer Referrer Commission Rates Detail

  Background:
    Given url baseURI

  Scenario: Get Customer Referrer Commission Rates Detail
    And path 'api/Accountv2/GetCustomerReferrerCommisionRateDetail'
    And param code = 'M4ZI60JP'
    And header authorization = generalToken
    And header apitoken = apiToken
    Then method get
    And status 200
    And match response.Data.Code == 'M4ZI60JP'
    * print response