Feature: Add Favorite

  Background:
    Given url baseURI

  Scenario: AddFavorite
    And path 'api/Ticker/AddFavorite'
    And header apitoken = apiToken
    And header authorization = generalToken
    * def RequestBody = read('classpath:model/Ticker/AddFavorite.json')
    And request RequestBody
    When method post
    Then status 200
    * match response.IsSuccess == true
    * match response.Message == "Successful"
    #* print response