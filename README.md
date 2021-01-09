# dentamed-cashflow-hosting
Hosting config for docker images

## Requires local images from repos:
* [cashflow-odata](https://github.com/tinkie101/dentamed-cashflow-odata)
    * Requires MySQL container
* [cashflow-ui5](https://github.com/tinkie101/dentamed-cashflow-ui5)
* [cashflow-docx](https://github.com/tinkie101/dentamed-cashflow-docx)

## Build
docker build -t cashflow-hosting-image:latest .

## Run
`docker-compuse up -d`


## environment variables
Create a .env file with the following values set:

* KEYCLOAK_USER
* KEYCLOAK_PASSWORD

* KEYCLOAK_ODATA_SECRET
* KEYCLOAK_URL
* KEYCLOAK_ODATA_RESOURCE
* KEYCLOAK_ODATA_REALM

* MYSQL_ROOT_PASSWORD
* MYSQL_USER
* MYSQL_PASSWORD

* PROXY_ADRESS_FORWARDING
* MYSQL_DATABASE
* KEYCLOAK_IMPORT
