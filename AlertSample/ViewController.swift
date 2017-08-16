//
//  ViewController.swift
//  AlertSample
//
//  Created by ktds 22 on 2017. 8. 16..
//  Copyright © 2017년 OliveNetworks, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 밑에서 올라오는 alert창
    @IBAction func openActionSheet(_ sender: Any) {
        let alert=UIAlertController(title: "알림", message: "메세지 내용", preferredStyle: .actionSheet)
        
        // handler에 익명함수를 정의함(할일이 없는 경우는 nil/ 있는경우 중괄호를 이용하여 구현)
        let cancelBtn=UIAlertAction(title: "취소", style: .cancel, handler: {(UIAlertAction)->Void in print("취소함")})
        
        // (1) let facebookBtn=UIAlertAction(title: "Facebook", style: .default, handler: {(UIAlertAction)->Void in print("Facebook")})
        // 마지막 매개변수가 함수타입인경우 괄호를 먼저 닫고 중괄호로 함수를 정의할 수 있다. (1)번과 똑같은 코드이다.
        let facebookBtn=UIAlertAction(title: "Facebook", style: .default){
            (UIAlertAction)->Void in print("Facebook 선택함" )
        }
        let twitterBtn=UIAlertAction(title: "Twitter", style: .default){
            (UIAlertAction)->Void in print("Twitter 선택함")
        }
        
        // cancel버튼을 action에 할당함
        alert.addAction(cancelBtn)
        alert.addAction(facebookBtn)
        alert.addAction(twitterBtn)
        
        self.present(alert, animated: true, completion: {()->Void in print("화면나타남")})
    }
    
    // 모달로 뜨는 alert창
    // alert을 통한 로그인창 구현
    @IBAction func openAlert(_ sender: Any) {
        let loginAlert=UIAlertController(title: "로그인", message: "아이디와 패스워드를 입력하세요.", preferredStyle: .alert)
        
        loginAlert.addTextField(configurationHandler: {textField in textField.placeholder="아이디"})
        loginAlert.addTextField(configurationHandler: {textField in textField.placeholder="패스워드"})
        
        let cancleBtn=UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let confirmBtn=UIAlertAction(title: "확인", style: .default, handler:
        {
            alertAction in
            
            let id=loginAlert.textFields?[0].text
            let pw=loginAlert.textFields?[1].text
        
            if id=="test" && pw=="1234"{
                print("성공")
            }else{
                print("실패")
            }
        })
        
        loginAlert.addAction(cancleBtn)
        loginAlert.addAction(confirmBtn)
        
        self.present(loginAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

