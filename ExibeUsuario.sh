#!/bin/bash

#########################################################################################
###                                                                                   ###  
###     ExibeUsuario.sh - RECEBE USUÁRIO COMO PARÂMETRO E EXIBE INFORMAÇÕES:          ###  
###                                                                                   ###  
###     AUTOR: MAURICIO CEZAR HIRSCH                                                  ###  
###      DATA: 31/08/2022                                                             ###  
###                                                                                   ###                  
###          DESCRIÇÃO:                                                               ###
###                                                                                   ###
###                 *  UID USUÁRIO                                                    ###      
###                 *  NOME COMPLETO (DESCRIÇÃO DO USUÁRIO)                           ###  
###                 *  INFORMAÇÕES DO ÚLTIMO LOGIN E USO /home                        ###  
###                 *  VALIDAÇÃO DE USUÁRIO CADASTRADO                                ###  
###                                                                                   ###  
###     Exemplo de uso: ./ExibeUsuario.sh <usuario>                                   ###                                                                                  ###  
###                                                                                   ###  
#########################################################################################

ls /home/$1 > /dev/null 2>&1 || { echo " Usuário Inexistente" ; exit1; }

USER_ID=$(grep $1 /etc/passwd | cut -d":" -f3)
DESC=$(grep $1 /etc/passwd | cut -d":" -f5 | tr -d ,)
USO_HOME=$(du -sh /home/$1 | cut -f1)

clear
echo "=================================================================================="
echo "RELATÓRIO DO USUÁRIO: $1"
echo ""
echo "UID: $USER_ID"
echo ""
echo "Descrição: $DESC"
echo "Total Usado no diretório /home/$1: $USO_HOME"
echo ""
echo "Ultimo login:"
lastlog -u $1
echo "=================================================================================="
exit 0 

