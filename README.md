# kubernetes-prometheus-monitoring
step by step building prometheus monitoring on kubernetes

## 开始

编译一个 all in one 的配置文件：

```
./build.sh
```

k8s 启动：

```
kubectl create -f manifests-all.yaml
```


## 项目说明

- ./configs => prometheus & grafana 的配置文件
- ./manifests => k8s 配置文件
