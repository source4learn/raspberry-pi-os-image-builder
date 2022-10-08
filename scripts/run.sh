#!/usr/bin/env sh

sed -i 's/^session[ \t]*optional[ \t]*pam_motd.so[ /t]*motd=\/run\/motd.dynamic/#session optional pam_motd.so motd=\/run\/motd.dynamic/' /etc/pam.d/login
sed -i 's/^session[ \t]*optional[ \t]*pam_motd.so[ /t]*noupdate/#session optional pam_motd.so noupdate/' /etc/pam.d/login

systemctl enable ssh
systemctl enable getty@
