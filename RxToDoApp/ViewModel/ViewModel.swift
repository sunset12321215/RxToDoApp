//
//  ViewModel.swift
//  RxToDoApp
//
//  Created by mac on 2/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel: NSObject {
    var todoInput = BehaviorRelay<String>(value: "Init1")
    
    var todoArray = BehaviorRelay<[String]>(value: ["Init2"])
    
    override init() {
        super.init()
        todoInput.asObservable()
            .subscribe(onNext: { (text) in
                self.todoArray.accept(self.todoArray.value + [text])
            })
    }
}
