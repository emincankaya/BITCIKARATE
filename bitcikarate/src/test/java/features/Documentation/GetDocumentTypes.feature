Feature: Get Document Types

  Background:
    Given url baseURI

    Scenario: GetDocumentTypes
      * def CreateResponsee = call read('classpath:features/AccounV2/Getcustomerinfo.feature')
      And path 'api/Documentation/GetDocumentTypes'
      And header authorization = generalToken
      And header apitoken = apiToken
      When method get
      Then status 200
      # citizenshipCard
      * def citizenshipCard = get response.DocumentTypes[?(@.Name=="CitizenshipCard")]
      * match citizenshipCard[0].DocumentStatus.DocumentStatusEnumId == 1
      * match citizenshipCard[0].DocumentStatus.DocumentRejectReasonEnumId == null
      # Selfie
      * def Selfie = get response.DocumentTypes[?(@.Name=="Selfie")]
      * match Selfie[0].DocumentStatus.DocumentStatusEnumId == 1
      * match Selfie[0].DocumentStatus.DocumentRejectReasonEnumId == null
      # Residence
      * def Residence = get response.DocumentTypes[?(@.Name=="Residence")]
      * match Residence[0].DocumentStatus.DocumentStatusEnumId == 1
      * match Residence[0].DocumentStatus.DocumentRejectReasonEnumId == null
      #
      * match response.IsSuccess == true
      * match response.Message == "Successful"
      * print response

