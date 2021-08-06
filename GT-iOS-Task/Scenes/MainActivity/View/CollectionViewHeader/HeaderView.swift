//
//  HeaderView.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class HeaderView: UICollectionReusableView, CollectionViewHeaderViewProtocol {

    // MARK: - Properties
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var buttonsStackView: UIStackView!
    @IBOutlet private var viewAllButtons: [UIButton]!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    @IBAction func didTapViewAllButtons(_ sender: UIButton) {
        
    }
    
    // MARK: - CollectionViewHeaderView Delegate
    func configure(model: CollectionViewHeaderModel) {
        titleLabel.text = model.title
        buttonsStackView.isHidden = model.viewAllButtonsAreHidden
        viewAllButtons[0].setTitle(model.viewAllButtonTitle, for: .normal)
    }
}
