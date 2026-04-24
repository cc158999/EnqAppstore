<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Db;
class Index extends Frontend
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';
    
    public function apiface(){
        if(empty($_REQUEST['udid'])){
            echo json_encode(['msg'=>'未获取设备udid'],JSON_UNESCAPED_UNICODE);die;
        }
        $udid =  $_REQUEST['udid'];
        $res = DB::name('kami')->where('udid',$udid)->find();
        if(!$res){
            echo json_encode(['msg'=>'未查到解锁记录'],JSON_UNESCAPED_UNICODE);die;
        }
        $endtime = $res['endtime'];
        if($endtime > time()){
            echo json_encode(['msg'=>'ok'],JSON_UNESCAPED_UNICODE);die;
        }else{
            $time = time();
            $res = DB::name('kami')->where('udid',$udid)->where(['endtime'=>['>',$time]])->find();
            if(!$res){
                echo json_encode(['msg'=>'解锁已到期'],JSON_UNESCAPED_UNICODE);die;
            }else{
                echo json_encode(['msg'=>'ok'],JSON_UNESCAPED_UNICODE);die;
            }
            
        }
    }
    public function index()
    {
    	if(!empty($_POST['uid'])){
    		$id = (int)$_POST['uid'];
    		$time = (int)date('d',time());
    		$s = DB::name('category')->where('id',$id)->where('cstime',$time)->find();
    		if($s){
    			DB::name('category')->where('id',$id)->setInc('cs');
    		}else{
    			DB::name('category')->where('id',$id)->update([
    				'cs' => 1,
    				'cstime' => $time
    			]);
    		}
    		return 'ok';
    	}
    	$data['img'] = DB::name('attachment')->whereNotNull('urls')->select();
    	$data['category'] = DB::name('category')->where('pid',0)->where('status','normal')->order('weigh desc')->select();
    	$data['xm'] = [];
    	foreach ($data['category'] as $v){
    		$data['xm'][$v['id']] = DB::name('category')->where('pid',$v['id'])->where('status','normal')->order('weigh desc')->select();
    	}
        return $this->view->fetch('',$data);
    }

}
