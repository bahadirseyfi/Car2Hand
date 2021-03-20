//
//  DetailViewController.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import UIKit
import WebKit
import CoreLocation

class DetailViewController: UIViewController {

    private var currentCar: Cars?
    private var detaylar : CarDetail?
    private var interactor : CarsDetailInteractor = CarsDetailInteractor()
    @IBOutlet weak var titleLabel: UILabel!
    var coordinate: CLLocationCoordinate2D?
    var adress: String = ""
   
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var markaLabel: UILabel!
    @IBOutlet weak var motorType: UILabel!
    @IBOutlet weak var gasType: UILabel!
    @IBOutlet weak var vitesLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        findingCoordinate()
    }
    
    func findingCoordinate(){
        guard let cityName = currentCar?.location?.cityName else { return }
        guard let townName = currentCar?.location?.townName else { return }
        
        let adress = cityName + ", " + townName
        self.adress = adress
        
        getCoordinateFrom(address: adress) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            
            // don't forget to update the UI from the main thread
            DispatchQueue.main.async {
                //print(adress, "Location:", coordinate)
                
                self.coordinate = coordinate
            }

        }
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }

    @IBAction func ilansahibiClicked(_ sender: UIButton) {

       
    }
    
    @IBAction func locationBtnClicked(_ sender: UIButton) {
        
    }
    
    
    func initialize(with car: Cars) {
        self.currentCar = car
    
    }
    
    
    func setupUI(){
        
        if let car = currentCar {
            interactor.fetchDetails(of: car, completion: { [self] in
                self.titleLabel.text = self.interactor.detail?.category?.name
                
                
                self.carImage.setupImage(by: self.interactor.detail!.image![0], imageSize: "800x600")
                self.priceLabel.text = String((self.interactor.detail?.fiyat!.formattedWithSeparator)!) + " TL"
      
                // İNTERNET BAĞLANTISI OLMAYINCA !!!!
                let motorWords = (self.interactor.detail?.model_ismi2?.wordList[1])! + "." + (self.interactor.detail?.model_ismi2?.wordList[2])! + " " + (self.interactor.detail?.model_ismi2?.wordList[3])!
                self.motorType.text = motorWords
                
                if let brandName = self.interactor.detail?.category?.name {
                    self.markaLabel.text = brandGenerator(sentence: brandName)
                }
            
                self.modelLabel.text = (self.interactor.detail?.model_ismi2?.wordList[0])!
                self.yearLabel.text = self.interactor.detail?.properties[2].value
                self.vitesLabel.text = self.interactor.detail?.properties[3].value
                self.gasType.text = self.interactor.detail?.properties[4].value
                let kmInt = Int((self.interactor.detail?.properties[0].value)!)
                self.kmLabel.text = String(kmInt!.formattedWithSeparator)
                let urlString = self.interactor.detail?.text
                self.webView.loadHTMLString(urlString!, baseURL: nil)
            })
            
        } else {
            print("girmedi :(")
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 200 - (scrollView.contentOffset.y + 200)
        let h = max(60, y)
        let rect = CGRect(x: 0, y: 0, width: view.bounds.width, height: h)
        
        carImage.frame = rect
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toLocationVC" {
            let vc = segue.destination as! PersonLocationViewController
            vc.shared_coordinate = coordinate
            vc.shared_city_town_name = adress
        } else {
        let selectVC = segue.destination as? PersonDetailViewController
        selectVC?.name = (interactor.detail?.userInfo?.nameSurname)!
        selectVC?.phone = (interactor.detail?.userInfo?.phone)!
        }
    }
    
    
    func brandGenerator(sentence: String) -> String {
        var sentences = sentence
        let wordToRemove = "otomobil/"

        if let range = sentences.range(of: wordToRemove) {
            sentences.removeSubrange(range)
        }
        var brandName = ""
        for each in sentences {
            if each != "-" {
                brandName.append(each)
            } else {
                break
            }
        }
        brandName = brandName.capitalized
        return brandName
    }
    
}


