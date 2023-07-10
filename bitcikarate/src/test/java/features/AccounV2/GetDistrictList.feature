Feature: Get District List

  Background:
    Given url baseURI

  Scenario: Antalya District
    * def antalyacode = callonce read('classpath:features/AccounV2/GetCityList.feature')
    * def antalyaId = antalyacode.antalya
   # * print antalyaId
    And path 'api/Accountv2/GetDistrictList'
    And header authorization = generalToken
    And header apitoken = apiToken
    And param cityId = antalyaId
    When method get
    Then status 200
    * def dosemealti = get response.[?(@.Name=="DÖŞEMEALTI")]
    * match dosemealti[0].Id == 87
    #* print dosemealti