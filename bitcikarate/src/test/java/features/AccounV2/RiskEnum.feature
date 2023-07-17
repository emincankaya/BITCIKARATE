Feature: Risk Enum

  Background:
    Given url baseURI

  Scenario: RiskEnum
    And path 'api/Accountv2/RiskEnum'
    And header apitoken = apiToken
    When method get
    Then status 200
    * def expectedResponse = read('classpath:model/AccountV2/RiskEnum.json')
    * match response == expectedResponse
