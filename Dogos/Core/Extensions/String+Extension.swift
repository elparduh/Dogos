import Foundation

extension String {
  
  static let empty = ""
}

protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) }
}
