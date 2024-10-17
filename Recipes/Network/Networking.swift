import Foundation

protocol Networking {
    func get<T>(path: String) async throws(NetworkingError) -> T where T: Decodable
}
