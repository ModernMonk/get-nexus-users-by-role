Please replace "your_username" and "your_password" with your actual Nexus API username and password.

With this updated script, the curl command includes the -u option to pass the username and password for authentication. The API call will now be authenticated, and you should be able to retrieve the user information based on the specified roles. The script will create the users_by_roles.txt file with the list of users grouped by their roles. If there are no users with a particular role, the corresponding section will not be present in the output file.
