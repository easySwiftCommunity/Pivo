//
//  DetailViewController.swift
//  TestRostov
//
//  Created by mac on 06.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pivoElement: PivoElement?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        label.font = .boldSystemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        label.font = .boldSystemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var ingredients: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        label.font = .boldSystemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var foodPairingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        label.font = .boldSystemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 15
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        parametrsView()
    }
    
    private func setUpUI() {
        view.addSubview(mainStack)
        mainStack.addArrangedSubview(imageView)
        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(descriptionLabel)
        mainStack.addArrangedSubview(ingredients)
        mainStack.addArrangedSubview(foodPairingLabel)
     
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func parametrsView() {
        nameLabel.text = pivoElement?.name
        descriptionLabel.text = pivoElement?.pivoDescription
        ingredients.text = pivoElement?.brewersTips
        foodPairingLabel.text = pivoElement?.tagline
        
    }
}


