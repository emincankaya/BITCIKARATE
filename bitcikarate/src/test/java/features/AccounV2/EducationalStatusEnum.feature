Feature: Educational Status Enum

  Background:
    Given url baseURI

    Scenario: EducationalStatusEnum
      And path 'api/Accountv2/EducationalStatusEnum'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * def expectedResponse = read('classpath:model/AccountV2/EducationalStatusEnum.json')
      * match response == expectedResponse
