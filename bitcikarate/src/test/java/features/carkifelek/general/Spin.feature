Feature: general spin
  
  Background:
    Given url baseURI
    
    Scenario: general spin
      And path 'api/campaignapi/spin'
      And header authorization = generalToken
      * def RequestBody = { "w":169b1ee6-d20f-4892-480b-08dbb45f3f78 }
      And request RequestBody
      When method post
    * print response
      * if (responseStatus == 403) karate.abort()
      Then status 200

