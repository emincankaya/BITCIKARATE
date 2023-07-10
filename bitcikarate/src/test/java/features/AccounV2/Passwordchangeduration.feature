Feature: PasswordChangeDuration

  Background:
    Given url baseURI

  Scenario: PasswordChangeDuration
    And path 'api/Accountv2/passwordchangeduration'
    And header apitoken = apiToken
    When method get
    Then status 200
    * print response
    * match response == [1,3,6]
