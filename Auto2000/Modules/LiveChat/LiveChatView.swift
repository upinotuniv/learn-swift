//
//  LiveChatView.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

protocol LiveChatView: AnyObject {
    // Define any methods that the Presenter can call to update the view
    func showDataSavedPopup()
}

class LiveChatViewController: UIViewController, LiveChatView {
    var presenter: LiveChatPresenter?
    
    private let container: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Welcome to Live Chat"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Let's Chat"
        view.backgroundColor = .white
        
        view.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(emailTextField)
        container.addSubview(passwordTextField)
        container.addSubview(loginButton)
        // Add action for the login button
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        // Check if data is already saved
        presenter?.checkUserData()
    }

    @objc private func loginButtonTapped() {
        presenter?.loginButtonTapped(email: emailTextField.text, password: passwordTextField.text)
    }

    // Implement showDataSavedPopup method from LiveChatView protocol
    func showDataSavedPopup() {
        let alertController = UIAlertController(title: "Data Saved", message: "Your data has been saved.", preferredStyle: .alert)
        let actionConfirmed = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(actionConfirmed)
        present(alertController, animated: true, completion: nil)
    }

    // Other UI-related methods
    // ...
}
