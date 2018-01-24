# ccms-components-dev-env


#### 开发环境

`docker build --rm -t <username>/ccms-components-dev-env .`

or

`docker run -d -p 9527:22 -p 3333:3000 -v  <yourpath>:/root/ccms-components <username>/ccms-components-dev-env`

注意: 端口映射 ssh 9527:22 express 3333:3000, volume映射 <yourpath>:/root/ccms-components

关于 volume issue https://github.com/moby/moby/issues/13984

以为会保持 container 目录中内容到映射的 Host 的目录中, 目前 Docker 还不支持, 之后在 2.0 版本会加新功能(?),
按照上述方式, /root/ccms-components 目录会被本地目录 <yourpath> 临时占用, 所以还需要在该目录 clone 一次项目, 再安装一次依赖,
但是会很快, 因为该系统之前已经安装过了 npm 依赖.

也可以直接使用我 build 完成的 image:

```
docker pull haojujzheng/ccms-components-dev-env
```

#### 访问开发环境

`ssh root@localhost -p 9527`

#### 进行本地开发

通过 volume 之间的映射, 本地的 IDE 直接可以访问和修改容器中的文件, 所以在本地使用自己的 IDE 访问 <yourpath> 进行开发.
