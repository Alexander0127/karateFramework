Feature: plan de pruebas

  @casoGET
  Scenario Outline: caso de prueba <nombreCaso>
    Given url 'https://reqres.in/api/users/<ID>'
    When header Content-Type = 'Application/json'
    When method GET
    Then status <estadoHTTP>
    Examples:
      | nombreCaso | ID | estadoHTTP |
      | id 3       | 3  | 200        |
      | id 6       | 6  | 200        |
      | id 30      | 30 | 404        |

  @casoPOST
  Scenario Outline: caso de prueba <nombreCaso>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": <valorName>, "job": "<valorJob>"}
    And method POST
    Then status 201
    Examples:
      | nombreCaso     | name | valorName | job | valorJob |
      | name vacío     | name |           | job | qa       |
      | name nulo      | name | null      | job | qa       |
      | name 3 letras  | name | Leo       | job | qa       |
      | sin campo name |      |           | job | qa       |
      | job vacío      | name | Alexander | job |          |
      | job nulo       | name | Alexander | job | null     |
      | job 3 letras   | name | Alexander | job | dev      |
      | sin campo job  | name | Alexander |     |          |

  Scenario: caso de prueba tipo POST
    Given url 'https://reqres.in/api/users'
    When request
      """
      {
        "name": "Alexander",
        "job": "QA"
      }
      """
    And method POST
    Then status 201

  Scenario: caso de prueba tipo DELETE
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204