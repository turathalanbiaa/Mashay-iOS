//
//  DateUtils.swift
//  Mashay
//
//  Created by AliMac on 10/23/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit

class DateUtils
{
    
    static let FIRST_TIME_DATE = "FIRST_TIME_DATE";
    static let DAY = "DAY";
    static let MONTH = "MONTH";
    static let YEAR = "YEAR";
    
    
    
    static func getTodayDate() -> Date
    {
        let gregorian = Calendar(identifier: .gregorian)
        let now = Date()
        var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let date = gregorian.date(from: components)!
        return date;
    }
    
    static func getFirstTimeDate() -> Date
    {
        let time = UserDefaults.standard.object(forKey: FIRST_TIME_DATE) as! Int;
        let fromDate = Date(milliseconds: time);
        
        let gregorian = Calendar(identifier: .gregorian)
        var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: fromDate)
        
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let date = gregorian.date(from: components)!
        
        
        return date;
    }
    
    static func saveFirstTimeDateIfNot()
    {
        let firstTimeDate = UserDefaults.standard.object(forKey: FIRST_TIME_DATE);
        if firstTimeDate == nil
        {
            let date = Date();
            UserDefaults.standard.set(Int(date.millisecondsSince1970), forKey: FIRST_TIME_DATE)
            UserDefaults.standard.synchronize();
        }
        
    }
    
}

extension Date
{
    var millisecondsSince1970:Int
    {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int)
    {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}

