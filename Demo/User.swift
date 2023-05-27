//
//  User.swift
//  Demo
//
//  Created by CREST on 24/05/23.
//


// login in time
// to logout time

import Foundation




class Userdata {
   static func getData() -> [[String : Any]] {
        let jsonData : [[String : Any]] = [
            [
              "type" : "login",    //
              "userid" : "u1",
              "timestamp" :  "10-05-2023T01:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u1",
              "timestamp" :  "10-05-2023T02:00:00".toDate()
            ],
            
            [
              "type" : "login",    //
              "userid" : "u2",
              "timestamp" :  "27-05-2023T10:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u2",
              "timestamp" :  "27-05-2023T12:00:00".toDate()
            ],
            
            [
              "type" : "login",    //
              "userid" : "u3",
              "timestamp" :  "27-05-2023T10:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u3",
              "timestamp" :  "27-05-2023T11:00:00".toDate()
            ],
            
            [
              "type" : "login",    //
              "userid" : "u4",
              "timestamp" :  "27-05-2023T12:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u4",
              "timestamp" :  "27-05-2023T13:00:00".toDate()
            ],
            
            [
              "type" : "login",    //
              "userid" : "u5",
              "timestamp" :  "27-05-2023T12:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u5",
              "timestamp" :  "27-05-2023T13:00:00".toDate()
            ],
            [
              "type" : "login",    //
              "userid" : "u6",
              "timestamp" :  "27-05-2023T12:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u6",
              "timestamp" :  "27-05-2023T13:00:00".toDate()
            ],
            [
              "type" : "login",    //
              "userid" : "u7",
              "timestamp" :  "27-05-2023T13:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u7",
              "timestamp" :  "27-05-2023T14:00:00".toDate()
            ],
            [
              "type" : "login",    //
              "userid" : "u7",
              "timestamp" :  "27-05-2023T14:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u7",
              "timestamp" :  "27-05-2023T15:00:00".toDate()
            ],
            [
              "type" : "login",    //
              "userid" : "u8",
              "timestamp" :  "27-05-2023T14:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u8",
              "timestamp" :  "27-05-2023T15:00:00".toDate()
            ],
            [
              "type" : "login",    //
              "userid" : "u9",
              "timestamp" :  "27-05-2023T14:00:00".toDate()
            ],
            [
              "type" : "logout",    //
              "userid" : "u9",
              "timestamp" :  "27-05-2023T15:00:00".toDate()
            ],
           
        ]
        
        
        return jsonData
    }
}
