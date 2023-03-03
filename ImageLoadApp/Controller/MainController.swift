//
//  MainController.swift
//  ImageLoadApp
//
//  Created by 모상현 on 2023/03/02.
//

import UIKit

private let reuseIdentifier = "ImageLoadCell"

class MainController: UIViewController {
    // MARK: - Properties
    private var images = [UIImage]()
    private let tableView = UITableView()
    private let allLoadButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .systemBlue
        btn.setTitle("Load All Images", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 6
        btn.addTarget(self, action: #selector(handleAllLoadingImages), for: .touchUpInside)
        return btn
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
 
    // MARK: - API
    @objc func handleAllLoadingImages() {
        let indexPath = IndexPath(row: 5, section: 0)
        let cell = self.tableView.cellForRow(at: indexPath)
        
        
    }
    
    // MARK: - Helper
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 2, paddingRight: 2)
        view.addSubview(allLoadButton)
        allLoadButton.anchor(top: tableView.bottomAnchor, left: tableView.leftAnchor, bottom: view.bottomAnchor, right: tableView.rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 30, paddingRight: 12)
        
        tableView.register(ImageLoadCell.self, forCellReuseIdentifier: reuseIdentifier)

    }
}

extension MainController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ImageLoadCell
        cell.delegate = self
        return cell
    }
}

extension MainController: ImageLoadCellDelegate {
    func handleButton(_ cell: ImageLoadCell) {
        tableView.reloadData()
    }
}
