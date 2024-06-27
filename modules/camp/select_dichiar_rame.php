<?php
/*
	  --------------------------------------------------------------------------
	  GAzie - Gestione Azienda
	  Copyright (C) 2004-present - Antonio De Vincentiis Montesilvano (PE)
	  (https://www.devincentiis.it)
	  <https://gazie.sourceforge.net>
	  --------------------------------------------------------------------------
	  REGISTRO DI CAMPAGNA è un modulo creato per GAzie da Antonio Germani, Massignano AP
	  Copyright (C) 2018-2023 - Antonio Germani, Massignano (AP)
	  https://www.lacasettabio.it
	  https://www.programmisitiweb.lacasettabio.it
	  --------------------------------------------------------------------------
	  Questo programma e` free software;   e` lecito redistribuirlo  e/o
	  modificarlo secondo i  termini della Licenza Pubblica Generica GNU
	  come e` pubblicata dalla Free Software Foundation; o la versione 2
	  della licenza o (a propria scelta) una versione successiva.

	  Questo programma  e` distribuito nella speranza  che sia utile, ma
	  SENZA   ALCUNA GARANZIA; senza  neppure  la  garanzia implicita di
	  NEGOZIABILITA` o di  APPLICABILITA` PER UN  PARTICOLARE SCOPO.  Si
	  veda la Licenza Pubblica Generica GNU per avere maggiori dettagli.

	  Ognuno dovrebbe avere   ricevuto una copia  della Licenza Pubblica
	  Generica GNU insieme a   questo programma; in caso  contrario,  si
	  scriva   alla   Free  Software Foundation,  Inc.,   59
	  Temple Place, Suite 330, Boston, MA 02111-1307 USA Stati Uniti.
	  --------------------------------------------------------------------------
	  # free to use, Author name and references must be left untouched  #
	  --------------------------------------------------------------------------
*/
require("../../library/include/datlib.inc.php");
require ("../../modules/magazz/lib.function.php");
$admin_aziend=checkAdmin();
$msg=''; $array=array();

function getMovements($date_ini,$date_fin)
    {
        global $gTables,$admin_aziend;
        $m=array();
        $where="datdoc BETWEEN $date_ini AND $date_fin"; // Antonio Germani prendo la data di attuazione
        $what=$gTables['movmag'].".*, ".
              $gTables['caumag'].".codice, ".$gTables['caumag'].".descri, ".
              $gTables['artico'].".codice, ".$gTables['artico'].".descri AS desart, ".$gTables['artico'].".perc_K, ".$gTables['artico'].".perc_P, ".$gTables['artico'].".perc_N, ".$gTables['artico'].".unimis, ".$gTables['artico'].".scorta, ".$gTables['artico'].".catmer, ".$gTables['artico'].".rame_metallico ";
        $table=$gTables['movmag']." LEFT JOIN ".$gTables['caumag']." ON (".$gTables['movmag'].".caumag = ".$gTables['caumag'].".codice)
               LEFT JOIN ".$gTables['artico']." ON (".$gTables['movmag'].".artico = ".$gTables['artico'].".codice)";
        $rs=gaz_dbi_dyn_query ($what,$table,$where, 'datreg ASC, tipdoc ASC, clfoco ASC, operat DESC, id_mov ASC');
        while ($r = gaz_dbi_fetch_array($rs)) {
            $m[] = $r;
        }
        return $m;
    }

if (!isset($_POST['hidden_req'])) { //al primo accesso allo script
    $form['hidden_req'] = '';
	$form['sta_fert'] = false;
    $form['ritorno'] = $_SERVER['HTTP_REFERER'];
    $form['this_date_Y']=date("Y");
    $form['this_date_M']=date("m");
    $form['this_date_D']=date("d");
    if (!isset($_GET['di'])) {
       $form['date_ini_D']=1;
       $form['date_ini_M']=1;
       $form['date_ini_Y']=date("Y");
    } else {
       $form['date_ini_D']=intval(substr($_GET['di'],0,2));
       $form['date_ini_M']=intval(substr($_GET['di'],2,2));
       $form['date_ini_Y']=intval(substr($_GET['di'],4,4));
    }
    if (!isset($_GET['df'])) {
       $form['date_fin_D']=date("d");
       $form['date_fin_M']=date("m");
       $form['date_fin_Y']=date("Y");
    } else {
       $form['date_fin_D']= intval(substr($_GET['df'],0,2));
       $form['date_fin_M']= intval(substr($_GET['df'],2,2));
       $form['date_fin_Y']= intval(substr($_GET['df'],4,4));
    }
} else { // accessi successivi
    $form['hidden_req']=htmlentities($_POST['hidden_req']);
	if (isset ($_POST['sta_fert'])){
		$form['sta_fert']=true;
	} else {
		$form['sta_fert']=false;
	}
    $form['ritorno']=$_POST['ritorno'];
    $form['date_ini_D']=intval($_POST['date_ini_D']);
    $form['date_ini_M']=intval($_POST['date_ini_M']);
    $form['date_ini_Y']=intval($_POST['date_ini_Y']);
    $form['date_fin_D']=intval($_POST['date_fin_D']);
    $form['date_fin_M']=intval($_POST['date_fin_M']);
    $form['date_fin_Y']=intval($_POST['date_fin_Y']);
    $form['this_date_Y']=intval($_POST['this_date_Y']);
    $form['this_date_M']=intval($_POST['this_date_M']);
    $form['this_date_D']=intval($_POST['this_date_D']);
    if (isset($_POST['return'])) {
        header("Location: ".$form['ritorno']);
        exit;
    }
}

