//
//  API_Handler.swift
//  Clima
//
//  Created by mohammad mugish on 27/01/21.
//

import Foundation
import Alamofire
import SwiftyJSON

let API_Key = "d6f21f9940bc17f59e9f72b9ec29386c"
let url = "https://api.openweathermap.org/data/2.5/onecall?lat=12.9716&lon=77.5946&appid=\(API_Key)&units=metric"

class API_Handler : ObservableObject{
  

    @Published var weatherInfoStore : WeatherInformationStore
   
    
    init(weatherInfoStore : WeatherInformationStore){
        
        self.weatherInfoStore = weatherInfoStore
        
    }
  
    
    //MARK: This function will return true only if current date would't match with already saved date .
    private func isDateChaged() -> Bool{
        
        let currentDate = Date()
        
        guard let oldDate = UserDefaults.standard.object(forKey: "date") as? Date else {
            print("No date found -> callAPIAndSaveData")
            return true
        }

        if getDateAsStringFormat(date: oldDate) != getDateAsStringFormat(date: currentDate){
            
            print("date changed -> callAPIAndSaveData")
            return true
        }else{
            return false

        }
    }

    
    func callAPIAndSaveData(){
//        if isDateChaged(){
            weatherInfoStore.deleteData()
            requestWeatherInfo(url: URL(string : url)!, method: .get) { (result) in
                if result{
                    print("Data Saved after API Call")
                    self.weatherInfoStore.readWeatherInfoSavedData()
                    self.weatherInfoStore.readWeatherAlertSavedData()
                    
                    let date = Date()
                    UserDefaults.standard.set(date, forKey: "date")
                }else{
                    print("Error")
                }
            }
//        }else{
//            print("data already saved for today")
//        }
    }
    
    
    
    private func requestWeatherInfo(url : URL , method: HTTPMethod, completion : @escaping (Bool) -> Void){
        
        
        
        AF.request(url , method: method).validate().responseData { (response) in
            switch response.result {
            case .success(let value):
                let json = try! JSON(data: value)
                
                self.saveAllData(data: json)

                completion(true)
                
            case .failure(let error):
                print("Data receved failed , : \(error)")
                completion(false)
            }
        }
            

    }
    
    private func saveAllData(data : JSON){
        self.saveCurrentWeatherInfo(jsonData: data)
        self.saveForecastWeatherInfo(jsonData: data)
        self.saveWeatherAlertInfo(jsonData: data)
    }
   
    
    
    
    private func saveWeatherAlertInfo(jsonData : JSON){


        let weatherAlerts = jsonData["alerts"].array

        guard let weatherAlert = weatherAlerts else {
            return
        }

        self.weatherInfoStore.saveWeatherAlerts(sender_name: weatherAlert[0]["sender_name"].string ?? "", event: weatherAlert[0]["event"].string ?? "", start: weatherAlert[0]["start"].int64 ?? Int64(0.0), end: weatherAlert[0]["end"].int64 ?? Int64(0.0), _description: weatherAlert[0]["description"].string ?? "") { (result) in
            if result{
                print("saved")
            }else{
                print("Error while saving")
            }
        }
        
    }
    
    private func saveForecastWeatherInfo(jsonData : JSON){
        
        let eightDaysData = jsonData["daily"].array!
        for i in 0..<eightDaysData.count{
            
            if i == 0 {
                continue
            }
            
            let imageName = self.getImageName(state: eightDaysData[i]["weather"].array![0]["id"].int!)
            
            self.weatherInfoStore.saveWeatherInfo(degree: "\(eightDaysData[i]["temp"]["day"].int!)°", atmophericPressure: "\(eightDaysData[i]["pressure"])", humidity: "\(eightDaysData[i]["humidity"])", status: "\(eightDaysData[i]["weather"].array![0]["main"])", timeStamp: eightDaysData[i]["dt"].int64Value, windSpeed: "\(eightDaysData[i]["wind_speed"])", image: "\(imageName)") { (result) in
                if result{
                    //Saving all data
                }else{
                    print("error while saving")
                }
            }
        }
    }
    
    
    private func saveCurrentWeatherInfo(jsonData : JSON){
        
        let todayUpdatedData = jsonData["current"]
        
        let imageName = self.getImageName(state: todayUpdatedData["weather"].array![0]["id"].int!)
        print("\(imageName)")
        
        self.weatherInfoStore.saveWeatherInfo(degree: "\(todayUpdatedData["temp"].int!)°", atmophericPressure: "\(todayUpdatedData["pressure"])", humidity: "\(todayUpdatedData["humidity"])", status: "\(todayUpdatedData["weather"].array![0]["main"])", timeStamp: todayUpdatedData["dt"].int64Value, windSpeed: "\(todayUpdatedData["wind_speed"])", image: "\(imageName)") { (result) in
            if result{
                //Saving all data
            }else{
                print("error while saving")
            }
        }
    }
    
    
    private func getImageName(state :Int) -> String{
        var imageName : String {
                switch state {
                case 200...232:
                    return "cloud.bolt.fill"
                case 300...321:
                    return "cloud.drizzle.fill"
                case 500...531:
                    return "cloud.rain.fill"
                case 600...622:
                    return "cloud.snow.fill"
                case 701...781:
                    return "cloud.fog.fill"
                case 800 :
                    return "sun.max.fill"
                case 801...804:
                    return "cloud.bolt.fill"
                default:
                    return "cloud.fill"
                }
            }
        return imageName
    }
    
    private func getDateAsStringFormat(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
