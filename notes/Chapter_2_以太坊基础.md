### 1.涉及内容

- 使用钱包
- 创建交易
- 运行智能合约

### 2.钱包推荐

- MetaMask
- Jaxx
- MyEtherWallet
- Emerald Wallet

### 3.网络

- 主网
- Ropsten测试网络
- Kovan测试网络，Aura协议，PoA共识
- Pinkeby测试网络
- Localhost 8545，浏览器连接到本机运行的以太坊节点
- 自定义RPC

### 4.外部账户和合约账户

**外部账户**

钱包中创建的账户类型都是外部账户。

外部账户拥有私钥，拥有私钥意味着对以太币和合约的访问控制。

**合约账户**

具有智能合约代码，无私钥，私钥由智能合约的代码逻辑所拥有、控制。

合约账户无法启动交易，因为它没有私钥。

> 只有外部账户可以启动交易。


### 5.创建智能合约的基本步骤

在Remix中编写智能合约代码 --> 编译智能合约 --> 注册到区块链

**合约内容**

```solidity
pragma solidity ^0.4.17;

// 合约逻辑：向任何提出申请的地址发送测试以太币
// 且定期被充满
// 通过钱包实现Faucet的功能

// 注意，此合约非常简单且有安全漏洞

contract Faucet {
    // 向任何发出申请的用户发送ETH
    // 公开函数，可以被其他合约调用
    function withdraw(uint withdraw_amount) public {
        // 限制申请数量,1ETH
        require(withdraw_amount <= 1000000000000000000);
        // 发送ETH到申请地址
        // msg对象是所有合约都可以访问的输入，代表触发这个合约执行的交易
        // msg.sender属性表示发起交易的发起方地址
        // msg.sender.transfer()用于将以太币转移到调用这个合约的交易地址
        // 针对Faucet合约逻辑：将代币转到触发Faucet合约执行的交易消息的发送地址
        msg.sender.transfer(withdraw_amount);
    }
    // 接收来自任何地址的代币
    // 回退函数，默认函数
    // 特殊情况下调用，如触发合约执行但是不指定调用的具体函数
    function () public payable {}
}
```

注意，编译完成后，注册时，在https://remix.ethereum.org中是无法连接到MetaMask的，切换到http://就可以了。

部署的合约地址：

0x0e5313a89308a95fa878d7b4f35f848905fa989b

浏览器查看地址：https://ropsten.etherscan.io/tx/0xb43255d4e02cef325bbad46ec4adb5a5c181f52c6bee2b0141aeff75caabebd3

此合约创建完毕后，不包含任何代币，我们需要向它充值先。

### 执行withdraw

TBD...
