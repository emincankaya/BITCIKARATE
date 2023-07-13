Feature: Monthly Earning Enum
  
  Background: 
    Given url baseURI
    
    Scenario: MonthlyEarningEnum
      And path 'api/Accountv2/MonthlyEarningEnum'
      And header authorazation = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * def ExpectedResponse = read('classpath:model/AccountV2/MonthlyEarningEnum.json')
      * match response == ExpectedResponse
