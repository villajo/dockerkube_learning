FROM ubuntu:latest

WORKDIR /opt/data

RUN apt update; apt-get install openssh-server nmap sudo lshw net-tools apt-file vim iproute2 coreutils ed tree -y
RUN mkdir /var/run/sshd
RUN groupadd jvilla && useradd -ms /bin/bash -g jvilla jvilla && usermod -a -G sudo jvilla 
RUN groupadd admin && usermod -a -G admin jvilla 
RUN mkdir -p /home/jvilla/.ssh && chown -Rf jvilla:jvilla /home/jvilla/.ssh
COPY keys/id_rsa.pub /home/jvilla/.ssh/authorized_keys
RUN chown jvilla:jvilla /home/jvilla/.ssh/authorized_keys && chmod 600 /home/jvilla/.ssh/authorized_keys
RUN /usr/bin/cat /etc/sudoers > /home/jvilla/output_sudoers
RUN /usr/bin/cat /etc/group > /home/jvilla/output_group
RUN /usr/bin/sed -i 's/admin ALL=(ALL) ALL/admin ALL=(ALL) NOPASSWD:ALL/g' /etc/sudoers
RUN /usr/bin/printf '%s\n' '46m51' 'wq' | /usr/bin/ed -s /etc/sudoers
RUN /usr/bin/printf '%s\n' '46m51' 'wq' | /usr/bin/ed -s /etc/sudoers
RUN /usr/bin/printf '%s\n' '46m52' 'wq' | /usr/bin/ed -s /etc/sudoers
#RUN /usr/bin/cat /etc/sudoers > /home/jvilla/output_sudoers_after
RUN systemctl enable ssh


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]