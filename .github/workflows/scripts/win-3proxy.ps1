# name: Download 3proxy config
$configUrl = "https://raw.githubusercontent.com/cicybot/personal/refs/heads/main/assets/3proxy_v1.cfg"
Invoke-WebRequest -Uri $configUrl -OutFile "~\3proxy.cfg"

# Download 3proxy
Invoke-WebRequest -Uri "https://github.com/3proxy/3proxy/releases/download/0.9.5/3proxy-0.9.5-x64.zip" -OutFile "~\3proxy.zip"
Expand-Archive -Path "~\3proxy.zip" -DestinationPath "~\3proxy"

#Start 3proxy inline (no config file)
$proxyPath = "~\3proxy\bin64\3proxy.exe"
Start-Process -FilePath $proxyPath -ArgumentList "~\3proxy.cfg" -WindowStyle Hidden

Start-Sleep -Seconds 2
netstat -ano | findstr 3128