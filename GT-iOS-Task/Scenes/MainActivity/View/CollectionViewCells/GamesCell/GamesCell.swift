//
//  GamesCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class GamesCell: UICollectionViewCell, GamesCellViewProtocol {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.cornerRadius = 5
    }
    
    func configure(model: GamesCellModel) {
        iconImageView.image = UIImage(named: model.imageName ?? "")
        titleLabel.text = model.title
    }
}
