//
//  Utilities.swift
//  TemplateProjectSwift
//
//  Created by Tedmob IMac on 10/19/15.
//  Copyright © 2015 Tedmob. All rights reserved.
//

import UIKit
import SystemConfiguration

class Utilities: NSObject {
    
    // MARK: Array
    func reverseArray(_ array:[AnyObject])->[AnyObject]{
        return array.reversed()
    }
    
    // MARK: Color
    func colorFromHex(_ hex: String) -> UIColor {
        var rgbValue: UInt32 = 0
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1
        scanner.scanHexInt32(&rgbValue)
        return UIColor(red: CGFloat(((rgbValue & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((rgbValue & 0xFF00) >> 8)) / 255.0, blue: CGFloat((rgbValue & 0xFF)) / 255.0, alpha: 1.0)
    }
    
    // MARK: Date
    func stringToDate(_ dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)
        return date!
    }
    
    func stringFromDate(_ date: Double) -> String {
        // let date = NSDate(timeIntervalSince1970: date)
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM d, H:mm a"
        
        return formatter.string(from: Date(timeIntervalSince1970: date))
    }
    func stringFromDate(_ date: Double,withFormat format : String ) -> String {
        // let date = NSDate(timeIntervalSince1970: date)
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = format
        
        return formatter.string(from: Date(timeIntervalSince1970: date))
    }
    
    // MARK: File
    func getFileURL(_ fileName: String) -> String? {
        let fileURL = FileManager().urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first
        
        return (fileURL?.appendingPathComponent(fileName).path)
    }
    
    // MARK: String
    func stringFromDeviceTokenData(_ deviceToken: Data) -> String? {
        let stringDeviceToken = deviceToken.description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        
        return stringDeviceToken
    }
    
    // MARK: Mathematics
    func degreesToRadians(_ degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat(M_PI / 180)
    }
    
    /**
     Returns the height for a text with certain font and font size
     
     - parameter text:  The Text
     - parameter font:  Font the text is written with
     - parameter width: The width of the font
     
     - returns: CGFloat representing the height for the text
     */
    func heightFor(_ text: NSString, withFont font: UIFont, boundedInRectWithWidth width: CGFloat) -> CGFloat {
        let sizeOfText: CGSize = text.boundingRect(with: CGSize(width: width, height: 9999), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).size
        
        return ceil(sizeOfText.height)
    }
    
    class func widthforText(_ text: NSString, font: UIFont, withMargin margin: CGFloat) -> CGFloat {
        let textSize: CGSize = text.size(attributes: [NSFontAttributeName: font])
        
        return ceil(textSize.width + margin)
    }
    
    
    // MARK: Localization
    func getCurrentDeviceLanguage() -> String? {
        return Locale.preferredLanguages.first
    }
    
    // MARK: Push Notifications
    func registerForRemotePushNotifications(_ deviceToken: String, appID: String, withCompletion handler: (_ success: Bool, _ registration_id: String?) -> Void) {
        /* ServerInterface().postRequest(withBaseURL:"https://push.tedmob.com/", forFunctionName:"api/register", functionParameters: ["platform" : "2", "token" : deviceToken, "app_id" : appID], andHeaderParameters: nil) { (response) -> Void in
         if (response.responseCode == 200) {
         // Response OK
         handler(success: true, registration_id: (response.responseData as! Dictionary)["registration_id"]!)
         } else{
         // Response Error
         handler(success: false, registration_id: nil)
         }
         } */
    }
    
    // MARK: Storyboard
    func viewControllerWith(_ identifier: String, fromStoryboard storyboardName: String) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    class  func redirectTo(viewWithIdentifier iden : String , fromStoryBoardWithName sname : String ){
        let view = Utilities().viewControllerWith(iden, fromStoryboard: sname)
        DispatchQueue.main.async {
            UIApplication.shared .windows.first!.rootViewController = view
        }
        
    }
    /**
     Checks if the device is connected to the internet
     
     - returns: True if connected. False if not
     */
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    /// Gets the type of url.
    ///
    /// - parameter url: the url you want to get the type of
    ///
    /// - returns: FileType
//    
//    class func getUTIType(ofURL url : URL) -> FileType{
//        guard url.typeIdentifier != nil else {
//            return .other
//        }
//        
//        switch url.typeIdentifier! {
//        case (kUTTypePDF as! String):
//            return .pdf
//        case (kUTTypeImage as! String):
//            return .image
//        default :
//            return .other
//        }
//        return .other
//    }
//    
    class func prepare(ArrayToSend array : [Any]) -> String?{
        var arrayOfString = [String]()
        for object in array {
            arrayOfString.append("\(object)")
        }
        let str =  arrayOfString.joined(separator: ",")
        return "[" + str + "]"
    }
    
}
