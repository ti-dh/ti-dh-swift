//
//  ti_dh.swift
//  ti-dh-swift
//
//  Created by Admin on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import BigInt

public class ti_dh:NSObject{
    
    private var p : BigUInt = ""
    
    private var g : BigUInt = ""

    private var server_number : BigUInt = ""
    
    public static func genereate_server_number() -> String{
        let startIndex = 10000;
        let endIndex = 99999;

        let client_number = Int(arc4random_uniform(UInt32(endIndex-startIndex))) + startIndex;
        
        return String(client_number);
    }

    //生成p、g和server_number( 也就是Bob )
    public static func genereate_info(_ width: Int, _ server_number_str: String = ti_dh.genereate_server_number()) -> (BigUInt, BigUInt, BigUInt ,BigUInt){
        let dh = ti_dh();
        // 初始化p g 和 server-number
        dh._genereate_base_info(width);
        dh.server_number = BigUInt(server_number_str)!;
        // 根据p, g, server得到A
        let processed_server_number = dh._process_server_key();
        // 然后将p 和 g以及server_number和processed_server_number 返回
        let tuple = (dh.p,dh.g,dh.server_number,processed_server_number);
        return tuple;
        
    }
    
    /*
     * @desc  : 接受来自与客户端dh数据
     * @param : client_number，来自于客户端的随机数字
     * @param : server_number，来自于客户端的随机数字
     */
    public static func compute_share_key(_ client_number_str:String!,_ server_number_str:String!,_ p_str:String!) -> BigUInt {
    // 接受client_number（实际上是经过了client客户端处理过后的client_number）
    // 利用client_number,server_number和p计算出公共密钥key
        let client_number_value=BigUInt(client_number_str);
        let server_number_value=BigUInt(server_number_str);
        let p_value=BigUInt(p_str);
        if (client_number_value != nil) && (server_number_value != nil) && (p_value != nil){
            let key = client_number_value?.power(server_number_value ?? 0, modulus: p_value ?? 0);
            // 这个key便是计算出出来的用于对称加解密的公钥
            return key!;
        }
        
        return "";
    }

    //动态生成质数
    private func generatePrime(_ width: Int) -> BigUInt {
        while true {
            var random = BigUInt.randomInteger(withExactWidth: width)
            random |= BigUInt(1)
            if random.isPrime() {
                return random
            }
        }
    }

    //根据大质数生成p和对应的base数字g
    private func _genereate_base_info(_ width: Int) {
        p = generatePrime(width);
        
        var primitive_flag = 0;
        while( primitive_flag==0 ) {
            
            g = BigUInt.randomInteger(lessThan: p-1-2)+2;
            let g_flag = g.power(p-1, modulus: p);
            if ( 1 == g_flag ) {
                primitive_flag = 1;
            }
        }
    }
    
    //返回已处理的服务端server-number
    private func _process_server_key() -> BigUInt {
        let processed_server_number = g.power(server_number, modulus: p);
        
        return processed_server_number;
    }
    
}
