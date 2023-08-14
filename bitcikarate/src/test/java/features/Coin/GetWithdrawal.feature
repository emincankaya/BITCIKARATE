Feature: Coin GetWithdrawal

  Background:
    Given url baseURI

    Scenario: CoinGetWithdrawal
      And path 'api/Coin/GetWithdrawal'
      And header apitoken = apiToken
      And header authorization = generalToken
      And param coinId = 29
      When method get
      Then status 200
      * match response.CoinChainNetworkList[0].CoinChainNetworkId == 29
      * match response.CoinChainNetworkList[0].ChainNetworkName == 'Bitci'
      * match response.CoinChainNetworkList[0].ChainNetworkCode == 'BRC20'


