# ti-dh-swift
Diffie Hellman密钥交换 可以与客户端和服务端，支持iOS和macOS
## ti-dh (服务端API)说明：
### genereate\_server\_number()函数
参数：无需任何参数

返回：随机10000-99999的数字字符串
### genereate_info()函数
参数：

| 字段 | 含义 |
| ------------ | ------------ |
| width | 随机质数长度 |
| server_number | 随机私钥字符串 |

返回：swift tuple

| 字段 | 含义 |
| ------------ | ------------ |
| p |服务端计算出来的p，返回给客户端 |
| g |服务端计算出来的g，返回给客户端 |
| server_number |服务端【私钥】，请保密，不可以外泄 |
| processed_server_number |处理过的服务端【私钥】，返回给客户端 |


### compute\_share\_key()函数
原型：string compute\_share\_key( string client_number, string server_number, string p )

参数：

| 字段 | 含义 |
| ------------ | ------------ |
| client_number |客户端提交过来client_number |
| server_number |服务端server_number，未经过处理的需要保密的那个 |
| p |服务端计算出来的p |

输出：String，最终结果就是协商完成的用于对称加解密的密钥

## ti-dh-lite (客户端API)说明：
### genereate\_client\_number()函数
参数：无需任何参数

返回：随机10000-99999的数字字符串
### process\_client\_number()函数
原型：string process\_client\_number(string g,string client_number,string p)
参数：

| 字段 | 含义 |
| ------------ | ------------ |
| g |服务端计算出来的g |
| client_number |genereate\_client\_number()生成的client_number |
| p |服务端计算出来的p |

输出：处理过的客户端【私钥】

### process\_client\_key()函数
原型：string process\_client\_key(string server_number,string client_number,string p)
参数：

| 字段 | 含义 |
| ------------ | ------------ |
| server_number |服务器给的processed_server_number |
| client_number |genereate\_client\_number()生成的client_number |
| p |服务端计算出来的p |

输出：客户端公钥 与服务器的compute\_share\_key比较


## Installation
- **Swift Package Manager:**
  Although the Package Manager is still in its infancy, BigInt provides experimental support for it.
  Add this to the dependency section of your `Package.swift` manifest:

    ```Swift
    .package(url: "https://github.com/ti-dh/ti-dh-swift.git", from: "1.0.0")
    ```

- **CocoaPods:** Put this in your `Podfile`:

    ```Ruby
    pod 'ti-dh-swift', '~> 1.0'
    ```

- **Carthage:** Put this in your `Cartfile`:

    ```
    github "ti-dh/ti-dh-swift" ~> 1.0
    ```
