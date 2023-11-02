import UIKit
import Combine
import Toast

class DogsViewController: UIViewController {

  let dogsCollectionView = UICollectionView(frame: .zero,
                                            collectionViewLayout: UICollectionViewFlowLayout())
  let activityIndicatorView = UIActivityIndicatorView()
  private var cancellable = Set<AnyCancellable>()
  var viewModel: DogsViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    stateController()
    viewModel.fetchDogs()
  }

  private func configUI() {
    title = Constants.title
    view.backgroundColor = .lightColor
    addSubviews(toMainView: view)
    addConstraints(toMainView: view)
  }

  private func stateController() {
    viewModel
      .state
      .receive(on: RunLoop.main)
      .sink { state in
        switch state {
        case .success:
          self.activityIndicatorView.stop()
          self.dogsCollectionView.reloadData()
        case .loading:
          self.activityIndicatorView.start()
        case .fail(error: let error):
          self.activityIndicatorView.stop()
          self.view.makeToast(error, duration: 5.0, position: .bottom)
        }
      }.store(in: &cancellable)
  }
}

extension DogsViewController: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    viewModel.dogsItemsCount
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: DogViewCell = collectionView.dequeueReusableCell(for: indexPath)
    let dog = viewModel.getItemDogViewModel(indexPath: indexPath)
    cell.bind(dog)
    return cell
  }
}
