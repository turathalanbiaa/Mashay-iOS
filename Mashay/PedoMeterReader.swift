//
//  PedoMeterReader.swift
//  Mashay
//
//  Created by AliMac on 10/23/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit
import CoreMotion

class PedoMeterReader
{
    
    var todayLabel : UILabel;
    var totalLabel : UILabel;
    
    let pedoMeter = CMPedometer()

    init(todayLabel : UILabel , totalLabel : UILabel)
    {
        self.todayLabel = todayLabel;
        self.totalLabel = totalLabel;
    }
    
    func read()
    {
        if(CMPedometer.isStepCountingAvailable())
        {
            
            self.pedoMeter.queryPedometerData(from: DateUtils.getFirstTimeDate(), to: Date())
            {
                (data : CMPedometerData!, error) -> Void in
                DispatchQueue.main.async(execute:
                    {
                        () -> Void in
                        if(error == nil)
                        {
                            self.totalLabel.text = "\(data.numberOfSteps)"
                        }
                })
            }
            
            self.pedoMeter.startUpdates(from: DateUtils.getTodayDate())
            {
                (data: CMPedometerData!, error) -> Void in
                DispatchQueue.main.async(execute:
                    {
                        () -> Void in
                        if(error == nil){
                            self.todayLabel.text = "\(data.numberOfSteps)"
                        }
                })
            }
        }
        else
        {
            self.todayLabel.text = "غير معروف"
            self.totalLabel.text = "غير معروف"
        }
    }

}
