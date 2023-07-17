Feature: InvestmentPurpose Enum

  Background:
    Given url baseURI

  Scenario: InvestmentPurposeEnum
    And path 'api/Accountv2/InvestmentPurposeEnum'
    And header apitoken = apiToken
    When method get
    Then status 200
    * def expectedResponse = read('classpath:model/AccountV2/InvestmentPurposeEnum.json')
    * match response == expectedResponse
