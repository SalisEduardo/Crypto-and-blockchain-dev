# __But how does bitcoin actually work?__ -  3Blue1Brown

* Protocol:
    * Anyone can add lines to the ledger
    * Settle up with real money each month
    * Only signed transactions are valid
    * No overspending

* Ledger - Trust + Cryptograph  = Cryptocurrency
* Backbone underlying is not a bank: i it s a clever system of decentralized trustless verification based on math (cryptograph)
* Digital signatures: allows the immutability  of the ledger
    * Private key : sk
    * Public key : pk
    * Sign(Message, sk) = Signature
    * Verify(Message, Signatured pk) = True/False

* Each transaction have an id
* Verifying a transaction means knowing the full history of transactions

* Currency = list of transactions 

* Block : list of transactions verified with proof of work
    * PoW: verify that the hash discovered by some one is the right one


* Transaction is only considered valid when it is signed
* BLock is considered valid with proof of work
* each block have to contain the hash of the previous block   
* change one block , changes the hash of the next block 

* Every one can be a block creator: 
    * They will listen for transactions being broadcast
    * Collect them in some block 
    * Do the work to find the special number which starts with "n" zeros 
    * Once is found , the block is broadcasted
* Creating blocks : mining (reward for producing blocks )
* more em more miners = harder to mine
* reward decreases with time
* Introduce new bits of currency to the economy

### Main ideas
* Digital signatures
* the ledger is the currency
* Decentralize
* Proof of work
* block chain


-----