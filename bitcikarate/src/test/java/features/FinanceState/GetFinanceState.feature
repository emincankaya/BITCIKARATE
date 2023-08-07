Feature: GetFinanceState

  Background:
    Given url baseURI

    Scenario: GetFinanceState
      And path 'api/FinanceState/GetFinanceState'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = {"CurrencyId": 1}
      And request RequestBody
      When method post
      Then status 200
     * def bakiye = get response.CashMoneyBalanceList[?(@.CurrencyCode=="TRY")].Amount
     * def tamSayi = Math.floor(bakiye)
     #* print tamSayi
     #* print response

