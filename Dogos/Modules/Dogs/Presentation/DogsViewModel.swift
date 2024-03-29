import Foundation
import Combine

protocol DogsViewModelProtocol {
    var state: PassthroughSubject<StateController, Never> { get }
    var dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol { get }
    func fetchDogs()
    func getDogItems() -> [UiDogModel]
}

class DogsViewModel: DogsViewModelProtocol {
    
    private var dogItems: [Dog] = []
    var dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol
    var state: PassthroughSubject<StateController, Never>
    
    init(dogsUseCaseProviderProtocol: DogsUseCaseProviderProtocol) {
        self.dogsUseCaseProviderProtocol = dogsUseCaseProviderProtocol
        self.state = PassthroughSubject<StateController, Never>()
    }
    
    func fetchDogs() {
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
    
    func getDogItems() -> [UiDogModel] {
        dogItems.compactMap { dog in
            UiDogModel(dog)
        }
    }
}

enum StateController {
    case success
    case loading
    case fail(error: String)
}
