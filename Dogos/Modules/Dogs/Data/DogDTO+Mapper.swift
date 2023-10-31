import Foundation

extension DogsResponse {

    func asToDomain() -> [DogModel] {
      dogs.compactMap { dogDTO in
        DogModel(name: dogDTO.dogName ?? .empty,
                 description: dogDTO.description ?? .empty,
                 age: dogDTO.age ?? .zero,
                 image: dogDTO.image ?? .empty)
      }
    }
}
