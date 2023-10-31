import Foundation

enum NetworkInjector {

  static func provideAPIClient() -> APIClientProtocol{
    APIClient()
  }
}
