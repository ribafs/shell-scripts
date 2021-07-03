#!/bin/bash


#Este script foi elaborado por Adenauer Pereira Sampaio (pr.adenauer@gmail.com)
#e se destina a baixar da internet a legisla��o federal (as leis que considero mais importantes)
#colocando-a no diret�rio /legisla��o que � criado na pasta pessoal do usu�rio.
#O script � distribu�do sob a licen�a GLP - ou seja, pode ser copiado, distribu�do e
#alterado livremente, mantendo-se os cr�ditos.

#IMPORTANTE: NECESS�RIO O SOFTWARE WGET


#As tr�s op��es abaixo � para quem est� sob um proxy
usandoproxy=off  # usar 'on' ou 'off'
userproxy=seu_login # login do proxy
userproxypass=sua_senha # senha do proxy


#Aqui as configura��es dos diret�rios
meudir="$HOME/legisla��o"
ms="$meudir/mandado de seguran�a"
hd="$meudir/habeas data"
acp="$meudir/a��o civil p�blica"
ap="$meudir/a��o popular"
sumula="$meudir/s�mulas"



#Verificando a exist�ncia dos diret�rios.  Se n�o existem, s�o
#criados.  Se existem, � feito um backup na pasta .old
if [ -e $meudir ]
then
  cd "$meudir"
  rm -f .wget.log.atualizaleis
  rm -Rf ./.old
  mkdir ./.old
  cp -R * ./.old

else

  mkdir "$meudir"
  cd "$meudir"
fi

  mkdir -p "$ms"
  mkdir -p "$hd"
  mkdir -p "$acp"
  mkdir -p "$ap"
  mkdir -p "$sumula"


xx=0


#Agora vamos alimentar o array com as informa��es:

#xx=$(($xx+1)) = n�o altere essa linha!!!
#link[0]=url a ser baixada pelo wget
#arquivo[0]=nome do arquivo a ser gravado
#descricao[0]=descri��o do artigo (oh!)
#codigo[0]=aqui informamos se se trata de um c�digo (ex: c�digo civil). Possibilidades: "yes" ou "no"
#ref1[0]=um par�metro que pode ser passado para obter a atualiza��o s� dessa legisla��o - se n�o for usar informe "."
#ref2[0]=outro par�metro que pode ser passado para obter a atualiza��o s� dessa legisla��o - se n�o for usar informe "."
#ligado[0]=se est� ligado ou n�o.  Possibilidades: "yes" ou "no"

#Ent�o vamos l�:

#Links dos arquivos:

#C�DIGOS:

link[$xx]="http://www.planalto.gov.br/ccivil_03/Constituicao/Constitui%E7ao.htm"
arquivo[$xx]="CRFB.htm"
descricao[$xx]="Constitui��o da Rep�blica Federativa do Brasil"
codigo[$xx]="yes"
ref1[$xx]="crfb"
ref2[$xx]="."
ligado[$xx]="yes"

