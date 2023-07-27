Feature: Withdraw

  Background:
    Given url baseURI

    Scenario: Withdraw
      And path 'api/Money/Withdraw'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = read('classpath:model/Money/Withdraw.json')
      And request RequestBody
      When method post
      Then status 200
      * match response.Message == "İşlem talebiniz alındı. Tamamlandığında ayrıca bilgilendireceğiz."
      * match response.Success == true
     # * print response

    Scenario: Withdraw minimum cekme miktari
      And path 'api/Money/Withdraw'
      And header apitoken = apiToken
      And header authorization = generalToken
      * def RequestBody = read('classpath:model/Money/Withdraw.json')
      * RequestBody.Amount = 9
      And request RequestBody
      When method post
      Then status 200
      * match response.Message == "Çekim tutarınız sistemde tanımlı minimum çekim limitinden düşük olamaz."
      * match response.Success == false
      #* print response

  Scenario:Withdraw bakiyenden fazlasi cekilmez
    * def bakiyeOgrenme = call read('classpath:features/FinanceState/GetFinanceState.feature')
    And path 'api/Money/Withdraw'
    And header apitoken = apiToken
    And header authorization = generalToken
    * def RequestBody = read('classpath:model/Money/Withdraw.json')
    * RequestBody.Amount = bakiyeOgrenme.tamSayi+100
    And request RequestBody
    When method post
    Then status 200
    * match response.Message == "Bu işlem için yeterli bakiyeniz bulunmamaktadır"
    * match response.Success == false
    #* print response