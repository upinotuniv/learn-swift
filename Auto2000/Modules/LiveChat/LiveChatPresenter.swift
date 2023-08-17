//
//  LiveChatPresenter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import Foundation

protocol LiveChatPresenter {
    // Define methods that the View can call to notify the Presenter about user actions
    func loginButtonTapped(email: String?, password: String?)
    func checkUserData()
}

class LiveChatPresenterImpl: LiveChatPresenter {
    weak var view: LiveChatView?
    var interactor: LiveChatInteractor?

    init(view: LiveChatView) {
        self.view = view
    }

    func loginButtonTapped(email: String?, password: String?) {
        // Add any necessary business logic here
        interactor?.saveUserData(email: email, password: password)
        view?.showDataSavedPopup()
    }

    func checkUserData() {
        interactor?.checkUserData()
    }

    // Other methods for LiveChatPresenter
    // ...
}
