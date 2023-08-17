//
//  ServicePresenter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import Foundation

protocol ServicePresenter {
    // Define methods that the View can call to notify the Presenter about user actions
}

class ServicePresenterImpl: ServicePresenter {
    weak var view: ServiceView?
    var interactor: ServiceInteractor?

    init(view: ServiceView) {
        self.view = view
    }

    // Implement ServicePresenter methods here if needed
}
