Feature: Casos de prueba de método POST

  Background:
    * configure ssl = true
    Given url baseUrlReqRes
    * path '/api/users'

  Scenario: Crear usuario
    * request {"name": "Jose","job": "Student"}
    When method post
    Then status 201
    And print response
    * def responseAPI = response
    * def nombre = response.name
    * print 'el nombre obtenido es: ' + nombre
    * match response.name == 'Jose'

  Scenario Outline: crear 3 usuarios: <id> - <name> es <job>
    * request {"name": "#(name)","job": "#(job)"}
    * method post
    Then status 201
    And print response
    Examples:
      | id | name   |  | job         |
      | 1  | Jose   |  | pintor      |
      | 2  | Fritz  |  | programador |
      | 3  | manuel |  | tester      |

  Scenario Outline: crear usuarios desde un archivo Json
    Given url baseUrlReqRes
    * path '/api/users'
    * configure ssl = true
    * request {"name": "<name>","job": "<job>"}
    * method post
    Then status 201
    And print response
    Examples:
      | read('classpath:examples/data/req/usuariosDataDrivenConJson.json') |

  Scenario: crear usuario con request body desde Json
    * def bodyrequest = read('classpath:examples/data/req/usuarioNuevo.json')
    * request bodyrequest
    When method post
    Then status 201
    And print response

Scenario: crear un usuario desde una funcion de la clase Util
  * def utilGeneraNombres = Java.type('examples.util.Util')
  * def nombreRandom = utilGeneraNombres.obtenerNombreRandom()
  * print "el nombre random es: "+nombreRandom
  * request {"name": "#(nombreRandom)","job": "SWAT"}
  When method post
  Then status 201
  And print response