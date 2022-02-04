//
//  CharacterViewModel.swift
//  Marvel_App
//
//  Created by admin on 1/28/22.
//

import Foundation

class CharacterViewModel {
    
    var datas: CharacterModel?
    var reloadCollectionView: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    var pageCount: Int = 1
    var vms = [DataListCellViewModel]()
    
    private var cellViewModels: [DataListCellViewModel] = [DataListCellViewModel]() {
        didSet {
            self.reloadCollectionView?()
        }
    }
    
    func getData(){
        showLoading?()
        Services.getCharacterList(url: APIUrl.url, page: "\(pageCount)") { [weak self] (success, data) in
            self?.hideLoading?()
            if success {
                guard let data = data else {return}
                self?.createCell(datas: data)
                self?.reloadCollectionView?()
            } else {
                debugPrint("error occured")
            }
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> DataListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func getDetailViewModel( at indexPath: IndexPath ) -> DetailViewModel {
        return DetailViewModel(titleText: cellViewModels[indexPath.row].titleText, subTitleText: cellViewModels[indexPath.row].subTitleText, imageUrl: cellViewModels[indexPath.row].imageUrl)
    }
    
    func createCell(datas: CharacterModel){
        self.datas = datas
                
        if let articles = datas.articles {
            for data in articles {
                vms.append(DataListCellViewModel(titleText: data.titleText, subTitleText: data.description, imageUrl: data.imgUrl))
            }
        }
        cellViewModels = vms
    }
    
    func loadPaginationData(_ indexPath: IndexPath) {
        if indexPath.item > 0 && indexPath.item % 19 == 0 && (self.datas?.totalResult ?? 0) > indexPath.item {
            pageCount += 1
            self.getData()
        }
    }
}

struct DataListCellViewModel {
    let titleText: String
    let subTitleText: String
    let imageUrl: String
}


struct DetailViewModel {
    let titleText: String
    let subTitleText: String
    let imageUrl: String
}
