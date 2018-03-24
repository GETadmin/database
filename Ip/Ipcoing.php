<?php
namespace Ip;
class Ipcoing 
{	//调用方法
	function index(){
		$ip         = $this->get_client_ip();
        $Getip      = $this->Getip();
        $Getaddress = $this->Getaddress();
         foreach($Getaddress[0] as $value){
     echo "\r\n    ".iconv("utf-8","gbk",$value);    
 }
        $GetBrowser = $this->GetBrowser();
        $GetOs      = $this->GetOs();
       
    
        return array($ip,$Getip,$Getaddress,$GetBrowser,$GetOs);
     
	}
////获得访客浏览器类型
  function GetBrowser(){
   if(!empty($_SERVER['HTTP_USER_AGENT'])){
    $br = $_SERVER['HTTP_USER_AGENT'];
    if (preg_match('/MSIE/i',$br)) {    
               $br = 'MSIE';
             }elseif (preg_match('/Firefox/i',$br)) {
     $br = 'Firefox';
    }elseif (preg_match('/Chrome/i',$br)) {
     $br = 'Chrome';
       }elseif (preg_match('/Safari/i',$br)) {
     $br = 'Safari';
    }elseif (preg_match('/Opera/i',$br)) {
        $br = 'Opera';
    }else {
        $br = 'Other';
    }
    return $br;
   }else{return "获取浏览器信息失败！";} 
  }
   ////获取访客操作系统
  function GetOs(){
   if(!empty($_SERVER['HTTP_USER_AGENT'])){
    $OS = $_SERVER['HTTP_USER_AGENT'];
      if (preg_match('/win/i',$OS)) {
     $OS = 'Windows';
    }elseif (preg_match('/mac/i',$OS)) {
     $OS = 'MAC';
    }elseif (preg_match('/linux/i',$OS)) {
     $OS = 'Linux';
    }elseif (preg_match('/unix/i',$OS)) {
     $OS = 'Unix';
    }elseif (preg_match('/bsd/i',$OS)) {
     $OS = 'BSD';
    }else {
     $OS = 'Other';
    }
          return $OS;  
   }else{return "获取访客操作系统信息失败！";}   
  }
    ////根据ip获得访客所在地地名
  function Getaddress($ip=''){

    if($ip == ''){
        $url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";
        $ip=json_decode(file_get_contents($url),true);
        $data = $ip;
    }else{
        $url="http://ip.taobao.com/service/getIpInfo.php?ip=".$ip;
        $ip=json_decode(file_get_contents($url));   
        if((string)$ip->code=='1'){
           return false;
        }
        $data = (array)$ip->data;
    }
    
    return $data;   

  } 
  // ////获得访客真实ip
  // function Getip(){
  //  if(!empty($_SERVER["HTTP_CLIENT_IP"])){   
  //     $ip = $_SERVER['HTTP_CLIENT_IP'];
  //  }
  //  if(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){ //获取代理ip
  //   $ips = explode(',',$_SERVER['HTTP_X_FORWARDED_FOR']);
  //  }
  //  if($ip){
  //     $ips = array_unshift($ips,$ip); 
  //  }
   
  //  $count = count($ips);
  //  for($i=0;$i<$count;$i++){   
  //    if(!preg_match("/^(10|172\.16|192\.168)\./i",$ips[$i])){//排除局域网ip
  //     $ip = $ips[$i];
  //     break;    
  //     }  
  //  }  
  //  $tip = empty($_SERVER['REMOTE_ADDR']) ? $ip : $_SERVER['REMOTE_ADDR']; 
  //  if($tip=="127.0.0.1"){ //获得本地真实IP
  //     return $this->get_onlineip();   
  //  }else{
  //     return $tip; 
  //  }
  // }
  
  ////获得本地真实IP
  function get_onlineip() {
      $mip = file_get_contents("http://city.ip138.com/city0.asp");
       if($mip){
           preg_match("/\[.*\]/",$mip,$sip);
           $p = array("/\[/","/\]/");
           return preg_replace($p,"",$sip[0]);

       }else{return "获取本地IP失败！";}
   }	
}