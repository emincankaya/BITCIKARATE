Feature: CoinGetAddress

  Background:
    Given url baseURI
    And header apitoken = apiToken

  Scenario: CoinGetAdress
    And path 'api/Coin/GetAddress'
    And header authorization = generalToken
    * def RequestBody = read('classpath:model/Coin/GetAdress.json')
    *  request RequestBody
    When method post
    Then status 200
    * match response.Address == '0x66a59969A853Bb6aD657278dcabA8fea0e0b3c59'
    * match response.Tag == '0'
    * match response.Message == 'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.'

  Scenario: CoinGetAdress with has tag coin
    And path 'api/Coin/GetAddress'
    And header authorization = generalToken
    * def RequestBody = read('classpath:model/Coin/GetAdress.json')
    * RequestBody.CoinChainNetworkId=5
    *  request RequestBody
    When method post
    Then status 200
    * match response.Address == 'rKqqLmJvM9Xcqz6bN7zL2rSWpQkK2Zptq6'
    * match response.Tag != '0'
    * match response.HasTag == true
    * match response.IsSucceeded == true
    * match response.Message == 'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.'