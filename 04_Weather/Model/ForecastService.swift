//
//  ForecastService.swift
//  04_Weather
//
//  Created by shota ito on 29/09/2018.
//  Copyright © 2018 shota ito. All rights reserved.
//

import Foundation

class ForecastService{
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    // forecastBaseURL/forecastAPIKey/latitude, longitude
    
    init(APIKey: String){
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void){
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)" ){
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSONFromURL ({ (jsonDictionary) in
                // TODO: some how parse jsonDictionary into a swift weather object
                
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: Any]{
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                }else{
                    completion(nil)
                }
            })
        }


    }
}




