import Foundation

protocol DogsDependencyAssembler {
  func resolve() -> DogsViewModelProtocol
  func resolve() -> DogsUseCaseProviderProtocol
  func resolve() -> DogsRepositoryProtocol
  func resolve() -> DogsDataSourceRemoteProtocol
  func resolve() -> APIClientProtocol
}

extension DogsDependencyAssembler {

  func resolve() -> DogsViewModelProtocol {
    DogsViewModel(dogsUseCaseProviderProtocol: resolve())
  }

  func resolve() -> DogsUseCaseProviderProtocol {
    DogsUseCaseProvider(dogsRepositoryProtocol: resolve())
  }

  func resolve() -> DogsRepositoryProtocol {
    DogsRepository(dogsDataSourceRemoteProtocol: resolve())
  }

  func resolve() -> DogsDataSourceRemoteProtocol {
    DogsDataSourceRemote(apiClient: resolve())
  }

  func resolve() -> APIClientProtocol {
    APIClient()
  }
}

struct DogsAssemblerInjector : DogsDependencyAssembler { }
