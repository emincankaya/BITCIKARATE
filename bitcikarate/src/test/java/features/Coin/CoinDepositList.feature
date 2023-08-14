Feature: CoinDepositList

  Background:
    Given url baseURI

    Scenario: CoinDepositList
      And path 'api/Coin/CoinDepositList'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = read('classpath:model/Coin/CoinDepositList.json')
      *  request RequestBody
      When method post
      Then status 200
      * def depositList = get response.Data.CustomerCoinDepositList[?(@.CoinName=="Bitci")]
     * print response
     # * print depositList
      * match depositList.[*]State contains any [3]
      * match depositList.[*]CoinDepositStatusEnumId contains any [2]


