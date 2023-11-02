import Foundation
import UIKit

extension UIActivityIndicatorView {

    func start() {
        self.show()
        self.startAnimating()
    }

    func stop() {
        self.hide()
        self.stopAnimating()
    }
}
