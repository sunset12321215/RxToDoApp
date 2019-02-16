//
//  ModelTask.swift
//  RxToDoApp
//
//  Created by mac on 2/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    
    init() {
        self.title = ""
    }
    
    init(title: String) {
        self.title = title
    }
}
