#!/bin/bash

###########################################
# 環境変数設定
###########################################
CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE}:-$0); pwd)
TEMPLATE_DIR=${CURRENT_DIR}/../template/

###########################################
# スタック作成コマンド(VPC,IGW...)
###########################################
aws cloudformation validate-template --template-body file://${TEMPLATE_DIR}common_base.json
aws cloudformation create-stack --stack-name common-base --template-body file://${TEMPLATE_DIR}common_base.json

###########################################
# スタック作成コマンド(Subnet,SecurityGroup...)
###########################################
aws cloudformation validate-template --template-body file://${TEMPLATE_DIR}service_base_webnw.json
aws cloudformation create-stack --stack-name service-base-webnw --template-body file://${TEMPLATE_DIR}service_base_webnw.json

###########################################
# スタック作成コマンド(Jenkinis...)
###########################################

