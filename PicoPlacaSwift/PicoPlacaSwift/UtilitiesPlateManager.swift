//
//  UtilitiesPlateManager.swift
//  PicoPlacaSwift
//
//  Created by Andres Efrain Chango Macas on 4/23/18.
//  Copyright © 2018 Andres Efrain Chango Macas. All rights reserved.
//

import Foundation

class UtilitiesPlateManager {
    
    func plateValidator(plate : String) -> Bool{
        let plateNumberRegEx = "^[A-Z&&[^DF]]{1}[A-Z]{2}[0-9]{3,4}"
            let isPlateNumber = NSPredicate(format:"SELF MATCHES %@", plateNumberRegEx)
            return isPlateNumber.evaluate(with: plate)
    }
    
    func getLastNumberofPlate(plate:String)-> Int{
        
        let lastChar = String(describing: plate.last!)
        let lastNumber = Int(lastChar)!
        return lastNumber
    }
    
    func getDayusingDate(date: String) -> Int{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddMMyyyy"
        let dateConverter = dateFormatter.date(from: date)
        let weekday = Calendar.current.component(.weekday, from: dateConverter!)
        return weekday
    }
    func isValidDate(date: String) -> Bool {
        var response = false
        if (date != ""){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "ddMMyyyy"
            if dateFormatter.date(from: date) != nil {
                response = true
            } else {
                response = false
            }
        }else{
             response = false
        }
        
        return  response
    }
    
    func isValidTime(time: String) -> Bool {
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            if dateFormatter.date(from: time) != nil {
                return true
            } else {
                return false
            }
   
    }
    
    func getDayForPicoPlaca(lastNumber: Int)-> Int{
        
        var response = 0
        switch (lastNumber) {
        case 1:
            response = 2
            break;
        case 2:
            response = 2
            break;
        case 3:
            response = 3
            break;
        case 4:
            response = 3
            break;
            
        case 5:
            response = 4
            break;
        case 6:
            response = 4
            break;
        case 7:
            response = 5
            break;
        case 8:
            response = 5
            break;
        case 9:
            response = 6
            break;
        case 0:
            response = 6
            break;
       
        default:
            response = 0
            break;
            
            
        }
        
       return response
        
    }
    
    
    func validatePicoPlacaHour(time: String) -> Bool{
        var timePicoPlacaResponse = false
        if(self.isValidTime(time: time)){
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let timeConverter = dateFormatter.date(from: time)
            let startTime = dateFormatter.date(from: "07:00")
            let endTime = dateFormatter.date(from: "09:30")
            let startAfternoomTime = dateFormatter.date(from: "16:00")
            let endAfternoomTime = dateFormatter.date(from: "19:30")
            
            if(self.validateHour(start:startTime! , end: endTime!, date: timeConverter!) ||  self.validateHour(start: startAfternoomTime!, end: endAfternoomTime!, date: timeConverter!)){
                timePicoPlacaResponse = true
            }
        }
        return timePicoPlacaResponse
    }
    
    func validateHour(start: Date , end : Date , date: Date) -> Bool{
        if(date.compare(start) == .orderedDescending  && date.compare(end) == .orderedAscending || date.compare(start) == .orderedSame || date.compare(end) == .orderedSame){
            return true
        }else{
        return false
        }
        
    }
    
    func validatePicoPlacaDay(date: String , plate : String)-> Bool{
       var response = false
        if(self.isValidDate(date: date)){
            if(self.getDayusingDate(date: date) == getDayForPicoPlaca(lastNumber: self.getLastNumberofPlate(plate: plate))){
                response = true
                
            }
        }
        return response
        
    }
    
    func validatePicoPlacaAllow(plate: String, date: String , time: String) -> Bool{
        var response = false
        if(self.validatePicoPlacaDay(date: date, plate: plate) && self.validatePicoPlacaHour(time: time)){
            response = true
            
        }
        return response
        
        
    }

    

    
}
