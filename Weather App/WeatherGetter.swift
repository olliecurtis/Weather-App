//
//  WeatherGetter.swift
//  Weather App
//
//  Created by Oliver Curtis on 23/05/2020.
//  Copyright © 2020 Oliver Curtis. All rights reserved.
//

import Foundation

class WeatherGetter {

  private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
  private let openWeatherMapAPIKey = "YOUR API KEY HERE"

  func getWeather(city: String) {
    
    // This is a pretty simple networking task, so the shared session will do.
    let session = URLSession.shared
    
    let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!
    var urlRequest = URLRequest(url:weatherRequestURL)
    
    // The data task retrieves the data.
    let dataTask = session.dataTask(with: urlRequest) {
      (data: NSData?, response: URLResponse?, error: NSError?) in
      if let error = error {
        // Case 1: Error
        // We got some kind of error while trying to get data from the server.
        print("Error:\n\(error)")
      }
      else {
        // Case 2: Success
        // We got a response from the server!
        print("Data:\n\(data!)")
      }
    }
    
    // The data task is set up...launch it!
    dataTask.resume()
  }
  
}
