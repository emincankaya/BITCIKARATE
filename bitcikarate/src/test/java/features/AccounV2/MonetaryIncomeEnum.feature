Feature: Monetary Income Enum

  Background:
    Given url baseURI

    Scenario: MonetaryIncomeEnum
      And path 'api/Accountv2/MonetaryIncomeEnum'
      And header authorazation = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * def expectedResponse = read('classpath:model/AccountV2/MonetaryIncomeEnum.json')
      * match response == expectedResponse
