# Docker-shadowsocks

科学上网工具 `shadowsocks` docker 镜像。

前提：一台境外 Linux 服务器，比如 VPS。

使用方法：

1. 下载
```
$ git clone https://github.com/Uphie/Docker-shadowsocks
```
或者
```
$ wget https://github.com/Uphie/Docker-shadowsocks.zip
$ uzip Docker-shadowsocks.zip
```
2. 编辑 `shadowsocks.json` 文件，添加端口和密码。
配置方法详见 [shadowsocks wiki](https://github.com/shadowsocks/shadowsocks/wiki)。

如多用户配置：
```
{
    "server": "0.0.0.0",
    "port_password": {
        "8500": "abcdef",
        "8501": "ABCDEF",
        "8502": "123456"
    },
    "timeout": 300,
    "method": "aes-256-cfb"
}
```

3. 构建 docker 镜像
```
$ cd Docker-shadowsocks

$ docker build -t my_image_name .
```
3. 启动 docker 镜像
```
$ docker run -itd -p port1:port1 -p port2:port2 --name your_container_name .
```
其中 `-p port1:port1 -p port2:port2` 是要将 `shadowsocks` 配置文件中用的端口从容器映射到宿主机，配了几个端口就映射几个端口。

以 1 中的配置范例为例，启动命令为：
```
$ docker run -itd -p 8500:8500 -p 8501:8501 -p 8502:8502 --name my_container_name my_image_name
```
4. 可以科学上网了😊

