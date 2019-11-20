//
//  WebServices.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/19/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

struct Resource<T>{
    let url : URL
    let parse: (Data) -> T?
}

final class WebService{
    
    func load<T>(resource:Resource<T>, completion: @escaping (T?) ->()){
        URLSession.shared.dataTask(with: resource.url){ data, result, error in
            
            if let data = data{
                
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
                
            }else{
                completion(nil)
            }
            
        }.resume()
    }
    
}
