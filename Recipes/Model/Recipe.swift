struct Recipe: Decodable, Identifiable {
    let cuisine: String
    let name: String
    let photoUrlLarge: String
    let photoUrlSmall: String
    let sourceUrl: String?
    let uuid: String
    let youtubeUrl: String?
    var id: String { uuid }
}
