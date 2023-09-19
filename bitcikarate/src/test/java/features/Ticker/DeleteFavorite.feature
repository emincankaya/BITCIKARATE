Feature: Delete Favorite

  Background:
    Given url baseURI

    Scenario: DeleteFavorite
      * def addFavrite = call read('classpath:features/Ticker/AddFavorite.feature')
      And path 'api/Ticker/DeleteFavorite'
      And header authorization = generalToken
      And header apitoken = apiToken
      * def RequestBody = read('classpath:model/Ticker/DeleteFavorite.json')
      And request RequestBody
      When method post
      Then status 200
      * match response.IsSuccess == true
      * match response.Message == "Successful"
      * print response