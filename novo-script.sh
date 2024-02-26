#!/bin/bash

# ------------------------------------------------------------------
# Script   : $1
# Descrição: Script feito para criar um arquivo, dar permissão de 
#            execução e mover para a pasta de scripts no home e 
#            tambem já abrir no vscode 
# Versão   : 0.1
# Autor    : tuneli
# Data     : $timeStamp
# Licença  : GNU/GLP v3.0
# ------------------------------------------------------------------
# USO: ~bin/novo-script ou novos-script <nome_arquivo>
# ------------------------------------------------------------------

# VARIAVEIS

file="$1.sh"
directory="scripts/"
timeStamp=$( date +'%d de %B de %Y' )
header="#!/bin/bash
# ------------------------------------------------------------------
# Script   : $1
# Descrição: 
# Versão   : 0.1
# Autor    : tuneli
# Data     : $timeStamp
# Licença  : GNU/GLP v3.0
# ------------------------------------------------------------------
# USO: ~bin/novo-script ou novos-script <nome_arquivo>
# ------------------------------------------------------------------
"


# Testar se usuario passou o numero certo de argumentos(1 argumento)...

msg="****ERRO*****(Voce deve fornecer apenas 1 argumento)"

[[ $# -ne 1 ]] && echo $msg && exit 1

# Testar se o arquivo já existe...
 
[[ -f $1.sh ]] && echo "****ERRO*****(Informe outro nome, arquivo já existe!)" && exit 1


# Criação de novo arquivo

echo "$header" > $file

chmod +x $file

mv $file $directory 

cd $directory

code . $file

exit 0
