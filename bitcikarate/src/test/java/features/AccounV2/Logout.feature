Feature: LogOut

  Background:
    Given url baseURI

  Scenario: Kullanıcı Logout
    And path 'api/Accountv2/logout'
    And header authorization = generalToken
    And header apitoken = apiToken
    And method get
    Then status 200

  Scenario: Kullanıcı Logout Aut OLmadan
    And path 'api/Accountv2/logout'
    And header apitoken = apiToken
    And method get
    Then status 401

  Scenario: Kullanıcı Logout ApıToken Olmadan
    And path 'api/Accountv2/logout'
    And header authorization = generalToken
    And method get
    Then status 403




