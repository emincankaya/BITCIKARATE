Feature: GetFinanceState

  Background:
    Given url baseURI

    Scenario: GetFinanceState
      And path 'api/FinanceState/GetFinanceState'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = {"CurrencyId": 29}
      And request RequestBody
      When method post
      Then status 200
      * print response