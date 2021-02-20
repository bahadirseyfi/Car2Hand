//
//  DetailViewController.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    private var currentCar: Cars?
    private var detaylar : CarDetail?
    private var interactor : CarsDetailInteractor = CarsDetailInteractor()
    @IBOutlet weak var titleLabel: UILabel!

   
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var markaLabel: UILabel!
    @IBOutlet weak var motorType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
      
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
            interactor.fetchDetails(of: car, completion: {
                self.titleLabel.text = self.interactor.detail?.category?.name
                
                
                self.carImage.setupImage(by: self.interactor.detail!.image![0], imageSize: "800x600")
                self.priceLabel.text = String((self.interactor.detail?.fiyat!.formattedWithSeparator)!) + " TL"
      
                // İNTERNET BAĞLANTISI OLMAYINCA !!!!
                let motorWords = (self.interactor.detail?.model_ismi2?.wordList[1])! + "." + (self.interactor.detail?.model_ismi2?.wordList[2])! + " " + (self.interactor.detail?.model_ismi2?.wordList[3])!
                
                self.motorType.text = motorWords
                self.markaLabel.text = "bmw"
                self.modelLabel.text = (self.interactor.detail?.model_ismi2?.wordList[0])!
                
                let urlString = self.interactor.detail?.text
                self.webView.loadHTMLString(urlString!, baseURL: nil)
            })
            
        } else {
            print("girmedi :(")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectVC = segue.destination as? PersonDetailViewController
        selectVC?.name = (interactor.detail?.userInfo?.nameSurname)!
        selectVC?.phone = (interactor.detail?.userInfo?.phone)!
    }
    
}


