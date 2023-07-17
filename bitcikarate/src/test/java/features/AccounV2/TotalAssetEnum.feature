Feature: TotalAssets Enum

  Background:
    Given url baseURI

  Scenario: TotalAssetsEnum
    And path 'api/Accountv2/TotalAssetsEnum'
    And header apitoken = apiToken
    When method get
    Then status 200
    * def expectedResponse = read('classpath:model/AccountV2/TotalAssetsEnum.json')
    * match response == expectedResponse
