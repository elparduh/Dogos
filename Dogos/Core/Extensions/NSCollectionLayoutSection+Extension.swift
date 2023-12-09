import Foundation
import UIKit

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
