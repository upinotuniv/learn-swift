//
//  ViewController.swift
//  Constraint Demo
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    let images = ["1-Platinum-White-Pearl_0 1", "1-Platinum-White-Pearl_0 1", "1-Platinum-White-Pearl_0 1"]
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
        toolbar.backgroundColor = .clear
        toolbar.isTranslucent = true
        return toolbar
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
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
        image.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return image
    }()
    
    private func setupComponents() {
        view.backgroundColor = .white
        
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalToConstant: 280).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        view.addSubview(topToolbar)
            topToolbar.translatesAutoresizingMaskIntoConstraints = true
            NSLayoutConstraint.activate([
                topToolbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                topToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                topToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                topToolbar.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        view.addSubview(scrollView)
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
        
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * view.bounds.size.width, height: 250)
        scrollView.delegate = self
            
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .darkGray
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
        pageControl.numberOfPages = images.count
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

extension ViewController: UIScrollViewDelegate {
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


//class HomeViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Home"
//    }
//}
//
//class NewCarsViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "New Car"
//    }
//}
//
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
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Live Chat"
//    }
//}
