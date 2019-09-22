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
        let v = ti_dh.genereate_info(200);
        
        let p = String(v.0);
        let g = String(v.1);
        let server_number = String(v.2);
        let processed_server_key = String(v.3);

        print("p:",p)
        print("g:",g)
        print("server_number:",server_number)
        print("processed_server_key:",processed_server_key)
        
        
        let c=ti_dh_lite.genereate_client_number();
        print("client_number:",c)
        let p_c_n=ti_dh_lite.process_client_number(g,c,p);
        print("process_client_number:",p_c_n)
        let s = ti_dh.compute_share_key(String(p_c_n),server_number,p);
        print("compute_share_key:",s)
        let p_c_k=ti_dh_lite.process_client_key(String(s), c, p);
        print("processed_client_key:",p_c_k)

    }


}

