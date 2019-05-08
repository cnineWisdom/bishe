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
		 $sql = "select * from collecttest join test on collecttest.testID = test.testID  where userID = '$id' ";
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
		$sql = "select * from test where subjectID = '$id' limit $startpage,$pagenum";
		$query = $this->db->query($sql);

		$arr;

		$arr = array(
			'currentpage'=>$page,
			'total'=>$num,
			'res'=>$query->result()

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
		$usernames = $this->input->post('username');
		$str = "select * from usermsg where userName = '$usernames'";
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
		$pageSize = 2;
		$type = $this->input->post('type');
		$page = $this->input->post('page') ? $this->input->post('page') : 1;
		$pages = ($page-1)*$pageSize;
		$countSql = "SELECT count(*) as allCount FROM `med_information` WHERE `type` = $type";
		$allCount = $this->db->query($countSql)->result();
		$pageCount = ceil($allCount[0]->allCount/$pageSize);//页数
		$allCount[0]->pageCount = $pageCount;
		$allCount[0]->page = $page;
		$allCount[0]->pageSize = $pageSize;

		$sql = "SELECT * FROM `med_information` where `type` = $type order by `createtime` desc limit $pages,$pageSize";
		$res = $this->db->query($sql)->result();
		$allCount[0]->res=$res;
		echo json_encode($allCount);
	}

	public function getCritic(){
		$pageSize = 2;
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
		}else {
			$countSql = "SELECT count(*) as allCount,type FROM `case`  group by type";
			$allCount = $this->db->query($countSql)->result();
			foreach ($allCount as $key => &$value) {
				$countArr[$key]['pageSize'] = $pageSize;
				$countArr[$key]['page'] = $page;
				$countArr[$key]['allCount'] = $value->allCount;
				
				$countArr[$key]['pageCount'] = ceil($value->allCount/$pageSize);
				$countArr[$key]['typeTmp'] = $typeArr[$value->type];
				$countArr[$key]['type'] = $value->type;
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
				$countArr[$key]['result'] = $res;
				unset($val);
			}
			unset($value);

		}
		

		echo json_encode($countArr);
		
		// $pageCount = ceil($allCount[0]->allCount/$pageSize);//页数
		// $sql = "select * from `critic` where  `type` = $type order by `createtime` desc limit $pages,$pageSize";

	}
}
