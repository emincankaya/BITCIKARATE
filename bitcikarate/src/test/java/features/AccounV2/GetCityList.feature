Feature: Get City List

  Background:
    Given url baseURI

    Scenario: Turkiye deki sehir
      * def turkiye = callonce read('classpath:features/AccounV2/GetCountryList.feature')
      * def turkiyeId = turkiye.bob1
      #* print turkiyeId
      And path 'api/Accountv2/GetCityList'
      And header authorization = generalToken
      And header apitoken = apiToken
      And param countryId = turkiyeId
      When method get
      Then status 200
     # * print response
      * def bab = get response.[?(@.Name=="ANTALYA")]
      * def antalya = bab[0].Id
     # * print antalya
     # * print bab
      * match bab[0].Plate == 7