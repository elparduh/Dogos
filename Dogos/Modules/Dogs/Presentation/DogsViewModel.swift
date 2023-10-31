import Foundation
import Combine

protocol DogsViewModelProtocol {
  var state: PassthroughSubject<StateController, Never> { get }
  var dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol { get }
  var dogsItemsCount: Int { get }
  func viewDidLoad()
}

class DogsViewModel: DogsViewModelProtocol {
  private var dogItems: [Dog] = []
  var dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol
  var state: PassthroughSubject<StateController, Never>

  var dogsItemsCount: Int {
    dogItems.count
  }

  init(dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol) {
    self.dogsUseCaseProviderProtocol = dogsUseCaseProviderProtocol
    self.state = PassthroughSubject<StateController, Never>()
  }

  func viewDidLoad() {
    state.send(.loading)
    Task {
      let result = await dogsUseCaseProviderProtocol.getDogsUseCaseProvider().execute()
        updateUI(result: result)
    }
  }
  
  private func updateUI(result: Result<[Dog], Error>) {
      switch result {
      case .success(let dogs):
          dogItems = dogs
          state.send(.success)
      case .failure(let error):
          state.send(.fail(error: error.localizedDescription))
      }
  }
}

enum StateController {
    case success
    case loading
    case fail(error: String)
}
