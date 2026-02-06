//
//  AssignmentItem.swift
//  Assignment Notebook
//
//  Created by Jaxson Werner on 2/4/26.
//

import Foundation
@Observable
class AssignmentItems {
    var items : [AssignmentItem] {
        didSet {
            if let encodeData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodeData, forKey: "data")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "data") {
            if let decodedData = try? JSONDecoder().decode([AssignmentItem].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
 }
