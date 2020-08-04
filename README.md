Ansible role for minikube
=====================

Ansible to create [minikube](https://kind.sigs.k8s.io) cluster. 


Requirements
------------

- [Docker Desktop](https://www.docker.com/products/docker-desktop) or Docker for Linux

- [Ansible](https://ansible.com) >= v2.9.10 

```shell
pip3 install \
  -r https://raw.githubusercontent.com/kameshsampath/ansible-role-kind/master/requirements.txt
ansible-galaxy role install kameshsampath.kind
ansible-galaxy collection install community.kubernetes
```
__NOTE__: For Windows its recommended to use Windows Subsystem for Linux (WSL)

Role Variables
--------------

| Variable Name| Description | Default |
|--|--|--|
| minikube_profile_name| Name of the minikube cluster| minikube |
| minikube_create|  If True creates the cluster | True |
| minikube_destroy| If True destroys the cluster | True |
| minikube_version| The minikube version | v1.12.1 |
| minikube_home_dir| The directory where KinD files will be stored | $HOME/.minikube |
| minikube_driver| The minikube driver | docker|
| minikube_memory| The memory to use for minikube | 8g |
| minikube_cpus| The cpus to use for minikube | 4 |
| minikube_disk_size| The disk size to use for minikube | 50g |
| minikube_addons| the addons to enable bu default | registry and registry-aliases |

License
-------

[Apache v2](https://github.com/kameshsampath/ansible-role-kind/tree/master/LICENSE)

Author Information
------------------

[Kamesh Sampath](mailto:kamesh.sampath@hotmail.com)

Issues
=======

[Issues](https://github.com/kameshsampath/ansible-role-kind/issues)

Testing
=======

Requirements
------------
- Extra Python modules
```shell
pip3 install \
  -r https://raw.githubusercontent.com/kameshsampath/ansible-role-kind/master/molecule/requirements.txt
```

All tests are built using [molecule](https://molecule.readthedocs.io/en/latest/index.html) with following scenarios:

* default 
```shell
molecule test
```
* pre_reqs
```shell
molecule test -s pre_reqs
```
