Feature: webpages

  Background:
    Given url baseURI

  Scenario: webpages
    And path 'api/webpageapi/webpages'
    And header apitoken = apiToken
    And header authorization = generalToken
    When method get
    Then status 200
