Feature: Create Customer Referrer Commision Rate

  Background:
    Given url baseURI

  Scenario: Create Customer Referrer Commision Rate
    And path 'api/Accountv2/CreateCustomerReferrerCommisionRate'
    And header authorization = generalToken
    And header apitoken = apiToken
    * def RequestBody = read('classpath:model/AccountV2/CreateCustomerReferrerCommisionRate.json')
    And request RequestBody
    When method post
    And status 200
    * match response.Message == "Maksimum 5 tane referans kodu üretebilirsiniz."
    * print response
