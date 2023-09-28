# hetzner
Configuração via Ansible para a recriação do Cluster kubernetes na Hetzner

Esse setup utiliza ansible dentro de um container docker.

## Como usar

### Adicionar chave OpenSSH

Path: ./keys/key.openssh

### Editar /hosts.json

Edite o arquivo ./hosts.yml com as informações sobre seu ambiente.

```yaml
all:
  hosts:
    "100.100.100.101":
       hostname: "serverhostname"
       ansible_ssh_user: "root"
       ansible_ssh_private_key_file: "/ansible/keys/???.openssh"
       ansible_port: 22
       IPv4: "100.100.100.101"
       IPv6: "0000:0000:0000:0000:0000:0000:0000:0001"

     "100.100.100.102":
       hostname: "serverhostname"
       ansible_ssh_user: "root"
       ansible_ssh_private_key_file: "/ansible/keys/???.openssh"
       ansible_port: 22
       IPv4: "100.100.100.102"
       IPv6: "0000:0000:0000:0000:0000:0000:0000:0002"

    "100.100.100.103":
       hostname: "serverhostname"
       ansible_ssh_user: "root"
       ansible_ssh_private_key_file: "/ansible/keys/???.openssh"
       ansible_port: 22
       IPv4: "100.100.100.103"
       IPv6: "0000:0000:0000:0000:0000:0000:0000:0003"

  children:
    microk8s:
      hosts:
        "100.100.100.101":
        "100.100.100.102":
        "100.100.100.103":

```


Edite o arquivo ./01-cluster-formation\playbooks\tasks\04-racqspace-microk8s.yaml para definir uma versão do Kubernetes. 

Atenção especial à nova variável microk8s_snap_channel, usada para determinar qual versão do Kubernetes vamos instalar nos nós do cluster.

Atenção à variável microk8s_plugins para definir quais plugins serão instalados já na construção do cluster.

```yaml
- hosts: microk8s
  roles:
    - role: "../../roles/ansible-role-microk8s-main"
      vars:
        microk8s_plugins:
          ingress: true
          dns: true
        microk8s_enable_ha: true
        microk8s_group_ha: "microk8s"
        microk8s_ip_regex_ha: "192.168.100."
        microk8s_snap_channel: "1.24/stable"
```


Para essa configuração:

* Os 3 servidores receberão todo o setup básico, exceto a instalação e configuração do Microk8s.
* Somente os servidores "100.100.100.101" e "100.100.100.102" receberão o Microk8s. A configuração não cria o cluster.


### Execute
```bash
./run.sh

```

## Tasks

### 1 | apt-get update

### 2 | apt-get upgrade

### 3 | apt-get install
- git
- zip
- unzip
- mc
- htop
- curl
- wget
- inxi
- screenfetch
- apt-transport-https
- ca-certificates
- gnupg-agent
- software-properties-common
- gnupg
- lsb-release

### 4 | Set the hostname using data from /hosts.json

### 5 | Rebuild entire /etc/hosts
- With hostname
- with others servers aliases

### 6 | Configure welcome console message

### 7 | Reboot if required (by apt upgrade or install)

### 8 | Change SSH Port from 22 to 7777

### 9 | Restart sshd

### 10 | Install Docker

### 10 | Install microk8s with aliases
