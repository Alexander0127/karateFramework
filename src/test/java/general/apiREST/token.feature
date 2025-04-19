@token
Feature: getToken

  @getToken
  Scenario: obtener token para consumir
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    Given url 'https://auth.wip.alignet.io/token'
    And header Content-Type = 'application/json'
    And request
      """
      {
        "action": "authorize",
        "grant_type": "password",
        "username": "commerce@email.com",
        "password": "123456",
        "audience": "https://api.dev.alignet.io",
        "client_id": "yhaPE3jtHXHMKUZBBFr9QS1x1FaXxr",
        "client_secret": "uTCetT3d4T-1NgXyTO66C0850xLJ5c7CwoyXm23NALxZ-MbwQxkqs1Q9ThwWfE",
        "scope": "create:token post:charges offline_access"
      }
      """
    When method POST
    Then status 400
    And match responseType == 'json'
    * print response
