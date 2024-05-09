Feature: GetInitialOfferingPaymentTransactions

  Background:
    Given url baseURI

    Scenario: Get Initial Offering Payment Transactions
      And path 'api/Coin/GetInitialOfferingPaymentTransactions'
      And param pageNumber = 1
      And param assetCode = 'GOM'
      And header apitoken = apiToken
      And header authorization = generalToken
      When method get
      Then status 200
      * assert response.PagerDto.Size > 0

