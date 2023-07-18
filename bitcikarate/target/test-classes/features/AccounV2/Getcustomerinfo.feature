Feature: GetCustomerInfo

  Background:
    Given url baseURI

  Scenario: Kullanici Bilgileri Kontrol Et
    And path 'api/Accountv2/getcustomerinfo'
    And header authorization = generalToken
    And header apitoken = apiToken
    When method get
    Then status 200
    * print response
    * match response.NameSurname == 'Muhammed Emin Çankaya'
    * match response.Active == 1
    * match response.Mail == 'cankibo07@gmail.com'
    * match response.Phone == '5451320507'
    * def customerStatusEnum = response.CustomerStatusEnumId
    * match response.CustomerStatusEnumId == 12
    * match response.IsTempFinancialBlockage == false
    * match response.HasSubAccountCreate == true