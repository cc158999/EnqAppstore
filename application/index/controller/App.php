<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Db;
class App
{
    private function isBrowser()
    {
        $ua = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';
        if (empty($ua)) return false;
        $browsers = ['Chrome', 'Safari', 'Firefox', 'Edg', 'OPR', 'Opera', 'MSIE', 'Trident', 'Gecko', 'WebKit', 'Mozilla/5.0'];
        foreach ($browsers as $browser) {
            if (stripos($ua, $browser) !== false) {
                if (stripos($ua, 'Feather') !== false || stripos($ua, 'ESign') !== false || stripos($ua, 'Scarlet') !== false || stripos($ua, 'GBox') !== false || stripos($ua, 'AltStore') !== false || stripos($ua, 'SideStore') !== false) {
                    return false;
                }
                return true;
            }
        }
        return false;
    }

    public function list()
    {   
        header('Content-Type: application/json;charset=utf-8');
        $value = file_get_contents("php://input");
        $value = json_decode($value,true);
        if(empty($_SERVER['HTTP_APPSTORE'])){
            $app_type = 'appstore';
        }elseif(!empty($_SERVER['HTTP_APPSTORE'])){
            if($_SERVER['HTTP_APPSTORE'] == 'v2'){
                $app_type = 'appstore_v2';
            }else{
                $app_type = 'appstore';
            }
        }
        $value = $value['value'];
        $openblack = Db::name('config')->where(['name'=>'openblack'])->value('value');
        $openblack2 = Db::name('config')->where(['name'=>'openblack2'])->value('value');

        if($value){
            $value = base64_decode($value);
            $udidArr = explode('|',$value);
            $udid1 = $udidArr[0];//添加者
            $udid2 = $udidArr[1];//破解者
            
            if($openblack == '1'){
                //自动拉黑
                if($udid1){
                    if(strlen($udid1) == '25' || strlen($udid1) == '40' ){
                        $res1 = Db::table('fa_black')->where(['udid'=>$udid1])->find();
                        if(!$res1){
                            Db::table('fa_black')->insert(['udid'=>$udid1,'addtime'=>time()]);
                        }
                        Db::table('fa_monitor')->where(['udid'=>$udid1])->delete();
                    }
                }
            }
            if($openblack2 == '1'){
                if($udid2){
                    if(strlen($udid2) == '25' || strlen($udid2) == '40' ){
                        $res2 = Db::table('fa_black')->where(['udid'=>$udid2])->find();
                        if(!$res2){
                            Db::table('fa_black')->insert(['udid'=>$udid2,'addtime'=>time()]);
                        }
                        Db::table('fa_monitor')->where(['udid'=>$udid2])->delete();
                    }
                }
            }
                //判断是否在黑明单;
                if($udid1 && $openblack != '1'){
                    if(strlen($udid1) == '25' || strlen($udid1) == '40' ){
                        $res1 = Db::name('black')->where('udid',$udid1)->find();
                        if(!$res1){
                            $r1 = Db::name('monitor')->where('udid',$udid1)->find();
                            if($r1){//增加次数
                                Db::name('monitor')->where('udid',$udid1)->inc('count',1)->update();
                            }else{
                                //添加记录
                                Db::name('monitor')->insert(['udid'=>$udid1,'identity'=>'添加者','count'=>1,'addtime'=>time()]);
                            }
                        }
                    }
                }
                if($udid2 && $openblack2 != '1'){
                    if(strlen($udid2) == '25' || strlen($udid2) == '40' ){
                    $res2 = Db::name('black')->where('udid',$udid2)->find();
                        if(!$res2){
                            $r2 = Db::name('monitor')->where('udid',$udid2)->find();
                            if($r2){//增加次数
                                Db::name('monitor')->where('udid',$udid2)->inc('count',1)->update();
                            }else{
                                //添加记录
                                Db::name('monitor')->insert(['udid'=>$udid2,'identity'=>'破解者','count'=>1,'addtime'=>time()]);
                            }
                        }
                    }
                }
            
        }
        
        $opencry = Db::name('config')->where(['name'=>'opencry'])->value('value');
		$udid = isset($_GET['udid'])?$_GET['udid']:'';
		if($udid == '') {$udid = '';}//return json(['code'=>0,'msg'=>'请上传参数UDID']);
		$kcode = isset($_GET['code'])?$_GET['code']:'';
		$nowtime = date("Y-m-d H:i:s");
		$black = Db::table('fa_black')->where('udid',$udid)->find();
		if($black){
            $json = [
              "name" => "已被源主拉黑",
              "message" => "你已被源主拉黑！",
              "identifier" => "长按此处删除软件源",
              "payURL" => "",
              "unlockURL" => "",
              "UDID" => $udid,
              "Time" => $nowtime,
              "apps" => [
                "0" => [
                  "name" => "你已被源主拉黑！",
                  "version" => "1.0",
                  "type" => "1.0",
                  "versionDate" => "2021-01-24",
                  "localizedDescription" => "你已被源主拉黑！",
                  "lock" => "1",
                  "downloadURL" => "",
                  "isLanZouCloud" => "0",
                  "tintColor" => "",
                  "size" => "123973140.48"
                ]
              ]
            ];
            //请求接口
            if($opencry=='1' && $this->isBrowser()){//开启接口(仅浏览器环境)
                $content = json_encode($json,JSON_UNESCAPED_UNICODE);
                $content = base64_encode($content);
                $native['content'] = $content;
                if($app_type == 'appstore_v2'){
                    $res = $this->curl('https://api.nuosike.com/encrypt.php',$native);
                    $return["appstore_v2"] = $res;
                }else{
                    $res = $this->curl('https://api.nuosike.com/api.php',$native);
                    $return["appstore"] = $res;
                }
                echo json_encode($return);die;
            }else{
                unset($json['UDID']);
                unset($json['Time']);
                echo json_encode($json,JSON_UNESCAPED_UNICODE);die;
            }
            
		}

		if($kcode == ''){
			$chkif = Db::table('fa_kami')->where('udid',$udid)->order('id desc')->select();
			if($chkif){
			    //var_dump('<pre>',$chkif);die;
				$ifend = time() > $chkif[0]['endtime']?true:false;
				$config = Db::table('fa_config')->select();
				if(empty($config)) return json(['code'=>0,'msg'=>'暂无站点数据']);
				$list = Db::table('fa_category')->where('status','normal')->order('weigh desc')->select();
				if(empty($list)) return json(['code'=>0,'msg'=>'暂无app数据']);
				$data = [];
				foreach ($list as $key=>$val)
				{
				    $lock = $val['bt2b'];
				    if($lock != '1'){
				        $downloadURL = $val['bt1a'];
				    }else{
				        if($ifend){
				            $downloadURL = '';
				        }else{
				            $downloadURL = $val['bt1a'];
				        }
				        
				    }
				    if($val['type'] == 'default'){
				        $val['type'] = 0;
				    }
					$data[$key]['name'] = $val['name'];
					$data[$key]['type'] = $val['type'];
					$data[$key]['version'] = $val['nickname'];
					$data[$key]['versionDate'] = date('Y-m-d\TH:i:s\+08:00',$val['updatetime']);
					$data[$key]['localizedDescription'] = str_replace('\\n','@@@',$val['keywords']);
					$data[$key]['lock'] = $val['bt2b'];
					$data[$key]['downloadURL'] = $downloadURL;
					$data[$key]['isLanZouCloud'] = $val['flag'];
					$data[$key]['iconURL'] = $val['image'];
					$data[$key]['tintColor'] = $val['bt1b'];
					$data[$key]['size'] = $val['bt2a'];
				}
				foreach ($config as $key=>$val)
				{
					if($val['name'] == 'name') $info['name'] = $val['value'];
					if($val['name'] == 'message') $info['message'] = $val['value'];
					if($val['name'] == 'identifier') $info['identifier'] = $val['value'];
					if($val['name'] == 'sourceURL') $info['sourceURL'] = $val['value'];
					if($val['name'] == 'sourceicon') $info['sourceicon'] = $val['value'];
					if($val['name'] == 'payURL') $info['payURL'] = $val['value'];
					if($val['name'] == 'unlockURL') $info['unlockURL'] = $val['value'];
					if($val['name'] == 'website') $info['website'] = $val['value'];
				}
				$newsList = Db::table('fa_enqapp_news')->where('deletetime', null)->order('weigh desc,id desc')->select();
				$news = [];
				foreach ($newsList as $k => $v) {
					$news[$k]['title'] = $v['title'];
					$news[$k]['identifier'] = $v['identifier'];
					$news[$k]['caption'] = $v['caption'];
					$news[$k]['tintColor'] = $v['tint_color'];
					$news[$k]['imageURL'] = $v['image'];
					$news[$k]['date'] = $v['publish_date'];
					$news[$k]['url'] = $v['url'];
					$news[$k]['notify'] = $v['notify'] == 1 ? true : false;
				}
				$arr = [
					'name'=>$info['name'],
					'identifier'=>$info['identifier'],
					'sourceURL'=>$info['sourceURL'],
					'sourceicon'=>$info['sourceicon'],
					'website'=>isset($info['website']) ? $info['website'] : '',
					'message'=>$info['message'],
					'payURL'=>$info['payURL'],
					'unlockURL'=>$info['unlockURL'],
					"UDID" => $udid,
                    "Time" => $nowtime,
					'apps'=>$data,
					'news'=>$news
					];

					if($opencry=='1' && $this->isBrowser()){//开启接口(仅浏览器环境)
                        $content = json_encode($arr,320);
                        $content = base64_encode($content);
                        $native['content'] = $content;
                        if($app_type == 'appstore_v2'){
                            $res = $this->curl('https://api.nuosike.com/encrypt.php',$native);
                            $return["appstore_v2"] = $res;
                        }else{
                            $res = $this->curl('https://api.nuosike.com/api.php',$native);
                            $return["appstore"] = $res;
                        }
                        $json = json_encode($return);
                        $jsonStr  = str_replace('@@@', '\n', $json);
                        echo $jsonStr;die;
                    }else{
                        unset($arr['UDID']);
                        unset($arr['Time']);
                        $json = json_encode($arr,320);
                        $jsonStr  = str_replace('@@@', '\n', $json);
				        //$jsonStr  = str_replace('N', '\n', $json);
                        echo $jsonStr;die;
                    }
				$json = json_encode($arr,320);
				//halt($json);
				$jsonStr  = str_replace('N', '\n', $json);
				return $json;
			}else{
				$config = Db::table('fa_config')->select();
				if(empty($config)) return json(['code'=>0,'msg'=>'暂无站点数据']);
				$list = Db::table('fa_category')->where('status','normal')->order('weigh desc')->select();
				if(empty($list)) return json(['code'=>0,'msg'=>'暂无app数据']);
				$data = [];
				foreach ($list as $key=>$val)
				{
				    if($val['type'] == 'default'){
				        $val['type'] = 0;
				    }
					$data[$key]['name'] = $val['name'];
					$data[$key]['type'] = $val['type'];
					$data[$key]['version'] = $val['nickname'];
					$data[$key]['versionDate'] = date('Y-m-d\TH:i:s\+08:00',$val['updatetime']);
					$data[$key]['localizedDescription'] = str_replace('\\n','@@@',$val['keywords']);
					$data[$key]['lock'] = $val['bt2b'];
					$data[$key]['downloadURL'] = $val['bt2b']?'':$val['bt1a'];
					$data[$key]['isLanZouCloud'] = $val['flag'];
					$data[$key]['iconURL'] = $val['image'];
					$data[$key]['tintColor'] = $val['bt1b'];
					$data[$key]['size'] = $val['bt2a'];
				}
				foreach ($config as $key=>$val)
				{
					if($val['name'] == 'name') $info['name'] = $val['value'];
					if($val['name'] == 'message') $info['message'] = $val['value'];
					if($val['name'] == 'identifier') $info['identifier'] = $val['value'];
					if($val['name'] == 'sourceURL') $info['sourceURL'] = $val['value'];
					if($val['name'] == 'sourceicon') $info['sourceicon'] = $val['value'];
					if($val['name'] == 'payURL') $info['payURL'] = $val['value'];
					if($val['name'] == 'unlockURL') $info['unlockURL'] = $val['value'];
					if($val['name'] == 'website') $info['website'] = $val['value'];
				}
				$newsList = Db::table('fa_enqapp_news')->where('deletetime', null)->order('weigh desc,id desc')->select();
				$news = [];
				foreach ($newsList as $k => $v) {
					$news[$k]['title'] = $v['title'];
					$news[$k]['identifier'] = $v['identifier'];
					$news[$k]['caption'] = $v['caption'];
					$news[$k]['tintColor'] = $v['tint_color'];
					$news[$k]['imageURL'] = $v['image'];
					$news[$k]['date'] = $v['publish_date'];
					$news[$k]['url'] = $v['url'];
					$news[$k]['notify'] = $v['notify'] == 1 ? true : false;
				}
				$arr = [
					'name'=>$info['name'],
					'identifier'=>$info['identifier'],
					'sourceURL'=>$info['sourceURL'],
					'sourceicon'=>$info['sourceicon'],
					'website'=>isset($info['website']) ? $info['website'] : '',
					'message'=>$info['message'],
					'payURL'=>$info['payURL'],
					'unlockURL'=>$info['unlockURL'],
					"UDID" => $udid,
                    "Time" => $nowtime,
					'apps'=>$data,
					'news'=>$news
					];
					if($opencry=='1' && $this->isBrowser()){//开启接口(仅浏览器环境)
                        $content = json_encode($arr,320);
                        $content = base64_encode($content);
                        $native['content'] = $content;
                        if($app_type == 'appstore_v2'){
                            $res = $this->curl('https://api.nuosike.com/encrypt.php',$native);
                            $return["appstore_v2"] = $res;
                        }else{
                            $res = $this->curl('https://api.nuosike.com/api.php',$native);
                            $return["appstore"] = $res;
                        }
                        $json = json_encode($return);
                        $jsonStr  = str_replace('@@@', '\n', $json);
                        echo $jsonStr;die;
                    }else{
                        unset($arr['UDID']);
                        unset($arr['Time']);
                        $json = json_encode($arr,320);
				        $jsonStr  = str_replace('@@@', '\n', $json);
                        echo $jsonStr;die;
                    }
				$json = json_encode($arr,320);
				$jsonStr  = str_replace('N', '\n', $json);
				return $json;
			}
		}else{
			$chkis = Db::table('fa_kami')->where('kami',$kcode)->order('id desc')->select();
			if($chkis){
				$kdata = $chkis[0];
				if(intval($kdata['jh'])){
					return json(['code'=>0,'msg'=>'解锁码已使用']);
				}else{
				    //---修复解锁到期部分设备无法解锁问题
				    				    $existInfo = Db::table('fa_kami')->where('udid',$udid)->select();
				    if(!empty($existInfo)){
				        foreach ($existInfo as $k => $v){
				            if($v['endtime'] < time()){
				                Db::table('fa_kami')->where('id', $v['id'])->delete();
				            }
				        }
				    }
					//---
					$kmtp = intval($kdata['kmyp']);
					if($kmtp == 1){ $sydt = time(); $endtm = $sydt+(86400*30); }
					if($kmtp == 2){ $sydt = time(); $endtm = $sydt+(86400*30*3); }
					if($kmtp == 3){ $sydt = time(); $endtm = $sydt+(86400*30*12); }
					if($kmtp == 4){ $sydt = time(); $endtm = $sydt+(86400*1); }
					if($kmtp == 5){ $sydt = time(); $endtm = $sydt+(86400*7); }
					Db::table('fa_kami')->where('id', $kdata['id'])->update(array('udid'=>$udid, 'usetime'=>$sydt, 'endtime'=>$endtm, 'jh'=>1));
					return json(['code'=>0,'msg'=>'ok，解锁成功']);
				}
			}else{
				return json(['code'=>0,'msg'=>'解锁码不存在']);
			}
		}
    }
    public function curl($url,$native){
		$postData = http_build_query($native);
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,$url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // stop verifying certificate
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/x-www-form-urlencoded'));
        curl_setopt($curl, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
        $data = curl_exec($curl);
        curl_close($curl);
        return $data;
    }
    public function log(){
        $value = $_REQUEST['value'];
    }
}
