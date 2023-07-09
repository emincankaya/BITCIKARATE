Feature: Get Market Currency Coin Matches

  Background:
    Given url baseURI

  Scenario: IsMarketOpen True Olanlar
    And path '/api/Order/GetMarketCurrencyCoinMatches'
    And param LanguageCode = 'tr'
    And header apitoken = apiToken
    And header authorization = generalToken
    When method post
    Then status 200
     # * def liste = response[0]
     # * print liste
     # * def kitnums = get response.CurrencyList[*].CoinId  ---> bütün currencyListedeki coinId leri getirir
     # * print kitnums
    * def bob1 = get response.CurrencyList[?(@.CurrencyId==1)]
    * def bob2 = get response.CurrencyList[?(@.CurrencyId==2008)]
    * def bob3 = get response.CurrencyList[?(@.CurrencyId==2010)]
    * print bob1
    * print bob2
    * print bob3
    * match bob1[0].IsMarketOpen == true
    * match bob2[0].IsMarketOpen == true
    * match bob3[0].IsMarketOpen == true