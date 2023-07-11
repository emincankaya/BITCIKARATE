Feature: Get Customer Transaction Log History

  Background:
    Given url baseURI
    And path 'api/Accountv2/GetCustomerTransactionLogHistory'
    And header authorization = generalToken
    And header apitoken = apiToken
    And param languageCode = 'tr'
    And param pageNumber = 1
    And param pageCount = 50


    Scenario: Gecmis dogrulama(password)
      * def password = callonce read('classpath:features/AccounV2/ChangePassword.feature')
      When method get
      Then status 200
      * def mesaj = response[0].TransactionType
     * match mesaj == "Şifre değiştirme işlemi onaylanmadı."

    Scenario: gecmis dogrulma(login)
      * def login  = callonce read('classpath:features/AccounV2/Login.feature')
      When method get
      Then status 200
      * def mesaj = response[0].TransactionType
      * match mesaj == "Kullanıcı adı ve şifre giriş doğrulaması başarıyla gerçekleştirildi."