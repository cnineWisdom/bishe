<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Web extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function updatemsgshow(){
		$id = $this->input->post('id');
		$data = array('msgshow'=>'N');
		$where = "ID='$id'";
		$sql = $this->db->update_string('total',$data,$where);
		$query = $this->db->query($sql);
		$arr = array(
			'status'=>$sql
		);
		echo json_encode($arr);
	}
	public function getknowledge(){
		$word = $this->input->post('word');
		// $caseID = $this->input->post('caseID');
		$sql = "select * from terminology where Name like '%$word%' limit 1";
		$query = $this->db->query($sql);
		$res = $query->result();
		echo json_encode($res);
	}
	public function getmsg(){
		$username = $this->input->post('username');
		// $caseID = $this->input->post('caseID');
		$sql = "select * from total where (ruleID = 5 or ruleID = 6) and userID ='$username' and msgshow = 'Y' order by createtime desc";
		$query = $this->db->query($sql);
		$res = $query->result();
		echo json_encode($res);
	}
	public function getcase1(){
		// $caseID = $this->input->post('caseID');
		$sql = "select *,FROM_UNIXTIME(createtime, '%Y-%m-%d') as createtime from `case` order by createtime desc limit 7";
		$query = $this->db->query($sql);
		$res = $query->result();
		echo json_encode($res);
	}
		public function getmaintestname(){	
		$testID = $this->input->post('testID');
		$sql = "select * from test where testID = '$testID'";
		$query = $this->db->query($sql);
		$res = $query->result();
		echo json_encode($res[0]->testName);
	}
	public function getintegration(){	
		$userID = $this->input->post('userID');
		$sql = "select *,total.createtime as createtime3 from rule join total on rule.ruleID = total.ruleID where userID='$userID' ORDER BY total.createtime desc";
		$query = $this->db->query($sql);
		echo json_encode($query->result());
	}
	public function integration(){
		$type = $this->input->post('type');
		$username = $this->input->post('username');
		$target = $this->input->post('target');

		$status=self::checkintegration($type,$username,$target);
		$arr;
		if($status == 1){
			date_default_timezone_set('PRC');
				$date = date('Y-m-d H:i:s');
				$data =array('ruleID'=>$type,'userID'=>$username,'createtime'=>$date,'target'=>$target);
				$str = $this->db->insert_string('total', $data);
				$query = $this->db->query($str);
			$arr = array(
				'codenum'=>'1',
				'message'=>'签到成功！'
			);
		}

		if($status == -1){
			
			$arr = array(
				'codenum'=>'-1',
				'message'=>'你今天已经签到了！'
			);
		}

		if($status == 2){
				date_default_timezone_set('PRC');
				$date = date('Y-m-d H:i:s');
			  $data =array('ruleID'=>$type,'userID'=>$username,'createtime'=>$date,'target'=>$target);
				$str = $this->db->insert_string('total', $data);
				$query = $this->db->query($str);
			if($type == 5){
				$arr = array(
					'codenum'=>'2',
					'message'=>'下载成功，+1积分！'
				);
			}

			if($type == 6){
				$arr = array(
					'codenum'=>'2',
					'message'=>'打印成功，+1积分！'
				);
			}
			if($type == 4){
				$arr = array(
					'codenum'=>'2',
					'message'=>'答题成功，+1积分！'
				);
			}
			if($type == 3){
				$arr = array(
					'codenum'=>'2',
					'message'=>'收藏成功，+1积分！'
				);
			}
			
		}
		if($status == -2){
			$arr = array(
				'codenum'=>'-2',
				'message'=>'已经添加过积分！'
			);
		}


		
		echo json_encode($arr);
	}
	public function checkintegration($type,$username,$target){
		if($type == 2 || $type == 1){
			date_default_timezone_set('PRC');
			$date = date('Y-m-d');
			$sql = "select * from total where userID = '$username' and (ruleID = '1' or ruleID = '2' ) ORDER BY createtime desc limit 1";
			$query = $this->db->query($sql);
			$EffectRow = $query->num_rows();
			$res = $query->result();
			if($EffectRow>0){
				$time = strtotime($res[0]->createtime);
			if($date == date('Y-m-d',$time)){
					return -1;
			}else{
				return 1;
			}
			}else{
				return 1;
			}
			
			
		}else{
			$sql = "select * from total where userID = '$username' and target = '$target' and ruleID='$type'";
			$query = $this->db->query($sql);
			$EffectRow = $query->num_rows();
			if($EffectRow > 0 ){
				return -2;
			}else{
				return 2;
			}
		}
	}
	public function getcollecttest(){
		 $id = $this->input->post('userID');
		 $sql = "select *,collecttest.createtime as testtime from collecttest join test on collecttest.testID = test.testID  where userID = '$id' ";
		 $query = $this->db->query($sql);
		 echo json_encode($query->result());
	}
	public function collecttest(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d H:i:s');
		$userID = $this->input->post('username');
		$usetime = $this->input->post('usetime');
		$testID = $this->input->post('testID');
		$score = $this->input->post('score');
		$arr;
		if(self::checkcollecttest($userID,$testID)){
			$data =array('usetime'=>$usetime,'testID'=>$testID,'userID'=>$userID,'createtime'=>$date,'score'=>$score);
			$str = $this->db->insert_string('collecttest', $data);
			$query = $this->db->query($str);
			$arr = array(
				'status'=>'success'
			);
		}else{
			$arr = array(
				'status'=>'error'
			);
		}
		
			echo json_encode($arr);
	}
	public function checkcollecttest($userID,$testID){
		$sql = "select * from collecttest where userID='$userID' and testID='$testID'";
			$query = $this->db->query($sql);
			$EffectRow = $query->num_rows();
		if($EffectRow>0){
				return false;
		}else{
			return true;
		}
	}
	public function gettestpage(){
		$id = $this->input->post('id');
		$page = $this->input->post('page');
		$num = self::getestpagetotalnum($id);
		$pagenum = 5;
		$startpage = $pagenum*($page-1);
		$sql = "select * from (test join subject on test.subjectID = subject.subjectID) join major on subject.majorID = major.majorID  where test.subjectID = '$id' limit $startpage,$pagenum";
		$query = $this->db->query($sql);
		$sql1 = "select * from  subject join major on subject.majorID = major.majorID  where subject.subjectID = '$id'";
		$query1 = $this->db->query($sql1);
		$arr;

		$arr = array(
			'currentpage'=>$page,
			'total'=>$num,
			'res'=>$query->result(),
			'navmsg'=>$query1->result()
		);
		echo json_encode($arr);
	}
	public function getestpagetotalnum($id){
		$sql = "select * from test where subjectID = '$id'";
		$query = $this->db->query($sql);
		$num = $query->num_rows();
		return $num;
	}
	public function deleteerrorquestion(){
		$id = $this->input->post('id');
		$sql = "delete from errorquestion where Id = '$id'";
		$query = $this->db->query($sql);
		$arr = array(
			"status"=>"success"
		);
		echo json_encode($arr);
	}
	public function changepwd1(){
		$username = $this->input->post('username');
		
		$newpwd = $this->input->post('newpwd');
		$arr;
		$data = array('pwd' => $newpwd);
		$where = "username='$username'";
		$str = $this->db->update_string('usermsg', $data, $where);
		$query = $this->db->query($str);
		if($query){
			$arr=array(
				'status'=>'success',
				'res'=>'修改成功！'
			);
		}else{
			$arr=array(
				'status'=>'error',
				'res'=>'修改失败！'
			);
		}	
		echo json_encode($arr);
}
	public function changepwd(){
			$username = $this->input->post('username');
			$pwd = $this->input->post('pwd');
			$newpwd = $this->input->post('newpwd');
			$arr;
			$sql = "select * from usermsg where userName='$username' and pwd='$pwd'";
			$query = $this->db->query($sql);
			$EffectRow = $query->num_rows();
			
		
	

			if($EffectRow>0){
				$data = array('pwd' => $newpwd);
				$where = "userName='$username'";
				$str = $this->db->update_string('usermsg', $data, $where);
				$query = $this->db->query($str);
		
				$arr = array(
					'status'=>'success'
				);
			}else{
				$arr = array(
					'status'=>'error'
				);
			}
			
			echo json_encode($arr);
	}
	public function testbydate(){
		$sql = "select * from test ORDER BY createtime desc limit 7";
		$query = $this->db->query($sql);
		echo json_encode($query->result());
}
	public function question(){
			$id = $this->input->post('id');
			$sql = "select * from question where questionID = '$id'";
			$query = $this->db->query($sql);
			echo json_encode($query->result());
	}
	
	public function getcollectquestion(){
		$userID = $this->input->post('username');
		$sql = "select * from errorquestion join test on errorquestion.testID = test.testID where userID = '$userID'";
		$query = $this->db->query($sql);
		$arr;
	
		
		echo json_encode($query->result());
	}
	public function collectquestion1($userID,$testID){
			$sql = "select * from errorquestion where userID = '$userID' and testID = '$testID'";
			$query = $this->db->query($sql);
			$EffectRow = $query->num_rows();
			if($EffectRow>0){
				return false;
			}else{
				return true;
			}
	}
	public function collectquestion(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d H:i:s');
		$userID = $this->input->post('userID');
		$testID = $this->input->post('testID');
		$arr = $this->input->post('arr');
		$amount = $this->input->post('amount');
		if(self::collectquestion1($userID,$testID)){
			$data =array('userID'=>$userID,'testID'=>$testID,'questionID'=>$arr,'createtime'=>$date,'amount'=>$amount);
			$arr;
			$str = $this->db->insert_string('errorquestion', $data);
				$query = $this->db->query($str);
				
				
				//echo $this->db->insert_id();
				if ($query) {
					$arr = array(
					'status' => 'success',
					'message' => "错题收集成功！",
					);
				}
				
		}else{
			
				$arr = array(
				'status' => 'error',
				'message' => "你已经有相关错题集！",
				);
		
		}
		echo json_encode($arr);
		
	}
	public function gettest(){
		$arr;
		$num;
		$testID = $this->input->post('testID');
		$sql1 = "select * from question where testID = '$testID' and type='radio'";
		$sql2 = "select * from question where testID = '$testID' and type='checkbox'";
		$sql3 = "select * from test where testID = '$testID'";
		$query1 = $this->db->query($sql1);
		$res1 = $query1->result();
		$query2 = $this->db->query($sql2);
		$res2 = $query2->result();
		$query3 = $this->db->query($sql3);
		$res3 = $query3->result();
		$arr = array(
			'test'=>$res3,
			'radio'=>$res1,
			'checkbox'=>$res2
		);
		echo json_encode($arr);
	}
	public function getmajor(){
		$sql = 'select * from major';
		$query = $this->db->query($sql);
		$res = $query->result();
		echo json_encode($res);
	}
	public function getmajorbyid(){
		$id = $this->input->post('id');
		$sql = "select * from major where majorID = '$id'";
		$query = $this->db->query($sql);
		$res = $query->result();
		echo json_encode($res);
	}
	public function getsubject(){
		$id = $this->input->post('id');
		$sql = "select * from subject where majorID = '$id'";
		$query = $this->db->query($sql);
		$res = $query->result();
		$num = 0;
		$arr;
		foreach($res as $row){
			$sql2 = "select * from test where subjectID = '$row->subjectID' limit 4";
			$query2 = $this->db->query($sql2);
			$res2 = $query2->result();
			$arr[$num] = array(
				'subjectName'=>$row->subjectName,
				'subjectID'=>$row->subjectID,
				'test'=>$res2
			);
			$num++;
		}
		echo json_encode($arr);
	}
	
	public function login(){
		$username = $this->input->post('username');
		$password = $this->input->post('password');	
		$arr;
		
		$sql = "select pwd,userName from usermsg where userName='$username' and pwd='$password'";
		$query = $this->db->query($sql);
		$res = $query->result();
		$EffectRow = $query->num_rows();

		if($EffectRow>0){
			$arr = array(
				'status'=>200,
				'message'=>'登录成功'

			);
			
		}else{
			$arr = array(
				'status'=>404,
				'message'=>'账号或者密码错误，请重试！'
			);
		}
		echo json_encode($arr);
	}
	public function login1(){
		$username = $this->input->post('adminuser');
		$password = $this->input->post('password');	
		$arr;
		
		$sql = "select Id,password,adminuser from root where adminuser='$username' and password='$password'";
		$query = $this->db->query($sql);
		$res = $query->result();
		$EffectRow = $query->num_rows();

		if($EffectRow>0){
			$arr = array(
				'status'=>200,
				'message'=>$res

			);
			
		}else{
			$arr = array(
				'status'=>404,
				'message'=>'账号或者密码错误，请重试！'
			);
		}
		echo json_encode($arr);
	}
	public function checkname($usernames){
		$str = "select * from usermsg where userName = '$usernames'";
		$query = $this->db->query($str);
		$EffectRow = $query->num_rows();
		if($EffectRow > 0){
			return true;
		}else{
			return false;
		}
	}
	public function checkname1(){
		$username = $this->input->post('username');
		$str = "select * from usermsg where userName = '$username'";
		$query = $this->db->query($str);
		$EffectRow = $query->num_rows();
		$arr;
		if($EffectRow > 0){
			$arr = array(
				'status'=>'success'
			);
			
		}else{
			$arr = array(
				'status'=>'error'
			);
		}
		echo json_encode($arr);
	}
	public function register1(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d H:i:s');
		$usernames = $this->input->post('username');
		$passwords = $this->input->post('pwd');
		$data =array('userName'=>$usernames,'pwd'=>$passwords,'createtime'=>$date);
		$arr;
		if(self::checkname($usernames)){
			$arr = array(
				'status' => 400,
				'message' => "用户名已存在",
			);
		}else{
			$str = $this->db->insert_string('usermsg', $data);
			$query = $this->db->query($str);
			
			
			//echo $this->db->insert_id();
			if ($query) {
				$arr = array(
				'status' => 200,
				'message' => "录入成功！",
				);
			}
			else
			{
				$arr = array(
				'status' => 400,
				'message' => "录入失败！",
				);
			}
		}
		
		echo json_encode($arr);
	}
	public function register(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d H:i:s');
		$usernames = $this->input->post('usernames');
		$passwords = $this->input->post('passwords');
		$data =array('userName'=>$usernames,'pwd'=>$passwords,'createtime'=>$date);
		$arr;
		if(self::checkname($usernames)){
			$arr = array(
				'status' => 400,
				'message' => "用户名已存在",
			);
		}else{
			$str = $this->db->insert_string('usermsg', $data);
			$query = $this->db->query($str);
			
			
			//echo $this->db->insert_id();
			if ($query) {
				$arr = array(
				'status' => 200,
				'message' => "录入成功！",
				);
			}
			else
			{
				$arr = array(
				'status' => 400,
				'message' => "录入失败！",
				);
			}
		}
		
		echo json_encode($arr);
	}






