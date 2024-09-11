//
//  Reusable.swift
//  MyHabits
//
//  Created by Matvey Krasnov on 11.9.24..
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

extension UICollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
