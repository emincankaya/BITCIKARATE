Feature: Create Token Caller

  Background:
    Given url baseURI
    And path '/api/Accountv2/login'
    And header apitoken = apiToken


  @create_token_caller
  Scenario: Create Token
    * def RequestBody = {"EmailOrPhone":"5451320507","Password":"Test123*","SmsMobileKey":"","AuthenticationCode":"","LanguageCode":"en"}
    And request RequestBody
    When method post
    Then status 200



    Scenario: Print General Token
      * print "generalToken:  ", generalToken