import UIKit

class DogsViewController: UIViewController {
  private let assemblerInjector = DogsAssemblerInjector()
  private var presenter: DogsPresenterProtocol!

  override func viewDidLoad() {
    super.viewDidLoad()
    initializePresenter()
  }

  private func initializePresenter() {
    presenter = assemblerInjector.resolve(dogsUIProtocol: self)
  }

  private func fetchDogs() async {
    await presenter.fechtDogs()
  }
}

extension DogsViewController: DogsUIProtocol {

  func showError(_ error: String) { }

  func showLoader() { }

  func hideLoader() { }

  func diplayUserData(_ dogs: [Dog]) { }
}
