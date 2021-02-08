*** Settings ***
Documentation       Instalação DatabaseLibrary
...                 pip install -U robotframework-databaselibrary
...                 Instalação Driver MySQL
...                 pip install PyMySQL

Library             DatabaseLibrary

Test Setup          Conectar ao Banco de Dados
Test Teardown       Desconectar do Banco de Dados

*** Variables ***
${dbname}       robot
${dbuser}       root
${dbpasswd}     
${dbhost}       localhost
${dbport}       3306
@{queryResults}

*** Test Cases ***

Exemplo1: executando scripts SQL via arquivo
    Executar script via arquivo no banco de dados       C:/Users/amanda.barreto/Desktop/robot/db/mysqlScripts/create_table.sql
    Executar script via arquivo no banco de dados       C:/Users/amanda.barreto/Desktop/robot/db/mysqlScripts/insert.sql
    Confere se "teste" foi inserido com sucesso
    Executar script via arquivo no banco de dados       C:/Users/amanda.barreto/Desktop/robot/db/mysqlScripts/update.sql
    ##Confere se o email "teste1@teste.com.br" foi alterado com sucesso
    Executar script via arquivo no banco de dados       C:/Users/amanda.barreto/Desktop/robot/db/mysqlScripts/delete.sql
    ##Confere se a "account" foi excluida com sucesso


*** Keywords ***

Conectar ao Banco de Dados

    ## MySQL
    # Connect to Database      dbapiModuleName=PyMySQL     dbName=robot        dbUsername=root        dbPassword=${senha}        dbHost=localhost        dbPort=3306
    Connect To Database     pymysql     ${dbname}       ${dbuser}       ${dbpasswd}     ${dbhost}       ${dbport}

Desconectar do Banco de Dados
    Disconnect From Database

Executar script via arquivo no banco de dados 
    [Arguments]             ${FILE}
    Execute SQL Script      sqlScriptFileName=${FILE}          
    ##Log To Console      FOI

Confere se "${USER}" foi inserido com sucesso
    Check If Exists In Database    selectStatement=SELECT user_Name FROM account WHERE user_Name = '${USER}'

Confere se o email "${email}" foi alterado com sucesso
    Check If Exists In Database    selectStatement=SELECT email FROM account WHERE email = '${email}'

Confere se a "{tabela}" foi excluida com sucesso
    Check If Exists In Database    selectStatement=SELECT * FROM "${tabela}" WHERE 1
