//
//  NewCarsPresenter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import Foundation

protocol NewCarsPresenter {
    // Define methods that the View can call to notify the Presenter about user actions
}

class NewCarsPresenterImpl: NewCarsPresenter {
    weak var view: NewCarsView?
    var interactor: NewCarsInteractor?

    init(view: NewCarsView) {
        self.view = view
    }

    // Implement NewCarsPresenter methods here if needed
}
