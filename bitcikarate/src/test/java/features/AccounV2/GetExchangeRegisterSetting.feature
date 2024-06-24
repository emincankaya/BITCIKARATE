Feature: GetExchangeRegisterSetting

  Background:
    Given url baseURI

    Scenario: Get Exchange Register Setting
      And path 'api/Accountv2/GetExchangeRegisterSetting'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      #* print response