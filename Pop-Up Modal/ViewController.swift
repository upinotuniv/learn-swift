//
//  ViewController.swift
//  Pop-Up Modal
//
//  Created by PRO M1 2020 8/256 on 04/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        view.addSubview(pop)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            let pop = Popup()
            self.view.addSubview(pop)
        }
    }


}

