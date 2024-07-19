//
//  SettingListViewController.swift
//  SettingTableView
//
//  Created by Jisoo Ham on 7/19/24.
//

import UIKit

final class SettingListViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<SettingOptions, String>!
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setDataSource()
        updateSnapshot()
    }
    
    private func setHierarchy() {
        navigationController?.navigationBar.isHidden = true
        view.addSubview(collectionView)
    }
    private func setLayout() {
        view.backgroundColor = .systemBackground
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    // compositional Layout 사용 -> ListCell 사용할 것.
    private func createLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.showsSeparators = true
        config.headerMode = .supplementary
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    private func setDataSource() {
        let registration
        : UICollectionView.CellRegistration<UICollectionViewListCell, String> 
        = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            // cell content의 특성
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier
            content.textProperties.color = .darkGray
            
            cell.contentConfiguration = content
        }
        
        // MARK: DiffableDataSource를 쓰고 있는게 맞나 .. ? indexPath.section을 통해 데이터를 접근한다는게 좀 어색함
        let headerRegistration
        : UICollectionView.SupplementaryRegistration<UICollectionViewListCell> 
        = UICollectionView.SupplementaryRegistration(elementKind: UICollectionView.elementKindSectionHeader) { supplementaryView, elementKind, indexPath in
            var content = UIListContentConfiguration.groupedHeader()
            
            
            if let section = SettingOptions(rawValue: indexPath.section) {
                content.text = section.mainOptions
            }
            content.textProperties.color = .lightGray
            supplementaryView.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                let cell = collectionView.dequeueConfiguredReusableCell(
                    using: registration,
                    for: indexPath,
                    item: itemIdentifier
                )
                
                return cell
            }
        )
        dataSource.supplementaryViewProvider = { collectionView, headerTitle, indexPath in
            let header = collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration, 
                for: indexPath
            )
            
            return header
        }
    }
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SettingOptions, String>()
        snapshot.appendSections(SettingOptions.allCases)
        snapshot.appendItems(SettingOptions.total.subOptions, toSection: .total)
        snapshot.appendItems(SettingOptions.personal.subOptions, toSection: .personal)
        snapshot.appendItems(SettingOptions.others.subOptions, toSection: .others)
        
        dataSource.apply(snapshot)
    }
}

/*
 어떻게 하고 싶은데 ??
 1. UITableView에서 systemCell처럼 활용하고 싶음!!
    -> UITableView의 SystemCell처럼 Cell을 사용하고 싶음 => iOS 14+에 제공되는 List로 활용할 수 있음.
    -> 그럼 layout은 어떤걸 써야해 ? -> Compositional.
    -> FlowLayout의 불편한 점을 보완한 Compositional을 통해 Layout을 잡고 List의 configuration을 적용해줌으로 Cell의 Layout을 잡아줄 수 있음.
        -> FlowLayout이 Compositional로 발전된 계기는 ? => 더 다양한 Layout을 개발자가 편할 수 있게 정해주기 위함.

 2. DataSource가 DiffableDataSource로 변경됨
    - Diffable로 변경되면서 사용할 때 가장 큰 차이점
        - index를 기반으로 데이터를 접근하지 않음.
        - UICollectio
 
 3. CollectionView에 Cell을 등록하는 방식 변경
    - cell Register / Registration
    - dequeue / dequeueConfiguredReusableCell
 
 
 */
