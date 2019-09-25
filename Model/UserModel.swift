//
//  UserModel.swift
//  Pods
//
//  Created by Nowfal E Salam on 23/09/19.
//

import Foundation

public struct MP{
    public init(){
        
    }
    public  func getUserDetails() -> [Profile]{
        return UserDetails.sharedInstance.getProfiles()
    }
}

class UserDetails{
    private var profiles = [Profile]()
    static let sharedInstance = UserDetails()
    
    func getProfiles() -> [Profile]{
        return profiles
    }
    
    func addProfile(profile : Profile){
        profiles.append(profile)
    }
}

public struct Profile {
    public var name = ""
    public var mobile = ""
    public var email = ""
    public var image : UIImage?
    init(name : String, mobile : String, email : String, image : UIImage?) {
        self.name = name
        self.mobile = mobile
        self.email = email
        self.image = image
    }
}
