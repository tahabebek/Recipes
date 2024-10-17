import SwiftUI

struct RecipesNotAvailableView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Recipes Found", systemImage: "error")
        }
    }
}
