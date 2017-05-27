
# https://github.com/Uphie/Docker-Shadowsocks

FROM uphie/shadowsocks:1.0

# add your customed config file to your image
COPY shadowsocks.json /etc/shadowsocks/

# environment
ENV PATH_CONF /etc/shadowsocks/shadowsocks.json
ENV PATH_PID /var/run/shadowsocks.pid
ENV PATH_LOG /var/log/shadowsocks/shadowsocks.log

# start shadowsocks server when start container...
ENTRYPOINT ssserver -c $PATH_CONF --pid-file $PATH_PID --log-file $PATH_LOG  start
