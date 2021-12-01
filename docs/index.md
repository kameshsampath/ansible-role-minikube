---
title: Overview
summary: Ansible role to create minikube clusters
authors:
  - Kamesh Sampath<kamesh.sampath@hotmail.com>
date: 2021-11-05
---

Ansible to create and configure minikube clusters.

## Install role

```shell
ansible-galaxy role install kameshsampath.minikube
```

## Role Variables

| Variable Name| Description | Default |
|--|--|--|
| minikube_create|  If True creates the cluster | True |
| minikube_destroy| If True destroys the cluster | False |
| minikube_version| The minikube version | v1.24.0 |
| minikube_home_dir| The directory where minikube files will be stored | `{{ playbook_dir }}/.minikube` |
| minikube_driver| The minikube driver | hyperkit |
| minikube_memory| The memory to use for minikube | 8g |
| minikube_cpus| The cpus to use for minikube | 4 |
| minikube_disk_size| The disk size to use for minikube | 50g |
| minikube_kubernetes_version | The kubernetes version to use | stable |
| kubeconfig_dir | The directory to create the flattened kubeconfig | `{{ playbook_dir }}/.kube` |

`minikube_profiles` is used to configure the minikube profiles(clusters) that will be created while using the role,

The default value of `minikube_profiles` is:

```yaml
minikube_profiles: 
  minikube:
    create: yes
    destroy: no
    addons:
     - registry
     - registry-aliases
     - metallb
```

A minikube dictionary as shown above will create minikube profile named `minikube` with `8g` of RAM and `4` cpus. The profile also enables the addons registry,registry-aliases and metallb. The `create` attribute determines if this profile needs to be created, similarly `destroy` will determine if the cluster is to be deleted.

!!!note
   The `minkube_profiles` **create** and **destroy** are mutally exclusive.

## Overriding default values

All the role variables like `minikube_*` could be overriden at the profile level. When overiding the value at profile level make sure you add attribute name without `minikube_` prefix.

Lets say we want to create minikube cluster with `4 cpus`, `16G ram` and `100g hard-disk`, then the minikube profile looks like,

```yaml
minikube_profiles: 
  minikube:
    create: yes
    destroy: no
    cpus: 4
    memory: 16g
    disk_size: 100g
    addons:
     - registry
     - registry-aliases
     - metallb
```

## Example playbooks

### Creating a minikube Cluster(s)

```yaml
---8<--- "examples/create_cluster.yml"
```

### Deleting minikue Cluster(s)

```yaml
---8<--- "examples/delete_cluster.yml"
```
