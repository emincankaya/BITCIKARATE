Feature: Login

  Background:
    Given url baseURI
    * def Wrongpassword1 = 'Test1234'
@loginpozitif
    Scenario: Kullanici Login Pozitif
      And path 'api/Accountv2/login'
      And header apitoken = apiToken
      * def RequestBody = read('classpath:model/AccountV2/Login.json')
      * def result =  Java.type('helpers.PasswordEncp').easEncryptString()
      * RequestBody.EPassword = result[0]
      * RequestBody.TimeStamp = result[1]
      And request RequestBody
      When method post
      Then status 200
      * print response
     * match response.IsLogged == true
     * match response.CustomerInfo.NameSurname == 'Muhammed Emin Çankaya'

      Scenario: Kullanici Login Negatif Sifre
        And path 'api/Accountv2/login'
        And header apitoken = apiToken
        * def RequestBody = read('classpath:model/AccountV2/Login.json')
        And request RequestBody
       When method post
        Then status 200
        * print response
        # * match response.Errors[0] == 'Password should contain at least one special(non-alphanumeric) character.'






