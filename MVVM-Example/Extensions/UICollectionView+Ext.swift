//
//  UICollectionView+Ext.swift
//  MVVM-Example
//
//  Created by Fatih Kilit on 10.10.2022.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
