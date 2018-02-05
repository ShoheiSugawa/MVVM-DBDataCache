//
// Created by Hikaru Wada on 2017/04/10.
// Copyright (c) 2017 poipoi inc. All rights reserved.
//

import UIKit

public protocol CellNibable: Nibable {
    static var identifier: String { get }
}

public extension CellNibable where Self: UIView {
    static var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UICollectionReusableView: CellNibable {}
extension UITableViewCell: CellNibable {}

