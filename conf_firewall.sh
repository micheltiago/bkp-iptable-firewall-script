sudo cp firewall.sh /etc/init.d/afirewall
sudo ln -s /etc/init.d/afirewall /sbin/afirewall
sudo ln -s /etc/init.d/afirewall /etc/rc0.d/afirewall
sudo ln -s /etc/init.d/afirewall /etc/rc2.d/S01afirewall
sudo service add afirewall
sudo service afirewall status
sudo service afirewall stop
sudo service afirewall start
sudo afirewall status


