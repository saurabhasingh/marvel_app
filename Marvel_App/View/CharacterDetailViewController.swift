//
//  CharacterDetailViewController.swift
//  Marvel_App
//
//  Created by admin on 2/1/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK:- Private Methods ---------------
extension CharacterDetailViewController {
    
    func initialSetup() {
        if let img = viewModel?.imageUrl {
            setImage(img)
        }
        self.newsTitleLabel.text = viewModel?.titleText
        self.descriptionLabel.text = viewModel?.subTitleText.html2String
    }
    
    private func setImage(_ imgString: String) {
        CustomImageView.loadImageUsingCacheWithURLString(imgString, placeHolder: UIImage(named: ImagePlaceholder.image)) { [weak self](img) in
            self?.imgView.image = img
        }
    }
}
