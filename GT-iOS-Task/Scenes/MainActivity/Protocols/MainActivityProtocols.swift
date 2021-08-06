//
//  MainActivityProtocols.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import Foundation

protocol MainActivityViewProtocol: AnyObject {
    var presenter: MainActivityPresenterProtocol! { get set }
    func setupNavbar()
    func setupCollectionView()
    func dataFetchedSuccessfully()
    func showLoadingAnimation()
    func hideLoadingAnimation()
    func showError(with title: String, message: String)
}

protocol BannerCellViewProtocol {
    func configure(model: BannerCellModel)
}

protocol SpecialEventsCellViewProtocol {
    func configure(model: SpecialEventsCellModel)
}

protocol GamesCellViewProtocol {
    func configure(model: GamesCellModel)
}

protocol CategoriesCellViewProtocol {
    func configure(model: CategoriesCellModel)
}

protocol CollectionViewHeaderViewProtocol {
    func configure(model: CollectionViewHeaderModel)
}

protocol MainActivityPresenterProtocol: AnyObject {
    var view: MainActivityViewProtocol? { get set }
    var numberOfSections: Int { get }
    func viewDidLoad()
    func viewWillAppear()
    func didTapMenuButton()
    func didTapAddButton()
    func numberOfItems(for section: Int) -> Int
    func bannerCellConfiguration(_ cell: BannerCellViewProtocol, at indexPath: IndexPath)
    func specialEventsCellConfiguration(_ cell: SpecialEventsCellViewProtocol, at indexPath: IndexPath)
    func gamesCellConfiguration(_ cell: GamesCellViewProtocol, at indexPath: IndexPath)
    func categoriesCellConfiguration(_ cell: CategoriesCellViewProtocol, at indexPath: IndexPath)
    func headerConfiguration(_ header: CollectionViewHeaderViewProtocol, at indexPath: IndexPath)
}

protocol MainActivityInteractorInputProtocol {
    var presenter: MainActivityInteractorOutputProtocol? { get set }
    func fetchData()
}

protocol MainActivityInteractorOutputProtocol: AnyObject {
    func dataFetchedSuccessfully(serviceResponse: [[DataSourceModel]])
    func dataFetchingFailed(withError error: Error)
}

protocol MainActivityRouterProtocol { }
