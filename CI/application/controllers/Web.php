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
	public function question(){
			$id = $this->input->post('id');
			$sql = "select * from question where questionID = '$id'";
			$query = $this->db->query($sql);
			echo json_encode($query->result());
	}
	
	public function getcollectquestion(){
		$userID = $this->input->post('username');
		$sql = "select * from errorquestion where userID = '$userID'";
		$query = $this->db->query($sql);
		$arr;
		$num = 0;
	    foreach($query->result() as $row){
			$sql2 = "select * from test where testID = '$row->testID'";
			$query2 = $this->db->query($sql2);
			$sql3 = "select * from errorquestion where testID = '$row->testID'";
			$query3 = $this->db->query($sql3);

			$arr[$num] = array(
				'test'=>$query2->result(),
				'question'=>$query3->result()
			);
			$num++;
		}
		echo json_encode($arr);
	}
	public function collectquestion(){
		date_default_timezone_set('PRC');
		$date = date('Y-m-d H:i:s');
		$userID = $this->input->post('userID');
		$testID = $this->input->post('testID');
		$arr = $this->input->post('arr');
		$amount = $this->input->post('amount');
		$data =array('userID'=>$userID,'testID'=>$testID,'questionID'=>$arr,'createtime'=>$date,'amount'=>$amount);
		$arr;
		$str = $this->db->insert_string('errorquestion', $data);
			$query = $this->db->query($str);
			if ($query) {
				$arr = array(
				'status' => 200,
				'message' => "录入成功！",
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
