Feature: DepositList

  Background:
    Given url baseURI

    Scenario: DepositList
      And path 'api/Money/DepositList'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = read('classpath:model/Money/DepositList.json')
      * request RequestBody
      When method post
      Then status 200
     # * print response
      * def status = get response.Data.CurrencyDepositListItemDto[*].Status
      #* print status
      * match status contains any [1, 2]