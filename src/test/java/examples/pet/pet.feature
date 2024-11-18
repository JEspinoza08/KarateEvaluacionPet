Feature: Casos de pruebas PET

  Background:
    * configure ssl = true

    Given url baseURLReqRes
  Scenario: Validar estado available
    * path '/pet/findByStatus'
    * params {"status": "available"}
    When method GET
    Then status 200
    And print response
    * match response[0].status == 'available'

  Scenario: Validar estado pending
    * path '/pet/findByStatus'
    * params {"status": "pending"}
    When method GET
    Then status 200
    And print response
    * match response[0].status == 'pending'

  Scenario: Validar estado sold
    * path '/pet/findByStatus'
    * params {"status": "sold"}
    When method GET
    Then status 200
    And print response
    * match response[0].status == 'sold'

  Scenario: Validar el nombre y el estado
    * def bodyRequest = read('classpath:examples/data/req/actPet.json')
    * path '/pet'
    * request bodyRequest
    When method PUT
    Then status 200
    And print response
    * match response.category.name == 'nombre'
    * match response.status == 'available'

  Scenario: Validar codigo, mensaje y validar schema
    * def bodyRequest = read('classpath:examples/data/req/addPet.json')
    * path '/pet'
    * request bodyRequest
    When method POST
    Then status 200
    And print response
    * match responseStatus == 200
    * def result = responseStatus == 200 ? "OK" : "ERROR"
    * match response.category.name == "#string"
    * match response.id == "#number"
    * print result



  Scenario: Validar codigo de error y mnsaje
    * def bodyRequest = read('classpath:examples/data/req/addErrorPet.json')
    * path '/pet'
    * request bodyRequest
    When method POST
    Then status 500
    And print response
    * match responseStatus == 500
    * def result = responseStatus == 500 ? "SERVER ERROR" : "ERROR"
    * print result

  Scenario: Creación y  eliminación de PET creado
    * def bodyRequest = read('classpath:examples/data/req/addPet.json')
    * path '/pet'
    * request bodyRequest
    When method POST
    Then status 200
    And print response
    * match responseStatus == 200
    * def result = responseStatus == 200 ? "OK" : "ERROR"
    * match response.category.name == "#string"
    * match response.id == "#number"
    * def idResult = response.id
    * print result
    * print idResult


    * def bodyRequest = read('classpath:examples/data/req/addPet.json')
    * print idResult
    * path '/pet/', idResult
    * request bodyRequest
    When method DELETE
    Then status 200
    And print response
    * print result

