//
//  AchievementValues.swift
//  RunKeeper Trophy
//
//  Created by Tinker on 2021-10-03.
//

import Foundation

class AchievementValues{
    
    let headerTitle = ["Persoanl Records", "Virtual Races"]
    
    let pR_title_score: [String:String] = ["Longest Run":"00:00",
                          "Highest Elevation":"2095 ft",
                          "Fastest 5K":"00:00",
                          "10K":"00:00:00",
                          "Half Marathon":"00:00",
                          "Marathon":"Not Yet"]
    
    let vR_title_score: [String:String] = ["Virtual Half Marathon Race":"00:00",
                          "Tokyo-Hakone Ekiden 2020":"00:00:00",
                          "Virtual 10K Race":"00:00:00",
                          "Hakone Ekiden":"00:00:00",
                          "Mizuno Singapore Ekiden 2015":"00:00:00",
                          "Virtual 5K Race":"23:07"]
    
    func getPRIconNamefromTitle(title: String) -> String {
        switch title{
        case "Longest Run": return "longest_run"
        case "Highest Elevation": return "highest_elevation"
        case "Fastest 5K": return "fastest_5k"
        case "10K": return "fastest_10k"
        case "Half Marathon": return "fastest_half_marathon"
        case "Marathon": return "fastest_marathon"
        default: return ""
        }
    }
    
    func getVRIconNamefromTitle(title: String) -> String {
        switch title{
        case "Virtual Half Marathon Race": return "virtual_half_marathon_race"
        case "Tokyo-Hakone Ekiden 2020": return "tokyo_kakone_ekiden"
        case "Virtual 10K Race": return "virtual_10k_race"
        case "Hakone Ekiden": return "hakone_ekiden"
        case "Mizuno Singapore Ekiden 2015": return "mizuno_singapore_ekiden"
        case "Virtual 5K Race": return "virtual_5k_race"
        default: return ""
        }
    }
    
    func getPRTitleArray() -> [String] {
        var pRTitleArray: [String] = []
        for key in pR_title_score{
            pRTitleArray.append(key.key)
        }
        return pRTitleArray
    }
    
    func getVRTitleArray() -> [String] {
        var vRTitleArray: [String] = []
        for key in vR_title_score{
            vRTitleArray.append(key.key)
        }
        return vRTitleArray
    }
    
    func getPRScore(title: String) -> String {
        let pRScore = pR_title_score[title]!
        return pRScore
    }
    
    func getVRScore(title: String) -> String {
        let vRScore = vR_title_score[title]!
        return vRScore
    }
    
    func getActiveNum(dic_title_score: [String:String]) -> Int {
        var activeNum = 0
        for score in dic_title_score{
            if (score.value != "Not Yet"){
                activeNum += 1
            }
        }
        return activeNum
    }
    
    
}

