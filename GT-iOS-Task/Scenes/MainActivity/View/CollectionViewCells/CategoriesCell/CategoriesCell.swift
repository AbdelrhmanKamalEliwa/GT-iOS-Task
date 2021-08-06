//
//  CategoriesCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class CategoriesCell: UICollectionViewCell, CategoriesCellViewProtocol {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius = 5
    }

    func configure(model: CategoriesCellModel) {
        iconImageView.image = UIImage(named: model.image ?? "")
    }
}
