Feature: PaymentChannelList

  Background:
    Given url baseURI

    Scenario: PaymentChannelList
      And path 'api/Money/PaymentChannelList'
      And header apitoken = apiToken
      And header authorization = generalToken
      And param currencyId = 1
      When method get
      Then status 200
      #ziraat
      * def ziraat = get response.[?(@.BankName=="Ziraat Bankası")]
      * match ziraat[0].IbanNo == "TR360001002146976030965003"
      * match ziraat[0].AccountNo == "97603096-5003"
      * match ziraat[0].BranchName == "Bodrum Ticari"
      #vakifbank
      * def vakifBank = get response.[?(@.BankName=="Vakıfbank")]
      * match vakifBank[0].IbanNo == "TR760001500158007318276482"
      * match vakifBank[0].AccountNo == "00158007318276482"
      #ortakMatch
      * match response.[*]AccountName contains any ["BİTCİ BORSA TEKNOLOJİ AŞ"]
      * match response.[*]MinDepositAmount contains any [1.0]
      * match response.[*]CurrencyCode contains any ["TRY"]
      * match response.[*]CurrencyId contains any [1]
      #* print response

