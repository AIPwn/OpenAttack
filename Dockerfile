FROM  ubuntu:18.04

RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list

ENV ALIYUN_PIP -i  http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com

RUN apt-get update && apt-get install -y   --no-install-recommends python3.6 python3-pip python3-setuptools git &&  rm -rf /var/lib/apt/lists/*

RUN git clone  --depth=1  https://github.com/thunlp/OpenAttack

WORKDIR /OpenAttack

RUN pip3 install  openattack  $ALIYUN_PIP

COPY nltk_data  /root/nltk_data