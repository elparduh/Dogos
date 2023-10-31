import Foundation

enum DogsEndPoint {
    case getDogs
}

extension DogsEndPoint: Endpoint {

    var path: String { "/1151549092634943488" }
    var method: HTTPMethodType { .get }
}
