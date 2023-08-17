//
//  TileCollectionViewCell.swift
//  Astra Practice
//
//  Created by PRO M1 2020 8/256 on 02/08/23.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let subName: String
    let backgroundColor: UIColor
    let imageName: String
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .black)

        
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .thin)
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // image
        contentView.addSubview(imageView)
        
        // blur effect
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemThickMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = contentView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.8
        contentView.addSubview(blurEffectView)

        // label centered
        contentView.addSubview(label)
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .systemYellow
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        label.addSubview(bottomLine)
        
        // Add constraints to center the bottom line horizontally
        bottomLine.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        bottomLine.bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        
        // Set the width of the bottom line (set to half of the label's width, you can adjust the multiplier as needed)
        bottomLine.widthAnchor.constraint(equalTo: label.widthAnchor, multiplier: 0.1).isActive = true
        
        // Set the height of the bottom line (1 point in this case, you can adjust this value as needed)
        bottomLine.heightAnchor.constraint(equalToConstant: 2).isActive = true

        
        // sublabel centered
//        contentView.addSubview(subLabel)
//        contentView.layer.cornerRadius = 6
//        contentView.layer.borderWidth = 1.5
//        contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
            
        let spaceBetweenLabels: CGFloat = 0.1
            let labelHeight: CGFloat = 25
            let subLabelHeight: CGFloat = 25
            
            // Calculate the total height required for both labels and the space between them
            let totalHeight = labelHeight + spaceBetweenLabels + subLabelHeight
            let labelsYPosition = (contentView.bounds.height - totalHeight) / 2
            
            label.frame = CGRect(x: 0, y: labelsYPosition, width: contentView.bounds.width, height: labelHeight)
            
            let subLabelYPosition = labelsYPosition + labelHeight + spaceBetweenLabels
            subLabel.frame = CGRect(x: 0, y: subLabelYPosition, width: contentView.bounds.width, height: subLabelHeight)
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
            contentView.backgroundColor = viewModel.backgroundColor
            label.text = viewModel.name
            subLabel.text = viewModel.subName
            imageView.image = UIImage(named: viewModel.imageName)
    }
}
