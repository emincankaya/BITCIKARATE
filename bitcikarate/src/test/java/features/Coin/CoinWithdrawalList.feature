Feature: CoinWithdrawalList

  Background:
    Given url baseURI

    Scenario: CoinWithdrawalList
      And path 'api/Coin/CoinWithdrawalList'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = read('classpath:model/Coin/CoinWithdrawalList.json')
      *  request RequestBody
      When method post
      Then status 200
      * print response