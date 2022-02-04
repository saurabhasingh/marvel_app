//
//  ViewController.swift
//  Marvel_App
//
//  Created by admin on 1/27/22.
//

import UIKit

class CharacterListViewController: ParentViewController {
    
    private var collectionView: UICollectionView!
    private var viewModel = CharacterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppConstant.characters
        collectionViewSetup()
        registerCell()
        initViewModel()
    }

}

extension CharacterListViewController {
    
    func initViewModel(){
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async { self?.collectionView.reloadData() }
        }
        viewModel.showLoading = {[weak self] in
            DispatchQueue.main.async { self?.showActivityIndicator() }
        }
        viewModel.hideLoading = {[weak self] in
            DispatchQueue.main.async { self?.hideActivityIndicator() }
        }
        viewModel.getData()
    }
    
    private func collectionViewSetup() {
        let layout = CollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout.singleLayout)
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
    }
    
    private func registerCell(){
        collectionView.register(UINib(nibName: Identifier.characterCell, bundle: nil), forCellWithReuseIdentifier: Identifier.characterCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


extension CharacterListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.characterCell, for: indexPath) as? CharacterCell else {
            return UICollectionViewCell()
        }
        let cellData = viewModel.getCellViewModel(at: indexPath)
        cell.cellModel = cellData
        return cell
    }
    
}

extension CharacterListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.loadPaginationData(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("IndexPath: \(indexPath)")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: Identifier.detailViewController) as? CharacterDetailViewController else {
            return
        }
        let detailViewModel = viewModel.getDetailViewModel(at: indexPath)
        vc.viewModel = detailViewModel
        present(vc, animated: true, completion: nil)
    }
}
