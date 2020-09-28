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
    var ahievement: Int?
    
    init?(name: String, mention: String? = nil, achivement: String? = nil){
        self.name = name
    }
}
