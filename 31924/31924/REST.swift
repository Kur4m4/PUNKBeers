//
//  REST.swift
//  31924
//
//  Created by user132969 on 12/1/17.
//  Copyright © 2017 user132969. All rights reserved.
//

import Foundation

class REST {
    
    static let basePath = "https://api.punkapi.com/v2/beers"
    
    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    static func loadBeers(onComplete: @escaping ([Beer]?) -> Void) {
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        var beers: [Beer] = []
                        for item in json {
                            let image = item["image_url"] as! String
                            let name = item["name"] as! String
                            let tagline = item["tagline"] as! String
                            let alcoholVolume = item["abv"] as! Double
                            let bitternessScale = item["ibu"] as! Double
                            let description = item["description"] as! String
                            let beer = Beer(image: image, name: name, tagline: tagline, alcoholVolume: alcoholVolume, bitternessScale: bitternessScale, description: description)
                            beers.append(beer)
                        }
                        onComplete(beers)
                    } catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                } else {
                    print("Erro no servidor:", response.statusCode)
                    onComplete(nil)
                }
            }
        }.resume()
    }
}
