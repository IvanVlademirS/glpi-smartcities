<?php
/*
 * @version $Id: HEADER 15930 2011-10-30 15:47:55Z tsmr $
-------------------------------------------------------------------------
Accounts plugin for GLPI
Copyright (C) 2003-2011 by the accounts Development Team.

https://forge.indepnet.net/projects/accounts
-------------------------------------------------------------------------

LICENSE

This file is part of accounts.

accounts is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

accounts is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with accounts. If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------
*/

$AJAX_INCLUDE=1;

include ('../../../inc/includes.php');

header("Content-Type: text/html; charset=UTF-8");
Html::header_nocache();

Session::checkLoginUser();

if (isset($_REQUEST['node'])) {
   /* if ($_SESSION['glpiactiveprofile']['interface']=='helpdesk') {
    $target="helpdesk.public.php";
   } else {*/
   $target="account.php";
   //}

   $nodes=array();
   // Root node
   if ($_REQUEST['node']== -1) {
      $pos=0;
      $entity = $_SESSION['glpiactive_entity'];

      $where=" WHERE `glpi_plugin_accounts_accounts`.`is_deleted` = '0' ";
      $where.=getEntitiesRestrictRequest("AND","glpi_plugin_accounts_accounts");

      $query="SELECT *
      FROM `glpi_plugin_accounts_accounttypes`
      WHERE `id` IN (
         SELECT DISTINCT `plugin_accounts_accounttypes_id`
         FROM `glpi_plugin_accounts_accounts`
         $where)
      GROUP BY `name`
      ORDER BY `name` ";
      if ($result=$DB->query($query)) {
         if ($DB->numrows($result)) {
            $pos=0;
            while ($row = $DB->fetch_array($result)) {

               $ID=$row['id'];

               $path['data']['title'] = Dropdown::getDropdownName("glpi_plugin_accounts_accounttypes",$ID);
               $path['attr']['id'] = $ID;

               if($entity==0) {
                  $link="&link[1]=AND&searchtype[1]=contains&contains[1]=NULL&field[1]=80";
               } else {
                  $link="&link[1]=AND&searchtype[1]=contains&contains[1]=".
                           Dropdown::getDropdownName("glpi_entities",$entity)."&field[1]=80";
               }
               $path['data']['attr']['href'] = $CFG_GLPI["root_doc"]."/plugins/accounts/front/".$target.
                        "?criteria[0][field]=2&criteria[0][searchtype]=contains&criteria[0][value]=^".
                        rawurlencode($path['data']['title'])."&itemtype=PluginAccountsAccount&start=0";
               $nodes[] = $path;
            }
         }
      }
   }

   print json_encode($nodes);
}

?>