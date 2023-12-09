import Foundation
import UIKit

extension DogsViewController: ViewBuildable {

  func addSubviews(toMainView view: UIView) {
    view.addSubview(dogsCollectionView)
    view.addSubview(activityIndicatorView)
  }
  
  func addConstraints(toMainView view: UIView) {
    let layoutGuide = view.safeAreaLayoutGuide
    configureDogsCollectionView(layoutGuide)
    configureActivityIndicatorView(view)
  }
  
    private func configureDogsCollectionView(_ layoutGuide: UILayoutGuide) {
        dogsCollectionView.pinToEdges(layoutGuide: layoutGuide)
        dogsCollectionView.backgroundColor = .lightColor
        dogsCollectionView.collectionViewLayout = createDogsLayout()
        dogsCollectionView.register(DogViewCell.self)
    }

  private func configureActivityIndicatorView(_ view: UIView) {
      activityIndicatorView.pinToEdges(superView: view)
      activityIndicatorView.backgroundColor = .white
      activityIndicatorView.hidesWhenStopped = true
  }
}

private func createDogsLayout() -> UICollectionViewCompositionalLayout {
    let item: NSCollectionLayoutItem = .configureCollectionLayoutItem(width: .fractionalWidth(.point1 / 1),
                                                                height: .fractionalHeight(.point1))
    item.configureContentInsets(leading: .point8, trailing: .point8)
    
    let section: NSCollectionLayoutSection = .sectionWithHorizontalGroup(width: .fractionalWidth(.point1),
                                                                         height: .absolute(.point300),
                                                                         item: item)
    section.interGroupSpacing = .point8
    section.configureContentInsets(leading: .point12, trailing: .point12)
    return UICollectionViewCompositionalLayout(section: section)
}
