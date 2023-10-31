import Foundation

protocol DogsDataSourceRemoteProtocol {
  var apiClient: APIClientProtocol { get }
  func getDogs() async throws -> [Dog]
}

struct DogsDataSourceRemote: DogsDataSourceRemoteProtocol {
  var apiClient: APIClientProtocol

  init(apiClient: APIClientProtocol) {
    self.apiClient = apiClient
  }

  func getDogs() async throws -> [Dog] {
    try await apiClient.request(endpoint: DogsEndPoint.getDogs, type: DogsResponse.self).asToDomain()
  }
}
