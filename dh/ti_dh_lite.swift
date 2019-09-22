//
//  ti_dh_lite.swift
//  ti-dh-swift
//
//  Created by Admin on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import BigInt

public class ti_dh_lite:NSObject{
    
    //生成客户端数据
    public static func genereate_client_number() -> String{
        let startIndex = 10000;
        let endIndex = 99999;

        let client_number = Int(arc4random_uniform(UInt32(endIndex-startIndex))) + startIndex;
        
        return String(client_number);
    }
    
    //获取服务器的p、g后 计算出client-number
    public static func process_client_number(_ g_str:String!,_ client_number_str:String!,_ p_str:String!) -> BigUInt {
        let g = BigUInt(g_str);
        let client_number = BigUInt(client_number_str);
        let p = BigUInt(p_str);
        
        let process_client_number = g?.power(client_number ?? 0, modulus: p ?? 0);
        
        return process_client_number!;
    }

    //获取服务器的server_number后，根据server-number，client-number和p 计算出公共密钥K
    public static func process_client_key(_ server_number_str:String!,_ client_number_str:String!,_ p_str:String!) -> BigUInt {
        let server_number = BigUInt(server_number_str);
        let client_number = BigUInt(client_number_str);
        let p = BigUInt(p_str);
        
        let process_client_key = server_number?.power(client_number ?? 0, modulus: p ?? 0);
        
        return process_client_key!;
    }

}
