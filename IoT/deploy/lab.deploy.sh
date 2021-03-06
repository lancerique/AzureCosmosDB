#!/bin/bash

# ====================
# Variables

subscription_id="PROVIDE"
location="PROVIDE"
resource_group_name="PROVIDE"

template_file="lab.deploy.json"
deployment_name="deploy_iot_scenario_lab"
# ====================

# Operations

echo "Create Resource Group"
az group create --subscription "$subscription_id" -n "$resource_group_name" -l "$location"

echo -e "\n"

echo "Deploy lab template"
az deployment group create --subscription "$subscription_id" \
	-g "$resource_group_name" -n "$deployment_name" --template-file "$template_file" \
	--parameters location="$location" --verbose

# ====================
