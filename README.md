# ДЗ: построение кластера k8s и развёртывание веб-портала
1. Подготовка нод терраформом.
2. Выполнения сценария предустановки.
3. Выполнение сценария развёртки кластера внутри частной сети.
4. Деплой микросервисов в кластер.
5. Проверка выполненной работы.

Заходим на ноду с нфс-сервером, которая будет служить нодой управления развёртывания кластера. 
Закачиваем репо на управляющую развёрткой ноду. Выполняем следующие команды для успешной работы кластера:
  1. yum install ansible python-pip python3-pip -y
  2. git clone https://github.com/kubernetes-sigs/kubespray.git && cd kubespray
  3. cp -rfp inventory/sample inventory/mycluster
  4. python3 -m venv ~/venv33
  5. source ~/venv33/bin/activate
  6. Удалим jinja, тк это будет вызывать ошибку при установке: yum remove python-jinja2
  7. Из виртуального окружения начинаем создание файла inventory:
```
declare -a IPS=(10.1.0.11 10.1.0.12 10.1.0.13)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
```
