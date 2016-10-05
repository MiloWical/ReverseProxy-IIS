FROM microsoft/iis

RUN mkdir C:\proxy

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "ReverseProxy" -PhysicalPath C:\proxy -BindingInformation "*:60000:"

EXPOSE 60000