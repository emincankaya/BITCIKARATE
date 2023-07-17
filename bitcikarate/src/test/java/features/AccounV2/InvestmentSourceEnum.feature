Feature: InvestmentSource Enum

  Background:
    Given url baseURI

  Scenario: InvestmentSourceEnum
    And path 'api/Accountv2/InvestmentSourceEnum'
    And header apitoken = apiToken
    When method get
    Then status 200
    * def expectedResponse = read('classpath:model/AccountV2/InvestmentSourceEnum.json')
    * match response == expectedResponse
