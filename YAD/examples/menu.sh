CVA="\x1B[0;38;5;196m"
FC="\x1B[m"
MENU() {

    echo "  ••••••••••••••••••••••••••••••••••••••••••
     ••••••••••         MENU         •••••••••• 
    •••                                      •••
    •••    [1] CADASTRO        [4] INCLUI    •••
    •••    [2] BUSCA           [5] EVENTOS   •••
    •••    [3] ALTERA          [6] SAIR    •••
    •••                                      •••
     ••••••••••••••••••••••••••••••••••••••••••"

    read -p " OPÇãO: " -n1 OPC
	    echo -e "\n"
	    case "$OPC" in
	     1) CADASTRAR ;;
	     2) BUSCA ;;
	     3) ALTERA ;;
	     4) INCLUI ;;
	     5) EVENTOS ;;
             6) SAIR ;;
             *) MSGM ;;
	    esac
    } 



    CADASTRAR() {
    COMANDOS . . .
    }

    CONSULTA() {
    COMANDOS . . .
    }
    #Essa abaixo é a função para opção invalida, o que for diferente de [1-6]
    MSGM() { echo -e "$CVA \" OPÇãO INVáLIDA! \" $FC" ; sleep 1.25 ; MENU}
}
#Cada OPÇÃO, chama uma função. . .
