//
//  UIFactory.swift
//  SGWeatherApp
//
//  Created by Ravindran on 03/03/22.
//

import Foundation
import UIKit

struct UIFactory {
    
    static func getTableView(id accessibilityIdentifier: String, style: UITableView.Style, dataSource: UITableViewDataSource,
                             delegate: UITableViewDelegate, isAccessibilityElement: Bool = true) -> UITableView {
        
        let table = UITableView(frame: CGRect.zero, style: style)
        
        table.dataSource = dataSource
        table.delegate = delegate
        table.accessibilityIdentifier = accessibilityIdentifier
        table.cellLayoutMarginsFollowReadableWidth = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = UITableView.automaticDimension
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = .white
        
        return table
        
    }
    
    static func getLabel(id accessibilityIdentifier: String, isAccessibilityElement: Bool = true) -> UILabel {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0)
        label.accessibilityIdentifier  = accessibilityIdentifier
        label.isAccessibilityElement = isAccessibilityElement
        
        return label
        
    }
    
    static func getImageView(id accessibilityIdentifier: String, contentMode: UIView.ContentMode = .scaleAspectFit,
                             image: UIImage? = nil, translatesAutoresizingMaskIntoConstraints: Bool = false,
                             isAccessibilityElement: Bool = true) -> UIImageView {
        
        let imageView = UIImageView(image: image)
        
        imageView.contentMode = contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        imageView.accessibilityIdentifier = accessibilityIdentifier
        imageView.isAccessibilityElement = isAccessibilityElement
        
        return imageView
        
    }
    
    static func getActivityIndicator(id accessibilityIdentifier: String, style: UIActivityIndicatorView.Style = .large,
                                     isAccessibilityElement: Bool = true) -> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView(style: style)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.accessibilityIdentifier = accessibilityIdentifier
        activityIndicator.isAccessibilityElement = isAccessibilityElement
        activityIndicator.stopAnimating()
        
        return activityIndicator
        
    }
    
    static func getCollectionView(id accessibilityIdentifier: String, dataSource: UICollectionViewDataSource,
                                  delegate: UICollectionViewDelegate, isAccessibilityElement: Bool = false) -> UICollectionView {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        collectionView.accessibilityIdentifier = accessibilityIdentifier
        collectionView.isAccessibilityElement = isAccessibilityElement
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = false
        
        return collectionView
        
    }
    
}
