
Clear .DS_Store && ._.files
```properties
cd /Applications/XAMPP/xamppfiles/htdocs/ankelli && find.-name ".DS_Store" -type f -delete && dot_clean .
```

Run the signing daemon
```properties
tatum-kms daemon --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=18f7cff7-3990-4ce7-b504-d67143bc9832 --testnet --chain=ETH
```

Store wallet 
```properties
tatum-kms storemanagedwallet ETH --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat --api-key=18f7cff7-3990-4ce7-b504-d67143bc9832 --testnet
```

tatum-kms export --path=/Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/wallet.dat
