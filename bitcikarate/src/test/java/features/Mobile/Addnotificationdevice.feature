Feature: Add notification device

  Background:
   Given url baseURI

    Scenario: Addnotificationdevice
      And path 'api/Mobile/addnotificationdevice'
      And header authorization = generalToken
      And header apitoken = apiToken
      * def RequestBody = read('classpath:model/Mobile/Addnotificationdevice.json')
      And request RequestBody
      * def deviceId = RequestBody.DeviceId
      When method post
      Then status 200


