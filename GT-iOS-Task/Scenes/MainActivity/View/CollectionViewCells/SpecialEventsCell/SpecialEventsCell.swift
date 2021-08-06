//
//  SpecialEventsCell.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class SpecialEventsCell: UICollectionViewCell {

    // MARK: - Properties
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadius = 5
    }
}

// MARK: - SpecialEventsCell Delegate
extension SpecialEventsCell: SpecialEventsCellViewProtocol {
    func configure(model: SpecialEventsCellModel) {
        iconImageView.image = UIImage(named: model.imageName ?? "")
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
