//
//  ChatListViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/26.
//

import UIKit
import Combine

final class ChatListViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ChatListViewModel!
    private var cancellable: Set<AnyCancellable> = []
    var viewWillAppear = PassthroughSubject<Void, Never>()
    private var chatList = [ChatModel]()
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    
    // MARK: - UI Components
    
    private lazy var headerView = HeaderView(title: "채팅")
        .setSubtitle(subTitle: "오픈채팅")
        .setSubButton(image: "iconPlus") {[weak self] _ in
            guard let self = self else { return }
            let vc = ModuleFactory.shared.makeLoginViewController()
            self.present(vc, animated: true)
        }
    
    private lazy var chatCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.backgroundColor = .clear
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        register()
        bindViewModels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewWillAppear.send()
    }
}

// MARK: - Methods

extension ChatListViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(headerView, chatCollectionView)
        
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        chatCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setDelegate() {
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
    }
    
    private func register() {
        chatCollectionView.register(ChatListCollectionViewCell.self, forCellWithReuseIdentifier: ChatListCollectionViewCell.className)
        chatCollectionView.register(ChatListCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatListCollectionViewHeader.className)
    }
    
    private func bindViewModels() {
        let input = ChatListViewModel.Input(viewWillAppear: viewWillAppear.eraseToAnyPublisher())
        let output = viewModel.transform(from: input)
        
        output.chatList
            .receive(on: RunLoop.main)
            .sink { event in
                print("event: \(event)")
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.chatList = value
                self.chatCollectionView.reloadData()
            }.store(in: &self.cancellable)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout

extension ChatListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatListCollectionViewCell.className, for: indexPath)
                as? ChatListCollectionViewCell else { return UICollectionViewCell() }
        cell.initCell(model: chatList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ChatListCollectionViewHeader.className, for: indexPath)
            
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 87)
    }
}
