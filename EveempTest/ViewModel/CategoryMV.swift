//
//  File.swift
//  EveempTest
//
//  Created by Nico Prasasty S on 20/01/20.
//  Copyright © 2020 Nico Prasasty Sembiring. All rights reserved.
//

import Foundation

class CategoryMV {
    let category = Category()
    
    var categoryCount: Int{
        get{
            return category.items.count
        }
    }
    
    var items: [String]{
        get{
            return category.items
        }
    }
}
