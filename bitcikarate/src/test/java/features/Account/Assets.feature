Feature: Assets
  
  Background: 
    Given url baseURI
    
    Scenario: Assets
      And path 'api/Account/assets'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method post
      Then status 200
      * def try = get response.[?(@.Code=="TRY")]
      * match try[0].AssetId == 1
      * match try[0].AssetType == 2
