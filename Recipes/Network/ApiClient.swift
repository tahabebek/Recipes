struct ApiClient: Api {
    private static let recipesURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    private let networking: Networking

    init(networking: Networking = NetworkingClient()) {
        self.networking = networking
    }

    func getRecipes() async throws(NetworkingError) -> [Recipe] {
        try await (networking.get(path: Self.recipesURL) as RecipesResponse).recipes
    }
}
