import Foundation

enum APIError: Error {
    case clientError
    case serverError
    case unknownError
    case decodingError
}

extension APIError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .clientError:
          return NSLocalizedString(Constants.clientErrorMsg, comment: .empty)
        case .serverError:
          return NSLocalizedString(Constants.serverErrorMsg, comment: .empty)
        case .unknownError:
          return NSLocalizedString(Constants.unknownErrorMsg, comment: .empty)
        case .decodingError:
          return NSLocalizedString(Constants.decodingErrorMsg, comment: .empty)
        }
    }
}
