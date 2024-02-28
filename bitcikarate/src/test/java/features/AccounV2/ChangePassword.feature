Feature: ChangePassword

  Background:
    Given url baseURI
#smoke suitin içinde koşturulmayacak -test geçti
  Scenario: ChangePassword
    And path 'api/Accountv2/changepassword'
    And header authorization = generalToken
    And header apitoken = apiToken
    * def RequestBody = read('classpath:model/AccountV2/ChangePassword.json')
    * request RequestBody
    And method post
    Then status 200

