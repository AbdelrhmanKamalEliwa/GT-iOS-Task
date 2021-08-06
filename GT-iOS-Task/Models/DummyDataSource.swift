//
//  DummyDataSource.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import Foundation

struct DataSourceModel {
    var image: String = "default.image"
    var title: String = "Main Title"
    var subtitle: String = "Subtitle"
}

class DummyDataSource {
    
    private(set) var data: [[DataSourceModel]] = []
    
    init() {
        createDummyDataSource()
    }
    
    private func createDummyDataSource() {
        var dataInSection: [DataSourceModel] = []
        for _ in 0 ..< 15 {
            dataInSection.append(DataSourceModel())
        }
        for _ in 0 ..< 5 {
            data.append(dataInSection)
        }
    }
}
