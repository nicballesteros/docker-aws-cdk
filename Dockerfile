FROM node:16.16.0-buster-slim

WORKDIR /workspace

RUN apt update
RUN apt install -y curl unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/usr/awscliv2.zip"
RUN unzip /usr/awscliv2.zip -d /usr
RUN /usr/aws/install
RUN rm /usr/awscliv2.zip

# Install AWS CDK
RUN npm i --location=global aws-cdk

ENTRYPOINT cdk
