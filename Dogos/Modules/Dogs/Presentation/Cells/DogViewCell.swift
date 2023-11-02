
import UIKit

class DogViewCell: UICollectionViewCell, ReusableView {

  private let imageView = UIImageView()
  private let containerView = UIView()
  private let mainStackView = UIStackView()
  private let nameLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let ageLabel = UILabel()

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

  func bind(_ uiDogModel: UiDogModel) {
    imageView.loadImage(withUrl: uiDogModel.image)
    nameLabel.text = uiDogModel.name
    descriptionLabel.text = uiDogModel.description
    ageLabel.text = "Almost \(uiDogModel.age) years"
  }
}

extension DogViewCell: CustomViewBuildable {

  func addSubviews() {
    contentView.addSubview(containerView)
    contentView.addSubview(imageView)
    containerView.addSubview(mainStackView)
    mainStackView.addArrangedSubviews([nameLabel,
                                       descriptionLabel,
                                       ageLabel])
  }

  func addConstraints() {
    configureImageView()
    configureContainerView()
    configureMainStackView()
    configureNameLabel()
    configureDescriptionLabel()
    configureAgeLabel()
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

  private func configureContainerView() {
    containerView.disableAutoresizingMaskIntoConstraints()
    containerView.roundedStyle(cornerRadius: .point16, backgroundColor: .white)

    NSLayoutConstraint.activate([
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .point0),
      containerView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -.point24),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.point16),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .point60)
    ])
  }

  private func configureMainStackView() {
    mainStackView.disableAutoresizingMaskIntoConstraints()
    mainStackView.axis = .vertical
    mainStackView.spacing = .point8
    mainStackView.alignment = .leading
    mainStackView.configureLayoutMargins(left: .point32, right: .point8)
    mainStackView.backgroundColor = .white
    mainStackView.layer.cornerRadius = .point8

    NSLayoutConstraint.activate([
      mainStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
    ])
  }

  private func configureNameLabel() {
    nameLabel.textColor = .darkColor
    nameLabel.font = UIFont.boldSystemFont(ofSize: .point18)
  }

  private func configureDescriptionLabel() {
    descriptionLabel.textColor = .grayColor
    descriptionLabel.numberOfLines = .zero
    descriptionLabel.textAlignment = .justified
    descriptionLabel.font = UIFont.systemFont(ofSize: .point16)
  }

  private func configureAgeLabel() {
    ageLabel.font = UIFont.boldSystemFont(ofSize: .point12)
  }
}
