//
//  HeaderView.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class HeaderView: UICollectionReusableView, CollectionViewHeaderViewProtocol {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var buttonsStackView: UIStackView!
    @IBOutlet private var viewAllButtons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTapViewAllButtons(_ sender: UIButton) {
        
    }
    
    func configure(model: CollectionViewHeaderModel) {
        titleLabel.text = model.title
        buttonsStackView.isHidden = model.viewAllButtonsAreHidden
        viewAllButtons[0].setTitle(model.viewAllButtonTitle, for: .normal)
    }
}
