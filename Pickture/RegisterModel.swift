//
//  SingUpModel.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper


class RegisterModel: NetworkModel {
    
    func registerUser(sex:String, username:String, password: String){
        let URL : String = "\(baseURL)/api/user/login"
        
        let body : [String:String] = [
            "id" : sex,
            "username" : username,
            "pw" : password
        ]
        
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<RegisterUserVO>) in
            
            switch response.result {
                
            case .success:
                guard let result = response.result.value else{
                    return
                }
                
                print(" success ")
                
                print(result)
                
                
                
                /*
                if result.message == "save"{
                    self.view.networkResult(resultData: "글작성완료", code: "Write")
                }
                else if result.message == "MissingParameter"{
                    self.view.networkResult(resultData: "파라미터 오류", code: "Write")
                }
                */
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
}
