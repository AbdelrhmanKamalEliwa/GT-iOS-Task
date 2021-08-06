//
//  MainActivityVC+CompositionalLayoutExtension.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

extension MainActivityVC {
    // MARK: - Internal Methods
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (index, _) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index)
        }
        return layout
    }
    
    // MARK: - Private Methods
    private func createSectionFor(
        index: Int,
        environment: NSCollectionLayoutEnvironment? = nil
    ) -> NSCollectionLayoutSection {
        switch index {
        case 0:
            return createFirstSection()
        case 1:
            return createSecondSection()
        case 2:
            return createThirdSection()
        case 3:
            return createThirdSection()
        case 4:
            return createFourthSection()
        default:
            return createFirstSection()
        }
    }
    
    private func createFirstSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        
        //Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: inset, leading: inset, bottom: inset, trailing: inset
        )
        
        //Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.65), heightDimension: .fractionalHeight(0.15)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        
        //Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: inset, leading: inset, bottom: inset, trailing: inset
        )
        
        //Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.85), heightDimension: .fractionalHeight(0.28)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        //Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: "header", alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createThirdSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        
        //Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: inset, leading: inset, bottom: inset, trailing: inset
        )
        
        //Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        //Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: "header", alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createFourthSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        
        //Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: inset, leading: inset, bottom: inset, trailing: inset
        )
        
        //Group
        let verticalGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)
        )
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: verticalGroupSize, subitems: [item]
        )
        
        let horizontalGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)
        )
        let horizontallGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: horizontalGroupSize, subitems: [verticalGroup, verticalGroup]
        )
        
        //Section
        let section = NSCollectionLayoutSection(group: horizontallGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        
        //Header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: "header", alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
