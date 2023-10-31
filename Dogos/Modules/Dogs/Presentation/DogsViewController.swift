import UIKit
import Combine

class DogsViewController: UIViewController {
  private var cancellable = Set<AnyCancellable>()
  var viewModel: DogsViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    stateController()
    viewModel.fetchDogs()
  }

  private func configUI() {
      view.backgroundColor = .systemBackground
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

