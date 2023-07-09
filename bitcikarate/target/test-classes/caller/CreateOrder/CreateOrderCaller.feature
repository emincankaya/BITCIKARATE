Feature: Create Order Caller

  Background:
    Given url baseURI
    And path 'api/Order/Create'
    And header apitoken = apiToken
    And header authorization = generalToken
    * def OrderType = karate.get('__arg.OrderType',8)
    * def Price = karate.get('__arg.Price',2)
    * print OrderType
    * print Price



    @create_order_caller
    Scenario:Create Limit Sell Order
      * def RequestBody = read('classpath:model/CreateOrder.json')
      * RequestBody.Price = Price
      * RequestBody.OrderType = OrderType
      And request RequestBody
      When method post
      Then status 200

