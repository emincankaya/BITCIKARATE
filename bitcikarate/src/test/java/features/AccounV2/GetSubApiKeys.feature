Feature: GetSubApiKeys

  Background:
    Given url baseURI

    Scenario: GetSub ApiKeys
      And path 'api/Accountv2/GetSubApiKeys'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      #* print response
      * match response.IsSuccess == true
