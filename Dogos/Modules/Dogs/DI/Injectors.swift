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

  private static func makeLayout() -> UICollectionViewFlowLayout {
      let layout = UICollectionViewFlowLayout()
      let layoutWidth = (UIScreen.main.bounds.width - 20 ) / 1
      let layoutHeight = (UIScreen.main.bounds.width  - 20 ) / 1
      layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
      layout.minimumLineSpacing = 10
      layout.minimumInteritemSpacing = .zero
      layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
      return layout
  }

  static func provideDogsViewController() -> DogsViewController {
    let dogsViewController = DogsViewController()
    let dogsViewModel = provideDogsViewModel()
    dogsViewController.viewModel = dogsViewModel
    return dogsViewController
  }
}
