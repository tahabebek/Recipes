@testable import Recipes
import XCTest

final class NetworkingClientTests: XCTestCase {

    func testGetRecipes() async throws {
        let recipes = try await getRecipes(file: "recipes", ext: "json")
        XCTAssertEqual(recipes.count, 63)

        let recipe = try XCTUnwrap(recipes.first)
        XCTAssertEqual(recipe.id, "0c6ca6e7-e32a-4053-b824-1dbf749910d8")
        XCTAssertEqual(recipe.name, "Apam Balik")
        XCTAssertEqual(recipe.cuisine, "Malaysian")
    }

    func testGetRecipesWithEmptyData() async throws {
        let recipes = try await getRecipes(file: "recipes-empty", ext: "json")
        XCTAssertEqual(recipes.count, 0)
    }

    func testGetRecipesWithMalformedData() async throws {
        do {
            _ = try await getRecipes(file: "recipes-malformed", ext: "json")
            XCTFail("Expected getRecipes() to throw an error for malformed JSON data.")
        } catch {
            XCTAssertEqual(error as? NetworkingError, .unknown)
        }
    }

    private func getRecipes(file: String, ext: String) async throws -> [Recipe] {
        let networking = try XCTUnwrap(
            NetworkingClient(
                urlSession: MockURLSession(
                    data: Data(
                        contentsOf: XCTUnwrap(
                            Bundle(
                                for: Self.self
                            )
                            .url(
                                forResource: file,
                                withExtension: ext
                            )
                        )
                    )
                )
            )
        )
        return try await (networking.get(path: "http://apple.com") as RecipesResponse).recipes
    }
}
