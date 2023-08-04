#!/bin/bash

nexus_api_url="https://<nexus_url>/service/rest/v1/security/users/"
output_file="users_by_roles.txt"
username="your_username"  # Replace with your Nexus API username
password="your_password"  # Replace with your Nexus API password

# Make the API request with authentication and store the output in a temporary file
curl_output=$(curl -s -u "$username":"$password" "$nexus_api_url")

# Parse the output and extract users by roles
roles=("role-name1" "role-name2" "role-name3" "role-name4" "role-name5") # Add more roles if needed
echo "Users by Roles:" > "$output_file"

for role in "${roles[@]}"; do
    users=$(echo "$curl_output" | jq -r --arg role "$role" '.[] | select(.roles | index($role)) | .userId')
    if [ -n "$users" ]; then
        echo "Role: $role" >> "$output_file"
        echo "$users" >> "$output_file"
    fi
done

echo "Results saved in $output_file"
