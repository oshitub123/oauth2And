//
//  ViewController.swift
//  TestOauth
//
//  Created by Dante Solorio on 4/27/17.
//
//

import UIKit
import OAuthSwift
import AlamofireObjectMapper
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UIApplicationDelegate,UIWebViewDelegate{
    
    @IBOutlet var wbview: UIWebView!
    @IBOutlet var muestra: UILabel!
    let defaults = UserDefaults.standard
    var aux1token:Any? = nil
    var aux2token:Any? = nil
    var oauthswift: OAuth2Swift?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        wbview.delegate = self
//        wbview.isUserInteractionEnabled = false
//        
//        if let url = URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-1/s200x200/17903883_1351359118280833_6619137909911054973_n.jpg?oh=5ffcb71dd992b7335c959a4c24b3cbb5&oe=5974E040"){
//            let request = URLRequest(url: url)
//            wbview.loadRequest(request)}
//        
        
        oauthswift = OAuth2Swift(
            consumerKey:    "da0a78c40b5e4a2eb38d5ea03f32b04f",
            consumerSecret: "",
            authorizeUrl:"https://accounts.spotify.com/authorize",
            responseType:"token"
        )
        
        oauthswift?.authorize(withCallbackURL: "TestOauth://testoauth/twitte", scope: "", state: "", success: { (credential, response,parameters) in
            print(" token :\(credential.oauthToken)")
            print(credential.oauthVerifier)
            print(parameters)
            self.aux1token = credential.oauthToken
            self.defaults.set(self.aux1token, forKey: "pk")
            self.lookRes()
            self.retrieve()
 
            
        }, failure: { error in
            print(error.localizedDescription)
        }
)
    }



    func retrieve( ) {

    let url = "https://api.spotify.com/v1/me"
        if let age = defaults.object(forKey: "pk"){
            self.aux2token = age
        }

        let headers: HTTPHeaders = ["Authorization": "Bearer " + "\(self.aux2token!)"]
        
        Alamofire.request(url,headers:headers).validate().responseObject() { (response: DataResponse<SpotifyModel>) in
            switch response.result{
            case .success:
            if let spotify = response.result.value{
            let spotifyModel = spotify
            self.muestra.text = "\(spotifyModel.displayName!)"
            var ab = spotifyModel.image
            print("url de imagen: \(ab?.url)")
            self.defaults.removeObject(forKey:"pk" )
        }

        case .failure(let error):
        print("Error in can't get information: \(error) ")
        break
        }
        
        }
    }
        func lookRes( ){
            
                let url = "https://api.spotify.com/v1/me"
                if let age = defaults.object(forKey: "pk"){
                    self.aux2token = age
                    print(self.aux2token!)
                }
                
                let headers: HTTPHeaders = ["Authorization": "Bearer " + "\(self.aux2token!)"]
                
                Alamofire.request(url,headers:headers).validate().responseJSON()
                    { response in
                        switch response.result{
                        case .success:
                            if let spotify = response.result.value{
                                print(response)
                            }
                            
                        case .failure(let error):
                            print("Error in can't get information: \(error)")
                            break
                        }
                    }
                }

 }