//controllo i campi
if (!checkdate( $form['this_date_M'],$form['this_date_D'],$form['this_date_Y']) ||
    !checkdate( $form['date_ini_M'], $form['date_ini_D'], $form['date_ini_Y']) ||
    !checkdate( $form['date_fin_M'], $form['date_fin_D'], $form['date_fin_Y'])) {
    $msg .='0+';
}
$utsexe= mktime(0,0,0,$form['this_date_M'],$form['this_date_D'],$form['this_date_Y']);
$utsini= mktime(0,0,0,$form['date_ini_M'],$form['date_ini_D'],$form['date_ini_Y']);
$utsfin= mktime(0,0,0,$form['date_fin_M'],$form['date_fin_D'],$form['date_fin_Y']);
if ($utsini > $utsfin) {
    $msg .='1+';
}
if ($utsexe < $utsfin) {
    $msg .='2+';
}
// fine controlli

if (isset($_POST['print']) && $msg=='') {
    $_SESSION['print_request']=array('script_name'=>'stampa_dichiar_rame',
                                     'ri'=>date("dmY",$utsini),
                                     'rf'=>date("dmY",$utsfin),
                                     'ds'=>date("dmY",$utsexe),
									 'stf'=>$form['sta_fert']
                                     );
    header("Location: sent_print.php");
    exit;
}

require("../../library/include/header.php");
$script_transl=HeadMain(0,array('calendarpopup/CalendarPopup'));
echo "<script type=\"text/javascript\">
var cal = new CalendarPopup();
var calName = '';
function setMultipleValues(y,m,d) {
     document.getElementById(calName+'_Y').value=y;
     document.getElementById(calName+'_M').selectedIndex=m*1-1;
     document.getElementById(calName+'_D').selectedIndex=d*1-1;
}
function setDate(name) {
  calName = name.toString();
  var year = document.getElementById(calName+'_Y').value.toString();
  var month = document.getElementById(calName+'_M').value.toString();
  var day = document.getElementById(calName+'_D').value.toString();
  var mdy = month+'/'+day+'/'+year;
  cal.setReturnFunction('setMultipleValues');
  cal.showCalendar('anchor', mdy);
}
</script>
";
echo "<form method=\"POST\" name=\"select\">\n";
echo "<input type=\"hidden\" value=\"".$form['hidden_req']."\" name=\"hidden_req\" />\n";
echo "<input type=\"hidden\" value=\"".$form['ritorno']."\" name=\"ritorno\" />\n";
$gForm = new magazzForm();
echo "<div align=\"center\" class=\"FacetFormHeaderFont\">".$script_transl['title'];
echo "</div>\n";
echo "<table class=\"Tsmall\" align=\"center\">\n";
if (!empty($msg)) {
    echo '<tr><td colspan="2" class="FacetDataTDred">'.$gForm->outputErrors($msg,$script_transl['errors'])."</td></tr>\n";
}
echo "<tr>\n";
echo "<td class=\"FacetFieldCaptionTD\">".$script_transl['date']."</td><td  class=\"FacetDataTD\">\n";
$gForm->CalendarPopup('this_date',$form['this_date_D'],$form['this_date_M'],$form['this_date_Y'],'FacetSelect',1);
echo "</tr>\n";
echo "<tr><td class=\"FacetFieldCaptionTD\">".$script_transl['date_ini']."</td><td  class=\"FacetDataTD\">\n";
$gForm->CalendarPopup('date_ini',$form['date_ini_D'],$form['date_ini_M'],$form['date_ini_Y'],'FacetSelect',1);
echo "</tr>\n";
echo "<tr>\n";
echo "<td class=\"FacetFieldCaptionTD\">".$script_transl['date_fin']."</td><td  class=\"FacetDataTD\">\n";
$gForm->CalendarPopup('date_fin',$form['date_fin_D'],$form['date_fin_M'],$form['date_fin_Y'],'FacetSelect',1);
echo "</tr>\n";
echo "<tr><td class=\"FacetFieldCaptionTD\">".$script_transl['sta_fert']."</td><td  class=\"FacetDataTD\">\n";
$gForm->selCheckbox('sta_fert', $form['sta_fert'], $script_transl['sta_fert']);
echo "</tr>\n";
echo "\t<tr class=\"FacetFieldCaptionTD\">\n";
echo "<td align=\"left\"><input type=\"submit\" name=\"return\" value=\"".$script_transl['return']."\">\n";
echo '<td align="right"> <input type="submit" accesskey="i" name="preview" value="';
echo $script_transl['view'];
echo '" tabindex="100" >';
echo "\t </td>\n";
echo "\t </tr>\n";
echo "</table>\n";