//
	public function getInformation()
	{
		$pageSize = 6;
		$type = $this->input->post('type');
		$page = $this->input->post('page') ? $this->input->post('page') : 1;
		$pages = ($page-1)*$pageSize;
		$countSql = "SELECT count(*) as allCount FROM `med_information` WHERE `type` = $type";
		$allCount = $this->db->query($countSql)->result();
		$pageCount = ceil($allCount[0]->allCount/$pageSize);//页数
		$allCount[0]->pageCount = $pageCount;
		$allCount[0]->page = $page;
		$allCount[0]->pageSize = $pageSize;

		$sql = "SELECT *,m.`inform_ID` FROM `med_information` as m left join `collect` as c on c.`inform_ID`=m.`inform_ID`  where m.`type` = $type order by m.`createtime` desc limit $pages,$pageSize";
		$res = $this->db->query($sql)->result();
		$allCount[0]->res=$res;
		echo json_encode($allCount);
	}


	public function getCritic(){
		$pageSize = 15;
		$typeArr = [
			1 =>'内科学',
			2 =>'外科学',
			4 =>'妇科'
		];
		$page = $this->input->post('page') ? $this->input->post('page') : 1;
		$pages = ($page-1)*$pageSize;

		$type = (int)$this->input->post('type');
		if($type){
			$countSql = "SELECT count(*) as allCount FROM `case` WHERE `type` = $type";
			$allCount = $this->db->query($countSql)->result();
			$pages = ($page-1)*$pageSize;
			$sql = "select * from `case` where  `type` = $type order by `createtime` desc limit $pages,$pageSize";
			$res = $this->db->query($sql)->result();
			foreach ($res as $key => &$value) {
				$value->createtime = date('Y-m-d',$value->createtime);
				$title = explode(' ', $value->caseName);
				if(sizeof($title) > 1){
					$value->title = $title[0];
					$value->title1 = $title[1];
				}else {
					$value->title1 = $title[0];
					$value->title = '';
				}	
			}
			$countArr[$value->type]['result'] = $res;
			$countArr[$type]['allCount'] = $allCount[0]->allCount;
			$countArr[$type]['pageSize'] = $pageSize;
			$countArr[$type]['page'] = $page;
			$countArr[$type]['pageCount'] = ceil($allCount[0]->allCount/$pageSize);
			$countArr[$type]['typeTmp'] = $typeArr[$type];
			$countArr[$type]['type'] = $type;
		}else {
			$countSql = "SELECT count(*) as allCount,type FROM `case`  group by type";
			$allCount = $this->db->query($countSql)->result();
			foreach ($allCount as $key => &$value) {
				$sql = "select * from `case` where  `type` = $value->type order by `createtime` desc limit $pageSize";
				$res = $this->db->query($sql)->result();
				foreach ($res as $k => &$val) {
					$val->createtime = date('Y-m-d',$val->createtime);
					$title = explode(' ', $val->caseName);
					if(sizeof($title) > 1){
						$val->title = $title[0];
						$val->title1 = $title[1];
					}else {
						$val->title1 = $title[0];
						$val->title = '';
					}	
				}
				$countArr[$value->type]['result'] = $res;
				$countArr[$value->type]['pageSize'] = $pageSize;
				$countArr[$value->type]['page'] = $page;
				$countArr[$value->type]['allCount'] = $value->allCount;
				$countArr[$value->type]['pageCount'] = ceil($value->allCount/$pageSize);
				$countArr[$value->type]['typeTmp'] = $typeArr[$value->type];
				$countArr[$value->type]['type'] = $value->type;
				unset($val);
			}
			unset($value);

		}
		echo json_encode($countArr);
	}

	public function getComment(){
		$id = (int)$this->input->post('id');
		if($id){
			$time =time();
			$userName = $this->input->post('username');
			$userMess = $this->getUserId($userName);
			if($userMess){
				$userId = $userMess->userID;
				//插入阅读表 先检查一下阅读的的时间大于多少
				$checkSql = "select * from `read` where `userID` = $userId and `inform_ID` = $id order by `createtime` desc limit 1";
				$checkMess = $this->db->query($checkSql)->result();
				$readData =[
					'userID' => $userId,
					'createtime' => $time,
					'inform_ID' => $id
				];
				if($checkMess){
					$timeInter = $time - $checkMess[0]->createtime; //时间间隔
					if( $timeInter > 300 ){
						$str = $this->db->insert_string('read',$readData);
						$query = $this->db->query($str);
					}
				}else{
					$str = $this->db->insert_string('read',$readData);
					$query = $this->db->query($str);
				}
				
				$sql = "select * from `case` where caseID = $id  "; 
				$res = $this->db->query($sql)->result();
				if($res){
					foreach ($res as $key => &$value) {
						$commentSql = "select c.*,u.userName from `critic` as c left join `usermsg` as u on c.userID = u.userID  where `caseID` = $value->caseID";
						$commentRes = $this->db->query($commentSql)->result();
						foreach ($commentRes as $k => &$v) {
							$v->createtime = date('Y-m-d',$v->createtime);
							$v->userName = empty($v->userName) ? "****":$v->userName; 
						}
						$readSql = "select count(*)as readCount from `read` where `inform_ID` = $id";
						$readCount = $this->db->query($readSql)->result();
						if($readCount){
							$value->readCount = $readCount[0]->readCount;
						}
						else $value->readCount = 0;
						$value->commentMess = $commentRes;
						$value->createtime = date('Y-m-d',$value->createtime);
						$value->commentCount = sizeof($commentRes);
					}
					
				}else{
					$res = false;
				}
			}else{
				$res = false;
			}
			echo json_encode($res);
		}
	}

	public function sendMess()
	{
		$id = $this->input->post('id');
		$userName = $this->input->post('userName');
		$critic_info = $this->input->post('critic_info');
		$time = time();
		$userMess = $this->getUserId($userName);
		if($userMess){
			$userID = $userMess->userID;
			$sendData = [
				'createtime'=>$time,
				'critic_info' =>$critic_info,
				'userID' => $userID,
				'caseID' => $id,
			];
			$str = $this->db->insert_string('critic',$sendData);
			$query = $this->db->query($str);
			$msg = [
				'code' =>200,
				'msg' =>'发布成功'
			];
		}else{
			$msg =[
				'code' => -1,
				'msg' => '没有该用户'
			];
		}
		echo json_encode($msg);
	}

	public function getRead()
	{
		$typeArr=[
			1 =>'内科学',
			2 =>'外科学',
			4 =>'妇科'
		];
		$userName = $this->input->post('userName');
		$userMess = $this->getUserId($userName);
		if($userMess){
			$userID = $userMess->userID;
			$sql = "select inform_ID,FROM_UNIXTIME(r.`createtime`,'%Y-%m-%d') as dayTime,count(`readID`) as readCount,`caseName`,`type` from `read` as r left join `case` as c on c.caseID = r.inform_ID where r.`userID` = $userID group by dayTime,r.`inform_ID` order by r.`createtime` desc";
			$mess = $this->db->query($sql)->result();
			foreach ($mess as $key => &$value) {
				$value->typeTmp = $typeArr[$value->type];
				$res[$value->dayTime][$value->type] = $value;
			}
			echo json_encode($res);
		}
	}

	public function collectMsg()
	{
		$id = $this->input->post('id');
		$userName = $this->input->post('userID');
		$flag = $this->input->post('flag');
		$userMess = $this->getUserId($userName);
		if($userMess){
			$userId = $userMess->userID;
			$time = time();

			$data = [
				'createtime'=>$time,
				'userID' =>$userId,
				'inform_ID'=>$id,
				'flag'=>$flag,
			];
			$sql = "select * from `collect` where `userID` = $userId and `inform_ID` = $id";

			$res = $this->db->query($sql)->result();
			if($res){
				$collectID = $res[0]->collectID;
				$updateData = ['flag'=>$flag];
				$updateWhere = "`collectID` = $collectID";
				$this->db->update('collect', $updateData, $updateWhere);
				if($flag ==0){
					$msg = '取消成功';
				}else{
					$msg = "收藏成功";
				}
			}
			else{
				$str = $this->db->insert_string('collect',$data);
				$query = $this->db->query($str);
				$msg = "收藏成功";		
			}
		}else{$msg ="没有该用户";}
		echo json_encode($msg);

	}

	public function getCollect()
	{
		$userName = $this->input->post('userName');
		$userMess = $this->getUserId($userName);
		if($userMess){
			$userID = $userMess->userID;
			$sql = "select *,c.createtime from `collect` as c left join `med_information` as m on c.inform_ID = m.inform_ID where c.userID = $userID and flag = 1 order by  c.`createtime` desc";
			$mess = $this->db->query($sql)->result();
			foreach ($mess as $key => &$value) {
				$value->createtime = date('Y-m-d',$value->createtime);
			}
			unset($value);
			echo json_encode($mess);
		}
	}

	public function getUserId($username)
	{
		$sql = "select * from `usermsg` where userName = $username";
		$userMess = $this->db->query($sql)->result();
		if($userMess){
			return $userMess[0];
		}else{
			return false;
		}
	}
	public function selectF1(){
		$table = $this->input->post('table');
		$sql = "select * from `$table`";
		$query = $this->db->query($sql);
		$res = $query->result();
		$arr = array(
			'res'=>$res
		);
		echo json_encode($arr);
	}
	public function selectF7(){
		// $table = $this->input->post('table');
		$Id = $this->input->post('Id');
		$sql = "select * from root where Id = '$Id'";
		$query = $this->db->query($sql);
		$res = $query->result();
		$arr = array(
			'res'=>$res
		);
		echo json_encode($arr);
	}
	public function selectF3(){
		$table = $this->input->post('table');
		$id = $this->input->post('Id');
		$idName = $this->input->post('idName');
		$sql = "select * from `$table` where $idName = $id";
		$query = $this->db->query($sql);
		$res = $query->result();
		$arr = array(
			'res'=>$res
		);
		echo json_encode($arr);
	}
	public function select3()
	{	
		$table = $this->input->post('table');
		$page = $this->input->post('page');
		$pagenum = $this->input->post('pagenum');


		$sql = "select * from $table";
		$query = $this->db->query($sql);
		$num =  $query->num_rows();


		// $id = $this->input->post('id');
		
		// $num = self::getestpagetotalnum($id);
		
		$startpage = $pagenum*($page-1);
		$sql1 = "select * from subject join major on subject.majorID = major.majorID limit $startpage,$pagenum";
		$query1 = $this->db->query($sql1);
		
		$arr;

		$arr = array(
			'currentpage'=>$page,
			'pagenum'=>$pagenum,
			'total'=>$num,
			'res'=>$query1->result()
		);
		echo json_encode($arr);
		// $sql = "select * from `usermsg` where userName = $username";
	}
	public function select4()
	{	
		$table = $this->input->post('table');
		$page = $this->input->post('page');
		$pagenum = $this->input->post('pagenum');


		$sql = "select * from $table";
		$query = $this->db->query($sql);
		$num =  $query->num_rows();


		// $id = $this->input->post('id');
		
		// $num = self::getestpagetotalnum($id);
		
		$startpage = $pagenum*($page-1);
		$sql1 = "select * from test join subject on subject.subjectID = test.subjectID limit $startpage,$pagenum";
		$query1 = $this->db->query($sql1);
		
		$arr;

		$arr = array(
			'currentpage'=>$page,
			'pagenum'=>$pagenum,
			'total'=>$num,
			'res'=>$query1->result()
		);
		echo json_encode($arr);
		// $sql = "select * from `usermsg` where userName = $username";
	}
	public function select6()
	{	
		$table = $this->input->post('table');
		$page = $this->input->post('page');
		$pagenum = $this->input->post('pagenum');


		$sql = "select * from $table";
		$query = $this->db->query($sql);
		$num =  $query->num_rows();


		// $id = $this->input->post('id');
		
		// $num = self::getestpagetotalnum($id);
		
		$startpage = $pagenum*($page-1);
		$sql1 = "select * from question join test on question.testID = test.testID limit $startpage,$pagenum";
		$query1 = $this->db->query($sql1);
		
		$arr;	

		$arr = array(
			'currentpage'=>$page,
			'pagenum'=>$pagenum,
			'total'=>$num,
			'res'=>$query1->result()
		);
		echo json_encode($arr);
		// $sql = "select * from `usermsg` where userName = $username";
	}
	public function selectF()
	{	
		$table = $this->input->post('table');
		$page = $this->input->post('page');
		$pagenum = $this->input->post('pagenum');


		$sql = "select * from `$table`";
		$query = $this->db->query($sql);
		$num =  $query->num_rows();


		// $id = $this->input->post('id');
		
		// $num = self::getestpagetotalnum($id);
		
		$startpage = $pagenum*($page-1);
		$sql1 = "select * from `$table` limit $startpage,$pagenum";
		$query1 = $this->db->query($sql1);
		
		$arr;

		$arr = array(
			'currentpage'=>$page,
			'pagenum'=>$pagenum,
			'total'=>$num,
			'res'=>$query1->result()
		);
		echo json_encode($arr);
		// $sql = "select * from `usermsg` where userName = $username";
	}

	public function insertF()
	{	
		$data = $this->input->post('data');
		$table = $this->input->post('table');
		// $data = json_decode($data);
		$sql = $this->db->insert_string($table, $data);
		$this->db->query($sql);
		// echo 'success';
		// $msg ="没有该用户";
		// echo json_encode($msg);
	}
	public function insertF1()
	{	
		date_default_timezone_set('PRC');
				$date1 = date('Y-m-d H:i:s');
		// $date = array(
		// 	"createtime"=>$date1
		// );
		
		$data = $this->input->post('data');
		$table = $this->input->post('table');
		$data['createtime'] = $date1;
		// array_push($data,$date);
		// $data = json_decode($data);
		$sql = $this->db->insert_string($table, $data);
		$this->db->query($sql);
		// echo 'success';
		// $msg ="没有该用户";
		// echo json_encode($msg);
	}

	public function updateF()
	{
		$id = $this->input->post('id');
		$table = $this->input->post('table');
		$idname = $this->input->post('idName');
		$data = $this->input->post('data');
		
		// $data = array('msgshow'=>'N');
		$where = "`$idname`=$id";
		$sql = $this->db->update_string($table,$data,$where);
		$query = $this->db->query($sql);
		$arr = array(
			'status'=>$sql
		);
		echo json_encode($arr);
	}
	public function addF(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d');
		$sql = "select Id,date,amountnum from data where date = '$date'";
		$query = $this->db->query($sql);
		$EffectRow = $query->num_rows();

		if($EffectRow > 0){

				
				$num = $query->result()[0]->amountnum;
				$id = $query->result()[0]->Id;
				$num++;
				$data3 = array('amountnum'=>$num);
				$where = "Id='$id'";
				$str3 = $this->db->update_string('data',$data3,$where);
				$query3 = $this->db->query($str3);
			
		}else{
			$num = 1;

			$data1 =array('amountnum'=>$num,'date'=>$date);
			$str = $this->db->insert_string('data', $data1);
			$query1 = $this->db->query($str);
		}
		$id = $this->input->post('id');

	}
	public function deteleF()
	{	
		$id = $this->input->post('id');
		$table = $this->input->post('table');
		$key = $this->input->post('key');
		$sql = "delete from `$table` where $key = '$id'";
		$this->db->query($sql);
		$arr = array(
			'status'=>$sql
		);
		echo json_encode($arr);
	}
	public function selectF8(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d');
		$sql1 = "select * from data where date = '$date'";
		$sql3 = "select * from data";
		$query3 = $this->db->query($sql3);
		$total3 = 0;
		foreach($query3->result() as $row){
			$total3 = $total3 + $row->amountnum;
		}
		$query = $this->db->query($sql1);
		$EffecRow = $query->num_rows();
		if($EffecRow > 0){
			$arr = array(
				'res'=>$query->result(),
				'tatal3'=>$total3
			);
			echo json_encode($arr);
		}else{
			self::addF();
			self::selectF8();
		}
	}
	public function selectFdata(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d');
		$length = 7;
		$datearr = [];
		$data9 = [];
		$readarr = [];
		$downloadarr = [];
		$testarr = [];
		$printarr = [];
		$res;


		$num1 = 0;
		$num3 = 0;
		$num4 = 0;
		$num6 = 0;
	
		$num9 = 0;
		
		
		// $amount3 = 0;
		// $amount4 = 0;
		$amount6 = 0;
	
		$amount9 = 0;



		for($i = 0 ; $i < $length ; $i++){
			array_push($datearr,date('Y-m-d',strtotime(-$i." day")));
		}
		$datearr = array_reverse($datearr);
		foreach($datearr as $row){
			$amount1 = 0;
			$sql1='select * from data';
			$query1 = $this->db->query($sql1);
			foreach($query1->result() as $row1){
				if($row == $row1->date){
					$amount1 = $amount1 + $row1->amountnum;
				}
			}
			$data9[$num1] = $amount1;
			$num1++;

			$amount3 = 0;
			$sql3="select * from `read`";
			$query3 = $this->db->query($sql3);
			foreach($query3->result() as $row3){
				$date3 = date('Y-m-d',$row3->createtime);
				if($row == $date3){
					$amount3++;
				}
			}
			$readarr[$num3] = $amount3;
			$num3++;

			$amount4 = 0;
			$sql4="select * from `total` where ruleID = 4";
			$query4 = $this->db->query($sql4);
			foreach($query4->result() as $row4){
				$date4 = date('Y-m-d',strtotime($row4->createtime));
				if($row == $date4){
					$amount4++;
				}
			}
			$testarr[$num4] = $amount4;
			$num4++;

			$amount6 = 0;
			$sql6="select * from `total` where ruleID = 5";
			$query6 = $this->db->query($sql6);
			foreach($query6->result() as $row6){
				$date6 = date('Y-m-d',strtotime($row6->createtime));
				if($row == $date6){
					$amount6++;
				}
			}
			$downloadarr[$num6] = $amount6;
			$num6++;

			$amount9 = 0;
			$sql9="select * from `total` where ruleID = 6";
			$query9 = $this->db->query($sql9);
			foreach($query9->result() as $row9){
				$date9 = date('Y-m-d',strtotime($row9->createtime));
				if($row == $date9){
					$amount9++;
				}
			}
			$printarr[$num9] = $amount9;
			$num9++;

		}
		// $datearr = [];
		// $dataarr = [];
		// $readarr = [];
		// $downloadarr = [];
		// $testarr = [];
		// $printarr = [];
		$res = array(
			'datearr'=>$datearr,
			'data9'=>$data9,
			'readarr'=>$readarr,
			'downloadarr'=>$downloadarr,
			'testarr'=>$testarr,
			'printarr'=>$printarr
		);
		echo json_encode($res);

	}
	public function selectF18(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d');
		$arr;
		$num = 0;
		$num1 = 0;
		$sql = "select * from `read`";
		$query = $this->db->query($sql);
		foreach($query->result() as $row){
			$num1++;
			$data1 = date('Y-m-d',$row->createtime);
			if($date == $data1){
				$num++;
			}
		}
		$arr = array(
			'amountnum'=>$num,
			'total'=>$num1
		);
		echo json_encode($arr);
	}
	public function selectF9(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d');

		$sql1 = "select * from total";
		$query = $this->db->query($sql1);
		$EffecRow = $query->num_rows();
		$num4 = 0;
		$num8 = 0;
		$num9 = 0;
		$num999 = 0;
		$num888 = 0;
		$num444 = 0;
		$arr4= array(
			'test'=> 0
		);
		$arr8= array(
			'download'=> 0
		);
		$arr9= array(
			'print'=> 0
		);
		
		$arr999= array(
			'testtotal'=> 0
		);
		$arr888= array(
			'downloadtotal'=> 0
		);
		$arr444= array(
			'printtotal'=> 0
		);
	
		foreach($query->result() as $row){
			// if(){

			// }
			$date1 = strtotime($row->createtime);
			$date3 = date("Y-m-d",$date1);
			if($date3 == $date){
				if($row->ruleID == 4){
					$num4++;
					$arr4= array(
						'test'=> $num4
					);
					
				}
				if($row->ruleID == 5){
					$num8++;
					$arr8 = array(
						'download'=> $num8
					);
					
				}
				if($row->ruleID == 6){
					$num9++;
					$arr9 = array(
						'print'=> $num9
					);
					
				}
			}
			
		}
		foreach($query->result() as $row){
			
				if($row->ruleID == 4){
					$num999++;
					$arr999 = array(
						'testtotal'=> $num999
					);
					
				}
				if($row->ruleID == 5){
					$num888++;
					$arr888 = array(
						'downloadtotal'=> $num888
					);
					
				}
				if($row->ruleID == 6){
					$num444++;
					$arr444 = array(
						'printtotal'=> $num444
					);
					
				}
		
			
		}
		$data = array(
			'arr1'=>$arr4,
			'arr2'=>$arr8,
			'arr3'=>$arr9,
			'arr4'=>$arr999,
			'arr5'=>$arr888,
			'arr6'=>$arr444
		);
	
		echo json_encode($data);
	}
	public function deteleF1()
	{	
		$id = $this->input->post('id');
	
		$sql = "delete major,subject,test,question from major left join subject on major.majorID = subject.majorID 
		left join test on test.subjectID = subject.subjectID 
		left join question on question.testID = test.testID 
		where major.majorID = '$id'";
		$this->db->query($sql);
		$arr = array(
			'status'=>$sql
		);
		echo json_encode($arr);
	}

	public function deteleF3()
	{	
		$id = $this->input->post('id');
	
		$sql = "delete subject,test,question from subject 
		left join test on test.subjectID = subject.subjectID 
		left join question on question.testID = test.testID 
		where subject.subjectID = '$id'";
		$this->db->query($sql);
		$arr = array(
			'status'=>$sql
		);
		echo json_encode($arr);
	}

	public function deteleF4()
	{	
		$id = $this->input->post('id');
	
		$sql = "delete test,question from test 
		left join question on question.testID = test.testID 
		where test.testID = '$id'";
		$this->db->query($sql);
		$arr = array(
			'status'=>$sql
		);
		echo json_encode($arr);
	}

}
