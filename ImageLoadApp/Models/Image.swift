//
//  Image.swift
//  ImageLoadApp
//
//  Created by 모상현 on 2023/03/03.
//

import UIKit

struct Image {
    var id: String
    var name: String
    var urls: URL?
    init(dictionary: [String : Any],_ urls: URL) {
        self.id = dictionary["id"] as? String ?? "알 수 없음"
        self.name = dictionary["name"] as? String ?? "알 수 없음"
        self.urls = urls
    }
}
