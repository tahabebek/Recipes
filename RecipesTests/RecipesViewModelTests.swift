@testable import Recipes
import XCTest

final class RecipesViewModelTests: XCTestCase {
    private static let mockRecipes: [Recipe] = [
        .init(
            cuisine: "Italian",
            name: "Spaghetti Bolognese",
            photoUrlLarge: "https://www.example.com/spaghetti-bolognese.jpg",
            photoUrlSmall: "https://www.example.com/spaghetti-bolognese-small.jpg",
            sourceUrl: "https://www.example.com/spaghetti-bolognese",
            uuid: "12345678901234567890123456789012",
            youtubeUrl: nil
        ),
        .init(
            cuisine: "American",
            name: "Chicken and Waffles",
            photoUrlLarge: "https://www.example.com/chicken-and-waffles.jpg",
            photoUrlSmall: "https://www.example.com/chicken-and-waffles-small.jpg",
            sourceUrl: "https://www.example.com/chicken-and-waffles",
            uuid: "12345678901234567890123456789013",
            youtubeUrl: nil
        ),
        .init(
            cuisine: "American",
            name: "Baked Ziti",
            photoUrlLarge: "https://www.example.com/baked-ziti.jpg",
            photoUrlSmall: "https://www.example.com/baked-ziti-small.jpg",
            sourceUrl: "https://www.example.com/baked-ziti",
            uuid: "12345678901234567890123456789014",
            youtubeUrl: nil
        )
    ]

    func testRecipesGetSortedByCusineAndName() async throws {
        let viewModel = await RecipesViewModel(apiClient: MockApiClient(result: .success(Self.mockRecipes)))
        await viewModel.loadRecipes()
        let recipes = await viewModel.recipes
        XCTAssertEqual(recipes.count, 3)

        let firstRecipe = try XCTUnwrap(recipes[0])
        let secondRecipe = try XCTUnwrap(recipes[1])
        let thirdRecipe = try XCTUnwrap(recipes[2])

        XCTAssertEqual(firstRecipe.cuisine, "American")
        XCTAssertEqual(firstRecipe.name, "Baked Ziti")
        XCTAssertEqual(secondRecipe.cuisine, "American")
        XCTAssertEqual(secondRecipe.name, "Chicken and Waffles")
        XCTAssertEqual(thirdRecipe.cuisine, "Italian")
        XCTAssertEqual(thirdRecipe.name, "Spaghetti Bolognese")
    }

    func testShowsAlertWhenLoadRecipesFails() async throws {
        let viewModel = await RecipesViewModel(apiClient: MockApiClient(result: .failure(NetworkingError.unknown)))
        let errorBefore = await viewModel.error
        XCTAssertNil(errorBefore)
        await viewModel.loadRecipes()
        let errorAfter = await viewModel.error
        XCTAssertEqual(errorAfter, .unknown)
    }
}
