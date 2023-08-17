//
//  Models.swift
//  CRUD Operation
//
//  Created by PRO M1 2020 8/256 on 05/08/23.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let message: String
    let data: [PostModel]
}

struct PostModel: Decodable {
    let id: Int
    let title: String
    let post: String
}
