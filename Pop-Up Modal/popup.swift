//
//  popup.swift
//  Pop-Up Modal
//
//  Created by PRO M1 2020 8/256 on 04/08/23.
//

import UIKit

class Popup: UIView {
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "1 credit"
        label.textAlignment = .center
        return label
    }()
    
    fileprivate let subTitlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "in app purchase for one book credit"
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    fileprivate let container: UIView = {
        let V = UIView()
        V.translatesAutoresizingMaskIntoConstraints = false
        V.backgroundColor = .white
        V.layer.cornerRadius = 24
        return V
    }()
    
    fileprivate lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitlelabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    @objc fileprivate func animatedIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
    @objc fileprivate func animatedOut() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) {(complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animatedOut)))
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        
        self.addSubview(container)
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        
        container.addSubview(stack)
//        stack.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        stack.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5).isActive = true
        
        animatedIn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
