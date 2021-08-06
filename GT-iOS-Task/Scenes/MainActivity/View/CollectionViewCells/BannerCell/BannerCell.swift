//
//  BannerCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class BannerCell: UICollectionViewCell, BannerCellViewProtocol {
    
    @IBOutlet private weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius = 5
    }
    
    func configure(model: BannerCellModel) {
        bannerImageView.image = UIImage(named: model.imageName ?? "")
    }
}
