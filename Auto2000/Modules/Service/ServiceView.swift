//
//  ServiceView.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol ServiceView: AnyObject {
    // Define any methods that the Presenter can call to update the view
}

class ServiceViewController: UIViewController, ServiceView {
    var presenter: ServicePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Service"
        view.backgroundColor = .white
    }
}
