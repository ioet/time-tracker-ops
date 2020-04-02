#!/usr/bin/env bash

# Region: southcentralus
DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"`
RESOURCE_GROUP="eys-training-api"
az group deployment create --name deploy-"$DATE_WITH_TIME" --resource-group "$RESOURCE_GROUP" --template-file template.json --parameters parameters.json