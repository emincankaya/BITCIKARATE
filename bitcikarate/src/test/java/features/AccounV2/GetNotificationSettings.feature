Feature: GetNotificationSettings

  Background:
    Given url baseURI

    Scenario: GetNotificationSettings
      * def falsemoneywithdraw = call read('classpath:features/AccounV2/SetNotificationSettings.feature@falsemoneywithdraw')
      * def truemoneywithdraw = call read('classpath:features/AccounV2/SetNotificationSettings.feature@truemoneywithdraw')
      And path 'api/Accountv2/GetNotificationSettings'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * match response.NoticeMoneyWithdrawal == true
      * match response.NoticeMoneyDeposit == true
