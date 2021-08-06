//
//  CollectionViewHeaderModel.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import Foundation

struct CollectionViewHeaderModel {
    let title: String?
    let viewAllButtonTitle: String
    let viewAllButtonsAreHidden: Bool
}

class CollectionViewHeaders {
    static let data = [
        CollectionViewHeaderModel(title: "", viewAllButtonTitle: "", viewAllButtonsAreHidden: true),
        CollectionViewHeaderModel(title: "Special Events", viewAllButtonTitle: "", viewAllButtonsAreHidden: true),
        CollectionViewHeaderModel(title: "Quiz & Brain Games", viewAllButtonTitle: "View All", viewAllButtonsAreHidden: false),
        CollectionViewHeaderModel(title: "Running Games", viewAllButtonTitle: "View All", viewAllButtonsAreHidden: false),
        CollectionViewHeaderModel(title: "All Game Categories", viewAllButtonTitle: "All Games", viewAllButtonsAreHidden: false)
    ]
}