xx=$(($xx+1)) 
link[$xx]="http://www.planalto.gov.br/ccivil_03/LEIS/L3071.htm"
arquivo[$xx]="CC-1916.htm"
descricao[$xx]="C�digo Civil de 1916 - revogado"
codigo[$xx]="yes"
ref1[$xx]="cc1916"
ref2[$xx]="l3071"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/LEIS/2002/L10406.htm"
arquivo[$xx]="CC-2002.htm"
descricao[$xx]="C�digo Civil de 2002"
codigo[$xx]="yes"
ref1[$xx]="cc2002"
ref2[$xx]="l10406"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/CCIVIL/Leis/L5869.htm"
arquivo[$xx]="CPC.htm"
descricao[$xx]="C�digo de Processo Civil"
codigo[$xx]="yes"
ref1[$xx]="cpc"
ref2[$xx]="l7565"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L8069.htm"
arquivo[$xx]="ECA - Lei8069.htm"
descricao[$xx]="Estatuto da Crian�a e do Adolescente"
codigo[$xx]="yes"
ref1[$xx]="eca"
ref2[$xx]="l8069"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/LEIS/L8078.htm"
arquivo[$xx]="CPDC - Lei8078.htm"
descricao[$xx]="C�digo de Defesa do Consumidor"
codigo[$xx]="yes"
ref1[$xx]="cpdc"
ref2[$xx]="l8078"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Decreto-Lei/Del2848.htm"
arquivo[$xx]="CP - Del2848.htm"
descricao[$xx]="C�digo Penal"
codigo[$xx]="yes"
ref1[$xx]="cp"
ref2[$xx]="del2848"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Decreto-Lei/Del3689.htm"
arquivo[$xx]="CPP - Del3689.htm"
descricao[$xx]="C�digo de Processo Penal"
codigo[$xx]="yes"
ref1[$xx]="cpp"
ref2[$xx]="del3689"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L4117.htm"
arquivo[$xx]="C�d Bras Telecomunica��es - L4117.htm"
descricao[$xx]="C�digo Brasileiro de Telecomunica��es"
codigo[$xx]="yes"
ref1[$xx]="cbtelecom"
ref2[$xx]="l4117"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L4771.htm"
arquivo[$xx]="C�d Florestal - L4771.htm"
descricao[$xx]="C�digo Florestal"
codigo[$xx]="yes"
ref1[$xx]="codflorestal"
ref2[$xx]="l4771"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L4737.htm"
arquivo[$xx]="C�d Eleitoral - L4737.htm"
descricao[$xx]="C�digo Eleitoral"
codigo[$xx]="yes"
ref1[$xx]="codeleitoral"
ref2[$xx]="l4737"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L5172.htm"
arquivo[$xx]="CTN - L5172.htm"
descricao[$xx]="C�digo Tribut�rio Nacional"
codigo[$xx]="yes"
ref1[$xx]="ctn"
ref2[$xx]="l5172"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9503.htm"
arquivo[$xx]="CTB - L9503.htm"
descricao[$xx]="C�digo de Tr�nsito Brasileiro"
codigo[$xx]="yes"
ref1[$xx]="ctb"
ref2[$xx]="l9503"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Decreto-Lei/Del1001.htm"
arquivo[$xx]="CPM - Del1001.htm"
descricao[$xx]="C�digo Penal Militar"
codigo[$xx]="yes"
ref1[$xx]="cpm"
ref2[$xx]="del1001"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Decreto-Lei/Del1002.htm"
arquivo[$xx]="CPPM - Del1002.htm"
descricao[$xx]="C�digo de Processo Penal Militar"
codigo[$xx]="yes"
ref1[$xx]="cppm"
ref2[$xx]="del1002"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L5197.htm"
arquivo[$xx]="C�d Ca�a - L5197.htm"
descricao[$xx]="C�digo de Ca�a e Prote��o � Fauna"
codigo[$xx]="yes"
ref1[$xx]="ccpf"
ref2[$xx]="l5197"
ligado[$xx]="no"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9279.htm"
arquivo[$xx]="C�d Ca�a - L5197.htm"
descricao[$xx]="C�digo de Ca�a e Prote��o � Fauna"
codigo[$xx]="yes"
ref1[$xx]="ccpf"
ref2[$xx]="l5197"
ligado[$xx]="no"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9279.htm"
arquivo[$xx]="C�d Prop Indusrial - L9279.htm"
descricao[$xx]="C�digo de Propriedade Industrial"
codigo[$xx]="yes"
ref1[$xx]="."
ref2[$xx]="l9279"
ligado[$xx]="no"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Decreto-Lei/Del5452.htm"
arquivo[$xx]="CLT - Del5452.htm"
descricao[$xx]="Consolida��o das Leis do Trabalho"
codigo[$xx]="yes"
ref1[$xx]="clt"
ref2[$xx]="del5452"
ligado[$xx]="no"


