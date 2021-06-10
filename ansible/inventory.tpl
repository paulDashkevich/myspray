---
all:
  children:
head:
  hosts:
    master:
      ansible_host: "${ip[1]}"
      ansible_subnet1: "${int_ip[1]}"
nfs:
  hosts:
    nfserver:
      ansible_host: "${ip[0]}"
      ansible_subnet1: "${int_ip[0]}"
workers:
  hosts:
    worker1:
      ansible_host: "${ip[2]}"
      ansible_subnet1: "${int_ip[2]}"
    worker2:
      ansible_host: "${ip[3]}"
      ansible_subnet1: "${int_ip[3]}"