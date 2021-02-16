//
//  CarDetailViewController.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import UIKit


class CarDetailViewController: UIViewController {
    
  //  private var detail : [CarDetail] = []
    private var interactor : CarsDetailInteractor = CarsDetailInteractor()
    private var currentCar: Cars?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupUI()
        
    }
    
    func initialize(with car: Cars?) {
        self.currentCar = car
    }

   
    private func setupUI(){
        interactor.fetchDetails(of: currentCar!, completion: {})
        
    }
    private func se2(of car: CarDetail){
        self.titleLabel.text = car.baslik
    }
    
   /*
    func fetchDetails(of car: Cars, completion: (()->Void)?){
        CarsWebServices.service.loadCarDetail(of: car, success: { detail in
            self.detail = detail
        }, fail:{ error in
            completion?()
            })
        }
 */
}
