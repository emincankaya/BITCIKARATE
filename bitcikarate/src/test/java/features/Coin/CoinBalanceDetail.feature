Feature: Coin CoinBlanceDetail

  Background:
    Given url baseURI

    Scenario: bitci Coin
      And path 'api/Coin/CoinBalanceDetail'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = {"CoinId": 29,"CurrencyId": 1}
      And request RequestBody
      * def varliklarimKismi = callonce read('classpath:features/FinanceState/GetFinanceState.feature@bakiye')
      * def bitci = get varliklarimKismi.response.CustomerCoinBalanceDetailList[?(@.CoinName=="Bitci")]
      When method post
      Then status 200
      * print bitci
      * print response
     * match response.TotalBalance == bitci[0].TotalBalance
     * match response.CoinBalance == bitci[0].CoinBalance
     * match response.CurrentPrice == bitci[0].CurrentPrice
     * match response.CurrentTotalBalance == bitci[0].CurrentTotalBalance
