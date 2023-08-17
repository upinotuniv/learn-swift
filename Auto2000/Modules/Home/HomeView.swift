//
//  HomeView.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol HomeView: AnyObject {
    // Define any methods that the Presenter can call to update the view
}

class HomeViewController: UIViewController, HomeView {
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
    }
}
