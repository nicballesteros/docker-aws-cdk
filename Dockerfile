FROM node:22.15.1-alpine3.20

WORKDIR /workspace

# Install required packages
RUN apt update
RUN apt install -y curl unzip

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/usr/awscliv2.zip"
RUN unzip /usr/awscliv2.zip -d /usr
RUN /usr/aws/install
RUN rm /usr/awscliv2.zip

# Install AWS CDK
RUN npm i --location=global aws-cdk@latest

ENTRYPOINT cdk