# S�MULAS:

xx=$(($xx+1))
link[$xx]="http://www.stf.gov.br/arquivo/cms/jurisprudenciaSumula/anexo/Sumulas1a736.pdf"
arquivo[$xx]="STF - s�mulas.pdf"
descricao[$xx]="S�mulas do STF"
codigo[$xx]="yes"
ref1[$xx]="sumulas"
ref2[$xx]="sumstf"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.stf.gov.br/arquivo/cms/jurisprudenciaSumulaVinculante/anexo/SumulaVinculante1a3.pdf"
arquivo[$xx]="STF - s�mulas vinculantes.pdf"
descricao[$xx]="S�mulas Vinculantes do STF"
codigo[$xx]="yes"
ref1[$xx]="sumulas"
ref2[$xx]="sumvincstf"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.stj.gov.br/webstj/Processo/Jurisp/Download/verbetes_asc.txt"
arquivo[$xx]="STJ - s�mulas.txt"
descricao[$xx]="S�mulas do STJ"
codigo[$xx]="yes"
ref1[$xx]="sumulas"
ref2[$xx]="sumstj"
ligado[$xx]="yes"


# LEIS:

# C�VEIS:


xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/decreto/D22626.htm"
arquivo[$xx]="D22626 - Lei de Usura.htm"
descricao[$xx]="Lei de Usura"
codigo[$xx]="no"
ref1[$xx]="usura"
ref2[$xx]="d22626"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/decreto-lei/1965-1988/Del0911.htm"
arquivo[$xx]="Del0911 - Busca e Apreens�o.htm"
descricao[$xx]="Busca e Apreens�o"
codigo[$xx]="no"
ref1[$xx]="busca"
ref2[$xx]="del0911"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Decreto-Lei/Del4657.htm"
arquivo[$xx]="Del4657 - LICC.htm"
descricao[$xx]="LICC - Lei de Introdu��o ao C�digo Civil"
codigo[$xx]="no"
ref1[$xx]="licc"
ref2[$xx]="del4657"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L1060.htm"
arquivo[$xx]="L1060 - Assist�ncia Judici�ria.htm"
descricao[$xx]="Assist�ncia Judici�ria"
codigo[$xx]="no"
ref1[$xx]="jg"
ref2[$xx]="l1060"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L6015.htm"
arquivo[$xx]="L6015 - Registros P�blicos.htm"
descricao[$xx]="Registros P�blicos"
codigo[$xx]="no"
ref1[$xx]="lrp"
ref2[$xx]="l6015"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L6515.htm"
arquivo[$xx]="L6515 - Div�rcio.htm"
descricao[$xx]="Div�rcio"
codigo[$xx]="no"
ref1[$xx]="divorcio"
ref2[$xx]="l6515"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L8245.htm"
arquivo[$xx]="L8245 - Loca��es.htm"
descricao[$xx]="Loca��es"
codigo[$xx]="no"
ref1[$xx]="locacoes"
ref2[$xx]="l8245"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L8429.htm"
arquivo[$xx]="L8429 - Improbidade Administrativa.htm"
descricao[$xx]="Improbidade Administrativa"
codigo[$xx]="no"
ref1[$xx]="lia"
ref2[$xx]="l8429"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L8666cons.htm"
arquivo[$xx]="L8666 - Liita��es e Contratos Adm.htm"
descricao[$xx]="Licita��es e Contratos Adm."
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l8666"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9099.htm"
arquivo[$xx]="L9099 - Juizados Especiais.htm"
descricao[$xx]="Juizados Especiais"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l9099"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil/Leis/LEIS_2001/L10259.htm"
arquivo[$xx]="L10259 - Juizados Federais.htm"
descricao[$xx]="Juizados Federais"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l10259"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9494.htm"
arquivo[$xx]="L9494 - Antecipa��o de Tutela contra Fazenda.htm"
descricao[$xx]="Antecipa��o de Tutela contra a Fazenda P�blica"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l9494"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/2003/L10.741.htm"
arquivo[$xx]="L10741 - Estatuto do Idoso.htm"
descricao[$xx]="Estatuto do Idoso"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l10741"
ligado[$xx]="yes"



