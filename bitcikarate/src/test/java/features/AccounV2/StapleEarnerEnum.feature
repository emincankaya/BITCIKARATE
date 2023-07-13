Feature: Staple Earner Enum
  
  Background: 
    Given url baseURI
    
    Scenario: StapleEarnerEnum
      And path 'api/Accountv2/StapleEarnerEnum'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * def expectedResponse = read('classpath:model/AccountV2/StapleEarnerEnum.json')
      * match response == expectedResponse
