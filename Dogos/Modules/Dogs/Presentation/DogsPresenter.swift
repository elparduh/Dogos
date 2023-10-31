import Foundation

protocol DogsPresenterProtocol {
  var dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol { get }
  var dogsUIProtocol: DogsUIProtocol { get }
  func fechtDogs() async
}

struct DogsPresenter: DogsPresenterProtocol {
  var dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol
  var dogsUIProtocol: DogsUIProtocol
  
  init(dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol,
       dogsUIProtocol: DogsUIProtocol) {
    self.dogsUseCaseProviderProtocol = dogsUseCaseProviderProtocol
    self.dogsUIProtocol = dogsUIProtocol
  }

  func fechtDogs() async {
    dogsUIProtocol.showLoader()
    let result = await dogsUseCaseProviderProtocol.getDogsUseCaseProvider().execute()
    switch result {
    case .success(let dogs):
      dogsUIProtocol.hideLoader()
      dogsUIProtocol.diplayUserData(dogs)
    case .failure(let error):
      dogsUIProtocol.hideLoader()
      dogsUIProtocol.showError(error.localizedDescription)
    }
  }
}

protocol DogsUIProtocol {
    func showError(_ error: String)
    func showLoader()
    func hideLoader()
    func diplayUserData(_ dogs: [Dog])
}
