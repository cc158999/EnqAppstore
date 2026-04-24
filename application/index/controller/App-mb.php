<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Db;
class App 
{
    public function list()
    {
        header('Content-Type: application/json;charset=utf-8');
        $config = Db::table('fa_config')->select();
        if(empty($config)) return json(['code'=>0,'msg'=>'暂无站点数据']);
        $list = Db::table('fa_category')->where('status','normal')->order('weigh desc')->select();
        if(empty($list)) return json(['code'=>0,'msg'=>'暂无app数据']);
        $data = [];
        foreach ($list as $key=>$val)
        {
            $data[$key]['name'] = $val['name'];
            $data[$key]['version'] = $val['nickname'];
            $data[$key]['versionDate'] = date('Y-m-d\TH:i:s\+08:00',$val['updatetime']);
            $data[$key]['versionDescription'] = str_replace($val['keywords']);
            $data[$key]['lock'] = $val['bt2b'];
            $data[$key]['downloadURL'] = $val['bt1a'];
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
        }
        $arr = [
            'name'=>$info['name'],
            'message'=>$info['message'],
            'identifier'=>$info['identifier'],
            'sourceURL'=>$info['sourceURL'],
            'sourceicon'=>$info['sourceicon'],
            'payURL'=>$info['payURL'],
            'unlockURL'=>$info['unlockURL'],
            'apps'=>$data
            ];
        $json = json_encode($arr,320);
        return $json;
    }
}
