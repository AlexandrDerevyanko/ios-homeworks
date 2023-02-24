//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 21.02.2023.
//

protocol ProfileViewModelProtocol: ViewModelProtocol{
    func pressed(viewInput: ProfileViewModel.ViewInput)
}

class ProfileViewModel: ProfileViewModelProtocol {
    
    enum ViewInput {
        case collectionViewPressed
    }
    
    weak var coordinator: ProfileCoordinator?
    
    func pressed(viewInput: ViewInput) {
        switch viewInput {
        case .collectionViewPressed:
            coordinator?.pushPhotosViewController()
        }
    }

}
