Feature: CoinWithdrawalList

  Background:
    Given url baseURI
@test
    Scenario: CoinWithdrawalList
      And path 'api/Coin/CoinWithdrawalList'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = read('classpath:model/Coin/CoinWithdrawalList.json')
      *  request RequestBody
      When method post
      Then status 200
      * print response
      * def statusaktif = get response.Data.CustomerCoinWithdrawalDto[*].CoinWithdrawalStatusEnumId
      * match statusaktif contains any [1, 2, 3]
  @test
  Scenario: CoinWithdrawalList islem gecmisi
    And path 'api/Coin/CoinWithdrawalList'
    And header apitoken = apiToken
    And header authorization = generalToken
    * def RequestBody = read('classpath:model/Coin/CoinWithdrawalList.json')
    * RequestBody.IsActive = false
    *  request RequestBody
    When method post
    Then status 200
    * print response
    * def statusaktif = get response.Data.CustomerCoinWithdrawalDto[*].CoinWithdrawalStatusEnumId
    * match statusaktif contains any [4, 5, 6]

