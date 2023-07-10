Feature: Get States

  Background:
    Given url baseURI

  Scenario: brazilya testi
    * def brazil = callonce read('classpath:features/AccounV2/GetCountryList.feature')
    * def brazilCountryId = brazil.brazilId
    And path 'api/Accountv2/GetStates'
    And header authorization = generalToken
    And header apitoken = apiToken
    And param countryId = brazilCountryId
    When method get
    Then status 200
    * def amazonas = get response.[?(@.Name=="Amazonas")]
    * def amazonasId = amazonas[0].Id
    * match amazonas[0].Id == 4
    * print amazonas