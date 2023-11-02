import UIKit

extension UIView {

  func roundedStyle(cornerRadius: CGFloat = .point12,
                    borderWidth: CGFloat = .point0,
                    borderColor: UIColor = .white,
                    backgroundColor: UIColor = .white) {
      self.layer.cornerRadius = cornerRadius
      self.clipsToBounds = true
      self.layer.borderWidth = borderWidth
      self.layer.borderColor = borderColor.cgColor
      self.layer.backgroundColor = backgroundColor.cgColor
  }

  func show() {
      self.isHidden = false
  }

  func hide() {
      self.isHidden = true
  }
  
  func pinToEdges(superView: UIView) {
      self.disableAutoresizingMaskIntoConstraints()
      NSLayoutConstraint.activate([
          topAnchor.constraint(equalTo: superView.topAnchor),
          leadingAnchor.constraint(equalTo: superView.leadingAnchor),
          trailingAnchor.constraint(equalTo: superView.trailingAnchor),
          bottomAnchor.constraint(equalTo: superView.bottomAnchor)
      ])
  }

  func pinToEdges(layoutGuide: UILayoutGuide,
                  top: CGFloat = .point0,
                  bottom: CGFloat = .point0,
                  leading: CGFloat = .point0,
                  trailing: CGFloat = .point0) {
      disableAutoresizingMaskIntoConstraints()

      NSLayoutConstraint.activate([
          topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: top),
          leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: leading),
          trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -trailing),
          bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -bottom)
      ])
  }

  func pinToEdges(superView: UIView,
                  topConstant: CGFloat = .point0,
                  leadingConstant: CGFloat = .point0,
                  trailingConstant: CGFloat = .point0,
                  bottomConstant: CGFloat = .point0) {
      disableAutoresizingMaskIntoConstraints()

      NSLayoutConstraint.activate([
          topAnchor.constraint(equalTo: superView.topAnchor, constant: topConstant),
          leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingConstant),
          trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -trailingConstant),
          bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -bottomConstant)
      ])
  }

  func pinToEdges(superView: UIView, constant: CGFloat) {
      pinToEdges(superView: superView,
                 topConstant: constant,
                 leadingConstant: constant,
                 trailingConstant: constant,
                 bottomConstant: constant)
  }

  func disableAutoresizingMaskIntoConstraints() { 
    translatesAutoresizingMaskIntoConstraints = false
  }
}
