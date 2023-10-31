import UIKit
import Combine

class DogsViewController: UIViewController {
  
  private let assemblerInjector = DogsAssemblerInjector()
  private var viewModel: DogsViewModel!
  private var cancellable = Set<AnyCancellable>()

  override func viewDidLoad() {
    super.viewDidLoad()
    stateController()
    viewModel.viewDidLoad()
  }

  private func stateController() {
    viewModel
      .state
      .receive(on: RunLoop.main)
      .sink { state in
        switch state {
        case .success:
          print("success")
        case .loading:
          print("loading")
        case .fail(error: let error):
          print("error",error)
        }
      }.store(in: &cancellable)
  }

}

