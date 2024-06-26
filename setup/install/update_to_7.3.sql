UPDATE `gaz_config` SET `cvalue` = '97' WHERE `id` =2;
ALTER TABLE `gaz_admin` CHANGE COLUMN `datpas` `datpas` DATE NULL DEFAULT '2004-01-27' AFTER `datacc`;
CREATE TABLE IF NOT EXISTS `gaz_admin_config` ( `id` INT NOT NULL AUTO_INCREMENT, `adminid` VARCHAR(20) NOT NULL DEFAULT '', `var_descri` VARCHAR(100) NOT NULL DEFAULT '', `var_name` VARCHAR(100) NOT NULL DEFAULT '', `var_value` text, PRIMARY KEY (`id`), KEY `adminid` (`adminid`), KEY `var_name` (`var_name`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `gaz_admin_config` (`adminid`, `var_descri`, `var_name`, `var_value`) SELECT Login , 'Contenuto in HTML del testo del corpo delle email inviate dell\'utente', 'body_send_doc_email', '' FROM `gaz_admin`;
INSERT INTO `gaz_admin_config` (`adminid`, `var_descri`, `var_name`, `var_value`) SELECT Login , 'Menu/header/footer personalizzabile', 'theme', '/library/theme/g7' FROM `gaz_admin`;
DELETE FROM `gaz_config` WHERE  `variable`='theme';
ALTER TABLE `gaz_anagra` ADD COLUMN `pec_email` VARCHAR(50) NOT NULL DEFAULT '' AFTER `e_mail`;
ALTER TABLE `gaz_anagra` CHANGE COLUMN `fe_cod_univoco` `fe_cod_univoco` VARCHAR(7) NOT NULL AFTER `pariva`;
ALTER TABLE `gaz_anagra` CHANGE COLUMN `datnas` `datnas` DATE NULL DEFAULT '1900-01-01' AFTER `sexper`;
UPDATE `gaz_anagra` SET datnas = '1900-01-01' WHERE YEAR(datnas) = 0;
ALTER TABLE `gaz_aziend` ADD COLUMN `pec` VARCHAR(50) NOT NULL DEFAULT '' AFTER `rea`;
ALTER TABLE `gaz_aziend` CHANGE COLUMN `datnas` `datnas` DATE NULL DEFAULT '1900-01-01' AFTER `sexper`;
UPDATE `gaz_aziend` SET datnas = '1900-01-01' WHERE YEAR(datnas) = 0;
-- START_WHILE ( questo e' un tag che serve per istruire install.php ad INIZIARE ad eseguire le query seguenti su tutte le aziende dell'installazione)
ALTER TABLE `gaz_XXXclfoco`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXclfoco` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXagenti`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXagenti` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXagenti_forn` CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXagenti_forn` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXaliiva`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXaliiva` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXartico`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXartico` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXbanapp`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXbanapp` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXcatmer`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXcatmer` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXcaucon`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXcaucon` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXcaumag`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXcaumag` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXeffett`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXeffett` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXfiles`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXfiles` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXimball`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXimball` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXletter`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXletter` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXmovmag`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXmovmag` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXpagame`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXpagame` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXportos`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXportos` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXragstat` CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXragstat` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXspediz`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXspediz` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXtesbro`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXtesbro` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXtesdoc`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXtesdoc` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXtesmov`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXtesmov` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXvettor`	CHANGE COLUMN `last_modified` `last_modified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `adminid`;
UPDATE `gaz_XXXvettor` SET last_modified = '2004-01-27 18:20:00' WHERE YEAR(last_modified) = 0;
ALTER TABLE `gaz_XXXclfoco`	DROP COLUMN `daulfa`, DROP COLUMN `daulbo`;
ALTER TABLE `gaz_XXXcontract` CHANGE COLUMN `conclusion_date` `conclusion_date` DATE NULL DEFAULT '2004-01-27' AFTER `doc_type`;
ALTER TABLE `gaz_XXXcontract` CHANGE COLUMN `start_date` `start_date` DATE NULL DEFAULT '2004-01-27' AFTER `conclusion_date`;
ALTER TABLE `gaz_XXXcontract` CHANGE COLUMN `last_reassessment` `last_reassessment` DATE NULL DEFAULT '2004-01-27' AFTER `id_body_text`;
ALTER TABLE `gaz_XXXeffett` CHANGE COLUMN `datemi` `datemi` DATE NULL DEFAULT '2004-01-27' AFTER `tipeff`;
ALTER TABLE `gaz_XXXeffett` CHANGE COLUMN `datfat` `datfat` DATE NULL DEFAULT '2004-01-27' AFTER `protoc`;
ALTER TABLE `gaz_XXXeffett` CHANGE COLUMN `scaden` `scaden` DATE NULL DEFAULT '2004-01-27' AFTER `impeff`;
ALTER TABLE `gaz_XXXletter` CHANGE COLUMN `write_date` `write_date` DATE NULL DEFAULT '2004-01-27' AFTER `id_let`;
ALTER TABLE `gaz_XXXrigbro` CHANGE COLUMN `delivery_date` `delivery_date` DATE NULL DEFAULT '2004-01-27' AFTER `ritenuta`;
UPDATE `gaz_XXXrigbro` SET delivery_date = '2004-01-27' WHERE YEAR(delivery_date) = 0;
ALTER TABLE `gaz_XXXstaff` CHANGE COLUMN `joined_date` `joined_date` DATE NULL DEFAULT '2004-01-27' AFTER `employment_status`;
UPDATE `gaz_XXXstaff` SET joined_date = '2004-01-27' WHERE YEAR(joined_date) = 0;
ALTER TABLE `gaz_XXXstaff` CHANGE COLUMN `graduation_year` `graduation_year` DATE NULL DEFAULT '2004-01-27' AFTER `institution`;
UPDATE `gaz_XXXstaff` SET graduation_year = '2004-01-27' WHERE YEAR(graduation_year) = 0;
ALTER TABLE `gaz_XXXstaff` CHANGE COLUMN `start_date` `start_date` DATE NULL DEFAULT '2004-01-27' AFTER `graduation_year`;
UPDATE `gaz_XXXstaff` SET start_date = '2004-01-27' WHERE YEAR(start_date) = 0;
ALTER TABLE `gaz_XXXstaff` CHANGE COLUMN `end_date` `end_date` DATE NULL DEFAULT '2004-01-27' AFTER `start_date`;
UPDATE `gaz_XXXstaff` SET end_date = '2004-01-27' WHERE YEAR(end_date) = 0;
ALTER TABLE `gaz_XXXtesbro` CHANGE COLUMN `datemi` `datemi` DATE NULL DEFAULT '2004-01-27' AFTER `day_of_validity`;
UPDATE `gaz_XXXtesbro` SET datemi = '2004-01-27' WHERE YEAR(datemi) = 0;
ALTER TABLE `gaz_XXXtesbro` CHANGE COLUMN `datfat` `datfat` DATE NULL DEFAULT '2004-01-27' AFTER `numfat`;
UPDATE `gaz_XXXtesbro` SET datfat = '2004-01-27' WHERE YEAR(datfat) = 0;
ALTER TABLE `gaz_XXXtesbro` CHANGE COLUMN `initra` `initra` DATETIME NULL DEFAULT '2004-01-27 18:20:00' AFTER `volume`;
UPDATE `gaz_XXXtesbro` SET initra = '2004-01-27 18:20:00' WHERE YEAR(initra) = 0;
ALTER TABLE `gaz_XXXtesdoc` CHANGE COLUMN `datemi` `datemi` DATE NULL DEFAULT '2004-01-27' AFTER `template`;
UPDATE `gaz_XXXtesdoc` SET datemi = '2004-01-27' WHERE YEAR(datemi) = 0;
ALTER TABLE `gaz_XXXtesdoc` CHANGE COLUMN `data_ordine` `data_ordine` DATE NULL DEFAULT '2004-01-27' AFTER `datemi`;
UPDATE `gaz_XXXtesdoc` SET data_ordine = '2004-01-27' WHERE YEAR(data_ordine) = 0;
ALTER TABLE `gaz_XXXtesdoc` CHANGE COLUMN `datfat` `datfat` DATE NULL DEFAULT '2004-01-27' AFTER `numfat`;
UPDATE `gaz_XXXtesdoc` SET datfat = '2004-01-27' WHERE YEAR(datfat) = 0;
ALTER TABLE `gaz_XXXtesdoc` CHANGE COLUMN `initra` `initra` DATETIME NULL DEFAULT '2004-01-27 18:20:00' AFTER `volume`;
UPDATE `gaz_XXXtesdoc` SET initra = '2004-01-27 18:20:00' WHERE YEAR(initra) = 0;
ALTER TABLE `gaz_XXXtesmov` CHANGE COLUMN `datdoc` `datdoc` DATE NULL DEFAULT '2004-01-27' AFTER `numdoc`;
UPDATE `gaz_XXXtesmov` SET datdoc = '2004-01-27' WHERE YEAR(datdoc) = 0;
ALTER TABLE `gaz_XXXtesmov` CHANGE COLUMN `datreg` `datreg` DATE NULL DEFAULT '2004-01-27' AFTER `descri`;
UPDATE `gaz_XXXtesmov` SET datreg = '2004-01-27' WHERE YEAR(datreg) = 0;
ALTER TABLE `gaz_XXXcompany_config`	CHANGE COLUMN `val` `val` VARCHAR(2000) NULL DEFAULT NULL AFTER `var`;
INSERT INTO `gaz_XXXcompany_config` (`description`,`var`, `val`) SELECT  'Testo in HTML delle email inviate dall\'azienda', 'company_email_text', body_text FROM `gaz_XXXbody_text` WHERE table_name_ref = 'body_send_doc_email';
DELETE FROM `gaz_XXXbody_text` WHERE  `table_name_ref` = 'body_send_doc_email';
INSERT INTO `gaz_XXXcompany_config` (`description`, `var`, `val`) VALUES ('Visualizzazione scadenzario in Home page (0=No,1=Si)', 'schedule_view', '1');
-- STOP_WHILE ( questo e' un tag che serve per istruire install.php a SMETTERE di eseguire le query su tutte le aziende dell'installazione)