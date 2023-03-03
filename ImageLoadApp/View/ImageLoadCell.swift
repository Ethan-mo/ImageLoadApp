//
//  ImageLoadCell.swift
//  ImageLoadApp
//
//  Created by 모상현 on 2023/03/03.
//

import UIKit

protocol ImageLoadCellDelegate: class {
    func handleButton(_ cell: ImageLoadCell)
}

class ImageLoadCell: UITableViewCell {
    // MARK: - Properties
    weak var delegate: ImageLoadCellDelegate?
    var image: UIImage? {
        didSet{
            print("DEBUG: 이미지 수정")
            randomImageView.image = image
        }
    }
    
    private var randomImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName:"photo"))
        iv.setDimensions(width: 80, height: 60)
        return iv
    }()
    private var loadingBar: UIProgressView = {
        let pv = UIProgressView(progressViewStyle: .bar)
        pv.transform = CGAffineTransform(scaleX: 1.0, y: 0.1)
        pv.backgroundColor = .systemGray6
        return pv
    }()
    lazy var loadButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Load", for: .normal)
        btn.setDimensions(width: 80, height: 60)
        btn.addTarget(self, action: #selector(handleLoadImage), for: .touchUpInside)
        return btn
    }()
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stack = UIStackView(arrangedSubviews: [randomImageView, loadingBar, loadButton])
        
        contentView.addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        stack.centerY(inView: self)
        stack.axis = .horizontal
        stack.spacing = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Selector
    @objc func handleLoadImage() {
        print("DEBUG: 버튼이 눌렸습니다.")
        loadImage()
    }
    
    // MARK: - API
    func loadImage() {
        Service.shared.loadImage(randomImageView, loadingBar)
    }
    
    
    // MARK: - Helper
    func configure() {
        print("DEUBG: configure")
        loadingBar.progressTintColor = UIColor.blue
        loadingBar.trackTintColor = UIColor.lightGray
    }
}

