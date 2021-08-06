//
//  MainActivityVC.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 05/08/2021.
//

import UIKit

class MainActivityVC: BaseWireframe, CustomeNavbarProtocol {

    // MARK: - Properties
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: MainActivityPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    // MARK: - Methods
    @objc
    private func didTapMenuButton() {
        presenter.didTapMenuButton()
    }
    
    @objc
    private func didTapAddButton() {
        presenter.didTapAddButton()
    }
}

// MARK: - Presenter Delegate
extension MainActivityVC: MainActivityViewProtocol {
    
    func setupNavbar() {
        let menuButton = UIBarButtonItem(
            image: UIImage(systemName: "text.justify"),
            style: .done,
            target: self,
            action: #selector(didTapMenuButton)
        )
        let logoImage = UIBarButtonItem(
            image: UIImage(named: "logo-2"),
            style: .plain,
            target: self,
            action: nil
        )
        let logoText = UIBarButtonItem(
            title: "GT",
            style: .done,
            target: self,
            action: nil
        )
        let addButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app.fill"),
            style: .done,
            target: self,
            action: #selector(didTapAddButton)
        )
        setupCustomeNavbar(
            leftbarButtonItems: [menuButton, logoImage, logoText],
            rightbarButtonItems: [addButton]
        )
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.registerCell(cellClass: BannerCell.self)
        collectionView.registerCell(cellClass: SpecialEventsCell.self)
        collectionView.registerCell(cellClass: GamesCell.self)
        collectionView.registerCell(cellClass: CategoriesCell.self)
        collectionView.registerHeaderFooter(cellClass: HeaderView.self, kind: "header")
    }
    
    func setupSearchBar() {
        searchBar.searchTextField.delegate = self
    }
    
    func dataFetchedSuccessfully() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
    
    func showLoadingAnimation() {
        //Show progress
    }
    
    func hideLoadingAnimation() {
        //Hide progress
    }
    
    func showError(with title: String, message: String) {
        let action = UIAlertAction(title: "Okay", style: .default)
        displayAlert(with: title, message: message, actions: [action])
    }
}

// MARK: - SearchBar TextField Delegate
extension MainActivityVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

// MARK: - CollectionView Delegate & DataSource
extension MainActivityVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.numberOfSections
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        presenter.numberOfItems(for: section)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = dequeueCollectionViewCell(for: indexPath)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let headerView = collectionView.dequeueHeaderFooter(
            kind: "header", indexPath: indexPath) as HeaderView
        presenter.headerConfiguration(headerView, at: indexPath)
        return headerView
    }
    
    // MARK: CollectionView Helper Function
    private func dequeueCollectionViewCell(for indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeue(indexPath: indexPath) as BannerCell
            presenter.bannerCellConfiguration(cell, at: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeue(indexPath: indexPath) as SpecialEventsCell
            presenter.specialEventsCellConfiguration(cell, at: indexPath)
            return cell
        case 2,3:
            let cell = collectionView.dequeue(indexPath: indexPath) as GamesCell
            presenter.gamesCellConfiguration(cell, at: indexPath)
            return cell
        case 4:
            let cell = collectionView.dequeue(indexPath: indexPath) as CategoriesCell
            presenter.categoriesCellConfiguration(cell, at: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
