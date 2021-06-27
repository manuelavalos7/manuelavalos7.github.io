FROM centos:6
RUN curl https://www.getpagespeed.com/files/centos6-eol.repo --output /etc/yum.repos.d/CentOS-Base.repo
RUN yum -y groupinstall "Development Tools"
RUN mkdir ~/.environment_config
WORKDIR ~/.environment_config
RUN curl -LO  https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
RUN curl -LO https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN yum install -y zlib-devel openssl openssl-devel
RUN tar xvf Python-2.7.9.tar.xz && cd Python-2.7.9 && ./configure --enable-shared && make && make install
RUN bash
RUN echo "/usr/local/lib/" >> /etc/ld.so.conf
RUN ldconfig
RUN python get-pip.py
RUN pip install pyinstaller==3.6
RUN pip install requests
WORKDIR /root
