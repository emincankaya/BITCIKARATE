Feature: Ticker Get Coin Favorite List

  Background:
    Given url baseURI

    Scenario: Ticker Get Coin Favorite List
      * def addFavorite = call read('classpath:features/Ticker/AddFavorite.feature')
      And path 'api/Ticker/GetCoinFavoriteList'
      And header apitoken = apiToken
      And header authorization = generalToken
      When method get
      Then status 200
     * print response
      * def list = get response[?(@.CoinName == "Bitci")]
      * match list[0].BaseAssetId == 7
      * match list[0].CurrencyId == 1
      * match list[0].CoinId == 29
      * match list[0].QuoteAssetId == 1
      * print list