//
//  AllCarsViewController.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import UIKit

class AllCarsViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var interactor: AllCarsInteractor = AllCarsInteractor()
    private var page = 10
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var textFieldSearch: UITextField?
    
    var pickerData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI(){
        textFieldSearch?.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        activityIndicator.startAnimating()
        interactor.fetchCars(page: page, completion: {
            self.activityIndicator.stopAnimating()
            self.tableView?.reloadData()
        })
    }
    private func redirectTo(car: Cars) {
        self.view.endEditing(true)
        textFieldSearch?.text = nil
        let viewController = DetailViewController.instantiateViewController(with: "DetailViewController")
        viewController.initialize(with: car)
        print("car : ",car)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
extension AllCarsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return interactor.filteredCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCarsCell") as! AllCarsCell
        let car = interactor.filteredCar[indexPath.row]
        cell.setupUI(for: car)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = interactor.filteredCar[indexPath.row]
        redirectTo(car: car)
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
extension AllCarsViewController : UITextFieldDelegate {
    
    @objc func textFieldDidChanged(_ sender: UITextField) {
        interactor.filterAllCars(by: textFieldSearch?.text, completion: {
            self.tableView?.reloadData()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
