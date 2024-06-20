# Projeto de Backup para PostgreSQL

Este projeto fornece um script simples em shell para realizar backups de bancos de dados PostgreSQL. O script `backup_db.sh` está localizado no diretório `backups` e pode ser executado para criar um backup do banco de dados PostgreSQL em um arquivo compactado.

Para usar o script, você precisa ter as ferramentas necessárias instaladas em seu sistema, como o cliente de banco de dados PostgreSQL e as utilitários de compactação. O script provavelmente solicitará credenciais de acesso ao banco de dados PostgreSQL durante a execução.

Os backups gerados pelo script são armazenados no diretório `backups` com um nome de arquivo que inclui a data e hora atuais.


### Comandos de Backup

Comando para executar o backup:
   - `nohup bash backup_db.sh &`

Comando para verificar o status do backup:
   - `tail -f /apps/backup/backup.log`

Comando para verificar se o backup está em execução:
   - `ps aux | grep backup_db.sh`

Comando para parar o backup:
   - `pkill -f backup_db.sh`


# Estrutura do Projeto

Backup
├─ backups
└─ backup_db.sh

