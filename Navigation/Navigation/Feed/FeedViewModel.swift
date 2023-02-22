//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 17.02.2023.
//

protocol FeedViewModelProtocol: ViewModelProtocol{
    func buttonPressed(viewInput: FeedViewModel.ViewInput)
}

class FeedViewModel: FeedViewModelProtocol {
    
    enum ViewInput {
        case profileButtonPressed
        case photosButtonPressed
        case infoButtonPressed
    }
    
    weak var coordinator: FeedCoordinator?
    var secretWord = "alpha"
    
    func buttonPressed(viewInput: ViewInput) {
        switch viewInput {
        case .profileButtonPressed:
            coordinator?.pushProfileViewController()
        case .photosButtonPressed:
            coordinator?.pushPostViewController()
        case .infoButtonPressed:
            coordinator?.pushInfoViewController()
        }
    }

    func check(word: String) -> String? {
        return word == secretWord ? word : nil
    }
    
}
