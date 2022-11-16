//
//  ImageData.swift
//  TableViewTutorial
//
//  Created by Акбота Бакыт on 15.11.2022.
//

import Foundation
import UIKit

struct ImageData: Decodable {
    let author: String?
    let download_url: String?
}

struct AlbumModel {
    let author: String
    let image: UIImage
}
