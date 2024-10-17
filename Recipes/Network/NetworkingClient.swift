import Foundation

struct NetworkingClient: Networking {
    private let urlSession: URLSessionInterface

    init(urlSession: URLSessionInterface = URLSession.shared) {
        self.urlSession = urlSession
    }

    func get<T>(path: String) async throws(NetworkingError) -> T where T: Decodable {
        guard let url = URL(string: path) else { throw NetworkingError.invalidURL }
        do {
            let (data, _) = try await urlSession.data(from: url, delegate: nil)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkingError.unknown
        }
    }
}
