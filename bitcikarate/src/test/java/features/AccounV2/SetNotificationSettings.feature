Feature: SetNotificationSettings

  Background:
    Given url baseURI

    @truemoneywithdraw
  Scenario: SetNotificationSettings
    And path 'api/Accountv2/SetNotificationSettings'
    And header authorization = generalToken
    And header apitoken = apiToken
    * def RequestBody = read('classpath:model/AccountV2/SetNotificationSettings.json')
    * request RequestBody
    When method post
    Then status 200
    * match response.IsSuccess == true
    * match response.Message == "İşleminiz başarılı bir şekilde gerçekleştirilmiştir."

    @falsemoneywithdraw
  Scenario: SetNotificationSettings
    And path 'api/Accountv2/SetNotificationSettings'
    And header authorization = generalToken
    And header apitoken = apiToken
    * def RequestBody = read('classpath:model/AccountV2/SetNotificationSettings.json')
    * RequestBody.NoticeMoneyWithdrawal = false
    * request RequestBody
    When method post
    Then status 200
    * match response.IsSuccess == true
    * match response.Message == "İşleminiz başarılı bir şekilde gerçekleştirilmiştir."



