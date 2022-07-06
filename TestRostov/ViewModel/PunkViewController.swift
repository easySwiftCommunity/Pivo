//
//  ViewController.swift
//  TestRostov
//
//  Created by mac on 06.07.2022.
//

import UIKit

class PunkViewController: UIViewController {
    
    private var refreshControl = UIRefreshControl()
    
    private var viewModel : PivoViewModel
    
    private let reusableIdentifier = "reusableIdentifier"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        layout.itemSize = CGSize(width: (width - 60) / 2, height: width / 2)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 50
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)
        return collectionView
    }()
    
    init(vm: PivoViewModel) {
            self.viewModel = vm
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        viewModel.getData {
            self.collectionView.reloadData()
        }
        setup()
        self.collectionView.refreshControl?.endRefreshing()
    }
    
    private func setup() {
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc func refreshData() {
        viewModel.getData {
            URLCache.shared.removeAllCachedResponses()
            self.collectionView.reloadData()
        }
        self.collectionView.refreshControl?.endRefreshing()
    }
}

extension PunkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reusableIdentifier,
            for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        let curentPivo = viewModel.arrayPivo[indexPath.row]
        
        cell.setUpData(imageURL: curentPivo.imageURL ?? "default ", text: curentPivo.name ?? " default ")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOrRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentPivo = viewModel.arrayPivo[indexPath.row]
        
        if let data = try? Data(contentsOf: URL(string: currentPivo.imageURL ?? "default")!) {
            let image = UIImage(data: data)
            guard let gotImage = image else { return }
            let vc = DetailViewController(image: gotImage)
            vc.pivoElement = currentPivo
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}




