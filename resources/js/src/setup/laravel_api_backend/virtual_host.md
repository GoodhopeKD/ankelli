## 1. Mapping domain name to local IP address

### a) Using one domain or with a few known subdomains

Add the following line to **`/etc/hosts`** file

On MacOS

```properties
nano /etc/hosts
```

On Windows

Open File **`C:\Windows\System32\drivers\etc\hosts`**

```properties
# ankelli.test
127.0.0.1   ankelli.test www.ankelli.test api.ankelli.test p2p.ankelli.test pay.ankelli.test admin.ankelli.test content.ankelli.test funds.ankelli.test support.ankelli.test accounts.ankelli.test webhooks.ankelli.test
```

### b) Using wildcard subdomains

Add the following line to /usr/local/etc/dnsmasq.conf after the #address=/double-click.net/127.0.0.1

```properties
nano /usr/local/etc/dnsmasq.conf
```

```properties
address=/ankelli.test/127.0.0.1
```

Restart dnsmasq

```properties
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq
dscacheutil -flushcache
```

If resolver folder doesn't exist

```properties
sudo mkdir -p /etc/resolver
```

Create dns resolver for .test tld if it doesn't exist

```properties
sudo tee /etc/resolver/test >/test/null <<EOF
nameserver 127.0.0.1
EOF
```

## 2. Activate virtual hosts in apache

Uncomment the following line in the **`httpd.conf`** file if not already uncommented

```properties
Include etc/extra/httpd-vhosts.conf
Include conf/extra/httpd-vhosts.conf
```

On MacOS

**`/Applications/XAMPP/xamppfiles/etc/httpd.conf`**

On Windows

**`C:\xampp\apache\conf\httpd.conf`**

## 3. Add the virtual host in apache

Add the following VHost entry to the **`httpd-vhosts.conf`** file

On MacOS

**`/Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf`**

```properties
# localhost [must be included as the default named server]
<VirtualHost *:80>
	ServerName localhost
	DocumentRoot "/Applications/XAMPP/xamppfiles/htdocs"
	<Directory "/Applications/XAMPP/xamppfiles/htdocs">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all 
	</Directory>
</VirtualHost>
```

On Windows

**`C:\xampp\apache\conf\extra\httpd-vhosts.conf`**

```properties
# localhost [must be included as the default named server]
<VirtualHost *:80>
	ServerName localhost
	DocumentRoot "C:\xampp\htdocs"
	<Directory "C:\xampp\htdocs">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all 
	</Directory>
</VirtualHost>
```

### a) Simple unsecured

On MacOS

```properties
# ankelli.test
<VirtualHost *:80>
	ServerName ankelli.test
	ServerAlias www.ankelli.test api.ankelli.test
	ServerAlias *.ankelli.test # If using wildcard subdomains
	ServerAdmin webmaster@ankelli.test
	DocumentRoot "/Applications/XAMPP/xamppfiles/htdocs/ankelli/public"
	<Directory "/Applications/XAMPP/xamppfiles/htdocs/ankelli/public">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>
	ErrorLog "logs/ankelli.test-error_log"
	CustomLog "logs/ankelli.test-access_log" common
</VirtualHost>
```

On Windows

```properties
# ankelli.test
<VirtualHost *:80>
	ServerName ankelli.test
	ServerAlias www.ankelli.test api.ankelli.test
	ServerAlias *.ankelli.test # If using wildcard subdomains
	ServerAdmin webmaster@ankelli.test
	DocumentRoot "C:\xampp\htdocs\ankelli\public"
	<Directory "C:\xampp\htdocs\ankelli\public">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>
	ErrorLog "logs\ankelli.test-error_log"
	CustomLog "logs\ankelli.test-access_log" common
</VirtualHost>
```

### b) Using SSL
 

Install [mkcert](https://github.com/FiloSottile/mkcert) if not already installed

On Windows

cmd in admin mode
```properties
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install mkcert
```

On MacOS

```properties
brew install mkcert
```

Generate ssl for ankelli.test *.ankelli.test

On MacOS

```properties
mkdir -p /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt
chflags hidden /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt
mkcert -cert-file /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test.pem -key-file /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test-key.pem ankelli.test *.ankelli.test
mkcert -install
```

On Windows

```properties
if not exist C:\xampp\htdocs\ankelli\.crt mkdir C:\xampp\htdocs\ankelli\.crt
attrib +h C:\xampp\htdocs\ankelli\.crt
mkcert -cert-file C:\xampp\htdocs\ankelli\.crt\ankelli.test.pem -key-file C:\xampp\htdocs\ankelli\.crt\ankelli.test-key.pem ankelli.test *.ankelli.test
mkcert -install
```


On MacOS

```properties
# ankelli.test
<VirtualHost *:80 *:443>
	ServerName ankelli.test
	ServerAlias *.ankelli.test
	ServerAdmin webmaster@ankelli.test
	DocumentRoot "/Applications/XAMPP/xamppfiles/htdocs/ankelli/public"
	<Directory "/Applications/XAMPP/xamppfiles/htdocs/ankelli/public">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>
	ErrorLog "logs/ankelli.test-error_log"
	CustomLog "logs/ankelli.test-access_log" common

	# Site SSL configuration
	SSLEngine on
	SSLCertificateKeyFile /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test-key.pem
	SSLCertificateFile /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test.pem
	SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown
</VirtualHost>
```

On Windows

```properties
# ankelli.test
<VirtualHost *:80 *:443>
	ServerName ankelli.test
	ServerAlias *.ankelli.test
	ServerAdmin webmaster@ankelli.test
	DocumentRoot "C:\xampp\htdocs\ankelli\public"
	<Directory "C:\xampp\htdocs\ankelli\public">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>
	ErrorLog "logs\ankelli.test-error_log"
	CustomLog "logs\ankelli.test-access_log" common

	# Site SSL configuration
	SSLEngine on
	SSLCertificateKeyFile C:\xampp\htdocs\ankelli\.crt\ankelli.test-key.pem
	SSLCertificateFile C:\xampp\htdocs\ankelli\.crt\ankelli.test.pem
	SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown
</VirtualHost>
```

## 4. Restart Apache
