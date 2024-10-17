import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
            Text("Loading recipes...")
            Spacer()
        }
    }
}
