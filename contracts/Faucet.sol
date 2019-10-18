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