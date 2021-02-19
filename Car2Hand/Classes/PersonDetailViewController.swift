//
//  PersonDetailViewController.swift
//  Car2Hand
//
//  Created by bahadir on 19.02.2021.
//

import UIKit


class PersonDetailViewController: UIViewController {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var name = ""
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        nameLabel.text = name
        phoneLabel.text = phone
        
    }
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

