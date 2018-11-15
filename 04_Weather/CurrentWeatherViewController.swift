//
//  CurrentWeatherViewController.swift
//  04_Weather
//
//  Created by shota ito on 30/09/2018.
//  Copyright © 2018 shota ito. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var temperatureScaleLebal: UILabel!
    
    // testing data
    let forecastAPIKey = "7e7fd4de797dc79348fd4cbd3881ffce"
    
    // get values and used below
    let coordinate: (lat: Double, long: Double) = (-37.8136,144.9631)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            
            // off the main queue
            if let currentWeather = currentWeather{
                
                // rule: all UI code must happen on the main queue
                // to do: get back to the main queue
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature{
                        let celsiusTemp = Int(round((temperature - 32) * 5 / 9))
                        self.temperatureLabel.text! = "\(celsiusTemp)"
                            
                    }else{
                        self.temperatureLabel.text! = "-"
                    }
                }
                
            }
        }
    }
}
