Feature: Order Create

  Background:
    Given url baseURI
    And path 'api/Order/Create'
    And header apitoken = apiToken
    And header authorization = generalToken

  Scenario: Gerceklesen Limit Alis Emri
    * def AlisFiyati = callonce read('classpath:features/Order/ActiveOrders.feature')
    * def Fiyat1 = AlisFiyati.response[0].Price
    * def RequestBody = read('classpath:model/CreateOrder.json')
    *  RequestBody.Price = Fiyat1
    * RequestBody.OrderType = 1
    And request RequestBody
    When method post
    Then status 200
    * print response

 #OrderType=1 Limit Buy Order
 # Scenario: Limit Buy Open Order
  #  * def RequestBody = read('classpath:model/CreateOrder.json')
   # *  RequestBody.OrderType = 1
    #*  RequestBody.Price = CurrentPrice+0.001
   # And request RequestBody
  #  When method post
  #  Then status 200
  #  * print response



    #Scenario: Lİmit Sell Open Order
     # * def RequestBody = read('classpath:model/CreateOrder.json')
      #*  RequestBody.OrderType = 2
      #*  RequestBody.Price = CurrentPrice+0.002
      #And request RequestBody
      #When method post
      #Then status 200
      #* print response


  #Scenario: Limit Sell Open Order
   # * def Price = CurrentPrice+0.001
    #* def CreateSellOpenOrder = call read('classpath:caller/CreateOrder/CreateOrderCaller.feature'){"OrderType":2,"Price":#(Price)}
    #* print CreateSellOpenOrder
    #Then status 200




