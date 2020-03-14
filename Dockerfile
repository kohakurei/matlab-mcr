FROM python:3.7-slim

# MATLAB Runtimeのインストール
ADD https://ssd.mathworks.com/supportfiles/downloads/R2019a/Release/7/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019a_Update_7_glnxa64.zip /tmp
# COPY matlab/MATLAB_Runtime_R2019a_Update_7_glnxa64.zip /tmp

RUN apt-get update && \
    apt-get install -y \
      unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN unzip MATLAB_Runtime_R2019a_Update_7_glnxa64.zip && \
    ./install -agreeToLicense yes -mode silent -destinationFolder /opt/mcr && \
    rm -rf /tmp/*
