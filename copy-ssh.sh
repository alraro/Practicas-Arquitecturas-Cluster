#!/bin/bash

# Requiere tener sshpass instalado
# Asegúrate de haber hecho ssh-copy-id aclus016@login.ac.uma.es previamente

ips=("192.168.173.171" "192.168.173.172" "192.168.173.173" "192.168.173.174" "192.168.173.175" "192.168.173.176" "192.168.173.177" "192.168.173.178" "192.168.173.179" "192.168.173.180")
usuario="root"
password='$aclus2526$' # Comillas simples obligatorias por el carácter $

for ip in "${ips[@]}"; do
    echo "Configurando clave en $ip..."
    # sshpass inyecta la contraseña
    # StrictHostKeyChecking=no evita que el script se pause pidiendo confirmación del fingerprint (yes/no)
    sshpass -p "$password" ssh-copy-id -o StrictHostKeyChecking=no -o ProxyJump=aclus016@login.ac.uma.es "$usuario@$ip"
done