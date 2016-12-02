//
//  ViewController.swift
//  ReactiveReSwift-PromiseKitExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import PromiseKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    let disposeBag = SubscriptionReferenceBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        disposeBag += mainStore.observable.subscribe { [weak self] store in
            self?.counterLabel.text = String(store.counter)
        }
    }
    
    // when either button is tapped, an action is dispatched to the store
    // in order to update the application state
    @IBAction func downTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch promises directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(PromiseKit.wrap { $0(AppAction.decrease, nil) })
    }
    
    @IBAction func upTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch promises directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(PromiseKit.wrap { $0(AppAction.increase, nil) })
    }
}

