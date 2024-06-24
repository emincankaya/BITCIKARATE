Feature: GetSubAccounts

  Background:
    Given url baseURI

    Scenario: Get Sub Accounts
      And path 'api/Accountv2/GetSubAccounts'
      And header authorization = generalToken
      And header apitoken = apiToken
      * def RequestBody = {LanguageCode: "tr"}
      * request RequestBody
      When method post
      Then status 200
      #* print response