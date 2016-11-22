FROM microsoft/iis

COPY ./Proxy C:/Proxy

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    $env:chocolateyUseWindowsCompression = 'false'; \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install urlrewrite -y; \
    choco install iis-arr -y; \
    choco install vim -y; \
    New-IISSite -Name "ReverseProxy" -PhysicalPath C:\Proxy -BindingInformation "*:58000:"    

EXPOSE 58000

ENTRYPOINT cmd