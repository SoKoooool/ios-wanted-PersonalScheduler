//
//  Obervable.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/27.
//

import Foundation

final class Observable<T> {
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(completion: @escaping (T) -> Void) {
        completion(value)
        listener = completion
    }
}