#CRIMINAIS:

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L8072.htm"
arquivo[$xx]="L8072 - Crimes Hediondos.htm"
descricao[$xx]="Crimes Hediondos"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l8072"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9296.htm"
arquivo[$xx]="L9296 - Escuta Telef�nica.htm"
descricao[$xx]="Escuta Telef�nica"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l9296"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9455.htm"
arquivo[$xx]="L9455 - Tortura.htm"
descricao[$xx]="Tortura"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l9455"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/2003/L10.826.htm"
arquivo[$xx]="L10826 - Estatuto do Desarmamento.htm"
descricao[$xx]="Estatuto do Desarmamento"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l10826"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/_Ato2004-2006/2006/Lei/L11343.htm"
arquivo[$xx]="L11343 - Drogas - Sinad.htm"
descricao[$xx]="Drogas - Entorpecentes - Sinad"
codigo[$xx]="no"
ref1[$xx]="drogas"
ref2[$xx]="l11343"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/_Ato2004-2006/2006/Lei/L11340.htm"
arquivo[$xx]="L11340 - Viol�ncia Contra Mulher.htm"
descricao[$xx]="Viol�ncia Contra Mulher - Maria da Penha"
codigo[$xx]="no"
ref1[$xx]="."
ref2[$xx]="l11340"
ligado[$xx]="yes"



# ESPECIAIS (diret�rios separados)

# Mandado de Seguran�a:

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L1533.htm"
arquivo[$xx]="L1533-51.htm"
descricao[$xx]="MS - Mandado de Seguran�a"
codigo[$xx]="no"
ref1[$xx]="ms"
ref2[$xx]="l1533"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L5021.htm"
arquivo[$xx]="L5021-66 - MS - Ptgo a servidor p�blico por Mand.Seg.htm"
descricao[$xx]="MS - Pagamento a Servidor P�blico por Mandado de Seguran�a"
codigo[$xx]="no"
ref1[$xx]="ms"
ref2[$xx]="l5021"
ligado[$xx]="yes"


# A��o Civil P�blica
xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L7913.htm"
arquivo[$xx]="L7913 - ACP - Danos no mercado de valores mobili�rios.htm"
descricao[$xx]="ACP - Danos no mercado de valores mobili�rios"
codigo[$xx]="no"
ref1[$xx]="acp"
ref2[$xx]="l7913"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L7347orig.htm"
arquivo[$xx]="L7347 - ACP - Danos ao meio-ambiete - consumidor.htm"
descricao[$xx]="ACP - Danos ao meio-ambiete - consumidor"
codigo[$xx]="no"
ref1[$xx]="acp"
ref2[$xx]="l7347"
ligado[$xx]="yes"



# A��o Popular
xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L4717.htm"
arquivo[$xx]="L4717 - AP - Regula a A��o Popular.htm"
descricao[$xx]="AP - Regula a A��o Popular"
codigo[$xx]="no"
ref1[$xx]="ap"
ref2[$xx]="l4717"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L6513.htm"
arquivo[$xx]="L6513 - AP - Cria��o de �reas de Interesse Tur�stico.htm"
descricao[$xx]="AP - Cria��o de �reas de Interesse Tur�stico"
codigo[$xx]="no"
ref1[$xx]="ap"
ref2[$xx]="l6513"
ligado[$xx]="yes"


# Habeas Data
xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9507.htm"
arquivo[$xx]="L9507 - HD - Regula o Habeas Data.htm"
descricao[$xx]="HD - Regula o Habeas Data"
codigo[$xx]="no"
ref1[$xx]="hd"
ref2[$xx]="l9507"
ligado[$xx]="yes"

