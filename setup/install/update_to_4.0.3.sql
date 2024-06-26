UPDATE `gaz_config` SET `cvalue` = '46' WHERE `id` =2;
ALTER TABLE `gaz_letter` CHANGE `corpo` `corpo` TEXT;
ALTER TABLE `gaz_rigdoc` CHANGE `descri` `descri` VARCHAR( 100 ) NOT NULL;
ALTER TABLE `gaz_rigdoc` ADD `id_body_text` INT NOT NULL AFTER `descri`;
ALTER TABLE `gaz_rigbro` CHANGE `descri` `descri` VARCHAR( 100 ) NOT NULL;
ALTER TABLE `gaz_rigbro` ADD `id_body_text` INT NOT NULL AFTER `descri`;
ALTER TABLE `gaz_aziend` ADD `ricbol` DECIMAL( 5, 2 ) NOT NULL AFTER `acciva` ;
UPDATE `gaz_module` SET `weight` = '99' WHERE `id` =1 LIMIT 1 ;
UPDATE `gaz_aziend` SET `ricbol` = '1.81' WHERE `codice` = 1 ;
TRUNCATE TABLE `gaz_menu_script`;
INSERT INTO `gaz_menu_script`
(`id`, `id_menu`, `link`, `icon`, `class`, `translate_key`, `accesskey`, `weight`)
VALUES
(1, 1, 'admin_scontr.php?tipdoc=VCO&Insert', '', '', 1, '', 1),
(2, 2, 'admin_docven.php?Insert&tipdoc=FAI', '', '', 2, '', 1),
(3, 2, 'admin_docven.php?Insert&tipdoc=FNC', '', '', 3, '', 2),
(4, 2, 'admin_docven.php?Insert&tipdoc=FND', '', '', 4, '', 3),
(5, 2, 'select_docforprint.php', '', '', 5, '', 4),
(6, 2, 'emissi_fatdif.php', '', '', 6, '', 5),
(7, 2, 'accounting_documents.php?type=F', '', '', 7, '', 6),
(8, 3, 'admin_docven.php?Insert&tipdoc=DDT', '', '', 8, '', 1),
(9, 4, 'admin_broven.php?Insert&tipdoc=VPR', '', '', 9, '', 1),
(10, 5, 'admin_broven.php?Insert&tipdoc=VOR', '', '', 10, '', 1),
(11, 5, 'select_evaord.php', '', '', 11, '', 2),
(12, 6, 'insert_effett.php', '', '', 12, '', 1),
(13, 6, 'genera_effett.php', '', '', 13, '', 2),
(14, 6, 'select_effett.php', '', '', 14, '', 3),
(15, 6, 'distin_effett.php', '', '', 15, '', 4),
(16, 6, 'select_filerb.php', '', '', 16, '', 5),
(17, 6, 'contab_effett.php', '', '', 17, '', 6),
(18, 7, 'admin_client.php?Insert', '', '', 18, '', 1),
(19, 7, 'report_credit.php', '', '', 19, '', 2),
(20, 10, 'admin_broacq.php?tipdoc=APR', '', '', 1, '', 1),
(21, 10, 'admin_broacq.php?tipdoc=AOR', '', '', 2, '', 2),
(22, 11, 'admin_docacq.php?seziva=1&tipdoc=DDR&Insert', '', '', 3, '', 3),
(23, 11, 'admin_docacq.php?seziva=1&tipdoc=DDL&Insert', '', '', 4, '', 4),
(24, 12, 'admin_docacq.php?Insert&tipdoc=AFA', '', '', 5, '', 1),
(25, 12, 'admin_docacq.php?Insert&tipdoc=AFC', '', '', 6, '', 2),
(26, 12, 'contab_docacq.php?seziva=1', '', '', 7, '', 3),
(27, 14, 'admin_fornit.php?Insert', '', '', 8, '', 1),
(28, 17, 'admin_movcon.php?Insert', '', '', 1, '', 1),
(29, 18, 'insert_piacon.php', '', '', 2, '', 1),
(30, 18, 'select_partit.php?codice=108000030', '', '', 3, '', 2),
(31, 19, 'admin_caucon.php?Insert', '', '', 4, '', 1),
(32, 23, 'admin_artico.php?Insert', '', '', 1, '', 1),
(33, 24, 'admin_catmer.php?Insert', '', '', 2, '', 1),
(34, 25, 'admin_movmag.php?Insert', '', '', 3, '', 1),
(35, 25, 'select_schart.php', '', '', 4, '', 2),
(36, 25, 'select_giomag.php', '', '', 5, '', 3),
(37, 25, 'genera_movmag.php', '', '', 6, '', 4),
(38, 26, 'admin_caumag.php?Insert', '', '', 7, '', 1),
(39, 32, 'error_rigmoc.php', '', '', 1, '', 1),
(40, 32, 'error_protoc.php', '', '', 2, '', 2),
(41, 38, 'admin_bank_account.php?Insert', '', '', 1, '', 1),
(42, 39, 'admin_aliiva.php?Insert', '', '', 2, '', 1),
(43, 40, 'admin_pagame.php?Insert', '', '', 3, '', 1),
(44, 41, 'insert_banapp.php', '', '', 4, '', 1),
(45, 42, 'insert_spediz.php', '', '', 5, '', 1),
(46, 43, 'insert_vettor.php', '', '', 6, '', 1),
(47, 44, 'admin_imball.php?Insert', '', '', 7, '', 1),
(48, 45, 'insert_portos.php', '', '', 8, '', 1),
(49, 46, 'admin_utente.php?Insert', '', '', 9, '', 1),
(50, 8, 'admin_agenti.php?Insert', '', '', 20, '', 1),
(51, 7, 'report_salcon.php', '', '', 21, '', 3),
(52, 23, 'recalc_exist_value.php', '', '', 8, '', 2),
(53, 23, 'inventory_stock.php', '', '', 9, '', 3),
(54, 47, 'admin_letter.php?Insert', '', '', 3, '', 1),
(55, 51, 'admin_contract.php?Insert', '', '', 22, '', 1),
(56, 51, 'invoice_from_contract.php', '', '', 23, '', 2),
(57, 1, 'accounting_documents.php?type=VRI', '', '', 24, '', 3),
(58, 1, 'report_received.php', '', '', 25, '', 2),
(59, 11, 'admin_docacq.php?tipdoc=ADT&Insert', '', '', 10, '', 2),
(60, 11, 'report_acqddt.php', '', '', 9, '', 1);
TRUNCATE TABLE `gaz_menu_module`;
INSERT INTO `gaz_menu_module`
(`id`, `id_module`, `link`, `icon`, `class`, `translate_key`, `accesskey`, `weight`)
VALUES
(0, 1, 'admin.php', ' ', '', 1, '', 1),
(1, 2, 'report_scontr.php', '', '', 1, '', 1),
(2, 2, 'report_docven.php', '', ' ', 2, '', 2),
(3, 2, 'report_doctra.php', '', '', 3, '', 3),
(4, 2, 'report_broven.php?auxil=VPR', '', '', 4, '', 4),
(5, 2, 'report_broven.php?auxil=VOR', '', '', 5, '', 5),
(6, 2, 'report_effett.php', '', '', 6, '', 6),
(7, 2, 'report_client.php', '', '', 7, '', 7),
(8, 2, 'report_agenti.php', '', '', 8, '', 9),
(51, 2, 'report_contract.php', '', '', 10, '', 8),
(9, 2, '../magazz/report_statis.php', '', '', 9, '', 10),
(10, 3, 'report_broacq.php', '', '', 1, '', 1),
(11, 3, 'report_ddtacq.php', '', '', 2, '', 2),
(12, 3, 'report_docacq.php', '', '', 3, '', 3),
(13, 3, 'report_pagdeb.php', '', '', 4, '', 4),
(14, 3, 'report_fornit.php', '', '', 5, '', 5),
(15, 3, 'report_debiti.php', '', '', 6, '', 6),
(16, 3, 'stampa_schcar.php', '', '', 7, '', 7),
(17, 4, 'report_movcon.php', '', '', 1, '', 1),
(18, 4, 'report_piacon.php', '', '', 2, '', 2),
(19, 4, 'report_caucon.php', '', '', 3, '', 3),
(20, 4, 'select_regiva.php', '', '', 4, '', 4),
(21, 4, 'select_liqiva.php', '', '', 5, '', 5),
(22, 4, 'select_libgio.php', '', '', 6, '', 6),
(23, 5, 'report_artico.php', '', '', 1, '', 1),
(24, 5, 'report_catmer.php', '', '', 2, '', 2),
(25, 5, 'report_movmag.php', '', '', 3, '', 3),
(26, 5, 'report_caumag.php', '', '', 4, '', 4),
(27, 5, 'select_listin.php', '', '', 5, '', 5),
(28, 5, 'update_prezzi.php', '', '', 6, '', 6),
(29, 5, 'select_deplia.php', '', '', 7, '', 7),
(30, 5, 'report_statis.php', '', '', 8, '', 8),
(31, 6, 'select_comiva.php', '', '', 1, '', 1),
(32, 6, 'report_control.php', '', '', 2, '', 2),
(33, 6, 'select_elencf.php', '', '', 3, '', 3),
(34, 6, 'select_chiape.php', '', '', 4, '', 4),
(35, 6, 'select_bilanc.php', '', '', 5, '', 5),
(36, 6, 'select_bilcee.php', '', '', 6, '', 6),
(37, 7, 'admin_aziend.php', '', '', 1, '', 1),
(38, 7, 'report_banche.php', '', '', 2, '', 2),
(39, 7, 'report_aliiva.php', '', '', 3, '', 3),
(40, 7, 'report_pagame.php', '', '', 4, '', 4),
(41, 7, 'report_banapp.php', '', '', 5, '', 5),
(42, 7, 'report_spediz.php', '', '', 6, '', 6),
(43, 7, 'report_vettor.php', '', '', 7, '', 7),
(44, 7, 'report_imball.php', '', '', 8, '', 8),
(45, 7, 'report_portos.php', '', '', 9, '', 9),
(46, 7, 'report_utenti.php', '', '', 10, '', 10),
(47, 8, 'report_letter.php', '', '', 1, '', 1),
(48, 8, 'select_intest.php', '', '', 2, '', 2),
(49, 8, 'backup.php', '', '', 3, '', 3),
(50, 8, 'update_control.php', '', '', 4, '', 4);
CREATE TABLE `gaz_contract` (
  `id_contract` INT NOT NULL auto_increment,
  `id_costumer` INT NOT NULL,
  `vat_section` INT NOT NULL,
  `doc_number` INT NOT NULL,
  `doc_type` VARCHAR(3) NOT NULL,
  `conclusion_date` DATE NOT NULL DEFAULT '0000-00-00',
  `start_date` DATE NOT NULL DEFAULT '0000-00-00',
  `months_duration` INT NOT NULL,
  `initial_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `periodic_reassessment` INT NOT NULL,
  `periodicity` INT NOT NULL,
  `payment_method` INT NOT NULL,
  `bank` INT NOT NULL,
  `tacit_renewal` INT NOT NULL,
  `current_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cod_revenue` INT NOT NULL,
  `id_con` INT NOT NULL,
  `vat_code` INT NOT NULL,
  `id_body_text` INT NOT NULL,
  `last_reassessment` DATE NOT NULL DEFAULT '0000-00-00',
  `id_agente` INT NOT NULL,
  `provvigione` decimal(4,2) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `note` VARCHAR(64) NOT NULL,
  `adminid` VARCHAR(20) NOT NULL DEFAULT '',
  `last_modified` TIMESTAMP NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id_contract`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `gaz_contract_row` (
  `id_row` INT NOT NULL auto_increment,
  `id_contract` INT NOT NULL,
  `descri` VARCHAR(100) default NULL,
  `unimis` CHAR(3) NOT NULL DEFAULT '',
  `quanti` decimal(12,3) default NULL,
  `price` decimal(14,5) DEFAULT '0.00000',
  `discount` decimal(4,1) DEFAULT '0.0',
  `vat_code` INT NOT NULL,
  `cod_revenue` INT NOT NULL,
  `id_con` INT NOT NULL,
  `status` VARCHAR(10) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id_contract`,`id_row`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `gaz_body_text` (
  `id_body` INT NOT NULL auto_increment,
  `table_name_ref` VARCHAR(50) NOT NULL DEFAULT '',
  `id_ref` INT NOT NULL,
  `body_text` TEXT NOT NULL,
  `iso3_country` CHAR(3) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id_body`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `gaz_tesbro` CHANGE `id_iva` `id_contract` INT NOT NULL ;
ALTER TABLE `gaz_tesdoc` CHANGE `id_iva` `id_contract` INT NOT NULL ;
