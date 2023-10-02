  Feature: Create Token Caller

  Background:
    Given url baseURI
    And path '/api/Accountv2/login'
    And header apitoken = apiToken


  @create_token_caller
  Scenario: Create Token
    * def RequestBody = read('classpath:model/AccountV2/Login.json')
    * def result =  Java.type('helpers.PasswordEncp').easEncryptString()
    * RequestBody.EPassword = result[0]
    * RequestBody.TimeStamp = result[1]
    And request RequestBody
    * print RequestBody
    When method post
  #  * print response
    Then status 200



  @create_token_caller2
  Scenario: Create Token
    * def RequestBody = {"EmailOrPhone": "TestTeam20@test.com","Password": "","EPassword": "QUpBYlRCUVFQN3ZEdjJlc65XlZyxENSBOsLMZibw990=","SmsMobileKey": "","AuthenticationCode": "","LanguageCode": "tr" }
    And request RequestBody
    When method post
    Then status 200




  Scenario: Print General Token
      #* print "generalToken:  ", generalToken