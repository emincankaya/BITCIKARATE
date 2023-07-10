Feature: Get City List By State

  Background:
    Given url baseURI

  Scenario: Brazilya City List By State
    * def amazonas = callonce read('classpath:features/AccounV2/GetStates.feature')
    * def id = amazonas.amazonasId
    And path 'api/Accountv2/GetCityListByState'
    And header authorization = generalToken
    And header apitoken = apiToken
    And param stateId = id
    When method get
    Then status 200
    * def alvaraes = get response.[?(@.Name=="Alvarães")]
    * match alvaraes[0].Id == 222
    #* print alvaraes