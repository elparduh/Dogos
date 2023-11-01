
import UIKit

class DogCell: UICollectionViewCell, ReusableView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    addSubviews()
    addConstraints()
  }
}

extension DogCell: CustomViewBuildable {

  func addSubviews() {

  }

  func addConstraints() {

  }
}
