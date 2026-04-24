<?php

namespace app\admin\controller;

use app\admin\model\Admin;
use app\common\controller\Backend;
use fast\Random;
use think\Session;
use think\Validate;

/**
 * 个人配置
 *
 * @icon fa fa-user
 */
class Cert extends Backend
{

    /**
     * 查看
     */
    public function index()
    {
        
        return $this->view->fetch();
    }

   
}
