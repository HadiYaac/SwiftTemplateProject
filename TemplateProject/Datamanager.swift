//
//  DataManager.swift
//  TemplateProjectSwift
//
//  Created by Tedmob IMac on 10/19/15.
//  Copyright © 2015 Tedmob. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    //Uncomment This if you want to create a saved instance from the user object
//    private var user: User? = nil
    
    class var sharedInstance: DataManager {
        struct Singleton {
            static let instance = DataManager()
        }
        
        return Singleton.instance
    }
    
    override init() {

        //Uncomment this if you want to instantiate the saved user instance
        //        user = NSKeyedUnarchiver.unarchiveObjectWithFile(Utilities().getFileURL("currentUser")!) as? User
        super.init()
    }
    
    func persistData(){
        
        //Uncomment this if you want to archive/save the user object
        //NSKeyedArchiver.archiveRootObject(user!, toFile: Utilities().getFileURL("currentUser")!)
    }
    
    //Uncomment the following functions if you want to use a func that you call from this singelton class whenever you are used to set or get a User object
//    func getUser()->User?{
//        return user
//    }
//    
//    func setUser(login: User){
//        //api
//        user = login
//    }
    

    //Uncommment the following function if you want to save an empty user obj when signing out
//    func signOut() {
//        user?.membershipType = "TRIAL"
//        self.user?.pass = ""
//        self.user = User(accessToken: "", userId: "", firstName: "", lastName: "", email: "", password: "", facebookId: "", image: "", googleId: "", ssignatureId: "", membershipType: "", telNumber: "", dob: "", maritalStatus: "", address: "", salutation: "", country: "", activated: "", termsOfPayment: "", paymentMethod: "", paymentNext: "", paymentDate: "", amount: "", renewPayment: false, warning: "", theRawAmount: false)
//        
//        persistData()
//    }
//    
    
    
    
    //MARK: -  loginUser & registerUser
    

    //MARK: - Push Request
    /// Registers for a push notification for TEDMOB
    ///
    /// - parameter deviceToken:   The FCM Token
    /// - parameter appId:         App ID on tedmob's dashboard
    /// - parameter projectSecret: App Secret on Tedmob's dashboard
    /// - parameter completion:    habdler contaning a String that represents the tedmob push token. This will be sent to the API
    
//    func registerPushNotification(deviceToken: String, appId: String, projectSecret: String, completion: (success:Bool, TedmobPushToken:String?, error : ServerInterfaceError?) ->Void){
//        ServerInterface().postRequest(withBaseURL:"https://dashboard.tedmob.com/api/push/v1/", forFunctionName: "register", functionParameters: ["platform_id":"2","token":deviceToken,"project_key":appId,"push_enabled":"1","project_secret":projectSecret], andHeaderParameters:  nil) { (response) -> Void in
//
//            if response.responseCode == 200{
//                guard let TedmobPushToken = (response.responseData! as? String ) else {
//                    completion(success: false , TedmobPushToken: nil , error: response.responseError)
//                    return
//                }
//                completion(success: true, TedmobPushToken: TedmobPushToken , error: nil)
//                
//            }else{
//                completion(success: false , TedmobPushToken: nil, error: response.responseError)
//            }
//        }
//    }
//    
//    func setPushToken(pushToken: String, completion: (success: Bool, response: ServerInterfaceResponse?) -> Void){
//        ServerInterface().postRequest(withBaseURL: "http://ssignature.tedmob.com/api/push/set_user_push", forFunctionName: nil, functionParameters: ["push_token" : pushToken], andHeaderParameters: ["accesstoken":(user?.accessToken)!]) { (response) -> Void in
//            if response.responseCode! == 200
//            {
//                completion(success: true, response: nil)
//            }
//            else
//            {
//                completion(success: false, response: response)
//            }
//            
//        }
//        
//    }

    //MARK: - helperMethods
    func stringOrEmptyString(_ theString: String?) -> String
    {
        if(theString == nil)
        {
            return ""
        }
        else
        {
            return theString!
        }
    }
    
    
    //MARK: - Push Notification Methods
    
}

