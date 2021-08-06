//
//  SpecialEventsCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class SpecialEventsCell: UICollectionViewCell, SpecialEventsCellViewProtocol {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius = 5
    }
    
    func configure(model: SpecialEventsCellModel) {
        iconImageView.image = UIImage(named: model.imageName ?? "")
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
