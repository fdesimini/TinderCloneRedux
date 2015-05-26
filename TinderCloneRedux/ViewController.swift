//
//  ViewController.swift
//  TinderCloneRedux
//
//  Created by Frank Desimini on 2015-05-26.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //check for existing token at load so the app doesn't switch to facebook
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            //User is already logged in - switch to a new view controller - create a MainVC
        } else {
            //Facebook button from SDK
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            //Use the readPermissions or publishPermissions property of the FBSDKLoginButton to ask the 'User' permission to their data
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
        
    }

    //Facebook Delegate Method
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error:NSError!){
        println("User Logged In")
        
        if error != nil
        {
            //Process error
        } else if result.isCancelled {
            //Handle cancellation
        } else {
            // If you ask for multiple permissions at once, you should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                //Do work
            }
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User logged Out")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

