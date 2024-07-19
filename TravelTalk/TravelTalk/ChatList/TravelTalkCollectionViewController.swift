//
//  TravelTalkCollectionViewController.swift
//  TravelTalk
//
//  Created by Jisoo Ham on 7/19/24.
//

import UIKit

import SnapKit

/*
 CollectionView에서 기본적으로 제공하는 기본 Cell 사용
 
 */

enum Section: CaseIterable {
    case main, sub
}

final class TravelTalkCollectionViewController: UIViewController {
    private let chatList = mockChatList
    private var dataSource: UICollectionViewDiffableDataSource<Section, ChatRoom>!
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createListLayout())
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        configureDataSource()
        updateSnapshot()
    }
    
    private func setHierarchy() {
        view.addSubview(collectionView)
    }
    private func setLayout() {
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        collectionView.snp.makeConstraints { collectionView in
            collectionView.edges.equalTo(safeArea)
        }
    }
    
    private func createListLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        // 1. CollectionView의 Cell registration 해야함.
        let registration: UICollectionView.CellRegistration<UICollectionViewListCell, ChatRoom> = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            // ListCell을 사용할 것 -> UIListConfiguration
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.chatroomName
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .systemPink
            content.imageToTextPadding = 10
            content.secondaryText = itemIdentifier.chatList.last?.message
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 13, weight: .light)
            content.secondaryTextProperties.color = UIColor.lightGray
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextHorizontalPadding = 10
            
            cell.contentConfiguration = content
            
        }
        // 2. cell에 들어갈 DataSource
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
    }
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ChatRoom>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(chatList, toSection: .main)
        dataSource.apply(snapshot)
    }
    
}

extension TravelTalkCollectionViewController: UICollectionViewDelegate {
    // didSelectItemAt으로 뷰 이동 시켜줄 것.
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let sb = UIStoryboard(name: "ChatDetail", bundle: nil)
        guard let vc = sb.instantiateViewController(
            withIdentifier: ChatDetailViewController.identifier
        ) as? ChatDetailViewController else { return }
        vc.chatting = chatList[indexPath.item].chatList
        navigationController?.pushViewController(vc, animated: true)
    }
}
