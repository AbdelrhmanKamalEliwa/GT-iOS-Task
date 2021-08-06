//
//  MainActivityInteractor.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import Foundation

class MainActivityInteractor: MainActivityInteractorInputProtocol {
    weak var presenter: MainActivityInteractorOutputProtocol?
    
    func fetchData() {
        let data = DummyDataSource().data
        presenter?.dataFetchedSuccessfully(serviceResponse: data)
    }
}
