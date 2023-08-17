////
////  ViewController.swift
////  Auto2000
////
////  Created by PRO M1 2020 8/256 on 07/08/23.
////
//
//import UIKit
//
//class TabBarViewController: UITabBarController {
//    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
//        let size = image.size
//
//        let widthRatio  = targetSize.width  / size.width
//        let heightRatio = targetSize.height / size.height
//
//        let newSize: CGSize
//        if widthRatio > heightRatio {
//            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
//        } else {
//            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
//        }
//
//        let rect = CGRect(origin: .zero, size: newSize)
//        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//        image.draw(in: rect)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return newImage!
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let homeViewController = HomeViewController()
//        let newCarsViewController = NewCarsViewController()
//        let serviceViewController U= ServiceViewController()
//        let liveChatViewController = LiveChatViewController()
//        
//        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
//        let newCarsNavigationController = UINavigationController(rootViewController: newCarsViewController)
//        let serviceNavigationController = UINavigationController(rootViewController: serviceViewController)
//        let liveChatNavigationController = UINavigationController(rootViewController: liveChatViewController)
//        
//        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
//        newCarsNavigationController.tabBarItem = UITabBarItem(title: "New Cars", image: UIImage(systemName: "car.fill"), tag: 1)
//        serviceNavigationController.tabBarItem = UITabBarItem(title: "Service", image: UIImage(systemName: "bolt.car.fill"), tag: 2)
//        liveChatNavigationController.tabBarItem =  UITabBarItem(title: "Lets Chat", image: UIImage(systemName: "person.wave.2.fill"), tag: 3)
//        
//        self.viewControllers = [homeNavigationController, newCarsNavigationController, serviceNavigationController, liveChatNavigationController]
//    }
//}
//
//class HomeViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Home"
//    }
//}
//
//
//class NewCarsViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "New Cars"
//    }
//}
//
//class ServiceViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Service"
//    }
//}
//
//class LiveChatViewController: UIViewController {
//    private let containerView: UIView = {
//       let view = UIView()
//       return view
//   }()
//   
//   private let titleLabel: UILabel = {
//       let label = UILabel()
//       label.text = "Login to continue"
//       label.font = UIFont.boldSystemFont(ofSize: 20)
//       label.textAlignment = .center
//       return label
//   }()
//    
//    private let emailTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Email"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    private let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Password"
//        textField.borderStyle = .roundedRect
//        textField.isSecureTextEntry = true
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    private let loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Login", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        button.backgroundColor = .systemBlue
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 5
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Let's Chat"
//
//        // Add UI elements to the view
//        view.addSubview(containerView)
//        containerView.addSubview(titleLabel)
//        containerView.addSubview(emailTextField)
//        containerView.addSubview(passwordTextField)
//        containerView.addSubview(loginButton)
//
//        // Setup layout constraint
//        setupLayoutConstraints()
//
//        // Add action for the login button
//        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//
//        // Check if data is already saved
//        checkUserData()
//    }
//
//    @objc private func loginButtonTapped() {
//        // Save data to local storage
//        saveUserData()
//
//        // Show popup message
//        showDataSavedPopup()
//    }
//
//    private func saveUserData() {
//        // Retrieve email and password from the text fields
//        if let email = emailTextField.text,
//           let password = passwordTextField.text {
//            // Save data to local storage (UserDefaults in this example)
//            UserDefaults.standard.set(email, forKey: "userEmail")
//            UserDefaults.standard.set(password, forKey: "userPassword")
//        }
//    }
//
//    private func showDataSavedPopup() {
//        let alertController = UIAlertController(title: "Data Saved", message: "Your data has been saved.", preferredStyle: .alert)
//        let actionConfirmed = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(actionConfirmed)
//        present(alertController, animated: true, completion: nil)
//    }
//
//    private func setupLayoutConstraints() {
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            titleLabel.heightAnchor.constraint(equalToConstant: 40),
//
//            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 40),
//
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
//            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
//
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
//            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
//            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
//            loginButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
//    }
//    
//    private func checkUserData() {
//        if let email = UserDefaults.standard.string(forKey: "userEmail"),
//           let password = UserDefaults.standard.string(forKey: "userPassword") {
//            print("Email: \(email)")
//            print("Password: \(password)")
//        } else {
//            print("Data is not saved yet")
//        }
//    }
//}

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the VIPER modules for each screen
        let homeViewController = HomeRouterImpl.createModule()
        let newCarsViewController = NewCarsRouterImpl.createModule()
        let serviceViewController = ServiceRouterImpl.createModule()
        let liveChatViewController = LiveChatRouterImpl.createModule()

        // Set up the tab bar items
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        newCarsViewController.tabBarItem = UITabBarItem(title: "New Cars", image: UIImage(systemName: "car.fill"), tag: 1)
        serviceViewController.tabBarItem = UITabBarItem(title: "Service", image: UIImage(systemName: "bolt.car.fill"), tag: 2)
        liveChatViewController.tabBarItem = UITabBarItem(title: "Let's Chat", image: UIImage(systemName: "person.wave.2.fill"), tag: 3)

        // Set up the view controllers for the tab bar
        self.viewControllers = [homeViewController, newCarsViewController, serviceViewController, liveChatViewController]
    }
}
