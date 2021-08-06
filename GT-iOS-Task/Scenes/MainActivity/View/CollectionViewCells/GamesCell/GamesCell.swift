//
//  GamesCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class GamesCell: UICollectionViewCell {

    // MARK: - Properties
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.cornerRadius = 5
    }
}

// MARK: - GamesCellView Delegate
extension GamesCell: GamesCellViewProtocol {
    func configure(model: GamesCellModel) {
        iconImageView.image = UIImage(named: model.imageName ?? "")
        titleLabel.text = model.title
    }
}
