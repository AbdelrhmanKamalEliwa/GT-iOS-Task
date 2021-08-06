//
//  CategoriesCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    // MARK: - Properties
    @IBOutlet private weak var iconImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius = 5
    }
}

// MARK: - CategoriesCellView Delegate
extension CategoriesCell: CategoriesCellViewProtocol {
    func configure(model: CategoriesCellModel) {
        iconImageView.image = UIImage(named: model.image ?? "")
    }
}
