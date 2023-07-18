Feature: Document Reject Reason Enum

  Background:
    Given url baseURI

    Scenario: DocumentRejectReasonEnum
      And path 'api/Accountv2/DocumentRejectReasonEnum'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      * def expectedResponse = read('classpath:model/AccountV2/DocumentRejectReasonEnum.json')
      * match expectedResponse == response
      #* print response
