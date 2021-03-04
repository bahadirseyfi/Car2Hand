//
//  HomeViewController.swift
//  Car2Hand
//
//  Created by bahadir on 4.03.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?

    
    var gasArray = [Gas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let article1 = Gas(brandName: "Shell", price: 12.7)
        let article2 = Gas(brandName: "Petrol Ofisi", price: 6.86)
        let article3 = Gas(brandName: "Lukoil", price: 3.44)
        let article4 = Gas(brandName: "Turkoil", price: 5.67)
        
        gasArray = [article1,article2,article3,article4]
        
    }
}


