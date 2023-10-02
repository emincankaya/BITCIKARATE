Feature: general wheeloffortune

  Background:
    Given url baseURI

    @general
  Scenario: general wheeloffortune
    And path 'api/campaignapi/wheeloffortune'
    And header authorization = generalToken
    #And param CampaignId = 98
    When method get
    * if (responseStatus == 403) karate.abort()
    Then status 200
    * print response
    * match response.d == read('classpath:model/carkifelek/general wheeloffortune.json')




