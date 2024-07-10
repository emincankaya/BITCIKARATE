Feature: Cancel Orders

  Background:
    Given url baseURI

  Scenario: Emir İptali
    * def CreateResponse = callonce read('classpath:features/Order/OrderCreate.feature@lımıtbuyorder')
    * def data = CreateResponse.response.Data
    And path 'api/Order/Cancel'
    And header apitoken = apiToken
    And header authorization = generalToken
    * def RequestBody = read('classpath:model/CancelOrder.json')
    *  RequestBody.OrderId = data
    And request RequestBody
    When method post
    Then status 200
    * print response
    * match  response.IsSuccess == true

