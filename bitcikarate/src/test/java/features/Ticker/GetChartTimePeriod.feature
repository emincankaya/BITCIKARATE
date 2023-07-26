Feature: Chart Time Period

  Background:
    Given url baseURI

    Scenario: ChartTimePeriod
      And path '/api/Ticker/GetChartTimePeriod'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def ResponseBody = read('classpath:model/Ticker/ChartTimePeriod.json')
      When method get
      Then status 200
      And match response == ResponseBody


