//
//  MainCollectionViewCell.swift
//  TestRostov
//
//  Created by mac on 06.07.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
   private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .orange
        return imageView
    }()
        
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(stack)
        setUpStack()
        stack.addArrangedSubview(photoImageView)
        stack.addArrangedSubview(nameLabel)
        
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        backgroundColor = .clear
        layer.cornerRadius = 12
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setUpStack() {
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    public func setUpData(imageURL: String, text: String) {
        guard let url = URL(string: imageURL) else { return }
        self.nameLabel.text = text
        if let data = try? Data(contentsOf: url) {
            let image = UIImage(data: data)
            guard let gotImage = image else { return }
            self.photoImageView.image = gotImage
        }
    }
}
