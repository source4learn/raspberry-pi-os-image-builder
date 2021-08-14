#!/usr/bin/env sh
echo "Modify Raspberry Pi Configurations"
sed -i 's/^session[ \t]*optional[ \t]*pam_lastlog.so/#session optional pam_lastlog.so/' /etc/pam.d/login
sed -i 's/^session[ \t]*optional[ \t]*pam_motd.so[ /t]*motd=\/run\/motd.dynamic/#session optional pam_motd.so motd=\/run\/motd.dynamic/' /etc/pam.d/login
sed -i 's/^session[ \t]*optional[ \t]*pam_motd.so[ /t]*noupdate/#session optional pam_motd.so noupdate/' /etc/pam.d/login
sed -i 's/^ExecStart=-\/sbin\/agetty.* --noclear %I \$TERM/ExecStart=-\/sbin\/agetty --skip-login --noclear --noissue --login-options "-f pi" %I $TERM/' /lib/systemd/system/getty@.service
sed -i '/^_IP=[\$]*/,+3 s/^/#/' /etc/rc.local
sed -i '/^exit[ /t]*0/i dmesg --console-off\n' /etc/rc.local

echo "Enable Raspberry Pi Default Services"
systemctl enable ssh
systemctl enable getty@
systemctl enable splashscreen
