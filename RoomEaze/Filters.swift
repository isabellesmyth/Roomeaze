//
//  Filters.swift
//  
//
//  Created by Isabelle Smyth on 12/3/19.
//

import Foundation


class Filters {
    var classYear: Int
    var gender: Int
    var campus: Int
    var groupSize: Int
    var spotsOpen: Int
    
    
    init(classYear: Int, gender: Int, campus: Int, groupSize: Int, spotsOpen: Int) {
        self.classYear = classYear
        self.gender = gender
        self.campus = campus
        self.groupSize = groupSize
        self.spotsOpen = spotsOpen
    }
    convenience init(){
        self.init(classYear: 0, gender: 2, campus: 2, groupSize: 0, spotsOpen: 0)
    }
}
