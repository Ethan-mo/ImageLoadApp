//
//  ImageAPI.swift
//  ImageLoadApp
//
//  Created by 모상현 on 2023/03/02.
//

import UIKit

struct Service {
    static let shared = Service()
    func loadImage(_ imageView: UIImageView,_ progressView: UIProgressView, completion:@escaping(Image) -> Void) {
        progressView.progress = 0.0
        let accessKey = "R2NV3QtFktacgl7anhF5gxJ0N-IZbKvuzwn9bvnSckA"
        let apiUrl = "https://api.unsplash.com/photos/random"
        guard let url = URL(string: apiUrl) else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response")
                return
            }
            
            guard let data = data else {
                print("Error: No data")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                guard let imageUrlString = json?["urls"] as? [String: Any], let imageUrl = imageUrlString["regular"] as? String else {
                    print("Error: Invalid JSON format")
                    return
                }
                
                guard let url = URL(string: imageUrl) else {
                    print("Error: Invalid image URL")
                    return
                }
                DispatchQueue.main.async {
                    imageView.load(url: url) { (success) in
                        if success {
                            progressView.setProgress(1.0, animated: true)
                            completion(Image(dictionary: json!, url))
                        }
                    }
                }
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
