## :scroll: Dogos / Clean Architecture and MVVM
Is an app to show a list of characters from the movie: "Isle of Dogs".
  
This project is built under SOLID principles, clean architecture, modular architecture and MVVM in the presentation layer. It uses UIKit and Combine framework for presentation. Also It uses Implementing an API client with Swift's async/await functionality.
## :loudspeaker: Description
Project specs:
- Minumun Deployment target: iOS 15.0
- 100% Swift & UIkit
- Image caching.
- iOS SDKs: Combine
- Supported: iPhone & iPad
- Orientation: Portrait
- Dependencies: [Toast](https://github.com/scalessec/Toast-Swift)
  
The layers that compose this project are: 
- Presentation Layer:
    - It uses MVVM for presentation layer.
    - Also it uses dependency injection to inject dependencies to the view and the view model.
    - The presentation layer has its own view entities different than domain entities (UIModel).
- Domain layer:
    - Business logic layer.
    - Dependency inversion to abstract domain layer from the data repositories.
    - Each use case is a reusable and independent component that executes an specific business logic.
    - Domain layer has its own domain entities different than view o data entities.(DomainlModel)
- Data layer:
    - Dependency inversion to communicate with Domain layer.
    - It uses the repository pattern. The repository pattern adds an abstraction layer over the the data sources from which the use cases get the data. With repository pattern, you can query your model objects from different data sources.
    - Business logic shouldn’t know where the data comes from.
    - Data layer has its own data entities different than domain entities.(DTO)

I've also created a module called "Network".
- Networking layer:
    - This module is only accessible from the data layer and it's works with with Swift's async/await.
## :art: UI 
 iPhone SE | iPhone 15 PRO MAX
--- | --- 
<img src="https://github.com/elparduh/Dogos/assets/12547614/a4e816e0-bfbd-4b60-a5e8-843f9774a7b8" width="260"> | <img src="https://github.com/elparduh/Dogos/assets/12547614/ce93a3b8-a655-452b-a2d6-99088fe0dfd6" width="260">
## 💙 How did you test it?
- Use Git clone command: ```git clone https://github.com/elparduh/Dogos.git```.
- Open the project on Xcode with Swift 5.
- Click the Run button in your project’s toolbar.
