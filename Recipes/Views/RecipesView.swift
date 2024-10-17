import OrderedCollections
import SwiftUI

struct RecipesView: View {
    @Environment(RecipesViewModel.self) private var viewModel

    var body: some View {
        List {
            ForEach(OrderedSet(viewModel.recipes.map(\.cuisine)), id: \.self) {
                sectionViewForCousing($0)
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            await viewModel.loadRecipes()
        }
    }

    @ViewBuilder private func sectionViewForCousing(_ cuisine: String) -> some View {
        Section {
            ForEach(viewModel.recipes.filter { $0.cuisine == cuisine }) {
                RecipeView($0)
            }
        } header: {
            Text(cuisine)
                .font(.headline)
        }
    }
}
