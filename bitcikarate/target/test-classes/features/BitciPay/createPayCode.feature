Feature: User can create payment
  Background:variables
    And header apitoken = apiToken



  @createPayCode
  Scenario: User should be able to create BitPay code
    Given url baseURI
    And path 'api/CryptoPay/createPayOrder'
    And header authorization = generalToken
    * def requestBody = read('classpath:model/BitciPay/CreatePayOrder.json')
    * request requestBody
    * method post