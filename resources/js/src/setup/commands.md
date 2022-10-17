
Clear .DS_Store && ._.files
```properties
cd /Applications/XAMPP/xamppfiles/htdocs/ankelli && find.-name ".DS_Store" -type f -delete && dot_clean .
```

Run the signing daemon
```properties
tatum-kms daemon --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=18f7cff7-3990-4ce7-b504-d67143bc9832 --testnet --chain=ETH,TRON
```

Store mnemonic based wallet 
```properties
tatum-kms storemanagedwallet ETH --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=18f7cff7-3990-4ce7-b504-d67143bc9832 --testnet
```

Export wallets
```properties
tatum-kms export --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat
```

Generate and store custodial managed wallet ** what we want
```properties
tatum-kms generatemanagedwallet ETH --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=18f7cff7-3990-4ce7-b504-d67143bc9832 --testnet
```

Remove stored wallet
```properties
tatum-kms removewallet 5ae102d3-6981-491e-bae5-8abefbd2321b --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat
```

Store private key of an address wallet
```properties
tatum-kms storemanagedprivatekey ETH --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=18f7cff7-3990-4ce7-b504-d67143bc9832 --testnet
```

SSH Login
```properties
ssh -p 2222 ankellic@50.87.177.120
```