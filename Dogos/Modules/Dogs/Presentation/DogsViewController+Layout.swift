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
    let item: NSCollectionLayoutItem = .configureCollectionLayoutItem(width: .fractionalWidth(.point1 / 2),
                                                                height: .fractionalHeight(.point1))
    item.configureContentInsets(leading: .point8, trailing: .point8)
    
    let section: NSCollectionLayoutSection = .sectionWithHorizontalGroup(width: .fractionalWidth(.point1),
                                                                         height: .absolute(.point300),
                                                                         item: item)
    section.interGroupSpacing = .point8
    section.configureContentInsets(leading: .point12, trailing: .point12)
    return UICollectionViewCompositionalLayout(section: section)
}

extension NSCollectionLayoutItem {
    
    static func configureCollectionLayoutItem(width: NSCollectionLayoutDimension,
                                              height: NSCollectionLayoutDimension) -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: width,
                                              heightDimension: height)
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    func configureContentInsets(top: CGFloat = .point0,
                                leading: CGFloat = .point0,
                                bottom: CGFloat = .point0,
                                trailing: CGFloat = .point0) {
        contentInsets = NSDirectionalEdgeInsets(top: top,
                                                leading: leading,
                                                bottom: bottom,
                                                trailing: trailing)
    }
}

extension NSCollectionLayoutSection {
    
    static func sectionWithHorizontalGroup(width: NSCollectionLayoutDimension,
                                           height: NSCollectionLayoutDimension,
                                           item: NSCollectionLayoutItem) -> NSCollectionLayoutSection {
        let groupSize = NSCollectionLayoutSize(widthDimension: width,
                                               heightDimension: height)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    static func sectionWithVerticalGroup(width: NSCollectionLayoutDimension,
                                         height: NSCollectionLayoutDimension,
                                         item: NSCollectionLayoutItem) -> NSCollectionLayoutSection {
        let groupSize = NSCollectionLayoutSize(widthDimension: width,
                                               heightDimension: height)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    func configureContentInsets(top: CGFloat = .point0,
                                leading: CGFloat = .point0,
                                bottom: CGFloat = .point0,
                                trailing: CGFloat = .point0) {
        contentInsets = NSDirectionalEdgeInsets(top: top,
                                                leading: leading,
                                                bottom: bottom,
                                                trailing: trailing)
    }
    
    func configureContentInsets(constant: CGFloat) {
        contentInsets = NSDirectionalEdgeInsets(top: constant,
                                                leading: constant,
                                                bottom: constant,
                                                trailing: constant)
    }
}
