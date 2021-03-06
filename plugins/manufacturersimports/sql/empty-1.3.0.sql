DROP TABLE IF EXISTS `glpi_plugin_manufacturersimports_configs`;
CREATE TABLE `glpi_plugin_manufacturersimports_configs` (
	`id` int(11) NOT NULL auto_increment,
	`name` varchar(255) collate utf8_unicode_ci default NULL,
	`entities_id` int(11) NOT NULL default '0',
	`is_recursive` tinyint(1) NOT NULL default '0',
	`supplier_url` varchar(255) collate utf8_unicode_ci collate utf8_unicode_ci default NULL,
	`manufacturers_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_manufacturers (id)',
	`suppliers_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_suppliers (id)',
	`warranty_duration` int(11) NOT NULL default '0',
	`document_adding` int(11) NOT NULL default '0',
	`documentcategories_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_documentcategories (id)',
	`comment_adding` int(11) NOT NULL default '0',
	PRIMARY KEY  (`id`),
	KEY `name` (`name`),
	KEY `entities_id` (`entities_id`),
	KEY `manufacturers_id` (`manufacturers_id`),
	KEY `suppliers_id` (`suppliers_id`),
	KEY `documentcategories_id` (`documentcategories_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_plugin_manufacturersimports_configs` ( `ID`,`name`,`entities_id`,`is_recursive`, `supplier_url` , `manufacturers_id`, `suppliers_id`, `warranty_duration`, `document_adding`, `documentcategories_id`) VALUES ('1','Dell',0,0,'http://support.dell.com/support/topics/global.aspx/support/my_systems_info/details?c=us&l=en&s=bsd&ServiceTag=', '0', '0','36', '0','0');
INSERT INTO `glpi_plugin_manufacturersimports_configs` ( `ID`,`name`,`entities_id`,`is_recursive`, `supplier_url` , `manufacturers_id`, `suppliers_id`, `warranty_duration`, `document_adding`, `documentcategories_id`) VALUES ('2','HP',0,0,'http://www11.itrc.hp.com/service/ewarranty/warrantyResults.do?', '0', '0','36', '0','0');
INSERT INTO `glpi_plugin_manufacturersimports_configs` ( `ID`,`name`,`entities_id`,`is_recursive`, `supplier_url` , `manufacturers_id`, `suppliers_id`, `warranty_duration`, `document_adding`, `documentcategories_id`) VALUES ('3','Fujitsu-Siemens',0,0,'http://sali.uk.ts.fujitsu.com/ServiceEntitlement/service.asp?command=search&', '0', '0','36', '0','0');
INSERT INTO `glpi_plugin_manufacturersimports_configs` ( `ID`,`name`,`entities_id`,`is_recursive`, `supplier_url` , `manufacturers_id`, `suppliers_id`, `warranty_duration`, `document_adding`, `documentcategories_id`) VALUES ('4','IBM',0,0,'http://www-304.ibm.com/jct01004c/systems/support/supportsite.wss/warranty?', '0', '0','36', '0','0');
INSERT INTO `glpi_plugin_manufacturersimports_configs` ( `ID`,`name`,`entities_id`,`is_recursive`, `supplier_url` , `manufacturers_id`, `suppliers_id`, `warranty_duration`, `document_adding`, `documentcategories_id`) VALUES ('5','Toshiba',0,0,'http://aps2.toshiba-tro.de/unit-details-php/unitdetails.aspx?', '0', '0','36', '0','0');

DROP TABLE IF EXISTS `glpi_plugin_manufacturersimports_profiles`;
CREATE TABLE `glpi_plugin_manufacturersimports_profiles` (
	`id` int(11) NOT NULL auto_increment,
	`profiles_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_profiles (id)',
	`manufacturersimports` char(1) collate utf8_unicode_ci default NULL,
	PRIMARY KEY  (`id`),
	KEY `profiles_id` (`profiles_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_manufacturersimports_models`;
CREATE TABLE `glpi_plugin_manufacturersimports_models` (
	`id` int(11) NOT NULL auto_increment,
	`model_name` varchar(100) collate utf8_unicode_ci default NULL,
	`items_id` int(11) NOT NULL default '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
   `itemtype` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT 'see .class.php file',
	PRIMARY KEY  (`id`),
	UNIQUE KEY `unicity` (`model_name`,`items_id`,`itemtype`),
   KEY `FK_device` (`items_id`,`itemtype`),
   KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_manufacturersimports_logs`;
CREATE TABLE `glpi_plugin_manufacturersimports_logs` (
	`id` int(11) NOT NULL auto_increment,
	`import_status` int(11) NOT NULL default '0',
	`items_id` int(11) NOT NULL default '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
   `itemtype` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT 'see .class.php file',
	`documents_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_documents (id)',
	`date_import` DATE default NULL,
	PRIMARY KEY  (`id`),
	UNIQUE KEY `unicity` (`import_status`,`items_id`,`itemtype`),
  KEY `FK_device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;