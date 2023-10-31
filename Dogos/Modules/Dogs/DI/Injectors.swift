import Foundation
import UIKit

enum NetworkInjector {

  static func provideAPIClient() -> APIClientProtocol{
    APIClient()
  }
}

enum DogsInjector {

  private static func provideDogsDataSourceRemote() -> DogsDataSourceRemote {
    DogsDataSourceRemote(apiClient: NetworkInjector.provideAPIClient())
  }
  
  private static func provideDogsRepository() -> DogsRepository {
    DogsRepository(dogsDataSourceRemoteProtocol: provideDogsDataSourceRemote())
  }

  private static func provideDogsUseCaseProvider() -> DogsUseCaseProvider {
    DogsUseCaseProvider(dogsRepositoryProtocol: provideDogsRepository())
  }
  
  private static func provideDogsViewModel() -> DogsViewModel {
    DogsViewModel(dogsUseCaseProviderProtocol: provideDogsUseCaseProvider())
  }

  static func provideDogsViewController() -> DogsViewController {
    let dogsViewController = DogsViewController()
    let dogsViewModel = provideDogsViewModel()
    dogsViewController.viewModel = dogsViewModel
    return dogsViewController
  }
}
