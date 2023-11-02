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
    dogsCollectionView.register(DogViewCell.self)
    dogsCollectionView.delegate = self
    dogsCollectionView.dataSource = self
  }

  private func configureActivityIndicatorView(_ view: UIView) {
      activityIndicatorView.pinToEdges(superView: view)
      activityIndicatorView.backgroundColor = .white
      activityIndicatorView.hidesWhenStopped = true
  }
}

extension DogsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let collectionViewWidth = dogsCollectionView.frame.size.width - .point16
        let cellViewWidth = collectionViewWidth / 1
      return CGSize(width: cellViewWidth, height: .point300)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      UIEdgeInsets(top: .point0, left: .point10, bottom: .point0, right: .point10)
    }
}
