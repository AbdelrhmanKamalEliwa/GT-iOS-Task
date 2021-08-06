//
//  MainActivityInteractor.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import Foundation

class MainActivityInteractor: MainActivityInteractorInputProtocol {
    // MARK: - Properties
    weak var presenter: MainActivityInteractorOutputProtocol?
    
    // MARK: - Methods
    func fetchData() {
        let data = DummyDataSource().data
        presenter?.dataFetchedSuccessfully(serviceResponse: data)
    }
}
