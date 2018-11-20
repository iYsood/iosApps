//
//  ViewController.swift
//  iOS_APPs
//
//  Created by Abdulrhman Alshmmri on 12/03/1440 AH.
//  Copyright © 1440 Abdulrhman Alshmmri. All rights reserved.
//

import UIKit

struct Apps: Decodable {
    let title: String
    let version: String
    let description: String
    let icon: String
    let plist: String
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "put url here"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                
                let app = try JSONDecoder().decode([Apps].self, from: data)
                print(app)
//                print(app[0].title)
                
            } catch let jsonErr {
                
                print("Error :", jsonErr)
                
            }
        }.resume()
        
    }
}

