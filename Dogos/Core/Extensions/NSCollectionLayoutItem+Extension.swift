import Foundation
import UIKit

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
