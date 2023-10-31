import Foundation

protocol DogsUseCaseProviderProtocol {
  var dogsRepositoryProtocol: DogsRepositoryProtocol { get }
  func getDogsUseCaseProvider() -> GetDogsUseCase
}

struct DogsUseCaseProvider: DogsUseCaseProviderProtocol {
  var dogsRepositoryProtocol: DogsRepositoryProtocol
  
  init(dogsRepositoryProtocol: DogsRepositoryProtocol) {
    self.dogsRepositoryProtocol = dogsRepositoryProtocol
  }

  func getDogsUseCaseProvider() -> GetDogsUseCase {
    GetDogsUseCase(dogsRepositoryProtocol: dogsRepositoryProtocol)
  }
}
