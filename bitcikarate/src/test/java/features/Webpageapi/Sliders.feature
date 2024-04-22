Feature: webpageapi sliders
  
  Background: 
    Given url baseURI
    
    Scenario: webpageapi sliders
      And path 'api/webpageapi/sliders'
     And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200

      