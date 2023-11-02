import Foundation

protocol DogsRepositoryProtocol {
  var dogsDataSourceRemoteProtocol: DogsDataSourceRemoteProtocol { get }
  func getDogs() async throws -> [Dog]
}

struct DogsRepository: DogsRepositoryProtocol {

  var dogsDataSourceRemoteProtocol: DogsDataSourceRemoteProtocol

  init(dogsDataSourceRemoteProtocol: DogsDataSourceRemoteProtocol) {
    self.dogsDataSourceRemoteProtocol = dogsDataSourceRemoteProtocol
  }

  func getDogs() async throws -> [Dog] {
    try await dogsDataSourceRemoteProtocol.getDogs()
  }
}
