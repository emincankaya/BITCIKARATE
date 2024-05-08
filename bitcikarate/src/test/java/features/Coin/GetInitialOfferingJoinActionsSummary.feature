Feature: GetInitialOfferingJoinActionsSummary

  Background:
    Given url baseURI

    Scenario: Get InitialOffering Join Actions Summary
      And path 'api/Coin/GetInitialOfferingJoinActionsSummary'
      And param pageNumber = 1
      And header apitoken = apiToken
      And header authorization = generalToken
      When method get
      Then status 200
      * match response.InitialOfferingJoinActionSummaries[*].InitialOfferingAssetCode contains any["GOM"]
