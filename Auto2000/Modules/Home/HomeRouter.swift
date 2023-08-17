//
//  HomeRouter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol HomeRouter {
    // Define methods for routing to other screens if needed
}

class HomeRouterImpl: HomeRouter {
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenterImpl(view: view as HomeView)
        let interactor = HomeInteractorImpl()

        view.presenter = presenter
        presenter.interactor = interactor

        return view
    }

    // Implement HomeRouter methods here if needed
}
