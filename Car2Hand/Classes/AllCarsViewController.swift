//
//  AllCarsViewController.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import UIKit

class AllCarsViewController: UIViewController {
    
    private var interactor: AllCarsInteractor = AllCarsInteractor()
    private var currentCar: Cars?
    private var page = 10
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI(){
        interactor.fetchCars(page: page, completion: {
            self.tableView?.reloadData()
        })
    }

}
extension AllCarsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return interactor.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCarsCell") as! AllCarsCell
        let car = interactor.cars[indexPath.row]
        cell.setupUI(for: car)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.height {
            if page < 16 {
            page += 4
                interactor.fetchCars(page: page, completion: {
                    self.tableView?.reloadData()
                    })
            } else {
                print("Maksimum sorguya ulaştınız")
            }
        }
    }
}
