# force platfrom=linux/386 because alpine x64 doesn't support wine32 and LoxoneConfig is win32
FROM --platform=linux/386 jlesage/baseimage-gui:alpine-3.17-v4.5

RUN add-pkg wine wget xterm cabextract
RUN wget -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
  chmod +x /usr/bin/winetricks

COPY init-install.sh /init-install.sh
COPY startapp.sh /startapp.sh

RUN set-cont-env APP_NAME "LoxoneConfig"
