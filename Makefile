# ロリポップ！マネージドクラウド
SSH_HOST = ssh-1.mc.lolipop.jp
SSH_PORT = 10022
SSH_USER = sshuser
DB_NAME = dbname
DB_USER = dbuser
DB_PASS = dbpass
DB_HOST = mysql-1.mc.lolipop.lan

PROMPT_SSH_HOST ?= $(shell bash -c 'read -p "SSH / SFTP ホスト名(${SSH_HOST}): " VAL; echo $${VAL:-${SSH_HOST}}')
PROMPT_SSH_PORT ?= $(shell bash -c 'read -p "SSH / SFTP ポート(${SSH_PORT}): " VAL; echo $${VAL:-${SSH_PORT}}')
PROMPT_SSH_USER ?= $(shell bash -c 'read -p "SSH / SFTP ユーザー名(${SSH_USER}): " VAL; echo $${VAL:-${SSH_USER}}')
PROMPT_DB_NAME  ?= $(shell bash -c 'read -p "データベース データベース名(${DB_NAME}): " VAL; echo $${VAL:-${DB_NAME}}')
PROMPT_DB_USER  ?= $(shell bash -c 'read -p "データベース ユーザー名(${DB_USER}): " VAL; echo $${VAL:-${DB_USER}}')
PROMPT_DB_PASS  ?= $(shell bash -c 'read -s -p "データベース パスワード(${DB_PASS}): " VAL; echo $${VAL:-${DB_PASS}}')
PROMPT_DB_HOST  ?= $(shell bash -c 'read -p "データベース データベースのホスト名(${DB_HOST}): " VAL; echo $${VAL:-${DB_HOST}}')

# ownCloud
OWNCLOUD_VERSION = 10.0.10

install:
	$(eval SSH_PORT=${PROMPT_SSH_PORT})
	$(eval SSH_USER=${PROMPT_SSH_USER})
	$(eval SSH_HOST=${PROMPT_SSH_HOST})
	$(eval INSTALLED=$(shell ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'if [ -f /var/www/html/.lolipop-mc-starter-installed ]; then echo "already installed"; fi'))
	@if [ -n "${INSTALLED}" ]; then echo "既にロリポップ！マネージドクラウド スターターによってインストールされています" && exit 1; fi
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'mkdir -p /var/www/src'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'wget -O /var/www/src/owncloud-${OWNCLOUD_VERSION}.zip https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.zip'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'wget -O /var/www/src/owncloud-${OWNCLOUD_VERSION}.zip.sha256 https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.zip.sha256'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'cd /var/www/src && sha256sum -c owncloud-${OWNCLOUD_VERSION}.zip.sha256 < owncloud-${OWNCLOUD_VERSION}.zip'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'unzip /var/www/src/owncloud-${OWNCLOUD_VERSION}.zip'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'mv html html.backup'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'mv owncloud html'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'touch /var/www/html/.lolipop-mc-starter-installed'
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'rm -rf /var/www/src'

ssh:
	$(eval SSH_PORT=${PROMPT_SSH_PORT})
	$(eval SSH_USER=${PROMPT_SSH_USER})
	$(eval SSH_HOST=${PROMPT_SSH_HOST})
	ssh -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST}
