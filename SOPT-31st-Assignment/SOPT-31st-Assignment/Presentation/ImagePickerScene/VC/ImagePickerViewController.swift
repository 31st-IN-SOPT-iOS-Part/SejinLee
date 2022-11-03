//
//  ImagePickerViewController.swift
//  SOPT-31st-Assignment
//
//  Created by sejin on 2022/10/27.
//

import UIKit
import Combine

final class ImagePickerViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ImagePickerViewModel!
    private var cancelBag = Set<AnyCancellable>()
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    private let itemSpacing: CGFloat = 9
    private let lineSpaceing: CGFloat = 7
    private var images = [String]()
    private var viewWillAppear = PassthroughSubject<Void, Never>()


    
    // MARK: - UI Components
    
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "iconClose"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "최근 항목"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    private lazy var submitButton = UIButton(type: .system).then {
        $0.setTitle("전송", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    private lazy var headerView = UIView().then {
        $0.addSubviews(cancelButton, titleLabel, submitButton)
        cancelButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        submitButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }
    }
    
    private lazy var imageListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.backgroundColor = .clear
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setLayout()
        self.setDelegate()
        self.register()
        self.bindViewModels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewWillAppear.send()
    }
}

// MARK: - Methods

extension ImagePickerViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(headerView, imageListCollectionView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(38)
        }
        imageListCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setDelegate() {
        imageListCollectionView.delegate = self
        imageListCollectionView.dataSource = self
    }
    
    private func register() {
        imageListCollectionView.register(ImageListCollectionViewCell.self, forCellWithReuseIdentifier: ImageListCollectionViewCell.className)
    }
    
    private func bindViewModels() {
        let input = ImagePickerViewModel.Input(viewWillAppear: self.viewWillAppear.eraseToAnyPublisher())
        
        let output = viewModel.transform(from: input)
    
        output.imageList
            .map { $0.map {$0.imageName} }
            .sink { event in
                print(event)
            } receiveValue: { value in
                self.images = value
                self.imageListCollectionView.reloadData()
            }.store(in: &self.cancelBag)
    }
    
    @objc private func dismissVC() {
        self.dismiss(animated: true)
    }
}


// MARK: - UICollectionViewDelgate

extension ImagePickerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageListCollectionViewCell.className, for: indexPath)
                as? ImageListCollectionViewCell else { return UICollectionViewCell() }
        cell.initCell(imageName: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 2*itemSpacing) / 3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpaceing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
}
