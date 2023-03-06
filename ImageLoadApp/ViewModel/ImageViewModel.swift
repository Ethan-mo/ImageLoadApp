//
//  ImageViewModel.swift
//  ImageLoadApp
//
//  Created by 모상현 on 2023/03/03.
//

import UIKit
import SDWebImage

struct ImageViewModel {
    var image: Image?
    var isButtonBackgroundColor: UIColor {
        return image != nil ? .systemBlue : .systemRed
    }
    var isLoadingImage: Bool {
        return image != nil ? true : false
    }
    var stateDownload: String {
        return image != nil ? "Success" : "Fail"
    }
    init(image: Image? = nil) {
        self.image = image
    }
}
