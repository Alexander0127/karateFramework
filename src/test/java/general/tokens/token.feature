Feature: token basic and bearer
  @bearertoken
  Scenario: bearer token
    Given url 'https://reqres.in/api/login'
    When header Authorization = 'bearer QpwL5tke4Pnpja7X4'
    And method GET
    Then status 200

  @basicAuth
  Scenario: basic authentication
    Given url 'https://postman-echo.com/basic-auth'
    When header Authorization = call read('tokenB.js') {username: 'postman', password: 'password'}
    And method GET
    Then status 200