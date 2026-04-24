<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;
/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Black extends Backend
{
    
    /**
     * Kami模型对象
     * @var \app\admin\model\Kami
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Black;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
	

    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $gtime = time();
                $kmqz = trim($params['udid']);
                $data['udid'] = $kmqz;
                $data['addtime'] = $gtime;
                $data['usetime'] = $gtime;
                $data['endtime'] = 2082643200;
                Db::table('fa_black')->insert($data);
                $this->success();
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
		return parent::add();
    }

}
