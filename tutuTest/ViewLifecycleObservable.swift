//
//  ViewLifecycleObservable.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol ViewLifecycleObservable {
    var onViewDidLoad: (() -> ())? { get set }
    var onViewWillAppear: (() -> ())? { get set }
}
