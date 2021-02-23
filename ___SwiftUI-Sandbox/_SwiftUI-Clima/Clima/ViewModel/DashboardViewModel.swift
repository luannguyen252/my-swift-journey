//
//  ContentViewModel.swift
//  Clima
//
//  Created by mohammad mugish on 28/01/21.
//

import Foundation
import Combine




class DashboardViewModel :ObservableObject{
    
    private var repo : Repo
    @Published var weatherInfo = [WeatherInformation]()
    @Published var isTempCentigrade : Bool = true
    
    @Published var appInForground = true{
        didSet{
            if appInForground{
                repo.api_handler.callAPIAndSaveData()
            }
        }
    }
    
    
    @Published var notificationManager : NotificationManager
    
    @Published var selectedCard : WeatherInformation = WeatherInformation(id: UUID().hashValue, status: "Unknown", degree: "0", windSpeed: "0", atmophericPressure: "0", humidity: "0", timeStamp: 0, image: "")
    
  
    private var cancellables = Set<AnyCancellable>()

    init(weatherInfoStore : WeatherInformationStore, api_handler : API_Handler, notificationManager : NotificationManager){
        
        
        //MARK: Setup Notification Manager
        self.notificationManager = notificationManager
        notificationManager.requestForNotificationAuthorization()
        
        //MARK: Setup repo
        repo = Repo(weatherInfoStore: weatherInfoStore, api_handler: api_handler)
        weatherInfo = repo.weatherInfoStore.info
        
        //MARK: Setup selected Temp type
        isTempCentigrade = repo.weatherInfoStore.getTempType()
        if !isTempCentigrade{
            convertTemperatureToFahrenheit()
        }
        

        
        //MARK: This will execute whenever anything changed in weatherInfoStore
        self.repo.weatherInfoStore.objectWillChange.sink(receiveValue: { (value) in
            
            self.weatherInfo = self.repo.weatherInfoStore.info
            
            self.pushWeatherAlertNotification(data: self.repo.weatherInfoStore.weatherAlert)
            
        }).store(in: &cancellables)

    }
    

    func pushWeatherAlertNotification(data : WeatherAlerts){
        if data.event != ""{
            if notificationManager.notificationState == .authorized{
            notificationManager.showNotification(title: data.event, subtitle: data._description, timeInterval: 2, repeats: false)
            }
        }
    }
    
    
    func isSelectedTempCentigrade(type : Bool){
        isTempCentigrade = type
        print(type, "Changed on tap")
        repo.weatherInfoStore.saveTempType(type: type)
        if !type{
            convertTemperatureToFahrenheit()
        }else{
            convertTemperatureToCentigrade()
        }
        
    }

    func convertTemperatureToCentigrade(){
        
        for i in 0..<weatherInfo.count{
            let degree = weatherInfo[i].degree
            let newDegree = degree.prefix(degree.count - 1)
            
            print(newDegree, "Degree alpha")
            
            let centigerade = ((Double(Int(newDegree)!) - 32) / 1.8)
            weatherInfo[i].degree = "\(Int(centigerade))°"
           
            updateSelectedCard(degree: "\(Int(centigerade))°", uuid: weatherInfo[i].id)
            
        }
        
    }
    
    func updateSelectedCard(degree : String, uuid : Int){
        if selectedCard.id == uuid{
            selectedCard.degree = degree
        }
        
    }
    
    
    func convertTemperatureToFahrenheit(){
        
        for i in 0..<weatherInfo.count{
            let degree = weatherInfo[i].degree
            let newDegree = degree.prefix(degree.count - 1)
            
            print(newDegree, "Degree alpha")
            
            let fahrenheit = ((Double(Int(newDegree)!) * 1.8) + 32)
            weatherInfo[i].degree = "\(Int(fahrenheit))°"
            
            updateSelectedCard(degree: "\(Int(fahrenheit))°", uuid: weatherInfo[i].id)
        }
        
        
    }
    
    func convertTimestampToDate(timeStamp : Int64) -> String{
        
        
            let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let localDate = dateFormatter.string(from: date)
        
       
        return localDate
    }
    
    func testingDelete(){
        repo.weatherInfoStore.deleteData()
    }

}
