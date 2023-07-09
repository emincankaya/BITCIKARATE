Feature: All Active Customer Orders

  Background:
    Given url baseURI

  Scenario: Post All Active Customer Orders Positive
    And path 'api/Order/AllActiveCustomerOrdersV2'
    And header apitoken = apiToken
    And header authorization = generalToken
    * def RequestBody = { "TimeScale": 3 }
    And request RequestBody
    When method post
    Then status 200
    * print response
