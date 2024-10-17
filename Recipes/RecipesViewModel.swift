import Observation

@Observable
@MainActor
class RecipesViewModel {
    var recipes = [Recipe]()
    var isLoading = false
    var initialLoading: Bool = true
    var error: NetworkingError?
    private let apiClient: Api

    init(apiClient: Api = ApiClient()) {
        self.apiClient = apiClient
    }

    func loadRecipes() async {
        guard !isLoading else { return }
        isLoading = true
        defer {
            initialLoading = false
            isLoading = false
        }
        do {
            let fetchedRecipes = try await apiClient.getRecipes()
                .sorted { $0.cuisine.caseInsensitiveCompare($1.cuisine) == .orderedAscending }
                .sorted {
                    if $0.cuisine == $1.cuisine {
                        return $0.name.caseInsensitiveCompare($1.name) == .orderedAscending
                    }
                    return false
                }
            recipes = fetchedRecipes
        } catch let networkingError {
            error = networkingError
        }
    }
}
