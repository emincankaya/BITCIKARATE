Feature: CoinGetAddress

  Background:
    Given url baseURI

  Scenario: CoinGetAdress
    And path 'api/Coin/GetAddress'
    And header apitoken = apiToken
    And header authorization = generalToken
    * def RequestBody = read('classpath:model/Coin/GetAdress.json')
    *  request RequestBody
    When method post
    Then status 200
    * match response.Address == '0x66a59969A853Bb6aD657278dcabA8fea0e0b3c59'
    * match response.Tag == '0'
    * match response.Message == 'İşleminiz başarılı bir şekilde gerçekleştirilmiştir.'