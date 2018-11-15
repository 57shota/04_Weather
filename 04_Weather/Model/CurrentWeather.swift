//
//  CurrentWeather.swift
//  04_Weather
//
//  Created by shota ito on 29/09/2018.
//  Copyright © 2018 shota ito. All rights reserved.
//

import Foundation

class CurrentWeather{
    let temperature: Double?
    let humidity: Double?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys {
        // if keys below change, it is hard work to change everything.
        // but it is okay to chenge only this "temperature"
        static let temperature = "temperature"
        static let humidity = "humiditiy"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        
    }
    
    init(weatherDictionary: [String: Any]){
        temperature = weatherDictionary[WeatherKeys.temperature] as? Double
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Int{
            humidity = Double(humidityDouble * 100)
        }else{
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double{
            precipProbability = Int(precipDouble * 100)
        }else{
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        
    }
    
    /*
 
     time: 1538202561,
     summary: "Partly Cloudy",
     icon: "partly-cloudy-night",
     nearestStormDistance: 6,
     nearestStormBearing: 208,
     precipIntensity: 0,
     precipProbability: 0,
     temperature: 60.02,
     apparentTemperature: 60.02,
     dewPoint: 52.32,
     humidity: 0.76,
     pressure: 1011.05,
     windSpeed: 6.7,
     windGust: 12.02,
     windBearing: 239,
     cloudCover: 0.36,
     uvIndex: 0,
     visibility: 9.17,
     ozone: 282
     
    */
    
    
    
}
