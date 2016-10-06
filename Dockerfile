FROM microsoft/iis

COPY ./Proxy C:/Proxy

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "ReverseProxy" -PhysicalPath C:\Proxy -BindingInformation "*:60000:"

EXPOSE 60000

ENTRYPOINT cmd