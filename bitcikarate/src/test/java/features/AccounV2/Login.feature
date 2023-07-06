Feature: Login

  Background:
    Given url baseURI
    * def Wrongpassword1 = 'Test1234'

    Scenario: Kullanıcı Login Pozitif
      And path 'api/Accountv2/login'
      And header apitoken = apiToken
      * def RequestBody = read('classpath:model/AccountV2/Login.json')
      And request RequestBody
      When method post
      Then status 200
      * match response.IsLogged == true
      * match response.CustomerInfo.NameSurname == 'Muhammed Emin Çankaya'

      Scenario: Kullanıcı Login Negatif Şifre
        And path 'api/Accountv2/login'
        And header apitoken = apiToken
        * def RequestBody = read('classpath:model/AccountV2/Login.json')
        *  RequestBody.Password = Wrongpassword1
        And request RequestBody
        When method post
        Then status 400
        * match response.Errors[0] == 'Password should contain at least one special(non-alphanumeric) character.'






