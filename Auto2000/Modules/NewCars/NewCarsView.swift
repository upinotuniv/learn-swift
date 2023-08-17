//
//  NewCarsView.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol NewCarsView: AnyObject {
    // Define any methods that the Presenter can call to update the view
}

class NewCarsViewController: UIViewController, NewCarsView {
    var presenter: NewCarsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Cars"
        view.backgroundColor = .white
    }
}
