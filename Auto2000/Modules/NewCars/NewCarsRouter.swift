//
//  NewCarsRouter.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol NewCarsRouter {
    // Define methods for routing to other screens if needed
}

class NewCarsRouterImpl: NewCarsRouter {
    static func createModule() -> UIViewController {
        let view = NewCarsViewController()
        let presenter = NewCarsPresenterImpl(view: view)
        let interactor = NewCarsInteractorImpl()

        view.presenter = presenter
        presenter.interactor = interactor

        return view
    }

    // Implement NewCarsRouter methods here if needed
}
