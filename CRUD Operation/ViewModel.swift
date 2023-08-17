//
//  ViewModel.swift
//  CRUD Operation
//
//  Created by PRO M1 2020 8/256 on 05/08/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [PostModel]()
    let prefixUrl = "http://localhost:3000"
    
    init() {
        fetchPosts()
    }
    
    // MARK: - retrive data
    func fetchPosts() {
        guard let url = URL(string: "\(prefixUrl)/post") else {
            print("Not found url!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    print("Raw data received:", String(data: data, encoding: .utf8) ?? "")
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
                
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - create data
    func createPosts(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/post") else {
            print("Not found url!")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
                
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - update data
    func updatePosts(id: Int, parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/post/\(id)") else {
            print("Not found url!")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // MARK: - delete data
    func deletePosts(id: Int, parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/post/\(id)") else {
            print("Not found url!")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("fetch json error: ", JsonError.localizedDescription)
            }
        }.resume()
    }
}
    
