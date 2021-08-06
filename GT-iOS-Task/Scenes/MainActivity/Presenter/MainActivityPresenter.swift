//
//  MainActivityPresenter.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import Foundation

class MainActivityPresenter: MainActivityPresenterProtocol {
    
    // MARK: - Properties
    weak var view: MainActivityViewProtocol?
    private let interactor: MainActivityInteractorInputProtocol
    private let router: MainActivityRouterProtocol
    private var dummyDataSource: [[DataSourceModel]] = []
    private var dummyHeaders: [CollectionViewHeaderModel] = CollectionViewHeaders.data
    var numberOfSections: Int {
        dummyDataSource.count
    }
    
    // MARK: - Init
    init(
        view: MainActivityViewProtocol,
        interactor: MainActivityInteractorInputProtocol,
        router: MainActivityRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        view?.setupCollectionView()
        view?.setupSearchBar()
        fetchData()
    }
    
    func viewWillAppear() {
        view?.setupNavbar()
    }
    
    func didTapMenuButton() {
        // MARK: do something
    }
    
    func didTapAddButton() {
        router.presentMainUnityActivityVC(from: view)
    }
    
    func numberOfItems(for section: Int) -> Int {
        dummyDataSource[section].count
    }
    
    func bannerCellConfiguration(_ cell: BannerCellViewProtocol, at indexPath: IndexPath) {
        let dataSourceModel = dummyDataSource[indexPath.section][indexPath.row]
        let model = BannerCellModel(imageName: dataSourceModel.image)
        cell.configure(model: model)
    }
    
    func specialEventsCellConfiguration(_ cell: SpecialEventsCellViewProtocol, at indexPath: IndexPath) {
        let dataSourceModel = dummyDataSource[indexPath.section][indexPath.row]
        let model = SpecialEventsCellModel(
            imageName: dataSourceModel.image,
            title: dataSourceModel.title,
            subtitle: dataSourceModel.subtitle
        )
        cell.configure(model: model)
    }
    
    func gamesCellConfiguration(_ cell: GamesCellViewProtocol, at indexPath: IndexPath) {
        let dataSourceModel = dummyDataSource[indexPath.section][indexPath.row]
        let model = GamesCellModel(imageName: dataSourceModel.image, title: dataSourceModel.title)
        cell.configure(model: model)
    }
    
    func categoriesCellConfiguration(_ cell: CategoriesCellViewProtocol, at indexPath: IndexPath) {
        let dataSourceModel = dummyDataSource[indexPath.section][indexPath.row]
        let model = CategoriesCellModel(image: dataSourceModel.image)
        cell.configure(model: model)
    }
    
    func headerConfiguration(_ header: CollectionViewHeaderViewProtocol, at indexPath: IndexPath) {
        let model = dummyHeaders[indexPath.section]
        header.configure(model: model)
    }
    
    // MARK: - Private Methods
    private func fetchData() {
        view?.showLoadingAnimation()
        interactor.fetchData()
    }
}

// MARK: - Interactor Delegates
extension MainActivityPresenter: MainActivityInteractorOutputProtocol {
    func dataFetchedSuccessfully(serviceResponse: [[DataSourceModel]]) {
        view?.hideLoadingAnimation()
        guard !serviceResponse.isEmpty else { return }
        dummyDataSource = serviceResponse
        view?.dataFetchedSuccessfully()
    }
    
    func dataFetchingFailed(withError error: Error) {
        view?.hideLoadingAnimation()
        view?.showError(with: "Error", message: error.localizedDescription)
    }
}
