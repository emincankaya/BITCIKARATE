Feature: Get Customer Referrer Commission Rates

  Background:
    Given url baseURI

    Scenario: Get Customer Referrer Commission Rates
      And path 'api/Accountv2/GetCustomerReferrerCommisionRates'
      And header authorization = generalToken
      And header apitoken = apiToken
      Then method get
      And status 200
      * print response
