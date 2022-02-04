//
//  CollectionView+Extension.swift
//  Marvel_App
//
//  Created by admin on 1/27/22.
//

import Foundation
import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var singleLayout: UICollectionViewFlowLayout! {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        layout.itemSize = CGSize(width: screenSize.width-40, height: (screenSize.width)*0.55)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        return layout
    }
}
