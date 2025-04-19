@graphQLTest
Feature: plan de pruebas asociado a query graphQL
  Scenario Outline: caso de prueba <nombreCaso>
    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
      """
      query {
        character (id:<numID>)
        {
          name,
          status,
          species,
          gender
        }
      }
      """
    And request {query: '#(query)'}
    And method POST
    #And match response.data.character.name == 'Beth Smith'
    Then status 200
    Examples:
      | nombreCaso      | numID |
      | personaje id 4  | 4     |
      | personaje id 16 | 16    |
      | personaje id 50 | 50    |
      | personaje id 27 | 27    |

  @graphQLTestFile
  Scenario Outline: caso de prueba body call <nombreCaso>
    Given url 'https://rickandmortyapi.com/graphql'
    When def query = read('testGraphQL.txt')
    And replace query.numID = <numID>
    And request {query : '#(query)'}
    And method POST
    Then status 200
    Examples:
    | nombreCaso      | numID |
    | personaje id 8  | 8     |
    | personaje id 17 | 17    |
    | personaje id 23 | 23    |
    | personaje id 34 | 34    |