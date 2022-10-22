
Clear .DS_Store && ._.files
```properties
cd /Applications/XAMPP/xamppfiles/htdocs/ankelli && find.-name ".DS_Store" -type f -delete && dot_clean .
```

Run the signing daemon
```properties
tatum-kms daemon --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=18f7cff7-3990-4ce7-b504-d67143bc9832 --testnet --chain=ETH,TRON

tatum-kms daemon --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=3eb010e4-b965-487c-b875-7dab48ec3e6e --chain=TRON --externalUrl=https://api.ankelli.com/webhooks/tatum/validate-signature
```

Store xpub based wallet 
```properties
tatum-kms storemanagedwallet ETH --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --testnet
```

Export wallets
```properties
tatum-kms export --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat
```

Generate and store custodial managed wallet ** what we want
```properties
tatum-kms generatemanagedwallet ETH --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --testnet

tatum-kms generatemanagedwallet TRON --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat
```

Remove stored wallet
```properties
tatum-kms removewallet 6842c662-6e2e-4026-9974-db19eb00bf86 --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat
```

Store private key of an address wallet
```properties
tatum-kms storemanagedprivatekey ETH --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --testnet
```

SSH Login
```properties
ssh -p 2222 ankellic@50.87.177.120
```