//
//  DetailViewController.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import UIKit

class DetailViewController: UIViewController {

    private var currentCar: Cars?
    private var yeniDetay : CarDetail?
    private var interactor : CarsDetailInteractor = CarsDetailInteractor()
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = currentCar?.baslik
    setupUI()
    }
    
    func initialize(with car: Cars) {
        self.currentCar = car
    }
    func setupUI(){
        if let car = currentCar {
            interactor.fetchDetails(of: car, completion: {
                print("hello")
            })
        } else {
            print("girmedi :(")
        }
    }
        
    
}
