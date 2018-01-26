# ccms-components-dev-env


#### 开发环境

```
docker build --rm -t <username>/ccms-components-dev-env .
```

or

```
docker run -d -p 9527:22 -p 3333:3000 -v  <yourpath>:/root/ccms-components <username>/ccms-components-dev-env
```

注意:
> 端口映射 ssh 9527:22 express 3333:3000, volume映射 `<yourpath>`:/root/ccms-components

> 关于 volume issue https://github.com/moby/moby/issues/13984

> 以为会将 container 目录中的内容 copy 到本地目录 `<yourpath>` 中, 目前 Docker 还不支持该功能, 之后在 2.0 版本也许会支持(?),
> 按照上述方式, /root/ccms-components 目录会被本地目录 `<yourpath>` 遮蔽, 所以还需要在该目录 clone 一次项目, 再安装一次依赖,
> 但是会很快, 因为该环境之前已经安装过了 npm 依赖.

> 另一个方法, 你也可以映射其它目录, 然后将 /root/ccms-components 中的 node_modules 作软链接到你映射项目中的 node_modules 目录.

可以直接使用我 build 完成的 image:

```
docker pull haojujzheng/ccms-components-dev-env
```

#### 访问开发环境

`ssh root@localhost -p 9527`

#### 进行本地开发

通过 volume 映射, 本地的 IDE 直接可以访问和修改共享目录中的文件, 所以在本地可以使用自己的 IDE 访问 `<yourpath>` 进行开发.


#### 总结

image 太大了.

该 image 是基于 centos7 并安装 openssh-server passwd git nodejs, 外加 ccms-components 项目源码以及依赖 npm 包, 整体 build 下来
500多MB, 太大了. 但是好处在于它是一套完全独立的开发环境, 可以节省 npm 依赖安装时间, 对于团队中使用 windows 的同学, 可以解决安装 npm 依赖慢,
安装易出错等问题. 另外, 最终项目打包完成后, 还是会部署到 Linux 环境, 使用 windows 同学提前去熟悉 Linux Shell 的操作.
