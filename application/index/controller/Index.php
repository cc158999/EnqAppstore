<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Db;
class Index extends Frontend
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';
    
    public function dylib(){
        header('Content-Type: application/json;charset=utf-8');
        $arr = ['code'=>0, 'msg'=>'未获取设备UDID！', 'data'=>[]];
        if(empty($_REQUEST['udid'])){
            echo json_encode($arr,JSON_UNESCAPED_UNICODE);die;
        }
        $config = Db::table('fa_config')->select();
        foreach ($config as $key=>$val)
        {
            if($val['name'] == 'name') $arr['data']['name'] = $val['value'];
            if($val['name'] == 'payURL') $arr['data']['pay'] = $val['value'];
            if($val['name'] == 'dylib-look') $arr['data']['look'] = $val['value'];
            if($val['name'] == 'dylib-control') $arr['data']['control'] = $val['value'];
            if($val['name'] == 'dylib-notice') $arr['data']['notice'] = $val['value'];
            if($val['name'] == 'dylib-time') $arr['data']['time'] = $val['value'];
            if($val['name'] == 'dylib-on') $arr['data']['on'] = $val['value'];
        }
        $udid =  $_REQUEST['udid'];
        $res = DB::name('kami')->where('udid',$udid)->find();
        $black = DB::name('black')->where('udid',$res['udid'])->find();
        if(!$res){
            $arr['msg'] = '未查到解锁记录！';
            $arr['code'] = 2;
            echo json_encode($arr,JSON_UNESCAPED_UNICODE);die;
        }
        if($res['endtime'] > time()){
            if ($black) {
                $arr['msg'] = 'UDID黑名单';
                $arr['code'] = 666;
                echo json_encode($arr,JSON_UNESCAPED_UNICODE);die;
            }
            $arr['msg'] = '验证成功';
            $arr['code'] = 1;
            echo json_encode($arr,JSON_UNESCAPED_UNICODE);die;
        }else{
            $res = DB::name('kami')->where('udid',$udid)->where(['endtime'=>['>',time()]])->find();
            if(!$res){
                $arr['msg'] = '设备解锁已到期！';
                $arr['code'] = 3;
                echo json_encode($arr,JSON_UNESCAPED_UNICODE);die;
            }else{
                if ($black) {
                    $arr['msg'] = 'UDID黑名单';
                    $arr['code'] = 666;
                    echo json_encode($arr,JSON_UNESCAPED_UNICODE);die;
                }
                $arr['msg'] = '验证成功';
                $arr['code'] = 1;
                echo json_encode($arr,JSON_UNESCAPED_UNICODE);die;
            }
        }
    }
    public function getApps(){
        header('Content-Type: application/json;charset=utf-8');
        $page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
        $pageSize = 20;
        $offset = ($page - 1) * $pageSize;
        $totalApps = Db::table('fa_category')->where('status','normal')->count();
        $apps = Db::table('fa_category')->where('status','normal')->order('weigh desc')->limit($offset, $pageSize)->select();
        $appList = [];
        foreach ($apps as $key=>$val) {
            if($val['type'] == 'default') $val['type'] = 0;
            $appList[$key]['name'] = $val['name'];
            $appList[$key]['type'] = $val['type'];
            $appList[$key]['version'] = $val['nickname'];
            $appList[$key]['versionDate'] = date('Y-m-d', $val['updatetime']);
            $appList[$key]['localizedDescription'] = $val['keywords'];
            $appList[$key]['iconURL'] = $val['image'];
            $appList[$key]['tintColor'] = $val['bt1b'];
            $appList[$key]['size'] = $val['bt2a'];
            $appList[$key]['lock'] = $val['bt2b'];
        }
        $hasMore = ($offset + count($apps)) < $totalApps;
        echo json_encode([
            'code' => 1,
            'data' => array_values($appList),
            'page' => $page,
            'pageSize' => $pageSize,
            'total' => $totalApps,
            'hasMore' => $hasMore
        ], JSON_UNESCAPED_UNICODE);
        die;
    }

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

    	$weblist = Db::name('config')->where(['name'=>'weblist'])->value('value');
    	if($weblist == '1'){
    	    $config = Db::table('fa_config')->select();
    	    $info = [];
    	    foreach ($config as $key=>$val) {
    	        if($val['name'] == 'name') $info['name'] = $val['value'];
    	        if($val['name'] == 'message') $info['message'] = $val['value'];
    	        if($val['name'] == 'identifier') $info['identifier'] = $val['value'];
    	        if($val['name'] == 'sourceURL') $info['sourceURL'] = $val['value'];
    	        if($val['name'] == 'sourceicon') $info['sourceicon'] = $val['value'];
    	        if($val['name'] == 'payURL') $info['payURL'] = $val['value'];
    	        if($val['name'] == 'website') $info['website'] = $val['value'];
    	    }
    	    $pageSize = 20;
    	    $totalApps = Db::table('fa_category')->where('status','normal')->count();
    	    $apps = Db::table('fa_category')->where('status','normal')->order('weigh desc')->limit(0, $pageSize)->select();
    	    $appList = [];
    	    foreach ($apps as $key=>$val) {
    	        if($val['type'] == 'default') $val['type'] = 0;
    	        $appList[$key]['name'] = $val['name'];
    	        $appList[$key]['type'] = $val['type'];
    	        $appList[$key]['version'] = $val['nickname'];
    	        $appList[$key]['versionDate'] = date('Y-m-d', $val['updatetime']);
    	        $appList[$key]['localizedDescription'] = $val['keywords'];
    	        $appList[$key]['iconURL'] = $val['image'];
    	        $appList[$key]['tintColor'] = $val['bt1b'];
    	        $appList[$key]['size'] = $val['bt2a'];
    	        $appList[$key]['lock'] = $val['bt2b'];
    	    }
    	    $newsList = Db::table('fa_enqapp_news')->where('deletetime', null)->order('weigh desc,id desc')->select();
    	    $news = [];
    	    foreach ($newsList as $k => $v) {
    	        $news[$k]['title'] = $v['title'];
    	        $news[$k]['caption'] = $v['caption'];
    	        $news[$k]['tintColor'] = $v['tint_color'];
    	        $news[$k]['imageURL'] = $v['image'];
    	        $news[$k]['date'] = $v['publish_date'];
    	        $news[$k]['url'] = $v['url'];
    	    }
    	    $data['info'] = $info;
    	    $data['apps'] = $appList;
    	    $data['news'] = $news;
    	    $data['totalApps'] = $totalApps;
    	    $data['pageSize'] = $pageSize;
    	    return $this->view->fetch('weblist', $data);
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
