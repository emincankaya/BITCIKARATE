Feature: WithdrawList

  Background:
    Given url baseURI

    Scenario: WithdrawList IsActive= true
      And path 'api/Money/WithdrawList'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = read('classpath:model/Money/WithdrawList.json')
      * request RequestBody
      When method post
      Then status 200
     # * print response
      * def bab = get response.Data[*].Status
     # * print bab
      * match bab contains any [1, 2, 3]

      Scenario: WithdrawList IsActive= false
        And path 'api/Money/WithdrawList'
        And header apitoken = apiToken
        And header authorization = generalToken
        * def RequestBody = read('classpath:model/Money/WithdrawList.json')
        * RequestBody.IsActive=false
        * request RequestBody
        When method post
        Then status 200
       # * print response
        * def bab = get response.Data[*].Status
       # * print bab
        * match bab contains any [4, 5]
       # contains any 4 veya 5 biri olmalı anlamında, sadece bir taneside olursa sıkıntı olmaz
       # * match bab contains deep [4, 5] ---> deep kullandığımızda  4, 5 den birer tane kesin olmalı
       # * match bab contains only [4,5,5,4,4] ---> only kullandığımızda 4 ve 5 den ne kdar varsa hepsini yazmamız gerekiyor
