import SwiftUI

struct RecipeView: View {
    private static let recipeImageSize: CGFloat = 60
    private let recipe: Recipe

    init(_ recipe: Recipe) {
        self.recipe = recipe
    }

    var body: some View {
        VStack {
            if let photoUrlLarge = URL(string: recipe.photoUrlLarge),
                let photoUrlSmall = URL(string: recipe.photoUrlSmall) {
                ImageView(
                    photoUrlLarge: photoUrlLarge,
                    photoUrlSmall: photoUrlSmall
                )
                .frame(maxWidth: .infinity)
            }
            Text(recipe.name)
        }
    }
}
