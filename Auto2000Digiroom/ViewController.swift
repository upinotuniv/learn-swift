//
//  ViewController.swift
//  Auto2000Digiroom
//
//  Created by PRO M1 2020 8/256 on 09/08/23.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        let newCarsViewController = NewCarsViewController()
        let serviceViewController = ServiceViewController()
        let liveChatViewController = LiveChatViewController()
        let menuViewController = MenuViewController()
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let newCarsNavigationController = UINavigationController(rootViewController: newCarsViewController)
        let serviceNavigationController = UINavigationController(rootViewController: serviceViewController)
        let liveChatNavigationController = UINavigationController(rootViewController: liveChatViewController)
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        newCarsNavigationController.tabBarItem = UITabBarItem(title: "New Cars", image: UIImage(systemName: "car.fill"), tag: 2)
        serviceNavigationController.tabBarItem = UITabBarItem(title: "Service", image: UIImage(systemName: "bolt.car.fill"), tag: 3)
        liveChatNavigationController.tabBarItem = UITabBarItem(title: "Live Chat", image: UIImage(systemName: "person.wave.2.fill"), tag: 4)
        menuNavigationController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "line.3.horizontal"), tag: 5)
        
        self.viewControllers = [homeNavigationController, newCarsNavigationController, serviceNavigationController, liveChatNavigationController, menuNavigationController]
    }
}

class HomeViewController: UIViewController, UIScrollViewDelegate {
    let images = ["1-Platinum-White-Pearl_0 1", "1-Platinum-White-Pearl_0 1", "1-Platinum-White-Pearl_0 1", "1-Platinum-White-Pearl_0 1"]
    var currentPage = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        startTimer()
    }
    
    private let topToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barTintColor = .clear
        return toolbar
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let scrollViewBase: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let titleCardMenu: UILabel = {
        let label = UILabel()
        label.text = "PREFERRED CATEGORY"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let subTitleCardMenu: UILabel = {
        let label = UILabel()
        label.text = "Enjoy various kinds of features provided by AUTO2000"
        label.font = UIFont.systemFont(ofSize: 14.5)
        return label
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wp2780898-beautiful-road-wallpaper 1")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    private let auto200Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "auto200logo_white"), for: .normal)
        return button
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "lup_icon"), for: .normal)
        return button
    }()
    
    private let locationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pin_icon"), for: .normal)
        return button
    }()
    
    private let chartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chart_icon"), for: .normal)
        return button
    }()
    
    private let accountButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "person_icon"), for: .normal)
        return button
    }()

    
    private func setupComponents() {
        view.backgroundColor = .white
        
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalToConstant: 280).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
//        let auto2000CustomButton = UIBarButtonItem(customView: auto200Button)
//        let searchCustomButton = UIBarButtonItem(customView: searchButton)
//        let locationCustomButton = UIBarButtonItem(customView: locationButton)
//        let chartCustomButton = UIBarButtonItem(customView: chartButton)
//        let accountCustomButton = UIBarButtonItem(customView: accountButton)
        
        
//        view.addSubview(topToolbar)
//        topToolbar.items = [auto2000CustomButton, searchCustomButton, locationCustomButton, chartCustomButton, accountCustomButton]
//            topToolbar.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                topToolbar.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
//                topToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                topToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                topToolbar.heightAnchor.constraint(equalToConstant: 44)
//            ])
        
        view.addSubview(scrollView)
//        scrollView.isScrollEnabled = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
                scrollView.heightAnchor.constraint(equalToConstant: 240),
            ])
        
        for (index, imageName) in images.enumerated() {
                let imageView = UIImageView(image: UIImage(named: imageName))
                imageView.contentMode = .center
                imageView.clipsToBounds = true
                imageView.frame = CGRect(x: CGFloat(index) * view.bounds.size.width, y: 0, width: view.bounds.size.width, height: 200)
                scrollView.addSubview(imageView)
            }
        
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * view.bounds.size.width, height: 0)
        scrollView.delegate = self
            
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.pageIndicatorTintColor = .lightGray
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
        pageControl.numberOfPages = images.count
        
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = .clear
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationBar)
        
        let searchButton = UIBarButtonItem(image: UIImage(named: "lup_icon"), style: .plain, target: self, action: #selector(didTapSearch))
        let locationButton = UIBarButtonItem(image: UIImage(named: "pin_icon"), style: .plain, target: self, action: #selector(didTapLocation))
        let chartButton = UIBarButtonItem(image: UIImage(named: "chart_icon"), style: .plain, target: self, action: #selector(didTapChart))
        let accountButton = UIBarButtonItem(image: UIImage(named: "person_icon"), style: .plain, target: self, action: #selector(didTapAccount))
        let homeButton = UIBarButtonItem(image: UIImage(named: "auto2000logo_white"), style: .plain, target: self, action: #selector(didTapHome))
        
        let whiteColor = UIColor.white
        searchButton.tintColor = whiteColor
        locationButton.tintColor = whiteColor
        chartButton.tintColor = whiteColor
        accountButton.tintColor = whiteColor
        homeButton.tintColor = whiteColor
        
        navigationItem.rightBarButtonItems = [accountButton, chartButton, locationButton, searchButton]
        navigationItem.setLeftBarButton(homeButton, animated: true)
        navigationBar.items = [navigationItem]
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        view.addSubview(scrollViewBase)
        scrollViewBase.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollViewBase.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewBase.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewBase.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            scrollViewBase.heightAnchor.constraint(equalToConstant: 280),
        ])
        scrollViewBase.addSubview(titleCardMenu)
        
        view.addSubview(titleCardMenu)
            titleCardMenu.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleCardMenu.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 300),
                titleCardMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            ])
        view.addSubview(subTitleCardMenu)
        subTitleCardMenu.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                subTitleCardMenu.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 325),
                subTitleCardMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            ])
        scrollViewBase.addSubview(titleCardMenu)
        scrollViewBase.addSubview(subTitleCardMenu)
    }
    
    @objc private func didTapHome() {
        // handle home
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
        // handle account
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc private func scrollToNextPage() {
        currentPage = (currentPage + 1) % images.count
        let xOffset = CGFloat(currentPage) * view.bounds.size.width
        scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        pageControl.currentPage = pageIndex
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
}

class NewCarsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Car"
    }
}


class ServiceViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Service"
    }
}

class LiveChatViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Live Chat"
    }
}

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Menus"
    }
}
