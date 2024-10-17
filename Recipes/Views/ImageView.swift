import Kingfisher
import SwiftUI

struct ImageView: View {
    private let photoUrlLarge: URL
    private let photoUrlSmall: URL

    init(photoUrlLarge: URL, photoUrlSmall: URL) {
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
    }

    var body: some View {
        KFImage
            .url(photoUrlLarge)
            .resizable()
            .placeholder { Image(systemName: "photo.artframe") }
            .lowDataModeSource(.network(photoUrlSmall))
            .fade(duration: 0.25)
            .aspectRatio(contentMode: .fit)
    }
}
