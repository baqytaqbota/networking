//
//  AlbumsViewModel.swift
//  TableViewTutorial
//
//  Created by Акбота Бакыт on 15.11.2022.
//

import Foundation

final class AlbumsViewModel {
    var data = [AlbumModel]()
    
    func fetchAlbums(completion: (() -> ())?) {
        ServerManager.shared.fetchingAPIData(with: "https://picsum.photos/v2/list") { [weak self] result in
            self?.data = result
            
            completion?()
        }
    }
}
