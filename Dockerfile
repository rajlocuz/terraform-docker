# Pull base image.
FROM ubuntu:latest
USER root

RUN \
# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y && \
#sshpass
apt-get install sshpass -y && \
#rsyslog
apt-get install rsyslog -y

RUN service rsyslog start

################################
# Install Terraform
################################

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/0.12.27/terraform_0.12.27_linux_amd64.zip

# Unzip
RUN unzip terraform_0.12.27_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version 

################################
# Install python
################################

RUN apt-get install -y python3-pip
#RUN ln -s /usr/bin/python3 python
RUN pip3 install --upgrade pip
RUN python3 -V
RUN pip --version

################################
# Install AWS CLI
################################
RUN pip install awscli --upgrade --user

# add aws cli location to path
ENV PATH=~/.local/bin:$PATH

###############################
#Config and start rsyslog server
###############################
RUN mv /etc/rsyslog.conf /etc/rsyslog.conf.bak
ADD rsyslog.conf /etc
RUN service rsyslog restart

# Adds local templates directory and contents in /usr/local/terrafrom-templates
#ADD templates /usr/local/bin/templates
RUN mkdir /work && cd /work

#Added deploy script & test file to send to remote(client's) server
ADD deploy.sh /work
ADD test.py /work

WORKDIR /work

EXPOSE 514

ENTRYPOINT ["bash", "/work/deploy.sh"]   

#RUN mkdir ~/.aws && touch ~/.aws/credentials
