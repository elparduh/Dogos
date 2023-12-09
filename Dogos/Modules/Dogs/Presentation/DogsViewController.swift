import UIKit
import Combine
import Toast

class DogsViewController: UIViewController {
    
    private var cancellable = Set<AnyCancellable>()
    let dogsCollectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
    let activityIndicatorView = UIActivityIndicatorView()
    private typealias DogsDataSource = UICollectionViewDiffableDataSource<DogsSection, UiDogModel>
    private typealias DogsDataSourceSnapshot = NSDiffableDataSourceSnapshot<DogsSection, UiDogModel>
    private lazy var dogsDataSource = createCategoriesDataSource()
    private lazy var dogsSnapshot = DogsDataSourceSnapshot()
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
                    //self.dogsCollectionView.reloadData()
                    let data = self.viewModel.getDogItems()
                    print(data)
                case .loading:
                    self.activityIndicatorView.start()
                case .fail(error: let error):
                    self.activityIndicatorView.stop()
                    self.view.makeToast(error, duration: 5.0, position: .bottom)
                }
            }.store(in: &cancellable)
    }
}

extension DogsViewController {
    
    private func createCategoriesDataSource() -> DogsDataSource {
        let dogsDataSource = DogsDataSource(
            collectionView: dogsCollectionView,
            cellProvider: { (collectionView, indexPath, dog) -> UICollectionViewCell? in
                self.bindDogData(collectionView: collectionView,
                                 indexPath: indexPath,
                                 dog: dog)
            })
        return dogsDataSource
    }
    
    private func bindDogData(collectionView: UICollectionView,
                             indexPath: IndexPath,
                             dog: UiDogModel) -> UICollectionViewCell {
        let cell: DogViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.bind(dog)
        return cell
    }
    
    private enum DogsSection {
        case main
    }
}
