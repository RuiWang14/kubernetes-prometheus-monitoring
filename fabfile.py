# coding=utf-8
from __future__ import with_statement
from fabric.api import *
import time

env.hosts = ['139.199.24.137']
env.user = 'root'

base_path = '/root/project/kubernetes-prometheus-monitoring'

def deploy():
    local('git push origin master ')

    with cd(base_path):
        run('pwd')
        run('git reset --hard HEAD')
        run('git pull')
        run('./build.sh')
        run('kubectl delete -f manifests-all.yaml')
        run('kubectl create -f manifests-all.yaml')