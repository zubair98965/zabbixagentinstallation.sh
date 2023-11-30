# Server IP Address

ZABBIX_SERVER_IP="119.159.226.111"

# Install Zabbix Agent


rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-release-6.0-4.el7.noarch.rpm
yum clean all
yum install zabbix-agent -y


# Configure Zabbix Agent

sudo sed -i "s/Server=127.0.0.1/Server=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agentd.conf
sudo sed -i "s/ServerActive=127.0.0.1/ServerActive=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agentd.conf

# Start Zabbix Agent

sudo systemctl start zabbix-agent
sudo systemctl enable zabbix-agent


echo "Zabbix Agent installed and configured. It is now communicating with the Zabbix Server at $ZABBIX_SERVER_IP."

sudo systemctl status zabbix-agent
