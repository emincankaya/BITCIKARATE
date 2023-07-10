Feature: Get Country List
  
  Background: 
    Given url baseURI
    
    Scenario: Ulkelerden Türkiye code dogrula
      And path 'api/Accountv2/GetCountryList'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * def bob = get response.[?(@.Name=="Turkey")]
      * def bob1 = bob[0].Id
      #* print bob
      #* print bob1
      * match bob[0].DialCode == "+90"
      #* print response
      * def brazil = get response.[?(@.Name=="Brazil")]
      * def brazilId = brazil[0].Id