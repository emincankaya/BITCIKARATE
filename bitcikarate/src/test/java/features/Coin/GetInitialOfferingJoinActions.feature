Feature: GetInitialOfferingJoinActions

  Background:
    Given url baseURI

    Scenario: Get Initial Offering Join Actions
      And path 'api/Coin/GetInitialOfferingJoinActions'
      And param pageNumber = 1
      And param assetCode = 'GOM'
      And header apitoken = apiToken
      And header authorization = generalToken
      When method get
      Then status 200
      #* print response
      * match response.Actions[*].InitialOfferingAssetCode contains any["GOM"]