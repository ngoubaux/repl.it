BORD=$(cat << EndOfMessage
738837118244101COMPLEXE CLTL FLORAC        17112021231120214717112021000000000000000000181120210000000000000000001911202100000000000000000020112021000000000000000000211120210000000000000000002211202100000000000000000023112021002000193000019300
738837118244101PREAU GPE SCOLCOLLET DE DEZE17112021231120214717112021000000000000000000181120210000000000000000001911202100000000000000000020112021000000000000000000211120210000000000000000002211202100000000000000000023112021001000053000005300
738837118244101FOYER SOCIO CLLASALLE       17112021231120214717112021000000000000000000181120210000000000000000001911202100000000000000000020112021000000000000000000211120210000000000000000002211202100000000000000000023112021001000102000010200
738837118244101SL POLYVALENTEMERGRAEIS     17112021231120214717112021000000000000000000181120210000000000000000001911202100100005300000530020112021000000000000000000211120210000000000000000002211202100000000000000000023112021000000000000000000
738837118244101SL POLYVALENTEST ETIENNE VAL17112021231120214717112021000000000000000000181120210010000290000029001911202100000000000000000020112021000000000000000000211120210000000000000000002211202100000000000000000023112021000000000000000000
738837118244101SALLE POLYVALEVILLEFORT EN C17112021231120214717112021000000000000000000181120210000000000000000001911202100100006000000600020112021000000000000000000211120210000000000000000002211202100000000000000000023112021000000000000000000
738837118244101SALLE POLYVALEPREVENCHERE   17112021231120214717112021000000000000000000181120210010000170000017001911202100000000000000000020112021000000000000000000211120210000000000000000002211202100000000000000000023112021000000000000000000
738837118244101SALLE POLYVALEPREVENCHERE   17112021231120214717112021000000000000000000181120210010000080000008001911202100000000000000000020112021000000000000000000211120210000000000000000002211202100000000000000000023112021000000000000000000
738837118244102NUM10000110977LA MARCHE DE L EMPEREUR        01556WALT DISNEY STUDIOS DISTR          01P000010000500000000021625
738837118244104FLORAC        TE  059981 060034000053001000000000530000000TE  060034 060174000140001000000001400000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244104COLLET DE DEZETE  059826 059879000053001000000000530000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244104LASALLE       TE  059879 059981000102001000000001020000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244104MERGRAEIS     TE  059773 059826000053001000000000530000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244104ST ETIENNE VALTE  059659 059688000029001000000000290000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244104VILLEFORT EN CTE  059713 059773000060001000000000600000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244104PREVENCHERE   TE  059688 059705000017001000000000170000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244104PREVENCHERE   TE  059705 059713000008001000000000080000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837118244106009000515000000515000947000000487710000000552100000043250000000000000000000000000000043250 0000002162512100000000523000000211021100000000023212P00000023212
738837118244110CINECO                             LA ROUVIERE                        LA PAILLOTE                        SAINT MARTIN DE LANSUSCLE          48110    SAINT MARTIN DE LANSUSCLE          04664594410000000000


EndOfMessage
)

function parse_type01 {
    record=$1
    echo "      Enseigne:       ${record:0:14}"
    echo "      Ville:          ${record:14:14}"
    echo "      Date de début:  ${record:28:8}"
    echo "      Date de fin:    ${record:36:8}"
    echo "      Semaine:        ${record:44:2}"
    
    offset=46
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Jour:           ${record:($offset):8}"
        offset=$(($offset+8))
        echo "          Nbr séance:     ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Nbr spéctateur: ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          recette:        ${record:($offset):9}"
        offset=$(($offset+9))
    done
    echo "          ---------------------"
}

function parse_type02 {
    record=$1
    offset=0
    echo "      Type de projection:       ${record:($offset):3}"
    offset=$(($offset+3))
    echo "      version du programme:     ${record:($offset):1}"
    offset=$(($offset+1))
    echo "      VISA:                     ${record:($offset):10}"
    offset=$(($offset+10))
    echo "      Titre film:               ${record:($offset):25}"
    offset=$(($offset+25))
    echo "      Numero copie:             ${record:($offset):6}"
    offset=$(($offset+6))
    echo "      Code distributeur:        ${record:($offset):5}"
    offset=$(($offset+5))
    echo "      Nom distributeur:         ${record:($offset):25}"
    offset=$(($offset+25))
    echo "      Ref Contract:             ${record:($offset):10}"
    offset=$(($offset+10))
    echo "      Numéro de condition:      ${record:($offset):2}"
    offset=$(($offset+2))
    echo "      Forfait/Min Garanti:      ${record:($offset):9}"
    offset=$(($offset+9))
    echo "      Taux Location:            ${record:($offset):4}"
    offset=$(($offset+4))
    echo "      Rendement brut partiel:   ${record:($offset):11}"
}

function parse_type03 {
    record=$1
    offset=0
    echo "      Ville:       ${record:($offset):14}"
    offset=$(($offset+14))
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Categorie:       ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Billet début:    ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Billet fin:      ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Spectateurs:     ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          Prix:            ${record:($offset):5}"
        offset=$(($offset+6))
        echo "          Recette:         ${record:($offset):11}"
        offset=$(($offset+11))
        echo "          Taxe spéciale:   ${record:($offset):5}"
        offset=$(($offset+5))
    done
    echo "          ---------------------"
}

