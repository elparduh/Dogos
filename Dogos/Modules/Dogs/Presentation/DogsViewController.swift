import UIKit
import Combine

class DogsViewController: UICollectionViewController {

  private var cancellable = Set<AnyCancellable>()
  var viewModel: DogsViewModel!

  init(layout: UICollectionViewFlowLayout) {
    super.init(collectionViewLayout: layout)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    configCollectionView()
    stateController()
    viewModel.fetchDogs()
  }

  private func configUI() {
    self.title = Constants.title
    self.view.backgroundColor = .blue
  }

  private func stateController() {
    viewModel
      .state
      .receive(on: RunLoop.main)
      .sink { state in
        switch state {
        case .success:
          print("success")
          self.collectionView.reloadData()
        case .loading:
          print("loading")
        case .fail(error: let error):
          print("error",error)
        }
      }.store(in: &cancellable)
  }

  private func configCollectionView() {
    collectionView.register(DogViewCell.self, forCellWithReuseIdentifier: DogViewCell.reuseIdentifier)
  }
}

extension DogsViewController {

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: DogViewCell.reuseIdentifier,
        for: indexPath
      ) as? DogViewCell
    else { return UICollectionViewCell() }

    let uiItem = viewModel.getItemDogViewModel(indexPath: indexPath)
    cell.bind(uiItem)

    return cell
  }

  override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    viewModel.dogsItemsCount
  }
}
