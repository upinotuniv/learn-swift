//
//  ViewController.swift
//  Astra Practice
//
//  Created by PRO M1 2020 8/256 on 02/08/23.
//

import UIKit

//struct SubMenuViewModel {
//    let title: String
//    let icon: UIImage?
//}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(name: "Toyota Supra", subName: "Supra GSX 2000", backgroundColor: .systemBlue, imageName: "kirill-shavlo-c5Jeb4rKKDM-unsplash"),
            TileCollectionViewCellViewModel(name: "American Muscle", subName: "American Muscle RTX 4040", backgroundColor: .systemRed, imageName: "wade-lambert-_PyDYwQwu9U-unsplash"),
            TileCollectionViewCellViewModel(name: "Landrover", subName:"Landrover Rally", backgroundColor: .systemYellow, imageName: "yusuf-evli-cl6XFFFv3n0-unsplash")
        ])
    ]
    
    func resizeImage(image: UIImage?, newWidth: CGFloat) -> UIImage? {
        guard let image = image else { return nil }
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func cardViewCar() {
        let cardMenuCarView = UIView()
        cardMenuCarView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        cardMenuCarView.layer.cornerRadius = 10
        
        view.addSubview(cardMenuCarView)
        NSLayoutConstraint.activate([
            cardMenuCarView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -200),
            cardMenuCarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardMenuCarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardMenuCarView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        // Buat UIStackView utama
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 10 // Atur jarak antara baris
        
        // Tambahkan UIStackView utama ke dalam cardMenuView
        cardMenuCarView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: cardMenuCarView.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: cardMenuCarView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: cardMenuCarView.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: cardMenuCarView.bottomAnchor, constant: -10),
        ])
        
        // Buat UIStackView untuk baris pertama tombol (3 baris ke atas)
        let topRowStackView = UIStackView()
        topRowStackView.axis = .horizontal
        topRowStackView.distribution = .fillEqually
        topRowStackView.spacing = 10 // Atur jarak antara tombol
        
        // Tambahkan UIStackView baris pertama ke dalam UIStackView utama
        mainStackView.addArrangedSubview(topRowStackView)
        
        // Buat UIStackView untuk baris kedua tombol (2 baris ke bawah)
        let bottomRowStackView = UIStackView()
        bottomRowStackView.axis = .horizontal
        bottomRowStackView.distribution = .fillEqually
        bottomRowStackView.spacing = 10 // Atur jarak antara tombol
        
        // Tambahkan UIStackView baris kedua ke dalam UIStackView utama
        mainStackView.addArrangedSubview(bottomRowStackView)
    }
    
    func setupCardMenuButtonView() {
        let cardMenuView = UIView()
//        cardMenuView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        cardMenuView.backgroundColor = .clear
        cardMenuView.layer.cornerRadius = 10
        cardMenuView.layer.shadowColor = UIColor.black.cgColor
//        cardMenuView.layer.shadowOpacity = 0.2
//        cardMenuView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        cardMenuView.layer.shadowRadius = 4
        cardMenuView.translatesAutoresizingMaskIntoConstraints = false
        
        // Taruh cardMenuView di bawah carousel dengan jarak tertentu menggunakan konstrain
        view.addSubview(cardMenuView)
        NSLayoutConstraint.activate([
            cardMenuView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -550),
            cardMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardMenuView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        // Buat UIStackView utama
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 10 // Atur jarak antara baris
        
        // Tambahkan UIStackView utama ke dalam cardMenuView
        cardMenuView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: cardMenuView.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: cardMenuView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: cardMenuView.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: cardMenuView.bottomAnchor, constant: -10),
        ])
        
        // Buat UIStackView untuk baris pertama tombol (3 baris ke atas)
        let topRowStackView = UIStackView()
        topRowStackView.axis = .horizontal
        topRowStackView.distribution = .fillEqually
        topRowStackView.spacing = 10 // Atur jarak antara tombol
        
        // Tambahkan UIStackView baris pertama ke dalam UIStackView utama
        mainStackView.addArrangedSubview(topRowStackView)
        
        // Buat UIStackView untuk baris kedua tombol (2 baris ke bawah)
        let bottomRowStackView = UIStackView()
        bottomRowStackView.axis = .horizontal
        bottomRowStackView.distribution = .fillEqually
        bottomRowStackView.spacing = 10 // Atur jarak antara tombol
        
        // Tambahkan UIStackView baris kedua ke dalam UIStackView utama
        mainStackView.addArrangedSubview(bottomRowStackView)
        
        let handHoldingIcon = UIImage(named: "hand_holding_icon")
        let truckIcon = UIImage(named: "truck_icon")
        let shoppingBasketIcon = UIImage(named: "shopping_basket_icon")
        let discountIcon = UIImage(named: "discount_icon")
        let carIcon = UIImage(named: "car_icon")
        let mapIcon = UIImage(named: "map_icon")
        
        // Resize the images to the desired size (for example, 25 points width)
        let resizedHandHoldingIcon = resizeImage(image: handHoldingIcon, newWidth: 50)
        let resizedTruckIcon = resizeImage(image: truckIcon, newWidth: 50)
        let resizedShoppingBasketIcon = resizeImage(image: shoppingBasketIcon, newWidth: 50)
        let resizedDiscountIcon = resizeImage(image: discountIcon, newWidth: 50)
        let resizedCarIcon = resizeImage(image: carIcon, newWidth: 50)
        let resizedMapIcon = resizeImage(image: mapIcon, newWidth: 30)
    
        let button1 = createMenuButton(title: "Service Booking", image: resizedHandHoldingIcon, selector: #selector(didTapButton1))
        let button2 = createMenuButton(title: "Service Coupon", image: resizedDiscountIcon, selector: #selector(didTapButton2))
        let button3 = createMenuButton(title: "Accessories", image: resizedShoppingBasketIcon, selector: #selector(didTapButton3))
        let button4 = createMenuButton(title: "Home Service", image: resizedTruckIcon, selector: #selector(didTapButton4))
        let button5 = createMenuButton(title: "Compare Car", image: resizedCarIcon, selector: #selector(didTapButton5))
        let button6 = createMenuButton(title: "Tracking Order", image: resizedMapIcon, selector: #selector(didTapButton6))
        
        // Add the buttons to the corresponding UIStackViews
        topRowStackView.addArrangedSubview(button1)
        topRowStackView.addArrangedSubview(button2)
        topRowStackView.addArrangedSubview(button3)

        bottomRowStackView.addArrangedSubview(button4)
        bottomRowStackView.addArrangedSubview(button5)
        bottomRowStackView.addArrangedSubview(button6)

    }
    
    func createMenuButton(title: String, image: UIImage?, selector: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 1

//        button.setTitle(title, for: .normal)
        // Atur ukuran teks (font size) pada tombol
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
//        button.setTitleColor(.black, for: .normal)
        
        return button
    }
    
    @objc func didTapButton1() {
        print("Button 1 tapped")
    }

    @objc func didTapButton2() {
        print("Button 2 tapped")
    }

    @objc func didTapButton3() {
        print("Button 3 tapped")
    }

    @objc func didTapButton4() {
        print("Button 4 tapped")
    }

    @objc func didTapButton5() {
        print("Button 5 tapped")
    }

    @objc func didTapButton6() {
        print("Button 6 tapped")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        setupCardMenuButtonView()
        
        cardViewCar()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Create a custom UINavigationBar
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = .clear
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(navigationBar)

        // Add constraints for the custom UINavigationBar
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            navigationBar.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // image icon
        let lupIcon = UIImage(named: "lup_icon")?.withRenderingMode(.alwaysTemplate)
        let pinIcon = UIImage(named: "pin_icon")?.withRenderingMode(.alwaysTemplate)
        let chartIcon = UIImage(named: "chart_icon")?.withRenderingMode(.alwaysTemplate)
        let userIcon = UIImage(named: "user_icon")?.withRenderingMode(.alwaysTemplate)
        
        // Resize the images to the desired size (for example, 25 points width)
        let resizedLupIcon = resizeImage(image: lupIcon, newWidth: 16)
        let resizedPinIcon = resizeImage(image: pinIcon, newWidth: 11)
        let resizedChartIcon = resizeImage(image: chartIcon, newWidth: 15)
        let resizedUserIcon = resizeImage(image: userIcon, newWidth: 15)
        
        // Create buttons and set their actions
        let searchButton = UIBarButtonItem(image: resizedLupIcon, style: .plain, target: self, action: #selector(didTapSearch))
        let locationButton = UIBarButtonItem(image: resizedPinIcon, style: .plain, target: self, action: #selector(didTapLocation))
        let chartButton = UIBarButtonItem(image: resizedChartIcon, style: .plain, target: self, action: #selector(didTapChart))
        let accountButton = UIBarButtonItem(image: resizedUserIcon, style: .plain, target: self, action: #selector(didTapAccount))
        let homeButton = UIBarButtonItem(title: "Garage 2000", style: .plain, target: self, action: #selector(didTapHome))
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        homeButton.setTitleTextAttributes(textAttributes, for: .normal)
        
        let iconColor = UIColor.white
        searchButton.tintColor = iconColor
        locationButton.tintColor = iconColor
        chartButton.tintColor = iconColor
        accountButton.tintColor = iconColor
        homeButton.tintColor = iconColor

        // Add buttons to the navigation item
        navigationItem.rightBarButtonItems = [accountButton, chartButton, locationButton, searchButton]
        
        navigationItem.setLeftBarButton(homeButton, animated: true)

        // Set the navigation items for the custom navigation bar
        navigationBar.items = [navigationItem]
        
    }
    
    @objc private func didTapHome() {
        print("home tapped")
    }
    
    @objc private func didTapSearch() {
        // handle search
    }

    @objc private func didTapLocation() {
        // handle location
    }

    @objc private func didTapChart() {
        // handle chart
    }
    
    @objc private func didTapAccount() {
        // handle function
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width / 1.8
    }

}

extension ViewController: CollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "You got the selected item!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func collectionTableViewCellDidShowCell(_ cell: CollectionTableViewCell) {
        cell.startTimer()
    }
}
