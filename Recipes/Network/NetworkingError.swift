import Foundation

enum NetworkingError: LocalizedError, Identifiable {
    var id: String { localizedDescription }

    case invalidURL
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .unknown: return "Something went wrong"
        }
    }
}
