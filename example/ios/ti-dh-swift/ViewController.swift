//
//  ViewController.swift
//  ti-dh-swift
//
//  Created by Admin on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import BigInt
import ti_dh
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let v = ti_dh.genereate_info(300);
        
        let p = String(v.0);
        let g = String(v.1);
        let server_number = String(v.2);
        let processed_server_key = String(v.3);

        print("p:",p)
        print("g:",g)
        print("server_number:",server_number)
        //返回给客户端的server_number用户计算
        print("processed_server_key:",processed_server_key)
        
        
        let c=ti_dh_lite.genereate_client_number();
        print("client_number:",c)
        let p_c_n=ti_dh_lite.process_client_number(g,c,p);
        //process_client_number传给服务端计算公钥给客户端
        print("process_client_number:",p_c_n)
        let s = ti_dh.compute_share_key(String(p_c_n),server_number,p);
        print("compute_share_key:",s)
        //利用服务端给的公钥计算后和加密后的私钥compute_share_key作比较
        let p_c_k=ti_dh_lite.process_client_key(processed_server_key, c, p);
        print("processed_client_key:",p_c_k)

    }


}

