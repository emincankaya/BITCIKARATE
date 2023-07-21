Feature: Mobile remove notification device

  Background:
    Given url baseURI

    Scenario: Mobileremovenotificationdevice
      * def addnotificationdevice = call read('classpath:features/Mobile/Addnotificationdevice.feature')
      And path 'api/Mobile/removenotificationdevice'
      And header apitoken = apiToken
      And header authorization = generalToken
      And param deviceId = addnotificationdevice.deviceId
      When method post
      Then status 200
