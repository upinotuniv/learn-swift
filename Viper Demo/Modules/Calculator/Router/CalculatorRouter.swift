//
//  CalculatorRouter.swift
//  Viper Demo
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

class CalculatorRouter: CalculatorRouterProtocol {
    weak var view: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = CalculatorView()
        let interactor = CalculatorInteractor()
        let presenter = CalculatorPresenter()
        let router = CalculatorRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
    // Implementasi navigasi kalkulator di sini
}
