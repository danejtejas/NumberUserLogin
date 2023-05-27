//
//  ViewController.swift
//  Demo
//
//  Created by CREST on 24/05/23.
//

import UIKit
import SwiftCharts


class ViewController: UIViewController {
    @IBOutlet weak var datePickerView: UIDatePicker!
    var userDataSet : [String : Any] = [:]
    @IBOutlet weak var barView: UIView!
    var chart : BarsChart?
    
    var selectedDate =  Date()
    
    let jsonData = Userdata.getData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Number Of User Login"
        
        confirgData()
        setupChart()
        datePickerView.date = selectedDate
    }
    
    func confirgData()  {
        for i in 0...jsonData.count-1 {
           let userDic =  jsonData[i]
           let userId = userDic["userid"] as! String
            
            if((userDataSet[userId]) != nil) {
                var dic = userDataSet[userId] as! [String : Any]
                if(userDic["type"] as! String == "login") {
                    dic["loginTime"] = userDic["timestamp"] as! Date
                }
                else {
                    dic["logoutTime"] = userDic["timestamp"] as! Date
                }
                userDataSet[userId] = dic
            }
            else {
                var dic : [String : Any] = [:]
                if(userDic["type"] as! String == "login") {
                    dic["loginTime"] = userDic["timestamp"] as! Date
                }
                else {
                    dic["logoutTime"] = userDic["timestamp"] as! Date
                }
                userDataSet[userId] = dic
                
            }
        }
    }
    

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        self.barView.viewWithTag(100)?.removeFromSuperview()
        chart = nil
        setupChart()
         
    }
    
    
   
    func filterDate(startTime : Int ) -> Double  {
        
       
       

        var count = 0
    
        for key in userDataSet.keys {
            
            let dic =  userDataSet[key] as! [String : Any]
            let loginTime = dic["loginTime"]  as! Date
            let logoutTime = dic["logoutTime"]  as! Date
            
            if loginTime.toString() ==  selectedDate.toString() {
                
                if loginTime.hours() <= startTime && logoutTime.hours() >= startTime {
                    count = count+1
                }
            }
        }
        
        return Double(count)
        
//     let filterData =   jsonData.filter { dic in
//         let date = dic["timestamp"] as! Date
//
//         if(date.day() == selectedDate.day() && date.year() == selectedDate.year() && date.month() == selectedDate.month() ) {
//
//             let hours = date.hours()
//
//             if(dic["type"] as! String == "login" &&  (startTime <= hours && endTime > hours) ) {
//                 return true
//             }
//
//         }
//
//         return false
//        }
//
//      print(filterData.count)
//      return  Double(filterData.count)
    }
    
 
    
    
    func setupChart()  {
        let chartConfig = BarsChartConfig(
            valsAxisConfig: ChartAxisConfig(from: 0, to: 100, by: 5)
        )

       
        var barsItem : [(String, Double)] = []
        

        for i in 0...23 {
            barsItem.append((("\(i)"), filterDate(startTime: i) ))
        }
//
        let chart = BarsChart(
            frame: barView.bounds,
            chartConfig: chartConfig,
            xTitle: "Hours",
            yTitle: "Number of login users",
            bars: barsItem,
            color: UIColor.red,
            barWidth: 5
        )
       
        chart.view.tag = 100
        self.barView.addSubview(chart.view)
        self.chart = chart
    }
    
    
}



extension Date {

    func toString() -> String {
        let df = DateFormatter()
        df.timeZone = TimeZone.current
        df.dateFormat = "ddMMyyyy"
        return df.string(from: self)
    }


    func year() -> Int {
        let df = DateFormatter()
        df.timeZone = TimeZone.current
        df.dateFormat = "yyyy"
        return Int(df.string(from: self))!
    }
    func month() -> Int {
        let df = DateFormatter()
        df.timeZone = TimeZone.current
        df.dateFormat = "MM"
        return Int(df.string(from: self))!
    }
    func day() -> Int {
        let df = DateFormatter()
        df.timeZone = TimeZone.current
        df.dateFormat = "dd"
        return Int(df.string(from: self))!
    }


    func hours() -> Int {
        let df = DateFormatter()
        df.timeZone = TimeZone.current
        df.dateFormat = "HH"
        return Int(df.string(from: self))!
    }
}

extension String {

    func toDate() -> Date {
        let df = DateFormatter()
        df.timeZone = TimeZone.current
        df.dateFormat = "dd-MM-yyyy'T'HH:mm:ss"
        return  df.date(from:self)!
    }
}
