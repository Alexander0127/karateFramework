@csv&json
  Feature: test csv y test json
    Scenario Outline: caso de prueba <nombreCaso>
      Given url 'https://reqres.in/api/users'
      When request {"<name>": <valorName>, "job": "<valorJob>"}
      And method POST
      Then status 201
      Examples:
        |read('test.csv')|


  @casoPOSTbody
  Scenario Outline: caso de prueba read json <nombreCaso>
    Given url 'https://reqres.in/api/users'
    When def body = read('body.json')
    And request body
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