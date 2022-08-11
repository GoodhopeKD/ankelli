## 1. Mapping domain name to local IP address

### a) Using one domain or with a few known subdomains

Add the following line to /etc/hosts file

```properties
nano /etc/hosts
```

```properties
# ankelli.test
127.0.0.1   ankelli.test www.ankelli.test api.ankelli.test
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

Uncomment the following line (remove the #) in **`etc/httpd.conf`**

```properties
Include etc/extra/httpd-vhosts.conf
```

## 3. Add the virtual host in apache

Add the following VHost entry to the **`/private/etc/apache2/extra/httpd-vhosts.conf`** file

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

### a) Simple unsecured

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

### b) Using SSL
 

Install [mkcert](https://github.com/FiloSottile/mkcert) if not already installed

Generate ssl for ankelli.test *.ankelli.test

```properties
mkdir /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt
mkcert -cert-file /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test.pem -key-file /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test-key.pem ankelli.test *.ankelli.test
mkcert -install
```

Use different certificates (for domain and subdomain) to avoid redirects

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

<VirtualHost *:80 *:443>
	ServerName api.ankelli.test
	ServerAdmin webmaster@ankelli.test
	DocumentRoot "/Applications/XAMPP/xamppfiles/htdocs/ankelli/public"
	<Directory "/Applications/XAMPP/xamppfiles/htdocs/ankelli/public">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>
	ErrorLog "logs/api.ankelli.test-error_log"
	CustomLog "logs/api.ankelli.test-access_log" common

	# App_name SSL configuration
	SSLEngine on
	SSLCertificateKeyFile /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test-key.pem
	SSLCertificateFile /Applications/XAMPP/xamppfiles/htdocs/ankelli/.crt/ankelli.test.pem
	SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown
</VirtualHost>
```

## 4. Restart Apache
