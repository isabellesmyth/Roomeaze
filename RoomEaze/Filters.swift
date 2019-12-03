//
//  Filters.swift
//  
//
//  Created by Isabelle Smyth on 12/3/19.
//

import Foundation


class Filters {
    var classYear: Int
    var gender: String = ""
    var campus: String = ""
    var groupSize: Int
    var spotsOpen: String
    
    
    init(classYear: Int, gender: String, campus: String, groupSize: Int, spotsOpen: String) {
        self.classYear = classYear
        self.gender = gender
        self.campus = campus
        self.groupSize = groupSize
        self.spotsOpen = spotsOpen
    }
}
