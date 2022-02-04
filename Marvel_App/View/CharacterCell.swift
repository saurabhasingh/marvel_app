//
//  CharacterCell.swift
//  Marvel_App
//
//  Created by admin on 1/27/22.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet private weak var bgView: UIView!
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var BottomView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    
    var cellModel: DataListCellViewModel? {
        didSet {
            titleLabel.text = cellModel?.titleText
            descLabel.text = cellModel?.subTitleText.html2String
            if let img = cellModel?.imageUrl {
                setImage(img)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addShadow(with: 12)
    }
    
    private func setImage(_ imgString: String) {
        CustomImageView.loadImageUsingCacheWithURLString(imgString, placeHolder: UIImage(named: ImagePlaceholder.image)) { [weak self](img) in
            self?.imgView.image = img
        }
    }

}
