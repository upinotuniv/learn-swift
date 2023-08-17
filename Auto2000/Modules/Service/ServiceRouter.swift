//
//  ServiceRouter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol ServiceRouter {
    // Define methods for routing to other screens if needed
}

class ServiceRouterImpl: ServiceRouter {
    static func createModule() -> UIViewController {
        let view = ServiceViewController()
        let presenter = ServicePresenterImpl(view: view)
        let interactor = ServiceInteractorImpl()

        view.presenter = presenter
        presenter.interactor = interactor

        return view
    }

    // Implement ServiceRouter methods here if needed
}
