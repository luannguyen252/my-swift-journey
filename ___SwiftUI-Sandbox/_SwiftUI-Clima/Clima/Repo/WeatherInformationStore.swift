//
//  WeatherInformationStore.swift
//  Clima
//
//  Created by mohammad mugish on 27/01/21.
//

import Foundation
import RealmSwift


class WeatherInformationStore : ObservableObject{
    
    private var realm : Realm
    
    
    
    @Published var info = [WeatherInformation]()
    
    @Published var weatherAlert = WeatherAlerts()
    
    
    init(realm : Realm){
        
        self.realm = realm
        
        readWeatherInfoSavedData()
        readWeatherAlertSavedData()
        
    }
    

    func readWeatherInfoSavedData(){
        objectWillChange.send()
        let weatherResults = self.realm.objects(WeatherInformationDB.self).sorted(byKeyPath: "timeStamp", ascending: true)
        DispatchQueue.main.async {
            self.info = weatherResults.map(WeatherInformation.init)
        }
    }
    
    func readWeatherAlertSavedData(){
        
        let weatherAlertResuts = realm.objects(WeatherAlerts.self)
        DispatchQueue.main.async {
            self.weatherAlert = weatherAlertResuts.first ?? WeatherAlerts()
        }
        objectWillChange.send()
    }
    
    
    
    func getTempType() -> Bool{
        let tempResults = self.realm.objects(TypeOfTemp.self)
        let b = tempResults.first
        return b?.type ?? true
        
    }
    
    func saveTempType(type : Bool){
        
        do{
            let realm = try Realm()
            try realm.write{
                realm.create(

                    TypeOfTemp.self,
                    value: [
                        "id" : 0,
                        "type" : type
                    ],
                    update: .modified
                )

                print("Changed selected state\(type)")
            }

        }catch let error {
            print("error while saving the data in realm type of temp\(error.localizedDescription)")
        }
    }
    
    
    
    
    func saveWeatherAlerts(sender_name : String, event : String, start : Int64, end : Int64, _description : String, completion : (Bool) -> Void){
        
        do {
            let realm = try Realm()
            let weatherAlert = WeatherAlerts()
            weatherAlert.id = UUID().hashValue
            weatherAlert._description = _description
            weatherAlert.sender_name = sender_name
            weatherAlert.start = start
            weatherAlert.end = end
            weatherAlert.event = event
            
            try realm.write{
                realm.add(weatherAlert)
                completion(true)
            }
            
        }catch let error {
            completion(false)
            print("error" , error)
        }
    }
    
    func saveWeatherInfo(degree : String, atmophericPressure : String, humidity : String, status : String, timeStamp : Int64, windSpeed : String, image : String, completion : @escaping (Bool) -> Void) {
        
        
        do{
            let realm = try Realm()
            let weatherInfoDB = WeatherInformationDB()
            weatherInfoDB.id = UUID().hashValue
            weatherInfoDB.degree = degree
            weatherInfoDB.atmophericPressure = atmophericPressure
            weatherInfoDB.humidity = humidity
            weatherInfoDB.status = status
            weatherInfoDB.timeStamp = timeStamp
            weatherInfoDB.windSpeed = windSpeed
            weatherInfoDB.image = image
            
            try realm.write{
                realm.add(weatherInfoDB)
                completion(true)
            }
            
        }catch let error {
            completion(false)
            print("Error \(error.localizedDescription)")
        }
        
       
    }
    

    
    func deleteData(){
        
        objectWillChange.send()
        
        let weatherInfoObjectTodelete = realm.objects(WeatherInformationDB.self)
        let weatherAlertObjectTodelete = realm.objects(WeatherAlerts.self)
        
      
        do{
            
            let realm = try Realm()
            try realm.write{
                realm.delete(weatherInfoObjectTodelete)
                realm.delete(weatherAlertObjectTodelete)
            }
            
        }catch let error{
            print("No Data Exist (:")
            print(error.localizedDescription)
        }
    }
    

    
}







