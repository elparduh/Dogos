import Foundation

extension DogsResponse {

    func asToDomain() -> [Dog] {
      dogs.compactMap { dogDTO in
        Dog(name: dogDTO.dogName ?? .empty,
            description: dogDTO.description ?? .empty,
            age: dogDTO.age ?? .zero,
            image: dogDTO.image ?? .empty)
      }
    }
}
