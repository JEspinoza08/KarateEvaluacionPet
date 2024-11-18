Feature: Casos de prueba de método GET

  Background:
    * configure ssl = true
    Given url baseUrlReqRes
    * path '/api/users'

  Scenario: Listar usuarios por pagina 1

    * param page = 1
    When method get
    Then status 200
    And print response
    * match response.data[0].first_name == 'George'

  Scenario: Listar usuarios por pagina 2

    * param page = 2
    When method get
    Then status 200
    And print response
    * match response.data[0].first_name == 'George'