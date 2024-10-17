import Foundation
@testable import Recipes

struct MockApiClient: Api {
    private let result: Result<[Recipe], NetworkingError>

    init(result: Result<[Recipe], NetworkingError> = .success([])) {
        self.result = result
    }

    func getRecipes() async throws(NetworkingError) -> [Recipe] {
        switch result {
        case .success(let recipes): return recipes
        case .failure(let error): throw error
        }
    }
}
