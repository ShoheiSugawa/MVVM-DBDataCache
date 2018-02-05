//
// Created by Hikaru Wada on 2017/04/10.
// Copyright (c) 2017 poipoi inc. All rights reserved.
//

import UIKit

public protocol Nibable {
    associatedtype Instance

    static func makeFromNib(_ index: Int) -> Instance
    static var nib: UINib { get }
    static var nibName: String { get }
    static var nibView: UIView { get }
}

public extension Nibable where Self: UIView {
    static func makeFromNib(_ index: Int = 0) -> Self {
        return nib.instantiate(withOwner: self)[index] as! Self
    }
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
    
    static var nibView: UIView {
        return nib.instantiate(withOwner: self, options: [:])[0] as! UIView
    }
}
