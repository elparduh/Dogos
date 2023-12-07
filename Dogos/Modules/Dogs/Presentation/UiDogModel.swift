import Foundation

struct UiDogModel: Identifiable, Hashable {
    
    let id = UUID()
    let dogItem: Dog
    
    init(_ dogItem: Dog) {
        self.dogItem = dogItem
    }
    
    var name: String {
        dogItem.name
    }
    
    var description: String {
        dogItem.description
    }
    
    var image: String {
        dogItem.image
    }
    
    var age: String {
        dogItem.age.description
    }
}
