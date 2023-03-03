//
//  Image.swift
//  ImageLoadApp
//
//  Created by 모상현 on 2023/03/02.
//

import Foundation
struct Image {
    var url: String
    var size: CGSize
    var type: ImageType
    var name: String
    var metaInfo: [String: Any]
}

enum ImageType {
    case jpeg
    case png
    case gif
}
