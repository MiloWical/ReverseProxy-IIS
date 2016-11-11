FROM microsoft/iis

COPY ./Proxy C:/Proxy

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "ReverseProxy" -PhysicalPath C:\Proxy -BindingInformation "*:58000:"

EXPOSE 58000

ENTRYPOINT cmd