function parse_type04 {
    record=$1
    offset=0
    echo "      Ville:       ${record:($offset):14}"
    offset=$(($offset+14))
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Categorie:       ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Billet début:   ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Billet fin:     ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Spectateurs:     ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          Prix:            ${record:($offset):5}"
        offset=$(($offset+5))
        echo "          Recette:         ${record:($offset):11}"
        offset=$(($offset+11))
        echo "          Taxe spéciale:   ${record:($offset):5}"
        offset=$(($offset+5))
    done
    echo "          ---------------------"
}

function parse_type05 {
    record=$1
    offset=0
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Categorie:       ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Code Famille:    ${record:($offset):3}"
        offset=$(($offset+3))
    done
    echo "          ---------------------"
}

function parse_type06 {
    record=$1
    offset=0
    echo "      Total séance:           ${record:($offset):3}"
    offset=$(($offset+3))
    echo "      Total spéctateur:       ${record:($offset):6}"
    offset=$(($offset+6))
    echo "      Total Guichet:          ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Coef conversion:        ${record:($offset):4}"
    offset=$(($offset+4))
    echo "      Total hors TVA:         ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Total taxe spe:         ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Total hors tout:        ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Supp location:          ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Prix attraction:        ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Base film:              ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Groupe Bordereau:       ${record:($offset):1}"
    offset=$(($offset+1))
    echo "      Rendement brut global:  ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Taux recup SACEM:       ${record:($offset):3}"
    offset=$(($offset+3))
    echo "      Recupération SACEM:     ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Facturation hors TVA:   ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Coef multiplicateur:    ${record:($offset):5}"
    offset=$(($offset+5))
    echo "      Facturation TVA:        ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Facturation distrib:    ${record:($offset):12}"
    offset=$(($offset+11))
}


function parse_type08 {
    record=$1
    offset=0
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Billets:   ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          Prix:    ${record:($offset):5}"
        offset=$(($offset+5))
    done
    echo "          ---------------------"
}

function parse_type09 {
    record=$1
    offset=0
    echo "      Code distributeur:      ${record:($offset):5}"
    offset=$(($offset+5))
    echo "      Commentaire:            ${record:($offset):60}"
    offset=$(($offset+60))
    echo "      Montant:                ${record:($offset):12}"
    offset=$(($offset+12))
}

function parse_type10 {
    record=$1
    offset=0
    echo "      Raison Social:          ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Rue:                    ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Batiment:               ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Localité:               ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Code postal:            ${record:($offset):9}"
    offset=$(($offset+9))
    echo "      Bureau distributeur:    ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Téléphone:              ${record:($offset):10}"
    offset=$(($offset+10))
    echo "      Fax:                    ${record:($offset):10}"
    offset=$(($offset+10))
}

FIRST=0
while IFS= read -r line
do
    ltrim=`echo $line | sed -e 's/^[[\r\n:space:]]*//'`
    
    if [ "$ltrim" = "" ]; then
      continue;
    fi

    echo "--------------"
    echo "  Numéro de région:       ${line:0:1}"
    echo "  Numéro d'autorisation:  ${line:1:6}"
    echo "  Numéro de manifold:     ${line:7:5}"
    echo "  Type de bordereau:      ${line:12:1}"
    echo "  Taille enregistrement:  ${#line}"

    rec_size=$((${#line}-15))
    line_size=$((${#line}-15))
    case ${line:13:2} in
    "01")
        echo "  Type d'enregistrement:  Résultats par jour (${line:13:2})"
        echo ""
        parse_type01 "${line:15:($rec_size)}"
    ;;
    "02")
        echo "  Type d'enregistrement:  Elément du programme et conditions de location (${line:13:2}) "
        echo ""
        parse_type02 "${line:15:($rec_size)}"
    ;;
    "03")
        echo "  Type d'enregistrement: Détail des séries location (${line:13:2})"
        echo ""
        parse_type03 "${line:15:($rec_size)}"
    ;;
    "04")
        echo "  Type d'enregistrement:  Détail par série de billets (${line:13:2})"
        echo ""
        parse_type04 "${line:15:($rec_size)}"
    ;;
    "05")
        echo "  Type d'enregistrement: Association catégorie | famille (${line:13:2})"
        echo ""
        parse_type05 "${line:15:($rec_size)}"
    ;;
    "06")
        echo "  Type d'enregistrement: Résultats totaux (${line:13:2})"
        echo ""
        parse_type06 "${line:15:($rec_size)}"
    ;;
    "08")
        echo "  Type d'enregistrement: Détail des billets annulés (${line:13:2})"
        echo ""
        parse_type08 "${line:15:($rec_size)}"
    ;;
    "09")
        echo "  Type d'enregistrement: Déduction frais de publicité (${line:13:2})"
        echo ""
        parse_type09 "${line:15:($rec_size)}"
    ;;
    "10")
        echo "  Type d'enregistrement: Adresse de correspondance de la salle (${line:13:2})"
        echo ""
        parse_type10 "${line:15:($rec_size)}"
    ;;
    esac
    echo ""
done <<< $BORD
