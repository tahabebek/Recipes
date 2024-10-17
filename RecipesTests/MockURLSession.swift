import Foundation
@testable import Recipes

struct MockURLSession: URLSessionInterface {
    private let data: Data

    init(data: Data = .init()) {
        self.data = data
    }

    func data(from url: URL, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        (data, .init())
    }
}
