import Foundation

protocol DogsUseCaseProtocol {
  var dogsRepositoryProtocol: DogsRepositoryProtocol { get }
  func execute() async -> Result<[Dog], Error>
}

struct GetDogsUseCase: DogsUseCaseProtocol {
  var dogsRepositoryProtocol: DogsRepositoryProtocol
  
  init(dogsRepositoryProtocol: DogsRepositoryProtocol) {
    self.dogsRepositoryProtocol = dogsRepositoryProtocol
  }

  func execute() async -> Result<[Dog], Error> {
    do {
      let repositoryResult = try await dogsRepositoryProtocol.getDogs()
        return .success(repositoryResult)
    } catch {
        return .failure(error)
    }
  }
}
