//
//  UITableViewExtension.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/6/27.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import UIKit


extension UITableView {
    
    public func register<T:UITableViewCell>(_: T.Type) where T:ReusableView {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func registerHeadCell<T:UITableViewHeaderFooterView>(_: T.Type) where T:ReusableView {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    public func updateCells(updateClosure:(UITableView)->()) {
        beginUpdates()
        defer {
          endUpdates()
        }
        updateClosure(self)
    }
    
    ///清除多余的分隔线
    public func clearOtioseSeparatorLine() {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        self.tableFooterView = footerView
    }
}

//phoneCollectionView.register(FlowFooterReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")

extension UICollectionView {
    public func register<T:UICollectionViewCell>(_: T.Type) where T:ReusableView {
        self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func registerHeader<T:UICollectionReusableView>(_: T.Type) where T:ReusableView {
        self.register(T.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    public func registerFooter<T:UICollectionReusableView>(_: T.Type) where T:ReusableView {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }
}






