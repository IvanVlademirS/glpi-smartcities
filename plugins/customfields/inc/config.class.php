<?php

/*
 * @version $Id: config.class.php 211 2013-02-19 08:27:50Z dethegeek $
-------------------------------------------------------------------------
GLPI - Gestionnaire Libre de Parc Informatique
Copyright (C) 2003-2011 by the INDEPNET Development Team.

http://indepnet.net/   http://glpi-project.org
-------------------------------------------------------------------------

LICENSE

This file is part of GLPI.

GLPI is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

GLPI is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GLPI. If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------
*/

class PluginCustomfieldsConfig extends CommonDBTM {

   static protected $notable = true;
   
   /**
    * @see CommonGLPI::getMenuName()
   **/
   static function getMenuName() {
      return __('Customfields');
   }
   
   /**
    *  @see CommonGLPI::getMenuContent()
    *
    *  @since version 1.7
   **/
   static function getMenuContent() {
   	global $CFG_GLPI;
   
   	$menu = array();

      $menu['title']   = __('Customfields');
      $menu['page']    = '/plugins/customfields/front/config.form.php';
   	return $menu;
   }
    

}