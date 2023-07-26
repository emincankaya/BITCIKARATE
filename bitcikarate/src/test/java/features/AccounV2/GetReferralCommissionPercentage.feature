Feature: Get Referral Commission Percentage

  Background:
    Given url baseURI

    Scenario: GetReferralCommissionPercentage
      And path 'api/Accountv2/GetRefferralCommissionPercantage'
      And header authorization = generalToken
      And header apitoken = apiToken
      Then method get
      And status 200
      And match response == '90.00000000000000'
      * print response
