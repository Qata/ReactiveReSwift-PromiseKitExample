//
//  ReactiveReSwiftBridge.swift
//  ReactiveReSwift-PromiseKitExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import ReactiveReSwift
import PromiseKit

extension Promise: StreamType {
    public typealias ValueType = T
    public typealias DisposableType = DisposableFake
    
    public func subscribe(_ function: @escaping (T) -> Void) -> DisposableFake? {
        _ = self.then(execute: function)
        return nil
    }
}

public struct DisposableFake: SubscriptionReferenceType {
    public func dispose() {}
}
