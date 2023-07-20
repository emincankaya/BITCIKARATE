Feature: Get Coin Rates

  Background:
    Given url baseURI

    Scenario: GetCoinRates
      * def addFavorite = call read('classpath:features/Ticker/AddFavorite.feature')
      And path 'api/Ticker/GetCoinRates'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * def favorite = get response[?(@.Favorite==true)]
      * match favorite[0].CoinId == 29
      * match favorite[0].CoinName == "Bitci"
      * print favorite
