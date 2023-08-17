//
//  HomePresenter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import Foundation

protocol HomePresenter {
    // Define methods that the View can call to notify the Presenter about user actions
}

class HomePresenterImpl: HomePresenter {
    weak var view: HomeView?
    var interactor: HomeInteractor?

    init(view: HomeView) {
        self.view = view
    }

    // Implement HomePresenter methods here if needed
}
