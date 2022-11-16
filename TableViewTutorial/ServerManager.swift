//
//  ServerManager.swift
//  TableViewTutorial
//
//  Created by Акбота Бакыт on 15.11.2022.
//

import Foundation
import UIKit

class ServerManager {
    public static var shared = ServerManager()
    
    func fetchingAPIData(with urlString: String, completion: @escaping ([AlbumModel]) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                do {
                    let decodedData = try JSONDecoder().decode([ImageData].self, from: data!)
                    
                    var result: [AlbumModel] = []
                    
                    for imageResponse in decodedData {
                        if let downloadUrl = imageResponse.download_url,
                           let author = imageResponse.author,
                           let url = URL(string: downloadUrl),
                           let imageData = try? Data(contentsOf: url),
                           let loadedImage = UIImage(data: imageData) {
                            result.append(AlbumModel(author: author, image: loadedImage))
                        }
                    }
            
                    
                    completion(result)
                } catch {
                    print("Parsing error")
                }
            }
            task.resume()
        }
    }
}