$date_ini =  sprintf("%04d%02d%02d",$form['date_ini_Y'],$form['date_ini_M'],$form['date_ini_D']);
$date_fin =  sprintf("%04d%02d%02d",$form['date_fin_Y'],$form['date_fin_M'],$form['date_fin_D']);

if (isset($_POST['preview']) and $msg=='') {
	$m=getMovements($date_ini,$date_fin);
	echo "<table class=\"Tlarge table table-striped table-bordered table-condensed table-responsive\">";
	if (sizeof($m) > 0) {
        $ctr_mv='';
        echo "<tr>";
		If ($form['sta_fert']==false){
			$linkHeaders=new linkHeaders($script_transl['header']);
		} else {
			$linkHeaders=new linkHeaders($script_transl['header_fert']);
		}
        $linkHeaders->output();
        echo "</tr>";

		foreach($m as $key => $mv) {
			If ($mv['campo_impianto']>0 && $mv['type_mov']==1){ // se nel movimento è inserito un campo di coltivazione ed è un movimento del registro di campagna
				if ($mv['rame_metallico']>0 OR ($mv['perc_N']>0 AND $form['sta_fert']==true)){ // se l'articolo contiene rame metallo o azoto con stampa fertilizzazioni
					$camp = gaz_dbi_get_row($gTables['campi'], 'codice', $mv['campo_impianto']); //carico i dati del campo di coltivazione

					$datedoc = substr($mv['datdoc'],8,2).'-'.substr($mv['datdoc'],5,2).'-'.substr($mv['datdoc'],0,4);
					$datereg = substr($mv['datreg'],8,2).'-'.substr($mv['datreg'],5,2).'-'.substr($mv['datreg'],0,4);

					echo "<tr><td class=\"FacetDataTD\">".$datedoc." &nbsp;</td>";
					echo "<td  align=\"left\" class=\"FacetDataTD\">".$mv['caumag'].'-'.substr($mv['descri'],0,20)." &nbsp</td>";

					// Antonio Germani carico la tabella campi e Inserisco campo, superficie e coltura
					$res = gaz_dbi_get_row ($gTables['campi'], 'codice', $mv['campo_impianto']);
					echo "<td align=\"left\" class=\"FacetDataTD\">".$mv['campo_impianto']." - ".$res['descri']." &nbsp;</td>";
					echo "<td class=\"FacetDataTD\" align=\"left\">".gaz_format_quantity($res['ricarico'],1,$admin_aziend['decimal_quantity'])." ha"." &nbsp;</td>\n";
					// fine inserisco campo, superficie, coltura

					echo "<td class=\"FacetDataTD\" align=\"left\">".$mv['artico']." &nbsp;</td>\n";
					echo "<td class=\"FacetDataTD\" align=\"left\">".$mv['unimis']." ".gaz_format_quantity($mv['quanti'],1,$admin_aziend['decimal_quantity'])."</td>\n";

					echo "<td class=\"FacetDataTD\" align=\"left\">"."Kg ".gaz_format_quantity(($mv['quanti']*$mv['rame_metallico']),1,$admin_aziend['decimal_quantity'])." </td>\n";
					if ($form['sta_fert']==true){
						echo "<td class=\"FacetDataTD\" align=\"left\">"."Kg ".gaz_format_quantity(($mv['quanti']*$mv['perc_N'])/100,1,$admin_aziend['decimal_quantity'])." </td>\n";
					}
					echo "</tr>\n";
					$ctr_mv = $mv['artico'];
				}
			}
        }
         echo "\t<tr class=\"FacetFieldCaptionTD\">\n";
         echo '<td colspan="7" align="right"><input type="submit" name="print" value="';
         echo $script_transl['print'];
         echo '">';
         echo "\t </td>\n";
         echo "\t </tr>\n";
	}
	echo "</table></form>";
}
?>
<?php
require("../../library/include/footer.php");
?>
