import Foundation

extension Array where Element == DogDTO {

  func asToDomain() -> [Dog] {
    self.compactMap { dogDTO in
      Dog(name: dogDTO.dogName ?? .empty,
          description: dogDTO.description ?? .empty,
          age: dogDTO.age ?? .zero,
          image: dogDTO.image ?? .empty)
    }
  }
}
