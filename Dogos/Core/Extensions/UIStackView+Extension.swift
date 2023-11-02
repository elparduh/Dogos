import UIKit

extension UIStackView {

  func addArrangedSubviews(_ views: [UIView]) {
      views.forEach { addArrangedSubview($0) }
  }

  func enableLayoutMarginsRelativeArrangement() {
      isLayoutMarginsRelativeArrangement = true
  }
  
  func configureLayoutMargins(top: CGFloat = .point0,
                              left: CGFloat = .point0,
                              bottom: CGFloat = .point0,
                              right: CGFloat = .point0) {
    enableLayoutMarginsRelativeArrangement()
    layoutMargins = UIEdgeInsets(top: top,
                                 left: left,
                                 bottom: bottom,
                                 right: right)
  }

  func configureLayoutMargins(constant: CGFloat = .point0) {
    configureLayoutMargins(top: constant,
                           left: constant,
                           bottom: constant,
                           right: constant)
  }
}


