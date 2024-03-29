import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

  func loadImage(withUrl urlString : String) {
    let url = URL(string: urlString)
    if url == nil {return}
    self.image = nil

    if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
      self.image = cachedImage
      return
    }

    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
    addSubview(activityIndicator)
    activityIndicator.startAnimating()
    activityIndicator.center = self.center

    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
      if error != nil {
        print(error!)
        return
      }

      DispatchQueue.main.async {
        if let image = UIImage(data: data!) {
          imageCache.setObject(image, forKey: urlString as NSString)
          self.image = image
          activityIndicator.removeFromSuperview()
        }
      }
    }).resume()
  }
}