xx=$(($xx+1))
link[$xx]="http://www.planalto.gov.br/ccivil_03/Leis/L9051.htm"
arquivo[$xx]="L9051 - HD - Expedi��o de Certid�es.htm"
descricao[$xx]="HD - Expedi��o de Certid�es"
codigo[$xx]="no"
ref1[$xx]="hd"
ref2[$xx]="l9051"
ligado[$xx]="yes"


# Legisla��o Estadual - RJ
xx=$(($xx+1))
link[$xx]="http://alerjln1.alerj.rj.gov.br/CONTLEI.NSF/c8aa0900025feef6032564ec0060dfff/fa1a422b516211130325657a0064293f?OpenDocument&Highlight=0,2877"
arquivo[$xx]="Lei Estadual 2877-97 IPVA.htm"
descricao[$xx]="Lei Estadual n. 2877-97 - IPVA"
codigo[$xx]="no"
ref1[$xx]="ipva"
ref2[$xx]="le2877"
ligado[$xx]="yes"



#Acho que daqui para baixo voc� n�o precisar� mexer em nada...
#Mas se quiser, fique a vontade  :-)



meutotal=$((${#link[@]}-1))


if [ $1 > /dev/null ]
   then
      entrada="$1"
   else
      entrada="todos"
fi

if [ $entrada = "codigos" ] 
   then
      for ((  i = 0 ;  i <= $meutotal;  i++  ))
      do

         if [ ${ligado[$i]} = "yes" ] && [ ${codigo[$i]} = "yes" ]; then
           echo ""
           echo "....Obtendo --> ${descricao[$i]}"
                for ((  t = 0 ;  t <= 2;  t++  ))
                do
                   wget --proxy=$usandoproxy --proxy-user=$userproxy --proxy-password=$userproxypass --no-check-certificate -a .wget.log.atualizaleis -N -c -O "${arquivo[$i]}" ${link[$i]}
                done
         fi
      done


  else

      for ((  i = 0 ;  i <= $meutotal;  i++  ))
      do

         if [ $entrada = "todos" ] || [ $entrada = ${ref1[$i]} ] || [ $entrada = ${ref2[$i]} ] 
           then

             if [ ${ligado[$i]} = "yes" ]; then
                echo ""
                echo "....Obtendo --> ${descricao[$i]}"
                     for ((  t = 0 ;  t <= 2;  t++  ))
                     do
                        wget --proxy=$usandoproxy --proxy-user=$userproxy --proxy-password=$userproxypass --no-check-certificate -a .wget.log.atualizaleis -c -O "${arquivo[$i]}" ${link[$i]}
                     done


                 if [ ${ref1[$i]} = "sumulas" ] || [ ${ref2[$i]} = "sumulas" ]
                     then
                        mv "${arquivo[$i]}" "$sumula/${arquivo[$i]}"
                  fi

                 if [ ${ref1[$i]} = "ms" ] || [ ${ref2[$i]} = "ms" ]
                     then
                        mv "${arquivo[$i]}" "$ms/${arquivo[$i]}"
                 fi

                 if [ ${ref1[$i]} = "hd" ] || [ ${ref2[$i]} = "hd" ]
                     then
                        mv "${arquivo[$i]}" "$hd/${arquivo[$i]}"
                 fi

                 if [ ${ref1[$i]} = "acp" ] || [ ${ref2[$i]} = "acp" ]
                     then
                        mv "${arquivo[$i]}" "$acp/${arquivo[$i]}"
                 fi

                 if [ ${ref1[$i]} = "ap" ] || [ ${ref2[$i]} = "ap" ]
                     then
                        mv "${arquivo[$i]}" "$ap/${arquivo[$i]}"
                 fi
             fi
         fi
       done
fi

echo "............................................................"
echo "............................................................"
echo "............................................................"
echo "                  Atualiza��o completa!                     "
echo "............................................................"
echo "............................................................"
echo "............................................................"