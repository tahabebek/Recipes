protocol Api {
    func getRecipes() async throws(NetworkingError) -> [Recipe]
}
