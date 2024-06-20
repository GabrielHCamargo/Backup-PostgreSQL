#!/bin/bash

exec > /apps/backup/backup.log 2>&1

host="SERVER_IP"
user="USER"
db="DATABASE"
password="PASSWORD"

run_command() {
    comando="$1"
    echo "Executando comando: $comando"
    PGPASSWORD="$password" $comando
    if [ $? -eq 0 ]; then
        echo "Comando executado com sucesso."
    else
        echo "Erro ao executar o comando."
    fi
}

backup() {
    data_atual=$(date +%d_%m_%Y_%H_%M)
    nome_arquivo="backups/backup_$data_atual.sql"
    comando="pg_dump -h $host -U $user -F c -b -f $nome_arquivo $db"
    run_command "$comando"

    backups_dir="backups"
    oldest_backup=$(ls -t "$backups_dir" | tail -n 1)
    if [ "$oldest_backup" != "backup_$data_atual.sql" ]; then
        if [ -n "$oldest_backup" ]; then
            rm "$backups_dir/$oldest_backup"
            echo "Backup antigo $oldest_backup excluído."
        fi
    else
        echo "O backup mais antigo é o atual, não será removido."
    fi
}

monitorar_backups() {
    while true; do
        backup
        sleep 3600
    done
}

main() {
    monitorar_backups
}

main
