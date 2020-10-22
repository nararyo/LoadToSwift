//
//  Swifter.swift
//  LoadToSwifter
//
//  Created by NR on 2020/09/28.
//  Copyright © 2020 nararyo. All rights reserved.
//

import Foundation

class Task {
    
    var name: String?
    var mention: String?
    var achievement: Double?
    
    init?(name: String, mention: String? = nil, achivement: Double = 1){
        self.name = name
    }
}
