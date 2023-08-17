//
//  LiveChatRouter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol LiveChatRouter {
    // Define methods for routing to other screens if needed
    static func createModule() -> UIViewController
}

class LiveChatRouterImpl: LiveChatRouter {
    static func createModule() -> UIViewController {
        let view = LiveChatViewController()
        let presenter = LiveChatPresenterImpl(view: view as LiveChatView)
        let interactor = LiveChatInteractorImpl()

        view.presenter = presenter
        presenter.interactor = interactor

        return view
    }

    // Other routing methods for LiveChatRouter
    // ...
}
