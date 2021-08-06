//
//  BannerCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    // MARK: - Properties
    @IBOutlet private weak var bannerImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius = 5
    }
}

// MARK: - BannerCellView Delegate
extension BannerCell: BannerCellViewProtocol {
    func configure(model: BannerCellModel) {
        bannerImageView.image = UIImage(named: model.imageName ?? "")
    }
}
