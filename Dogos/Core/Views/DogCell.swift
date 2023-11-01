
import UIKit

class DogCell: UICollectionViewCell, ReusableView {

  private let imageView = UIImageView()
  private let containerView = UIView()

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

  func configData(viewModel: ItemDogViewModel) {
    imageView.loadImageUsingCache(withUrl: viewModel.image)
  }
}

extension DogCell: CustomViewBuildable {

  func addSubviews() {
    contentView.addSubview(containerView)
    contentView.addSubview(imageView)
  }

  func addConstraints() {
    configureContentView()
    configureImageView()
    configurecontainerView()
  }

  private func configureContentView() {
    contentView.backgroundColor = .clear
  }

  private func configureImageView() {
    imageView.disableAutoresizingMaskIntoConstraints()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.roundedStyle(cornerRadius: .point16)

    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .point16),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.point16),
      imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: .point0_45)
    ])
  }

  private func configurecontainerView() {
    containerView.disableAutoresizingMaskIntoConstraints()
    containerView.roundedStyle(cornerRadius: .point16, backgroundColor: .lightColor)

    NSLayoutConstraint.activate([
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .point0),
      containerView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -.point24),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.point16),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .point60)
    ])
  }
}
