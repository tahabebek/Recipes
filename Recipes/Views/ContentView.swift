import SwiftUI

struct ContentView: View {
    @State private var viewModel: RecipesViewModel

    init(viewModel: RecipesViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.initialLoading {
                    LoadingView()
                } else if viewModel.recipes.isEmpty {
                    RecipesNotAvailableView()
                } else {
                    RecipesView()
                        .environment(viewModel)
                }
            }
            .task {
                await viewModel.loadRecipes()
            }
            .alert(item: $viewModel.error) { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription))
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    ContentView(viewModel: RecipesViewModel())
}
