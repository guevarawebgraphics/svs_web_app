<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;
use Illuminate\Support\Facades\Hash;
use App\Models\TaskModel;
use App\Models\UserAccount;
use App\Models\ManageAccessList;
use App\Models\ManageAccessRecords;
use App\Models\ViewUsers;
use App\Models\ProjectList;
use App\Models\ProjTask;
use App\Models\EmpProj;
use App\Models\ProjectPercentage;
use App\Models\ProjTaskView;
use App\Models\Sample;
use App\Models\Member;
use Importer;
use Validator;

class MainController extends Controller
{
    public function index(){
        // if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){adadadadadadadadadadad
        if(!empty(auth()->user()->id)){
            $view_project_percentage = DB::connection('mysql')->select("SELECT * from view_project_percentage WHERE deleted = 0 ORDER BY created_at DESC");

            return view('main.index', compact('view_project_percentage'));
        }else{
            return redirect('/');
        }
    }

    public function project_view(Request $request){
        $data = "";
        $counter = 0;

        if($request->type == "TASK")
        {
            $task_selected = DB::connection('mysql')->select("SELECT * FROM view_projtask WHERE projCode = '".$request->code."' and deleted = 0 and taskDeleted = 0");
            
            if($task_selected != ""){
                foreach($task_selected as $field){

                    if($field->taskWeight != ""){
                        $taskWeight = $field->taskWeight."%";
                    }else{
                        $taskWeight = 0.00."%";
                    }
                    if($field->total_task_weight != ""){
                        $total_task_weight = $field->total_task_weight."%";
                    }else{
                        $total_task_weight = 0.00."%";
                    }
                    $data .= '
                    <tr class="row-element-lm">
                        <td>'.$field->taskCode.'</td>

                        <td>'.$field->task_title.'</td>

                        <td>'.$field->task_desc.'</td>

                        <td>'.$total_task_weight.'/'.$taskWeight.'</td>

                        <td>'.$field->plan_days.'</td>

                        <td>'.$field->actual_days.'</td>

                        <td>
                            <button type="button" class="svs-action btn waves-effect waves-light taskModal" onClick="openTask(\''.$field->taskCode.'\',\''.$field->projCode.'\',\''.$field->task_title.'\')" data-taskcode="'.$field->taskCode.'"><i class="fa fa-list"></i></button>
                        </td>
                    </tr>
                    ';
                    $counter++;
                }
                
            }

        }
        else if($request->type == "PM")
        {
            $pm_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, b.csi_email, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
                b.emp_no, b.company_id, b.fullname, b.lname, b.fname, b.company_ind, b.company_name, b.department, b.position, b.team, b.employment_status, b.active
                FROM tbl_emp_proj AS a LEFT JOIN view_employee_info AS b ON a.emp_id = b.company_id
                WHERE a.type = 'PM' AND a.projCode = '".$request->code."' and a.deleted = 0
                GROUP BY a.emp_id
            ");
            
            if($pm_selected != ""){
                foreach($pm_selected as $field){

                    $data .= '
                    <tr>
                        <td>'.$field->fullname.'</td>

                        <td>'.$field->csi_email.'</td>

                        <td>'.$field->position.'</td>
                    </tr>
                    ';
                }
               
            }

        }
        else if($request->type == "EMP")
        {
            $emp_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
                b.emp_no, b.company_id, b.fullname, b.lname, b.fname, b.company_ind, b.company_name, b.department, b.position, b.team, b.employment_status, b.active
                FROM tbl_emp_proj AS a LEFT JOIN view_employee_info AS b ON a.emp_id = b.company_id
                WHERE a.type = 'EMP' AND a.projCode = '".$request->code."' and a.deleted = 0
                GROUP BY a.emp_id
            ");
            
            if($emp_selected != ""){
                foreach($emp_selected as $field){

                    $data .= '
                    <tr>
                        <td>'.$field->fullname.'</td>

                        <td>'.$field->position.'</td>

                        <td>'.$field->department.'</td>

                        <td>'.$field->team.'</td>
                    </tr>
                    ';
                }
                
            }
        }
        else if($request->type == "ACT")
        {
            $act_selected = DB::connection('mysql')->select("SELECT * FROM view_activity_log WHERE projCode = '".$request->code."'");
            
                if($act_selected != ""){
                    foreach($act_selected as $field){

                        if($field->attachment != ""){
                            $data .= '
                            <tr>
                                <td><small>'.date("F d Y <br> h:i a",strtotime($field->created_at)).'</small></td>
                                <td>'.$field->activity_desc.'</td>
                                <td>'.$field->type.'</td>
                                <td>'.$field->name.'</td>
                                <td>
                                    <a data-img="'.$field->attachment.'" data-projcode= "'.$field->projCode.'" onClick="activityLog(\''.$field->projCode.'\',\''.$field->attachment.'\')" class="btn btn-info svs-action"><i class="fa fa-file"></i>&nbsp;&nbsp;file</a>
                                </td>
                            </tr>
                            ';
                        }else{
                            $data .= '
                            <tr>
                                <td><small>'.date("F d Y <br> h:i a",strtotime($field->created_at)).'</small></td>
                                <td>'.$field->activity_desc.'</td>
                                <td>'.$field->type.'</td>
                                <td>'.$field->name.'</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            ';
                        }

                    }
                    
                }
        }
        else if($request->type == "STAKE")
        {
            $stake_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, b.memberCode, b.member_name, b.member_email,
                b.member_contact_no, b.member_address, b.member_type, b.member_position  
                FROM tbl_emp_proj AS a
                LEFT JOIN tbl_member AS b 
                ON a.emp_id = b.memberCode
                WHERE a.deleted = 0 AND b.deleted = 0 AND a.type = 'STAKEHOLDER' AND projCode = '".$request->code."'
            ");
            
            if($stake_selected != ""){
                foreach($stake_selected as $field){

                    $data .= '
                    <tr>
                        <td>'.$field->member_name.'</td>

                        <td>'.$field->member_email.'</td>

                        <td>'.$field->member_contact_no.'</td>

                        <td>'.$field->member_position.'</td>

                    </tr>
                    ';
                }
                
            }
        }
        else if($request->type == "CUSTOMER")
        {
            $customer_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, b.memberCode, b.member_name, b.member_email,
                b.member_contact_no, b.member_address, b.member_type, b.member_position  
                FROM tbl_emp_proj AS a
                LEFT JOIN tbl_member AS b 
                ON a.emp_id = b.memberCode
                WHERE a.deleted = 0 AND b.deleted = 0 AND a.type = 'CUSTOMER' AND projCode = '".$request->code."'
            ");
            
            if($customer_selected != ""){
                foreach($customer_selected as $field){

                    $data .= '
                    <tr>
                        <td>'.$field->member_name.'</td>

                        <td>'.$field->member_email.'</td>

                        <td>'.$field->member_contact_no.'</td>

                        <td>'.$field->member_position.'</td>

                    </tr>
                    ';
                }
                
            }
        }

        echo $data;
    }

    public function open_task_view(Request $request){
        $data = "";
        $counter = 0;

        if($request->proceed == "TRUE")
        {
            $progress = DB::connection('mysql')->select("SELECT * FROM view_proj_progress WHERE projCode = '".$request->projCode."' AND taskCode = '".$request->taskCode."' AND taskDeleted = 0 AND deleted = 0");
            
            if(count($progress)){
                foreach($progress as $field){

                    if($field->weight_progress != ""){
                        $taskWeight = $field->weight_progress."%";
                    }else{
                        $taskWeight = 0.00."%";
                    }
                    if($field->attachment == ""){
                        $data .= '
                        <tr>
                            <td>'.$taskWeight.'</td>

                            <td><p>'.$field->report.'</p></td>

                            <td>'.$field->updated_by.'</td>

                            <td>'.date("F d Y - h:i a",strtotime($field->created_at)).'</td>

                            <td></td>
                        </tr>
                        ';
                    }else{
                        $data .= '
                        <tr>
                            <td>'.$taskWeight.'</td>
    
                            <td><p>'.$field->report.'</p></td>
    
                            <td>'.$field->updated_by.'</td>
    
                            <td>'.date("F d Y - h:i a",strtotime($field->created_at)).'</td>
    
                            <td><a data-img="'.$field->attachment.'" data-projcode= "'.$field->projCode.'" onClick="activityLog(\''.$field->projCode.'\',\''.$field->attachment.'\')" class="btn btn-info svs-action" ><i class="fa fa-file"></i>&nbsp;File</a></td>
                        </tr>
                        ';
                    }
                    $counter++;
                }
            }

        }

        echo $data;
    }

    public function location(){
        // if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
        if(!empty(auth()->user()->id)){
            return view('main.location');
        }else{
            return redirect('/');
        }
    }

    public function task(){
        // if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
        if(!empty(auth()->user()->id)){

            $task_record = TaskModel::where('deleted', 0)
                ->orderBy('created_at','desc')
                ->get();

            $manage_user_task = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 2)
            ->orderBy('created_at','desc')
            ->get();

            if($manage_user_task[0]->no_access_data == 0)
            {
                return view('main.task', compact('task_record','manage_user_task'));
            }
            else
            {
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function task_val(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();
        if($request->proceed != "TRUE"){
            $messages = "Invalid Request";
            $error[] = $messages;
        }else if($request->task_title == ""){
            $messages = "Task Title is required!";
            $error[] = $messages;
        }else if($request->desc == ""){
            $messages = "Description is required!";
            $error[] = $messages;
        }else{
            $messages = "Successfully Validated!";
            $success[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function task_save(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->proceed == "TRUE"){
            $taskCode = strtoupper(str_random(12));
            $task = new TaskModel;
            $task->taskCode = $taskCode;
            $task->task_title = $request->task_title;
            $task->task_desc = $request->desc;
            $task->deleted = 0;
            $task->by_id = auth()->user()->id;
            $task->updated_by = auth()->user()->name;
            $task->created_at = now();
            $task->updated_at = now();
            $task->save();

            $messages = $taskCode;
            $success[] = $messages;

        }else{
            $messages = "Invalid Request";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function getTask(){
        $task_record = DB::connection('mysql')->select("SELECT * FROM tbl_task WHERE deleted = 0 ORDER BY created_at DESC");

        $data = "";
        
        $counter = 1;
        if(count($task_record) > 0){
            foreach($task_record as $field){

                $data .='
                        <tr class="">
                            <td>'.$field->task_title.'</td>
                            <td>'.$field->task_desc.'</td>
                            <td>'.$field->updated_by.'</td>
                            <td>'.$field->created_at.'</td>
                            <td></td>
                        </tr>
                        ';
                $counter++;
            }
        }
        echo $data;
    }

    public function delete_task(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();
        if($request->type == "delete_task" && $request->id != ""){

            DB::table('tbl_task')
            ->where('id', $request->id)
            ->update([
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
            'deleted' => '1',
            'updated_at' => now()
            ]);

            $request->session()->put('deleteTask',"Successfully Deleted!");
            $request->session()->put('titleTask',$request->title);
            $request->session()->put('descTask',$request->desc);
            $request->session()->put('codeTask',$request->code);
                        

            $messages = "Successfully Deleted!";
            $success[] = $messages;
        }else{
            $messages = "Invalid Request";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function update_task_val(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type != "update_task"){
            $messages = "Invalid Request";
            $error[] = $messages;
            
        }
        else if($request->title == ""){
            $messages = "Title is required!";
            $error[] = $messages;
        }
        else if($request->desc == ""){
            $messages = "Description is required!";
            $error[] = $messages;
        }
        else if($request->id == ""){
            $messages = "ID is required!";
            $error[] = $messages;
        }
        else
        {
            $messages = "Successfully Updated!";
            $success[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function update_task(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();
        
        if($request->type == "update_task" && $request->id != ""){

            DB::table('tbl_task')
            ->where('id', $request->id)
            ->update([
            'task_title'=> $request->title,
            'task_desc'=> $request->desc,
            // 'by_id'=> auth()->user()->id,
            // 'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);

            $request->session()->put('successTask',"Successfully Updated!");
            $request->session()->put('titleTask',$request->title);
            $request->session()->put('descTask',$request->desc);
            $request->session()->put('codeTask',$request->code);
                        
            $messages = "Successfully Updated!";
            $success[] = $messages;
        }
        else
        {
            $messages = "Invalid request!";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function session_success(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();
        if($request->type == "TASK"){

            $request->session()->put('successTask',"Successfully Saved!");
            $request->session()->put('titleTask',$request->task_title);
            $request->session()->put('descTask',$request->desc);
            $request->session()->put('codeTask',$request->code);
            
            $messages = "Successfully Saved!";
            $success[] = $messages;
        }
        else if($request->type == "NEWPROJECT"){

            $request->session()->put('successProj',"Successfully Saved!");
            $request->session()->put('titleProj',$request->proj_title);
            $request->session()->put('descProj',$request->proj_desc);
            $request->session()->put('lonProj',$request->lon);
            $request->session()->put('latProj',$request->lat);
            $request->session()->put('addrProj',$request->addr);
            $request->session()->put('codeProj',$request->code);

            $messages = "Successfully Saved!";
            $success[] = $messages;
        }
        else if($request->type == "UPDATEPROJECT"){

            $request->session()->put('successProj',"Successfully Updated!");
            $request->session()->put('titleProj',$request->proj_title);
            $request->session()->put('descProj',$request->proj_desc);
            $request->session()->put('lonProj',$request->lon);
            $request->session()->put('latProj',$request->lat);
            $request->session()->put('addrProj',$request->addr);
            $request->session()->put('codeProj',$request->code);

            $messages = "Successfully Saved!";
            $success[] = $messages;
        }
        else if($request->type == "DELETEPROJECT"){

            $request->session()->put('deleteProj',"Successfully Deleted!");
            $request->session()->put('titleProj',$request->proj_title);
            $request->session()->put('descProj',$request->proj_desc);
            $request->session()->put('lonProj',$request->lon);
            $request->session()->put('latProj',$request->lat);
            $request->session()->put('addrProj',$request->addr);
            $request->session()->put('codeProj',$request->code);

            $messages = "Successfully Saved!";
            $success[] = $messages;
        }
        else{
            $messages = "Invalid Request";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function projectlist(){
        // if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
        if(!empty(auth()->user()->id)){
            $user_record = UserAccount::where('deleted', 0)
            ->where('is_admin', 0)
            ->orderBy('name','ASC')
            ->get();

            $task_record = TaskModel::where('deleted', 0)
            ->orderBy('created_at','desc')
            ->get();
            
            $project_record = ProjectPercentage::where('deleted', 0)
            ->orderBy('created_at','desc')
            ->get();

            // $project_record = DB::connection('mysql')->select("SELECT * from view_project_percentage");
        
            // $projtask_record = ProjTask::where('deleted', 0)
            // ->orderBy('created_at','desc')
            // ->get();

            $projtask_record = ProjTaskView::where('deleted', 0)
            ->where('taskDeleted', 0)
            ->orderBy('created_at','desc')
            ->get();

            // $emp_info = DB::connection('mysql2')->select("select a.emp_no AS emp_no, a.company_id AS company_id,
            // concat(a.lname,', ',a.fname,' ',a.mname) AS fullname,
            // a.lname AS lname,a.fname AS fname, b.company_ind AS company_ind, 
            // d.company_name AS company_name, b.department AS department, 
            // b.position AS position, b.team AS team, 
            // b.employment_status AS employment_status, 
            // a.active AS active 
       
            // from ((hris_csi_b.personal_information a left join hris_csi_b.employee_information b on((a.company_id = b.company_id)))
            // left join hris_csi_b.company d on((b.company_ind = d.id))) where (a.active = 'yes')
            // ORDER BY b.department ASC
            // ");

            $emp_info = DB::connection('mysql')->select("SELECT * FROM view_employee_info");

            $stakeholder_info = DB::connection('mysql')->select("SELECT * FROM tbl_member WHERE member_type = 'STAKEHOLDER' AND deleted = 0");

            $customer_info = DB::connection('mysql')->select("SELECT * FROM tbl_member WHERE member_type = 'CUSTOMER' AND deleted = 0");

            $emp_selected = DB::connection('mysql')->select("
            SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
            b.emp_no, b.company_id, b.fullname, b.lname, b.fname, b.company_ind, b.company_name, b.department, b.position, b.team, b.employment_status, b.active
            FROM tbl_emp_proj AS a LEFT JOIN view_employee_info AS b ON a.emp_id = b.company_id
            WHERE a.type = 'EMP'
            GROUP BY a.emp_id
            ");

            $pm_selected = DB::connection('mysql')->select("
            SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
            b.emp_no, b.company_id, b.fullname, b.lname, b.fname, b.company_ind, b.company_name, b.department, b.position, b.team, b.employment_status, b.active
            FROM tbl_emp_proj AS a LEFT JOIN view_employee_info AS b ON a.emp_id = b.company_id
            WHERE a.type = 'PM'
            GROUP BY a.emp_id
            ");


            $manage_user_proj = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 3)
            ->orderBy('created_at','desc')
            ->get();

            if($manage_user_proj[0]->no_access_data == 0){
                return view('main.projectlist', compact('user_record','task_record','project_record','projtask_record','emp_info','emp_selected','pm_selected','stakeholder_info','customer_info','manage_user_proj'));
            }else{
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function new_project(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        //Estimated
        //Start Datetime
        $est_start_d = date('Y-m-d',strtotime("$request->est_start_d"));
        $est_start_t = date('H:i:s',strtotime("$request->est_start_t"));
        $est_start_dt = date('Y-m-d H:i:s', strtotime("$est_start_d $est_start_t"));

        //End Datetime
        $est_end_d = date('Y-m-d',strtotime("$request->est_end_d"));
        $est_end_t = date('H:i:s',strtotime("$request->est_end_t"));
        $est_end_dt = date('Y-m-d H:i:s', strtotime("$est_end_d $est_end_t"));

        //Actual
        //Start Datetime
        $act_start_d = date('Y-m-d',strtotime("$request->act_start_d"));
        $act_start_t = date('H:i:s',strtotime("$request->act_start_t"));
        $act_start_dt = date('Y-m-d H:i:s', strtotime("$act_start_d $act_start_t"));

        //End Datetime
        $act_end_d = date('Y-m-d',strtotime("$request->act_end_d"));
        $act_end_t = date('H:i:s',strtotime("$request->act_end_t"));
        $act_end_dt = date('Y-m-d H:i:s', strtotime("$act_end_d $act_end_t"));


        if($request->type != "NEWPROJECT"){
            $messages = "Invalid request..";
            $error[] = $messages;
        }
        else if($request->proj_title == ""){
            $messages = "Title is required!";
            $error[] = $messages;
        }
        else if($request->proj_desc == ""){
            $messages = "Description is required!";
            $error[] = $messages;
        }
        else if($request->target_man_days == ""){
            $messages = "Target Man Days is required!";
            $error[] = $messages;
        }
        else if($request->lon == ""){
            $messages = "Please search and choose location..";
            $error[] = $messages;
        }
        else if($request->lat == ""){
            $messages = "Please search and choose location..";
            $error[] = $messages;
        }
        else if($request->addr == ""){
            $messages = "Please search and choose location..";
            $error[] = $messages;
        }
        else if($request->est_start_d == ""){
            $messages = "Est. Start Date is required!";
            $error[] = $messages;
        }
        else if($request->est_start_t == ""){
            $messages = "Est. Start Time is required!";
            $error[] = $messages;
        }
        else if($request->est_end_d == ""){
            $messages = "Est. End Date is required!";
            $error[] = $messages;
        }
        else if($request->est_end_t == ""){
            $messages = "Est. End Time is required!";
            $error[] = $messages;
        }
        else if($est_end_dt < $est_start_dt){
            $messages = "Est. End Datetime must be ahead to Start Datetime";
            $error[] = $messages;
        }
        else if($est_end_dt == $est_start_dt){
            $messages = "Est. Start and End Datetime have same values.";
            $error[] = $messages;
        }
        else if($act_end_dt < $act_start_dt){
            $messages = "Act. End Datetime must be ahead to Start Datetime";
            $error[] = $messages;
        }
        else if($act_end_dt == $act_start_dt){
            $messages = "Act. Start and End Datetime have same values.";
            $error[] = $messages;
        }
        else if($request->act_start_d == ""){
            $messages = "Act. Start Date is required!";
            $error[] = $messages;
        }
        else if($request->act_start_t == ""){
            $messages = "Act. Start Time is required!";
            $error[] = $messages;
        }
        else if($request->act_end_d == ""){
            $messages = "Act. End Date is required!";
            $error[] = $messages;
        }
        else if($request->act_end_t == ""){
            $messages = "Act. End Time is required!";
            $error[] = $messages;
        }
        else if($request->taskData == ""){
            $messages = "Please choose task for this project.";
            $error[] = $messages;
        }
        else if($request->pmData == ""){
            $messages = "Please select Project Manager for this project.";
            $error[] = $messages;
        }
        else if($request->empData == ""){
            $messages = "Please select Employees for this project.";
            $error[] = $messages;
        }
        else if($request->stakeData == ""){
            $messages = "Please select Stakeholders for this project.";
            $error[] = $messages;
        }
        // else if($request->cusData == ""){
        //     $messages = "Please select Customers for this project.";
        //     $error[] = $messages;
        // }
        else if($request->dataWeight == ""){
            $messages = "Please specify task weight";
            $error[] = $messages;
        }
        else if($request->dataWeightAttr == ""){
            $messages = "Invalid request of task weight";
            $error[] = $messages;
        }
        else if($request->resPercent != 100){
            $messages = "Please make sure task weight grand total is 100%";
            $error[] = $messages;
        }
        else{
            $messages = "Successfully Saved!";
            $success[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );
        echo json_encode($output);
    }

    public function save_project(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type == "NEWPROJECT"){
            //Estimated
            //Start Datetime
            $est_start_d = date('Y-m-d',strtotime("$request->est_start_d"));
            $est_start_t = date('H:i:s',strtotime("$request->est_start_t"));
            $est_start_dt = date('Y-m-d H:i:s', strtotime("$est_start_d $est_start_t"));

            //End Datetime
            $est_end_d = date('Y-m-d',strtotime("$request->est_end_d"));
            $est_end_t = date('H:i:s',strtotime("$request->est_end_t"));
            $est_end_dt = date('Y-m-d H:i:s', strtotime("$est_end_d $est_end_t"));

            //Actual
            //Start Datetime
            $act_start_d = date('Y-m-d',strtotime("$request->act_start_d"));
            $act_start_t = date('H:i:s',strtotime("$request->act_start_t"));
            $act_start_dt = date('Y-m-d H:i:s', strtotime("$act_start_d $act_start_t"));

            //End Datetime
            $act_end_d = date('Y-m-d',strtotime("$request->act_end_d"));
            $act_end_t = date('H:i:s',strtotime("$request->act_end_t"));
            $act_end_dt = date('Y-m-d H:i:s', strtotime("$act_end_d $act_end_t"));

            //Random String and Number for Project Code
            $projCode = strtoupper(str_random(12));

            
            $projectList = new ProjectList;
            $projectList->proj_code = $projCode;
            $projectList->proj_title = $request->proj_title;
            $projectList->proj_desc = $request->proj_desc;
            $projectList->target_man_days = $request->target_man_days;
            $projectList->est_start_date = $est_start_dt;
            $projectList->est_end_date = $est_end_dt;
            $projectList->act_start_date = $act_start_dt;
            $projectList->act_end_date = $act_end_dt;
            $projectList->longitude = $request->lon;
            $projectList->latitude = $request->lat;
            $projectList->location = $request->addr;
            $projectList->status = NULL;
            $projectList->deleted = 0;
            $projectList->by_id = auth()->user()->id;
            $projectList->updated_by = auth()->user()->name;
            $projectList->created_at = now();
            $projectList->updated_at = now();
            $projectList->save();

            $myString = $request->taskData;
            foreach($myString as $value){
                $ProjTask = new ProjTask;
                $ProjTask->projCode = $projCode;
                $ProjTask->taskCode = $value;
                $ProjTask->deleted = 0;
                $ProjTask->by_id = auth()->user()->id;
                $ProjTask->updated_by = auth()->user()->name;
                $ProjTask->created_at = now();
                $ProjTask->updated_at = now();
                $ProjTask->save();
            }

            $myString2 = $request->pmData;
            foreach($myString2 as $value2){
                $ProjPM = new EmpProj;
                $ProjPM->projCode = $projCode;
                $ProjPM->emp_id = $value2;
                $ProjPM->type = "PM";
                $ProjPM->deleted = 0;
                $ProjPM->by_id = auth()->user()->id;
                $ProjPM->updated_by = auth()->user()->name;
                $ProjPM->created_at = now();
                $ProjPM->updated_at = now();
                $ProjPM->save();
            }

            $myString3 = $request->empData;
            foreach($myString3 as $value3){
                $ProjEMP = new EmpProj;
                $ProjEMP->projCode = $projCode;
                $ProjEMP->emp_id = $value3;
                $ProjEMP->type = "EMP";
                $ProjEMP->deleted = 0;
                $ProjEMP->by_id = auth()->user()->id;
                $ProjEMP->updated_by = auth()->user()->name;
                $ProjEMP->created_at = now();
                $ProjEMP->updated_at = now();
                $ProjEMP->save();
            }

            $myString4 = $request->stakeData;
            foreach($myString4 as $value4){
                $ProjSTKHLDR = new EmpProj;
                $ProjSTKHLDR->projCode = $projCode;
                $ProjSTKHLDR->emp_id = $value4;
                $ProjSTKHLDR->type = "STAKEHOLDER";
                $ProjSTKHLDR->deleted = 0;
                $ProjSTKHLDR->by_id = auth()->user()->id;
                $ProjSTKHLDR->updated_by = auth()->user()->name;
                $ProjSTKHLDR->created_at = now();
                $ProjSTKHLDR->updated_at = now();
                $ProjSTKHLDR->save();
            }

            $myString5 = $request->cusData;
            foreach($myString5 as $value5){
                $ProjCus = new EmpProj;
                $ProjCus->projCode = $projCode;
                $ProjCus->emp_id = $value5;
                $ProjCus->type = "CUSTOMER";
                $ProjCus->deleted = 0;
                $ProjCus->by_id = auth()->user()->id;
                $ProjCus->updated_by = auth()->user()->name;
                $ProjCus->created_at = now();
                $ProjCus->updated_at = now();
                $ProjCus->save();
            }

            $dataWeight = $request->dataWeight; 
            $dataWeightAttr = $request->dataWeightAttr; 

            foreach($dataWeightAttr as $keyWeight => $valueWeight){
                DB::table('tbl_projtask')
                ->where('taskCode', $valueWeight)
                ->where('projCode',$projCode)
                ->update([
                'taskWeight'=> $dataWeight[$keyWeight],
                'by_id'=> auth()->user()->id,
                'updated_by'=> auth()->user()->name,
                'updated_at' => now()
                ]);
            }

            $dataPlan = $request->dataPlan; 
            $dataPlanAttr = $request->dataPlanAttr; 

            foreach($dataPlanAttr as $keyPlan => $valuePlan){
                DB::table('tbl_projtask')
                ->where('taskCode', $valuePlan)
                ->where('projCode',$projCode)
                ->update([
                'plan_days'=> $dataPlan[$keyPlan],
                'by_id'=> auth()->user()->id,
                'updated_by'=> auth()->user()->name,
                'updated_at' => now()
                ]);
            }


            $dataActual = $request->dataActual; 
            $dataActualAttr = $request->dataActualAttr; 

            foreach($dataActualAttr as $keyActual => $valueActual){
                DB::table('tbl_projtask')
                ->where('taskCode', $valueActual)
                ->where('projCode',$projCode)
                ->update([
                'actual_days'=> $dataActual[$keyActual],
                'by_id'=> auth()->user()->id,
                'updated_by'=> auth()->user()->name,
                'updated_at' => now()
                ]);
            }


            $messages = $projCode;
            $success[] = $messages;
        }
        else{
            $messages = "Invalid request..";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );
        echo json_encode($output);
    }

    public function project_info_task(Request $request){
        $projTask = DB::connection('mysql')->select("SELECT a.projCode, a.taskWeight , b.taskCode, b.task_title, b.task_desc FROM tbl_projtask AS a LEFT JOIN tbl_task AS b ON a.taskCode = b.taskCode WHERE a.projCode = '".$request->code."' AND a.deleted = 0 AND b.deleted = 0");
        $data = "";
        $counter = 1;

        if(count($projTask)){
            foreach($projTask as $field){

                $data .='
                        <tr>
                            <td>'.$field->taskCode.'</td>
                            <td>'.$field->task_title.'</td>
                            <td>'.$field->task_desc.'</td>
                            <td>'.$field->taskWeight.'</td>
                            <td><button class="svs-action btn waves-effect waves-light taskModal" onClick="openTask(\''.$field->taskCode.'\',\''.$field->projCode.'\',\''.$field->task_title.'\')" data-projcode="'.$request->code.'" data-taskcode="'.$field->taskCode.'"><i class="fa fa-list"></i></button></td>
                        </tr>
                        ';
                $counter++;
            }
        }

        echo $data;
    }

    public function project_info_pm(Request $request){

        $projPm = DB::connection('mysql')->select("
        SELECT a.id, a.projCode, a.emp_id, b.csi_email, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
        b.emp_no AS emp_no, b.company_id AS company_id, concat(b.lname,', ',b.fname,' ',b.mname) AS fullname, b.active AS active,

        c.department AS department, c.position AS position, c.team AS team, c.employment_status AS employment_status

                    
        FROM tbl_emp_proj AS a LEFT JOIN hris_csi_b.personal_information AS b ON a.emp_id = b.company_id
        LEFT JOIN hris_csi_b.employee_information AS c ON a.emp_id = c.company_id
        WHERE (b.active = 'yes') AND projCode = '".$request->code."' AND a.deleted = 0 AND type = 'PM'
        ");

        $data = "";
        $counterPM = 1;

        if(count($projPm)){
            foreach($projPm as $fieldPM){
                $data .='
                        <tr>
                                <td>'.$fieldPM->fullname.'</td>
                                <td>'.$fieldPM->csi_email.'</td>
                                <td>'.$fieldPM->position.'</td>
                        </tr>
                        ';
                $counterPM++;
            }
        }

        echo $data;

    }

    public function project_info_emp(Request $request){
        
        $projEmp = DB::connection('mysql')->select("
        SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
        b.emp_no AS emp_no, b.company_id AS company_id, concat(b.lname,', ',b.fname,' ',b.mname) AS fullname, b.active AS active,

        c.department AS department, c.position AS position, c.team AS team, c.employment_status AS employment_status

                    
        FROM tbl_emp_proj AS a LEFT JOIN hris_csi_b.personal_information AS b ON a.emp_id = b.company_id
        LEFT JOIN hris_csi_b.employee_information AS c ON a.emp_id = c.company_id
        WHERE (b.active = 'yes') AND projCode = '".$request->code."' AND a.deleted = 0 AND type = 'EMP'
        ");

        $data = "";
        $counterEMP = 1;

        if(count($projEmp)){
            foreach($projEmp as $fieldEMP){
                $data .='
                        <tr>
                            <td>'.$fieldEMP->fullname.'</td>
                            <td>'.$fieldEMP->position.'</td>
                            <td>'.$fieldEMP->department.'</td>
                            <td>'.$fieldEMP->position.'</td>
                        </tr>
                        ';
                $counterEMP++;
            }
        }

        echo $data;
    }

    public function project_info_stakeholder(Request $request){
        
        $projStake = DB::connection('mysql')->select("
        SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, b.memberCode, b.member_name, b.member_email,
        b.member_contact_no, b.member_address, b.member_type, b.member_position 
        FROM tbl_emp_proj AS a
        LEFT JOIN tbl_member AS b 
        ON a.emp_id = b.memberCode
        WHERE a.deleted = 0 AND b.deleted = 0 AND a.type = 'STAKEHOLDER' AND projCode = '".$request->code."'
        ");

        $data = "";
        $counterStake = 1;

        if(count($projStake)){
            foreach($projStake as $fieldStake){
                $data .='
                    <tr>
                        <td>'.$fieldStake->member_name.'</td>
                        <td>'.$fieldStake->member_email.'</td>
                        <td>'.$fieldStake->member_contact_no.'</td>
                        <td>'.$fieldStake->member_position.'</td>
                    </tr>
                ';
                $counterStake++;
            }
        }

        echo $data;
    }

    public function project_info_customer(Request $request){

        $projCustomer = DB::connection('mysql')->select("
        SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, b.memberCode, b.member_name, b.member_email,
        b.member_contact_no, b.member_address, b.member_type, b.member_position 
        FROM tbl_emp_proj AS a
        LEFT JOIN tbl_member AS b 
        ON a.emp_id = b.memberCode
        WHERE a.deleted = 0 AND b.deleted = 0 AND a.type = 'CUSTOMER' AND projCode = '".$request->code."'
        ");

        $data = "";
        $counterCustomer = 1;

        if(count($projCustomer)){
            foreach($projCustomer as $fieldCustomer){
                $data .='
                    <tr>
                    <td>'.$fieldCustomer->member_name.'</td>
                    <td>'.$fieldCustomer->member_email.'</td>
                    <td>'.$fieldCustomer->member_contact_no.'</td>
                    <td>'.$fieldCustomer->member_position.'</td>
                    </tr>
                ';
                $counterCustomer++;
            }
        }

        echo $data;
    }

    public function project_dropdown(Request $request){

        $data = "";
        $counter = 1;

        if($request->type == "PM")
        {
            $pm_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
                b.emp_no, b.company_id, b.fullname, b.lname, b.fname, b.company_ind, b.company_name, b.department, b.position, b.team, b.employment_status, b.active
                FROM tbl_emp_proj AS a LEFT JOIN view_employee_info AS b ON a.emp_id = b.company_id
                WHERE a.type = 'PM' AND a.projCode = '".$request->code."' and a.deleted = 0
                GROUP BY a.emp_id
            ");

            if(count($pm_selected)){
                foreach($pm_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-pm">
                        <input type="checkbox" class="custom-control-input pmChck" name="pmChck" value="'.$field->emp_id.'" id="pmChck'.$field->emp_id.'" checked>
                        <label class="custom-control-label" for="pmChck'.$field->emp_id.'">'.$field->fullname.'<em><small> ('.$field->position.') - '.$field->department.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Current Project Manager found';
            }

        }
        else if($request->type == "EMP")
        {
            $emp_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
                b.emp_no, b.company_id, b.fullname, b.lname, b.fname, b.company_ind, b.company_name, b.department, b.position, b.team, b.employment_status, b.active
                FROM tbl_emp_proj AS a LEFT JOIN view_employee_info AS b ON a.emp_id = b.company_id
                WHERE a.type = 'EMP' AND a.projCode = '".$request->code."' and a.deleted = 0
                GROUP BY a.emp_id
            ");
            if(count($emp_selected)){
                foreach($emp_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-emp">
                        <input type="checkbox" class="custom-control-input" name="empChck" value="'.$field->emp_id.'" id="empChck'.$field->emp_id.'" checked>
                        <label class="custom-control-label" for="empChck'.$field->emp_id.'">'.$field->fullname.'<em><small> ('.$field->position.') - '.$field->department.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Current Employee found';
            }

        }
        else if($request->type == "STAKE")
        {
            $stake_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, b.memberCode, b.member_name, b.member_email,
                b.member_contact_no, b.member_address, b.member_type, b.member_position 
                FROM tbl_emp_proj AS a
                LEFT JOIN tbl_member AS b 
                ON a.emp_id = b.memberCode
                WHERE a.deleted = 0 AND b.deleted = 0 AND a.type = 'STAKEHOLDER' AND projCode = '".$request->code."'
            ");
            if(count($stake_selected)){
                foreach($stake_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-stake">
                        <input type="checkbox" class="custom-control-input" name="stakeChck" value="'.$field->memberCode.'" id="stakeChck'.$field->memberCode.'" checked>
                        <label class="custom-control-label" for="stakeChck'.$field->memberCode.'">'.$field->member_name.'<em><small> ('.$field->member_email.') - '.$field->member_contact_no.' - '.$field->member_position.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Current Stakeholder found';
            }

        }
        else if($request->type == "CUSTOMER")
        {
            $cus_selected = DB::connection('mysql')->select("
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, b.memberCode, b.member_name, b.member_email,
                b.member_contact_no, b.member_address, b.member_type, b.member_position 
                FROM tbl_emp_proj AS a
                LEFT JOIN tbl_member AS b 
                ON a.emp_id = b.memberCode
                WHERE a.deleted = 0 AND b.deleted = 0 AND a.type = 'CUSTOMER' AND projCode = '".$request->code."'
            ");
            if(count($cus_selected)){
                foreach($cus_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-stake">
                        <input type="checkbox" class="custom-control-input" name="cusChck" value="'.$field->memberCode.'" id="cusChck'.$field->memberCode.'" checked>
                        <label class="custom-control-label" for="cusChck'.$field->memberCode.'">'.$field->member_name.'<em><small> ('.$field->member_email.') - '.$field->member_contact_no.' - '.$field->member_position.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Current Customer found';
            }

        }
        else if($request->type == "TASK")
        {
            // $task_selected = DB::connection('mysql')->select("
            // SELECT a.projCode, a.taskCode, a.deleted, a.by_id, a.updated_by, 
            // a.created_at, a.updated_at, b.task_title, b.task_desc
            // FROM `tbl_projtask` AS a LEFT JOIN tbl_task AS b ON a.taskCode = b.taskCode
            // WHERE a.projCode = '".$request->code."' and a.deleted = 0
            // ");
            $task_selected = DB::connection('mysql')->select("SELECT * FROM view_projtask WHERE projCode = '".$request->code."' and deleted = 0");
            if(count($task_selected)){
                foreach($task_selected as $field){
                    $data .= '
                    <div class="current-task row">
                        <div class="col-md-3">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" name="taskChck" value="'.$field->taskCode.'" id="taskChck'.$field->taskCode.'" checked>
                                <label class="custom-control-label" for="taskChck'.$field->taskCode.'">'.$field->task_title.'</label>
                            </div>
                            <small><p>WBS: '.$field->task_desc.'</p></small>
                        </div>
                        <div class="col-md-3">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Task Weight" id="taskTxtFld'.$field->taskCode.'" name="taskTxtFld" value="'.$field->taskWeight.'" class="form-control">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Planned # of days" id="planTxtFld'.$field->taskCode.'" name="planTxtFld" value="'.$field->plan_days.'" class="form-control">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Actual # of days" id="actualTxtFld'.$field->taskCode.'" name="actualTxtFld" value="'.$field->actual_days.'" class="form-control">
                                
                            </div>
                        </div>
                    </div>
                    ';
                }
            }else{
                $data .= 'No Current Task found';
            }

        }

        echo $data;

    }

    public function project_unselected(Request $request){
        $data = "";
        $counter = 1;

        if($request->type == "PM")
        {
            $arrays = implode("', '", $request->pmChck);
            $pm_selected = DB::connection('mysql')->select("SELECT * FROM view_employee_info WHERE company_id NOT IN('".$arrays."')");
           
            if(count($pm_selected)){
                foreach($pm_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-pm">
                        <input type="checkbox" class="custom-control-input pmChck" name="pmChck" value="'.$field->company_id.'" id="pmChck'.$field->company_id.'">
                        <label class="custom-control-label" for="pmChck'.$field->company_id.'">'.$field->fullname.'<em><small> ('.$field->position.') - '.$field->department.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Project Manager found';
            }
        }
        else if($request->type == "EMP")
        {
            $arrays = implode("', '", $request->empChck);
            $emp_selected = DB::connection('mysql')->select("SELECT * FROM view_employee_info WHERE company_id NOT IN('".$arrays."')");
           
            if(count($emp_selected)){
                foreach($emp_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-emp">
                        <input type="checkbox" class="custom-control-input empChck" name="empChck" value="'.$field->company_id.'" id="empChck'.$field->company_id.'">
                        <label class="custom-control-label" for="empChck'.$field->company_id.'">'.$field->fullname.'<em><small> ('.$field->position.') - '.$field->department.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Employee found';
            }
        }
        else if($request->type == "STAKE")
        {
            $arrays = implode("', '", $request->stakeChck);
            $stake_selected = DB::connection('mysql')->select("SELECT * FROM tbl_member WHERE memberCode NOT IN('".$arrays."') AND member_type = 'STAKEHOLDER' AND deleted = 0");
           
            if(count($stake_selected)){
                foreach($stake_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-stake">
                        <input type="checkbox" class="custom-control-input stakeChck" name="stakeChck" value="'.$field->memberCode.'" id="stakeChck'.$field->memberCode.'">
                        <label class="custom-control-label" for="stakeChck'.$field->memberCode.'">'.$field->member_name.'<em><small> ('.$field->member_email.') - '.$field->member_contact_no.' - '.$field->member_position.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Stakeholder found';
            }
        }
        else if($request->type == "CUSTOMER")
        {
            $arrays = implode("', '", $request->cusChck);
            $cus_selected = DB::connection('mysql')->select("SELECT * FROM tbl_member WHERE memberCode NOT IN('".$arrays."') AND member_type = 'CUSTOMER' AND deleted = 0");
           
            if(count($cus_selected)){
                foreach($cus_selected as $field){
                    $data .= '
                        <div class="custom-control custom-checkbox current-stake">
                        <input type="checkbox" class="custom-control-input cusChck" name="cusChck" value="'.$field->memberCode.'" id="cusChck'.$field->memberCode.'">
                        <label class="custom-control-label" for="cusChck'.$field->memberCode.'">'.$field->member_name.'<em><small> ('.$field->member_email.') - '.$field->member_contact_no.' - '.$field->member_position.'</small></em></label>
                        </div>
                    ';
                }
            }else{
                $data .= 'No Customer found';
            }
        }
        else if($request->type == "TASK"){
            $arrays = implode("', '", $request->taskChck);
            $task_selected = DB::connection('mysql')->select("SELECT * FROM tbl_task WHERE taskCode NOT IN('".$arrays."') AND deleted = 0");
           
            if(count($task_selected)){
                foreach($task_selected as $field){
                    $data .= '
                    <div class="current-task row">
                        <div class="col-md-3">
                            <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input taskChck" name="taskChck" value="'.$field->taskCode.'" id="taskChck'.$field->taskCode.'">
                            <label class="custom-control-label" for="taskChck'.$field->taskCode.'">'.$field->task_title.'</label>
                            </div>
                            <small><p>WBS: '.$field->task_desc.'</p></small>
                        </div>
                        <div class="col-md-3">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Task Weight" id="taskTxtFld'.$field->taskCode.'" name="taskTxtFld" class="form-control">
                               
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Planned # of days" id="planTxtFld'.$field->taskCode.'" name="planTxtFld" class="form-control">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Actual # of days" id="actualTxtFld'.$field->taskCode.'" name="actualTxtFld" class="form-control">
                                
                            </div>
                        </div>
                    </div>
                    ';
                }
            }else{
                $data .= '<em>All task already taken..</em>';
            }
            $data .= '
                <script>
                var checkE = function ($checkboxE) {
                    $("#taskTxtFld"+$checkboxE.val()).prop("readonly", !$checkboxE.is(":checked"));
                    $("#planTxtFld"+$checkboxE.val()).prop("readonly", !$checkboxE.is(":checked"));
                    $("#actualTxtFld"+$checkboxE.val()).prop("readonly", !$checkboxE.is(":checked"));
                    };
                
                    $("input[name=taskChck]").each(function () {
                    checkE($(this));
                    
                    $(this).on("change", function () {
                        checkE($(this));
                    });
                });
                </script>
                ';
        }
        echo $data;
    }

    public function project_update_val(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->proceed != "TRUE"){
            $messages = "Invalid Request";
            $error[] = $messages;
        }
        else if($request->code == ""){
            $messages = "Project Code is required!";
            $error[] = $messages;
        }
        else if($request->title == ""){
            $messages = "Title is required!";
            $error[] = $messages;
        }
        else if($request->desc == ""){
            $messages = "Description is required!";
            $error[] = $messages;
        }
        else if($request->addr == ""){
            $messages = "Address is required!";
            $error[] = $messages;
        }
        else if($request->target_man_days_edit == ""){
            $messages = "Man Day is required!";
            $error[] = $messages;
        }
        else if($request->lon == ""){
            $messages = "Longitude is required!";
            $error[] = $messages;
        }
        else if($request->lat == ""){
            $messages = "Latitude is required!";
            $error[] = $messages;
        }
        else if($request->stakeChck == ""){
            $messages = "Choose Stakeholder for this project!";
            $error[] = $messages;
        }
        else if($request->cusChck == ""){
            $messages = "Choose Customer for this project!";
            $error[] = $messages;
        }
        else if($request->pmChck == ""){
            $messages = "Choose Project Manger for this project!";
            $error[] = $messages;
        }
        else if($request->empChck == ""){
            $messages = "Choose Employee for this project!";
            $error[] = $messages;
        }
        else if($request->est_start_date == ""){
            $messages = "Estimated start date is required";
            $error[] = $messages;
        }
        else if($request->est_start_time == ""){
            $messages = "Estimated start time is required";
            $error[] = $messages;
        }
        else if($request->est_end_date == ""){
            $messages = "Estimated end date is required";
            $error[] = $messages;
        }
        else if($request->est_end_time == ""){
            $messages = "Estimated end time is required";
            $error[] = $messages;
        }
        else if($request->act_start_date == ""){
            $messages = "Actual start date is required";
            $error[] = $messages;
        }
        else if($request->act_start_time == ""){
            $messages = "Actual start time is required";
            $error[] = $messages;
        }
        else if($request->act_end_date == ""){
            $messages = "Actual end date is required";
            $error[] = $messages;
        }
        else if($request->act_end_time == ""){
            $messages = "Actual end time is required";
            $error[] = $messages;
        }
        else if($request->taskChck == ""){
            $messages = "Choose Task for this project!";
            $error[] = $messages;
        }
        else if($request->dataWeight == ""){
            $messages = "Please specify task weight";
            $error[] = $messages;
        }
        else if($request->dataWeightAttr == ""){
            $messages = "Invalid request of task weight";
            $error[] = $messages;
        }
        else if($request->dataPlan == ""){
            $messages = "Please specify Planned # of days";
            $error[] = $messages;
        }
        else if($request->dataPlanAttr == ""){
            $messages = "Invalid request of Planned # of days";
            $error[] = $messages;
        }
        else if($request->dataActual == ""){
            $messages = "Please specify Actual # of days";
            $error[] = $messages;
        }
        else if($request->dataActualAttr == ""){
            $messages = "Invalid request of Actual # of days";
            $error[] = $messages;
        }
        else if($request->resPercent != 100){
            $messages = "Please make sure task weight grand total is 100%";
            $error[] = $messages;
        }
        else{
            $messages = "Successfully Validated!";
            $success[] = $messages;
        }
        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function project_update(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->proceed == "TRUE" && $request->code != ""){

            //Estimated
            //Start Datetime
            $est_start_d = date('Y-m-d',strtotime("$request->est_start_date"));
            $est_start_t = date('H:i:s',strtotime("$request->est_start_time"));
            $est_start_dt = date('Y-m-d H:i:s', strtotime("$est_start_d $est_start_t"));

            //End Datetime
            $est_end_d = date('Y-m-d',strtotime("$request->est_end_date"));
            $est_end_t = date('H:i:s',strtotime("$request->est_end_time"));
            $est_end_dt = date('Y-m-d H:i:s', strtotime("$est_end_d $est_end_t"));

            //Actual
            //Start Datetime
            $act_start_d = date('Y-m-d',strtotime("$request->act_start_date"));
            $act_start_t = date('H:i:s',strtotime("$request->act_start_time"));
            $act_start_dt = date('Y-m-d H:i:s', strtotime("$act_start_d $act_start_t"));

            //End Datetime
            $act_end_d = date('Y-m-d',strtotime("$request->act_end_date"));
            $act_end_t = date('H:i:s',strtotime("$request->act_end_time"));
            $act_end_dt = date('Y-m-d H:i:s', strtotime("$act_end_d $act_end_t"));

            //Project Info Update
            DB::table('tbl_projectlist')
            ->where('proj_code', $request->code)
            ->update([
            'proj_title'=> $request->title,
            'proj_desc'=> $request->desc,
            'target_man_days'=> $request->target_man_days_edit,
            'est_start_date'=> $est_start_dt,
            'est_end_date'=> $est_end_dt,
            'act_start_date'=> $act_start_dt,
            'act_end_date'=> $act_end_dt,
            'longitude'=> $request->lon,
            'latitude'=> $request->lat,
            'location'=> $request->addr,
            // 'by_id'=> auth()->user()->id,
            // 'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);

            //Task
            DB::table('tbl_projtask')
            ->where('projCode', $request->code)
            ->update([
            'deleted'=> 1,
            // 'by_id'=> auth()->user()->id,
            // 'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);
            $myString = $request->taskChck;
            foreach($myString as $value){
                $ProjTask = new ProjTask;
                $ProjTask->projCode = $request->code;
                $ProjTask->taskCode = $value;
                $ProjTask->deleted = 0;
                $ProjTask->by_id = auth()->user()->id;
                $ProjTask->updated_by = auth()->user()->name;
                $ProjTask->created_at = now();
                $ProjTask->updated_at = now();
                $ProjTask->save();
            }

            $dataWeight = $request->dataWeight; 
            $dataWeightAttr = $request->dataWeightAttr; 

            foreach($dataWeightAttr as $keyWeight => $valueWeight){
                DB::table('tbl_projtask')
                ->where('taskCode', $valueWeight)
                ->where('projCode',$request->code)
                ->update([
                'taskWeight'=> $dataWeight[$keyWeight],
                // 'by_id'=> auth()->user()->id,
                // 'updated_by'=> auth()->user()->name,
                'updated_at' => now()
                ]);
            }


            $dataPlan = $request->dataPlan; 
            $dataPlanAttr = $request->dataPlanAttr; 

            foreach($dataPlanAttr as $keyPlan => $valuePlan){
                DB::table('tbl_projtask')
                ->where('taskCode', $valuePlan)
                ->where('projCode',$request->code)
                ->update([
                'plan_days'=> $dataPlan[$keyPlan],
                // 'by_id'=> auth()->user()->id,
                // 'updated_by'=> auth()->user()->name,
                'updated_at' => now()
                ]);
            }


            $dataActual = $request->dataActual; 
            $dataActualAttr = $request->dataActualAttr; 

            foreach($dataActualAttr as $keyActual => $valueActual){
                DB::table('tbl_projtask')
                ->where('taskCode', $valueActual)
                ->where('projCode',$request->code)
                ->update([
                'actual_days'=> $dataActual[$keyActual],
                // 'by_id'=> auth()->user()->id,
                // 'updated_by'=> auth()->user()->name,
                'updated_at' => now()
                ]);
            }

            //PM
            DB::table('tbl_emp_proj')
            ->where('projCode', $request->code)
            ->where('type', 'PM')
            ->update([
            'deleted'=> 1,
            // 'by_id'=> auth()->user()->id,
            // 'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);
            $myString2 = $request->pmChck;
            foreach($myString2 as $value2){
                $ProjPM = new EmpProj;
                $ProjPM->projCode = $request->code;
                $ProjPM->emp_id = $value2;
                $ProjPM->type = "PM";
                $ProjPM->deleted = 0;
                $ProjPM->by_id = auth()->user()->id;
                $ProjPM->updated_by = auth()->user()->name;
                $ProjPM->created_at = now();
                $ProjPM->updated_at = now();
                $ProjPM->save();
            }

            //EMP
            DB::table('tbl_emp_proj')
            ->where('projCode', $request->code)
            ->where('type', 'EMP')
            ->update([
            'deleted'=> 1,
            // 'by_id'=> auth()->user()->id,
            // 'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);
            $myString3 = $request->empChck;
            foreach($myString3 as $value3){
                $ProjEMP = new EmpProj;
                $ProjEMP->projCode = $request->code;
                $ProjEMP->emp_id = $value3;
                $ProjEMP->type = "EMP";
                $ProjEMP->deleted = 0;
                $ProjEMP->by_id = auth()->user()->id;
                $ProjEMP->updated_by = auth()->user()->name;
                $ProjEMP->created_at = now();
                $ProjEMP->updated_at = now();
                $ProjEMP->save();
            }

            //Stakeholder
            DB::table('tbl_emp_proj')
            ->where('projCode', $request->code)
            ->where('type', 'STAKEHOLDER')
            ->update([
            'deleted'=> 1,
            // 'by_id'=> auth()->user()->id,
            // 'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);
            $myString4 = $request->stakeChck;
            foreach($myString4 as $value4){
                $ProjSTAKE = new EmpProj;
                $ProjSTAKE->projCode = $request->code;
                $ProjSTAKE->emp_id = $value4;
                $ProjSTAKE->type = "STAKEHOLDER";
                $ProjSTAKE->deleted = 0;
                $ProjSTAKE->by_id = auth()->user()->id;
                $ProjSTAKE->updated_by = auth()->user()->name;
                $ProjSTAKE->created_at = now();
                $ProjSTAKE->updated_at = now();
                $ProjSTAKE->save();
            }


            //Customer
            DB::table('tbl_emp_proj')
            ->where('projCode', $request->code)
            ->where('type', 'CUSTOMER')
            ->update([
            'deleted'=> 1,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);
            $myString5 = $request->cusChck;
            foreach($myString5 as $value5){
                $ProjCUS = new EmpProj;
                $ProjCUS->projCode = $request->code;
                $ProjCUS->emp_id = $value5;
                $ProjCUS->type = "CUSTOMER";
                $ProjCUS->deleted = 0;
                $ProjCUS->by_id = auth()->user()->id;
                $ProjCUS->updated_by = auth()->user()->name;
                $ProjCUS->created_at = now();
                $ProjCUS->updated_at = now();
                $ProjCUS->save();
            }
            
            $messages = "Successfully Updated!";
            $success[] = $messages;
        }else{
            $messages = "Invalid Request!!";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );
        echo json_encode($output);
    }

    public function project_delete(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->proceed == "TRUE" && $request->code != ""){
            DB::table('tbl_projectlist')
            ->where('proj_code', $request->code)
            ->update([
            'deleted'=> 1,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);
            
            $messages = "Successfully Deleted!";
            $success[] = $messages;
        }else{
            $messages = "Invalid Request!!";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );
        echo json_encode($output);
    }

    public function project_import_excel(Request $request){
        $validator = Validator::make(
            [
                'file'      => $request->file,
                'extension' => strtolower($request->file->getClientOriginalExtension()),
            ],
            [
                'file'          => 'required|max:5000',
                'extension'      => 'required|in:,csv,xlsx,xls',
            ]
        );

        $modal = "active";
        $ttlTaskWeight = 0;
        if($validator->fails()){
            return redirect()
            ->back()
            ->with(['errors'=>$validator->errors()->all()])
            ->with('modal',$modal);
        }

        $dateTime = date('Ymd_His');
        $file = $request->file('file');
        $fileName = $dateTime . '-' . $file->getClientOriginalName();
        $savePath = public_path('/upload/projectlist/');
        $file->move($savePath, $fileName);

        $projCode = strtoupper(str_random(12));

        //Project Info
            $error = "";
            $success = "";
            $excel = Importer::make('Excel');
            $excel->hasHeader(true);
            $excel->load($savePath.$fileName);
            $excel->setSheet(1);
            $collection = $excel->getCollection();

            if(sizeof($collection[0]) == 8){
                $arr = json_decode($collection,true);
                
                if(count($arr) == 1){
                    $success = "TRUE";
                    $error = "FALSE";
                }else{
                    $success = "FALSE";
                    $error = "TRUE";
                }
            }else{
                $success = "FALSE";
                $error = "TRUE";
            }
        //Project Info

        //Project Employee
            $error1 = "";
            $success1 = "";
            $excel1 = Importer::make('Excel');
            $excel1->hasHeader(true);
            $excel1->load($savePath.$fileName);
            $excel1->setSheet(2);
            $collection1 = $excel1->getCollection();

            if(sizeof($collection1[0]) == 1){
                $arr1 = json_decode($collection1,true);
                
                if(count($arr1) > 0){
                    $success1 = "TRUE";
                    $error1 = "FALSE";
                }else{
                    $success1 = "FALSE";
                    $error1 = "TRUE";
                }
            }else{
                $success1 = "FALSE";
                $error1 = "TRUE";
            }
        //Project Employee

        //Project Stakeholder
            $error2 = "";
            $success2 = "";
            $excel2 = Importer::make('Excel');
            $excel2->hasHeader(true);
            $excel2->load($savePath.$fileName);
            $excel2->setSheet(3);
            $collection2 = $excel2->getCollection();

            if(sizeof($collection2[0]) == 1){
                $arr2 = json_decode($collection2,true);
                
                if(count($arr2) > 0){
                    $success2 = "TRUE";
                    $error2 = "FALSE";
                }else{
                    $success2 = "FALSE";
                    $error2 = "TRUE";
                }
            }else{
                $success2 = "FALSE";
                $error2 = "TRUE";
            }
        //Project Stakeholder

        //Project Manager
            $error3 = "";
            $success3 = "";
            $excel3 = Importer::make('Excel');
            $excel3->hasHeader(true);
            $excel3->load($savePath.$fileName);
            $excel3->setSheet(4);
            $collection3 = $excel3->getCollection();

            if(sizeof($collection3[0]) == 1){
                $arr3 = json_decode($collection3,true);
                
                if(count($arr3) > 0){
                    $success3 = "TRUE";
                    $error3 = "FALSE";
                }else{
                    $success3 = "FALSE";
                    $error3 = "TRUE";
                }
            }else{
                $success3 = "FALSE";
                $error3 = "TRUE";
            }
        //Project Manager

        //Task List
            $error4 = "";
            $success4 = "";
            $excel4 = Importer::make('Excel');
            $excel4->hasHeader(true);
            $excel4->load($savePath.$fileName);
            $excel4->setSheet(6);
            $collection4 = $excel4->getCollection();

            if(sizeof($collection4[0]) == 5){
                $arr4 = json_decode($collection4,true);
                
                if(count($arr4) > 0){
                    $success4 = "TRUE";
                    $error4 = "FALSE";
                    
                }else{
                    $success4 = "FALSE";
                    $error4 = "TRUE";
                }
            }else{
                $success4 = "FALSE";
                $error4 = "TRUE";
            }
        //Task List

        //Customer
            $error5 = "";
            $success5 = "";
            $excel5 = Importer::make('Excel');
            $excel5->hasHeader(true);
            $excel5->load($savePath.$fileName);
            $excel5->setSheet(5);
            $collection5 = $excel5->getCollection();

            if(sizeof($collection5[0]) == 1){
                $arr5 = json_decode($collection5,true);
                
                if(count($arr5) > 0){
                    $success5 = "TRUE";
                    $error5 = "FALSE";
                }else{
                    $success5 = "FALSE";
                    $error5 = "TRUE";
                }
            }else{
                $success5 = "FALSE";
                $error5 = "TRUE";
            }
        //Customer

        //Save Function
            if($success != "TRUE"){
                return redirect()
                ->back()
                ->with(['errors'=> [0=> 'Please provide correct format for Project Information Sheet']])
                ->with('modal',$modal);
            }
            else if($success1 != "TRUE"){
                return redirect()
                ->back()
                ->with(['errors'=> [0=> 'Please provide correct format for Project Employee Sheet']])
                ->with('modal',$modal);
            }
            else if($success2 != "TRUE"){
                return redirect()
                ->back()
                ->with(['errors'=> [0=> 'Please provide correct format for Project Stakeholder Sheet']])
                ->with('modal',$modal);
            }
            else if($success3 != "TRUE"){
                return redirect()
                ->back()
                ->with(['errors'=> [0=> 'Please provide correct format for Project Manager Sheet']])
                ->with('modal',$modal);
            }
            else if($success4 != "TRUE"){
                return redirect()
                ->back()
                ->with(['errors'=> [0=> 'Please provide correct format for Task List Sheet']])
                ->with('modal',$modal);
            }
            else if($success5 != "TRUE"){
                return redirect()
                ->back()
                ->with(['errors'=> [0=> 'Please provide correct format for Customer Sheet']])
                ->with('modal',$modal);
            }
            else
            {
                //Project List Validation
                foreach ($arr as $row) {
                    
                    $insert_data[] = array(
                        'proj_code'  => $projCode,
                        'proj_title'  => $row['project_title'],
                        'proj_desc'  => $row['project_description'],
                        'target_man_days'  => $row['target_man_days'],
                        'est_start_date'  =>  $row['estimated_start_date']['date'],
                        'est_end_date'  => $row['estimated_end_date']['date'],
                        'act_start_date'  =>  $row['actual_start_date']['date'],
                        'act_end_date'  =>  $row['actual_end_date']['date'],
                        'longitude'  =>  '121.33365260',
                        'latitude'  =>  '14.16964760',
                        'location'  =>  $row['project_location'],
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }
                $validatorSave = Validator::make(
                    $insert_data,
                    [
                        '*.proj_code' => "required",
                        '*.proj_title' => 'required',
                        '*.proj_desc' => 'required',
                        '*.target_man_days' => 'required',
                        '*.est_start_date' => 'required',
                        '*.est_end_date' => 'required',
                        '*.act_start_date' => 'required',
                        '*.act_end_date' => 'required',
                        '*.location' => 'required',
                    ]
                );
        
                //Employee Validation
                foreach ($arr1 as $row1) {
                    $insert_data1[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row1['company_id'],
                        'type'  =>  'EMP',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }
                $validatorSave1 = Validator::make(
                    $insert_data1,
                    [
                        '*.emp_id' => "required|exists:users,company_id",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Employee does not exists!',
                    ]
                );

                //Stakeholder Validation
                foreach ($arr2 as $row2) {
                    $insert_data2[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row2['stakeholder_member_code'],
                        'type'  =>  'STAKEHOLDER',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }
                $validatorSave2 = Validator::make(
                    $insert_data2,
                    [
                        '*.emp_id' => "required|exists:tbl_member,memberCode",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Stakeholder does not exists!',
                    ]
                );

                //Project Manager Validation
                foreach ($arr3 as $row3) {
                    $insert_data3[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row3['pm_member_code'],
                        'type'  =>  'PM',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }
                $validatorSave3 = Validator::make(
                    $insert_data3,
                    [
                        '*.emp_id' => "required|exists:users,company_id",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Project Manager does not exists!',
                    ]
                );
                
                //Task List & Project Task Validation
                foreach ($arr4 as $row4) {
                    $taskCode = strtoupper(str_random(12));
                    $insert_data4[] = array(
                        'taskCode'  =>  $taskCode,
                        'task_title'  => $row4['task_title'],
                        'task_desc'  =>  $row4['work_breakdown_structure'],
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );

                    $insert_data5[] = array(
                        'projCode'  =>  $projCode,
                        'taskCode'  => $taskCode,
                        'taskWeight'  =>  $row4['weight'],
                        'plan_days' =>  $row4['planned_days'],
                        'actual_days'  =>  $row4['actual_days'],
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );

                    $ttlTaskWeight += $row4['weight'];

                }
                $validatorSave6 = Validator::make(
                    $insert_data4,
                    [
                        '*.taskCode' => "required",
                        '*.task_title' => "required",
                        '*.task_desc' => "required",
                    ]
                );
                $validatorSave7 = Validator::make(
                    $insert_data5,
                    [
                        '*.projCode' => "required",
                        '*.taskCode' => "required",
                        '*.taskWeight' => "required",
                        '*.plan_days' => 'required',
                        '*.actual_days' => 'required',
                    ]
                );

                //Customer Validation
                foreach ($arr5 as $row5) {
                    $insert_data6[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row5['customer_id'],
                        'type'  =>  'CUSTOMER',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }
                $validatorSave5 = Validator::make(
                    $insert_data6,
                    [
                        '*.emp_id' => "required|exists:tbl_member,memberCode",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Customer does not exists!',
                    ]
                );
                

                if($validatorSave->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave1->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave1->errors()->all()])
                    ->with('modal',$modal);
                }
                
                if($validatorSave2->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave2->errors()->all()])
                    ->with('modal',$modal);
                }
                
                if($validatorSave3->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave3->errors()->all()])
                    ->with('modal',$modal);
                }
                
                if($validatorSave5->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave5->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave6->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave6->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave7->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave7->errors()->all()])
                    ->with('modal',$modal);
                }

                if($ttlTaskWeight != 100){
                    $errMsgTask = 'Total Task Weight must be exact 100% and you have '.$ttlTaskWeight.'%';
                    return redirect()
                    ->back()
                    ->with(['errors'=> [0=> $errMsgTask]])
                    ->with('modal',$modal);
                }

                DB::table('tbl_projectlist')->insert($insert_data);
                DB::table('tbl_emp_proj')->insert($insert_data1);
                DB::table('tbl_emp_proj')->insert($insert_data2);
                DB::table('tbl_emp_proj')->insert($insert_data3);
                DB::table('tbl_task')->insert($insert_data4);
                DB::table('tbl_projtask')->insert($insert_data5);
                DB::table('tbl_emp_proj')->insert($insert_data6);
            }
        //Save Function

        return redirect()->back()
        ->with(['success'=>'File uploaded successfully!'])
        ->with('modal',$modal);
        
    }

    public function project_import_excel_update(Request $request){
        $validator = Validator::make(
            [
                'file'      => $request->file,
                'extension' => strtolower($request->file->getClientOriginalExtension()),
            ],
            [
                'file'          => 'required|max:5000',
                'extension'      => 'required|in:,csv,xlsx,xls',
            ]
        );

        $modal = "active";
        $ttlTaskWeight = 0;
        if($validator->fails()){
            return redirect()
            ->back()
            ->with(['errors'=>$validator->errors()->all()])
            ->with('modal',$modal);
        }

        $dateTime = date('Ymd_His');
        $file = $request->file('file');
        $fileName = $dateTime . '-' . $file->getClientOriginalName();
        $savePath = public_path('/upload/projectlist/');
        $file->move($savePath, $fileName);


        //Project Info
            $error = "";
            $success = "";
            $excel = Importer::make('Excel');
            $excel->hasHeader(true);
            $excel->load($savePath.$fileName);
            $excel->setSheet(1);
            $collection = $excel->getCollection();

            if(sizeof($collection[0]) == 9){
                $arr = json_decode($collection,true);
                
                if(count($arr) == 1){
                    $success = "TRUE";
                    $error = "FALSE";
                }else{
                    $success = "FALSE";
                    $error = "TRUE";
                }
            }else{
                $success = "FALSE";
                $error = "TRUE";
            }
        //Project Info

        //Project Employee
            $error1 = "";
            $success1 = "";
            $excel1 = Importer::make('Excel');
            $excel1->hasHeader(true);
            $excel1->load($savePath.$fileName);
            $excel1->setSheet(2);
            $collection1 = $excel1->getCollection();

            if(sizeof($collection1[0]) == 1){
                $arr1 = json_decode($collection1,true);
                
                if(count($arr1) > 0){
                    $success1 = "TRUE";
                    $error1 = "FALSE";
                }else{
                    $success1 = "FALSE";
                    $error1 = "TRUE";
                }
            }else{
                $success1 = "FALSE";
                $error1 = "TRUE";
            }
        //Project Employee

        //Project Stakeholder
            $error2 = "";
            $success2 = "";
            $excel2 = Importer::make('Excel');
            $excel2->hasHeader(true);
            $excel2->load($savePath.$fileName);
            $excel2->setSheet(3);
            $collection2 = $excel2->getCollection();

            if(sizeof($collection2[0]) == 1){
                $arr2 = json_decode($collection2,true);
                
                if(count($arr2) > 0){
                    $success2 = "TRUE";
                    $error2 = "FALSE";
                }else{
                    $success2 = "FALSE";
                    $error2 = "TRUE";
                }
            }else{
                $success2 = "FALSE";
                $error2 = "TRUE";
            }
        //Project Stakeholder

        //Project Manager
            $error3 = "";
            $success3 = "";
            $excel3 = Importer::make('Excel');
            $excel3->hasHeader(true);
            $excel3->load($savePath.$fileName);
            $excel3->setSheet(4);
            $collection3 = $excel3->getCollection();

            if(sizeof($collection3[0]) == 1){
                $arr3 = json_decode($collection3,true);
                
                if(count($arr3) > 0){
                    $success3 = "TRUE";
                    $error3 = "FALSE";
                }else{
                    $success3 = "FALSE";
                    $error3 = "TRUE";
                }
            }else{
                $success3 = "FALSE";
                $error3 = "TRUE";
            }
        //Project Manager

        //Task List
            $success4 = "";
            $result4 = 0;
            $excel4 = Importer::make('Excel');
            $excel4->hasHeader(true);
            $excel4->load($savePath.$fileName);
            $excel4->setSheet(6);
            $collection4 = $excel4->getCollection();

            if(sizeof($collection4[0]) == 4){
                $arr4 = json_decode($collection4,true);
                
                if(count($arr4) > 0){
                    $success4 = "TRUE";
                    $error4 = "FALSE";
                }else{
                    $success4 = "FALSE";
                    $error4 = "TRUE";
                }
            }else{
                $success4 = "FALSE";
                $error4 = "TRUE";
            }
        //Task List

        //Customer
            $error5 = "";
            $success5 = "";
            $excel5 = Importer::make('Excel');
            $excel5->hasHeader(true);
            $excel5->load($savePath.$fileName);
            $excel5->setSheet(5);
            $collection5 = $excel5->getCollection();

            if(sizeof($collection5[0]) == 1){
                $arr5 = json_decode($collection5,true);
                
                if(count($arr5) > 0){
                    $success5 = "TRUE";
                    $error5 = "FALSE";
                }else{
                    $success5 = "FALSE";
                    $error5 = "TRUE";
                }
            }else{
                $success5 = "FALSE";
                $error5 = "TRUE";
            }
        //Customer

        //Save Function
            if($success != "TRUE"){
                return redirect()
                ->back()
                ->with(['errors'=> [0=> 'Please provide correct format for Project Information Sheet']])
                ->with('modal',$modal);
            }else{

                //Project Code Validations
                foreach ($arr as $rowValidate) {
                    $projCodeValidate = $rowValidate['proj_code'];
                    $validate_data[] = array(
                        'projCodeVal'  =>  $rowValidate['proj_code'],
                        'proj_title'  => $rowValidate['project_title'],
                        'proj_desc'  => $rowValidate['project_description'],
                        'target_man_days'  => $rowValidate['target_man_days'],
                        'est_start_date'  =>  $rowValidate['estimated_start_date']['date'],
                        'est_end_date'  => $rowValidate['estimated_end_date']['date'],
                        'act_start_date'  =>  $rowValidate['actual_start_date']['date'],
                        'act_end_date'  =>  $rowValidate['actual_end_date']['date'],
                        'longitude'  =>  '121.33365260',
                        'latitude'  =>  '14.16964760',
                        'location'  =>  $rowValidate['project_location'],
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }
                $validatorSave = Validator::make(
                    $validate_data,
                    [
                        '*.projCodeVal' => "required|exists:tbl_projectlist,proj_code",
                        '*.proj_title' => 'required',
                        '*.proj_desc' => 'required',
                        '*.target_man_days' => 'required',
                        '*.est_start_date' => 'required',
                        '*.est_end_date' => 'required',
                        '*.act_start_date' => 'required',
                        '*.act_end_date' => 'required',
                        '*.location' => 'required',
                    ],
                    [
                        '*.projCodeVal.exists' => 'The selected :attribute is invalid. Project Code does not exists!',
                    ]
                );


                //Employee Validations
                foreach ($arr1 as $rowValidate1) {
                    $validate_data1[] = array(
                        'emp_id'  =>  $rowValidate1['company_id'],
                        'type'  =>  'EMP',
                    );
                }
                $validatorSave1 = Validator::make(
                    $validate_data1,
                    [
                        '*.emp_id' => "required|exists:users,company_id",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Employee does not exists!',
                    ]
                );

                //Stakeholder Validations
                foreach ($arr2 as $rowValidate2) {
                    $validate_data2[] = array(
                        'emp_id'  =>  $rowValidate2['stakeholder_member_code'],
                        'type'  =>  'STAKEHOLDER',
                    );
                }
                $validatorSave2 = Validator::make(
                    $validate_data2,
                    [
                        '*.emp_id' => "required|exists:tbl_member,memberCode",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Stakeholder does not exists!',
                    ]
                );

                //Project Manager Validations
                foreach ($arr3 as $rowValidate3) {
                    $validate_data3[] = array(
                        'emp_id'  =>  $rowValidate3['pm_member_code'],
                        'type'  =>  'PM',
                    );
                }
                $validatorSave3 = Validator::make(
                    $validate_data3,
                    [
                        '*.emp_id' => "required|exists:users,company_id",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Project Manager does not exists!',
                    ]
                );



                //Task Code Validations
                foreach ($arr4 as $rowValidate4) {
                    
                    $validate_data4[] = array(
                        'projCode'  =>  $projCodeValidate,
                        'taskCode'  =>   $rowValidate4['task_code'],
                        'taskWeight'  =>  $rowValidate4['weight'],
                        'plan_days' =>  $rowValidate4['planned_days'],
                        'actual_days'  =>  $rowValidate4['actual_days'],
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );

                    $ttlTaskWeight += $rowValidate4['weight'];
                }
                $validatorSave4 = Validator::make(
                    $validate_data4,
                    [
                        '*.projCode' => "required",
                        '*.taskCode' => "required|exists:tbl_projtask,taskCode",
                        '*.taskWeight' => "required",
                        '*.plan_days' => "required",
                        '*.actual_days' => "required",
                    ],
                    [
                        '*.taskCode.exists' => 'The selected :attribute is invalid. Task Code does not exists!',
                    ]
                );


                //Customer Validations
                foreach ($arr5 as $rowValidate5) {
                    $validate_data5[] = array(
                        'emp_id'  =>  $rowValidate5['customer_id'],
                        'type'  =>  'CUSTOMER',
                    );
                }
                $validatorSave5 = Validator::make(
                    $validate_data5,
                    [
                        '*.emp_id' => "required|exists:tbl_member,memberCode",
                    ],
                    [
                        '*.emp_id.exists' => 'The selected :attribute is invalid. Customer does not exists!',
                    ]
                );


                if($validatorSave->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave1->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave1->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave2->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave2->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave3->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave3->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave4->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave4->errors()->all()])
                    ->with('modal',$modal);
                }

                if($validatorSave5->fails()){
                    return redirect()
                    ->back()
                    ->with(['errors'=>$validatorSave5->errors()->all()])
                    ->with('modal',$modal);
                }

                if($ttlTaskWeight != 100){
                    $errMsgTask = 'Total Task Weight must be exact 100% and you have '.$ttlTaskWeight.'%';
                    return redirect()
                    ->back()
                    ->with(['errors'=> [0=> $errMsgTask]])
                    ->with('modal',$modal);
                }


                //Update Project Info
                foreach ($arr as $row) {
                    $projCode = $row['proj_code'];

                    DB::table('tbl_projectlist')
                    ->where('proj_code', $projCode)
                    ->update([
                        'proj_title'  => $row['project_title'],
                        'proj_desc'  => $row['project_description'],
                        'est_start_date'  =>  $row['estimated_start_date']['date'],
                        'est_end_date'  => $row['estimated_end_date']['date'],
                        'act_start_date'  =>  $row['actual_start_date']['date'],
                        'act_end_date'  =>  $row['actual_end_date']['date'],
                        'longitude'  =>  '121.33365260',
                        'latitude'  =>  '14.16964760',
                        'location'  =>  $row['project_location'],
                        'updated_at'    => now(),
                    ]);
                }

                foreach ($arr1 as $row1) {
                    DB::table('tbl_emp_proj')
                    ->where('projCode', $projCode)
                    ->where('type', 'EMP')
                    ->update([
                        'deleted'   => 1,
                        'updated_at'    => now(),
                    ]);

                    $insert_data1[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row1['company_id'],
                        'type'  =>  'EMP',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }

                foreach ($arr2 as $row2) {
                    DB::table('tbl_emp_proj')
                    ->where('projCode', $projCode)
                    ->where('type', 'STAKEHOLDER')
                    ->update([
                        'deleted'   => 1,
                        'updated_at'    => now(),
                    ]);

                    $insert_data2[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row2['stakeholder_member_code'],
                        'type'  =>  'STAKEHOLDER',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }

                foreach ($arr3 as $row3) {

                    DB::table('tbl_emp_proj')
                    ->where('projCode', $projCode)
                    ->where('type', 'PM')
                    ->update([
                        'deleted'   => 1,
                        'updated_at'    => now(),
                    ]);

                    $insert_data3[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row3['pm_member_code'],
                        'type'  =>  'PM',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }

                foreach ($arr4 as $row4) {
                    
                    DB::table('tbl_projtask')
                    ->where('projCode', $projCode)
                    ->update([
                        'deleted'   => 1,
                        'updated_at'    => now(),
                    ]);

                    $insert_data4[] = array(
                        'projCode'  =>  $projCode,
                        'taskCode'  =>   $row4['task_code'],
                        'taskWeight'  =>  $row4['weight'],
                        'plan_days' =>  $row4['planned_days'],
                        'actual_days'  =>  $row4['actual_days'],
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }

                foreach ($arr5 as $row5) {
                    DB::table('tbl_emp_proj')
                    ->where('projCode', $projCode)
                    ->where('type', 'CUSTOMER')
                    ->update([
                        'deleted'   => 1,
                        'updated_at'    => now(),
                    ]);

                    $insert_data3[] = array(
                        'projCode'  =>  $projCode,
                        'emp_id'  =>  $row5['customer_id'],
                        'type'  =>  'CUSTOMER',
                        'deleted'  =>  0,
                        'by_id'  => auth()->user()->id,
                        'updated_by'    =>  auth()->user()->name,
                        'created_at'    =>  now(),
                        'updated_at'    => now(),
                    );
                }


                DB::table('tbl_emp_proj')->insert($insert_data1);
                DB::table('tbl_emp_proj')->insert($insert_data2);
                DB::table('tbl_emp_proj')->insert($insert_data3);
                DB::table('tbl_projtask')->insert($insert_data4);
            }
        //Save Function

        return redirect()->back()
        ->with(['success'=>'File uploaded successfully!'])
        ->with('modal',$modal);
    }

    public function assignproject(){
        // if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
        if(!empty(auth()->user()->id)){
            return view('main.assignproject');
        }else{
            return redirect('/');
        }
    }

    public function retrack_task(){
        // if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
        if(!empty(auth()->user()->id)){
            $task = DB::connection('mysql')->select("SELECT * from tbl_task WHERE deleted = 1 ORDER BY created_at DESC");
            
            $manage_retrack_task = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 2)
            ->orderBy('created_at','desc')
            ->get();

            if($manage_retrack_task[0]->no_access_data == 0){
                return view('main.retracktask', compact('task','manage_retrack_task'));
            }else{
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function retrack_project(){
        // if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
        if(!empty(auth()->user()->id)){

            $project_record = ProjectPercentage::where('deleted', 1)
            ->orderBy('created_at','desc')
            ->get();

            $manage_retrack_proj = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 3)
            ->orderBy('created_at','desc')
            ->get();
            
            if($manage_retrack_proj[0]->no_access_data == 0)
            {
                return view('main.retrackprojectlist', compact('project_record','manage_retrack_proj'));
            }
            else
            {
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function retrack_member(){
        if(!empty(auth()->user()->id)){
            $member_record = Member::where('deleted', 1)
            ->orderBy('created_at','desc')
            ->get();

            $manage_retrack_mem = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 4)
            ->orderBy('created_at','desc')
            ->get();
            
            if($manage_retrack_mem[0]->no_access_data == 0)
            {
                return view('main.retrackmember', compact('member_record','manage_retrack_mem'));
            }
            else
            {
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function retrack_web_users(){
        if(!empty(auth()->user()->id)){
            if(auth()->user()->is_admin == 2){
                $user_records_web = ViewUsers::where('deleted', 1)
                ->where('account_type','WEB')
                // ->where('is_admin','1')
                ->where('company_id', '<>', auth()->user()->company_id)
                ->orderBy('created_at','desc')
                ->get();
            }else{
                $user_records_web = ViewUsers::where('deleted', 1)
                ->where('account_type','WEB')
                ->where('is_admin','1')
                ->where('company_id', '<>', auth()->user()->company_id)
                ->orderBy('created_at','desc')
                ->get();
            }


            $manage_retrack_um = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 5)
            ->orderBy('created_at','desc')
            ->get();
            
            if($manage_retrack_um[0]->no_access_data == 0)
            {
                return view('main.retrackusermanagement', compact('user_records_web','manage_retrack_um'));
            }
            else
            {
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function retrack(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type == "retrack_task" && $request->code != ""){
            $task = DB::connection('mysql')->select("SELECT * from tbl_task WHERE taskCode = '".$request->code."' ORDER BY created_at DESC");
        
            DB::table('tbl_task')
            ->where('taskCode', $request->code)
            ->update([
            'deleted'=> 0,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);

            $request->session()->put('successRetrack',"Successfully Retracked!");
            $request->session()->put('titleRetrack',$task[0]->task_title);
            $request->session()->put('descRetrack',$task[0]->task_desc);
            $request->session()->put('codeRetrack',$request->code);

            $messages = "Successfully Reactivated!";
            $success[] = $messages;
        }
        else if($request->type == "retrack_project" && $request->code != ""){
            $proj = DB::connection('mysql')->select("SELECT * from tbl_projectlist WHERE proj_code = '".$request->code."' ORDER BY created_at DESC");
        
            DB::table('tbl_projectlist')
            ->where('proj_code', $request->code)
            ->update([
            'deleted'=> 0,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);

            $request->session()->put('successRetrack',"Successfully Retracked!");
            $request->session()->put('titleRetrack',$proj[0]->proj_title);
            $request->session()->put('descRetrack',$proj[0]->proj_desc);
            $request->session()->put('codeRetrack',$request->code);

            $messages = "Successfully Reactivated!";
            $success[] = $messages;
        }
        else if($request->type == "retrack_member" && $request->code != ""){
            $mem = DB::connection('mysql')->select("SELECT * from tbl_member WHERE memberCode = '".$request->code."'");
        
            DB::table('tbl_member')
            ->where('memberCode', $request->code)
            ->update([
            'deleted'=> 0,
            'updated_at' => now()
            ]);

            $request->session()->put('successRetrackMem',"Successfully Member Retracked!");
            $request->session()->put('RetrackMemName',$mem[0]->member_name);
            $request->session()->put('RetrackMemEmail',$mem[0]->member_email);
            $request->session()->put('RetrackMemContact',$mem[0]->member_contact_no);
            $request->session()->put('RetrackMemType',$mem[0]->member_type);
            $request->session()->put('RetrackMemPosition',$mem[0]->member_position);
            $request->session()->put('RetrackMemCode',$request->code);

            $messages = "Successfully Reactivated!";
            $success[] = $messages;
        }
        else if($request->type == "retrack_web_user" && $request->code != ""){
            $users = DB::connection('mysql')->select("SELECT * from users WHERE company_id = '".$request->code."'");
        
            DB::table('users')
            ->where('company_id', $request->code)
            ->update([
            'deleted'=> 0,
            'updated_at' => now()
            ]);

            $request->session()->put('successRetrackUser',"Successfully User Retracked!");
            $request->session()->put('RetrackUserName',$users[0]->name);
            $request->session()->put('RetrackUserEmail',$users[0]->email);
            $request->session()->put('RetrackUserType',$users[0]->is_admin);
            $request->session()->put('RetrackUserCode',$request->code);

            $messages = "Successfully Retracked!";
            $success[] = $messages;
        }
        else{
            $messages = "Invalid request!";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );
        echo json_encode($output);
    }
    
    public function member(){
        if(!empty(auth()->user()->id)){
            $member_record = Member::where('deleted', 0)
            ->orderBy('created_at','desc')
            ->get();

            $manage_user_mem = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 4)
            ->orderBy('created_at','desc')
            ->get();

            if($manage_user_mem[0]->no_access_data == 0){
                return view('main.member', compact('member_record','manage_user_mem'));
            }else{
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function val_new_member(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type == "NEW_MEMBER" || $request->type == "EDIT_MEMBER" || $request->type == "DELETE_MEMBER")
        {
            if($request->name == ""){
                $messages = "Name is required!";
                $error[] = $messages;
            }
            else if($request->email == ""){
                $messages = "Email is required!";
                $error[] = $messages;
            }
            else if($request->contact == ""){
                $messages = "Contact is required!";
                $error[] = $messages;
            }
            else if($request->position == "" && $request->type != "DELETE_MEMBER"){
                $messages = "Position is required!";
                $error[] = $messages;
            }
            else if($request->addr == ""){
                $messages = "Address is required!";
                $error[] = $messages;
            }
            else if($request->cat == ""){
                $messages = "Select your category";
                $error[] = $messages;
            }
            else if($request->type == "EDIT_MEMBER" && $request->code == ""){
                $messages = "Member Code is required!";
                $error[] = $messages;
            }
            else if($request->type == "DELETE_MEMBER" && $request->code == ""){
                $messages = "Member Code is required!";
                $error[] = $messages;
            }
            else{
                $messages = "Successfully Saved!";
                $success[] = $messages;
            }

            
        }
        else{
            $messages = "Invalid request...";
            $error[] = $messages;
        }
        

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function new_member(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();
        if($request->type == "NEW_MEMBER"){
            $memCode = date("Y")."-".strtoupper(str_random(8));
            $member = new Member;
            $member->memberCode = $memCode;
            $member->member_name = $request->name;
            $member->member_email = $request->email;
            $member->member_contact_no = $request->contact;
            $member->member_position = $request->position;
            $member->member_address = $request->addr;
            $member->member_type = $request->cat;
            $member->deleted = 0;
            $member->by_id = auth()->user()->id;
            $member->updated_by = auth()->user()->name;
            $member->created_at = now();
            $member->updated_at = now();
            $member->save();

            $request->session()->put('successMem',"Successfully Saved!");
            $request->session()->put('memCode',$memCode);
            $request->session()->put('memName',$request->name);
            $request->session()->put('memEmail',$request->email);
            $request->session()->put('memContact',$request->contact);
            $request->session()->put('memAddr',$request->addr);
            $request->session()->put('memCat',$request->cat);

            $messages = "Successfully Saved!";
            $success[] = $messages;
        }
        else if($request->type == "EDIT_MEMBER"){
            DB::table('tbl_member')
                ->where('memberCode', $request->code)
                ->update([
                'member_name'  =>  $request->name,
                'member_email'  =>  $request->email,
                'member_contact_no'  =>  $request->contact,
                'member_position'  =>  $request->position,
                'member_address'  =>  $request->addr,
                'member_type'  =>  $request->cat,
                'deleted'=> 0,
                'updated_at' => now()
            ]);

            $request->session()->put('successMem',"Successfully Updated!");
            $request->session()->put('memCode',$request->code);
            $request->session()->put('memName',$request->name);
            $request->session()->put('memEmail',$request->email);
            $request->session()->put('memContact',$request->contact);
            $request->session()->put('memAddr',$request->addr);
            $request->session()->put('memCat',$request->cat);

            $messages = "Successfully Updated!";
            $success[] = $messages;
        }
        else if($request->type == "DELETE_MEMBER"){
            DB::table('tbl_member')
            ->where('memberCode', $request->code)
            ->update([
            'deleted'=> 1,
            'updated_at' => now()
            ]);

            $request->session()->put('deleteMem',"Successfully Deleted!");
            $request->session()->put('memCode',$request->code);
            $request->session()->put('memName',$request->name);
            $request->session()->put('memEmail',$request->email);
            $request->session()->put('memContact',$request->contact);
            $request->session()->put('memAddr',$request->addr);
            $request->session()->put('memCat',$request->cat);

            $messages = "Successfully Deleted!";
            $success[] = $messages;
        }
        else{
            $messages = "Invalid request...";
            $error[] = $messages;
        }
        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }
    
    public function user_management(){
        if(!empty(auth()->user()->id)){

            $manage_access_list = ManageAccessList::where('deleted', 0)->get();

            if(auth()->user()->is_admin == 2){
                $user_records_web = ViewUsers::where('deleted', 0)
                ->where('account_type','WEB')
                ->where('company_id', '<>', auth()->user()->company_id)
                ->orderBy('created_at','desc')
                ->get();
            }
            else{
                $user_records_web = ViewUsers::where('deleted', 0)
                ->where('account_type','WEB')
                ->where('is_admin','1')
                ->where('company_id', '<>', auth()->user()->company_id)
                ->orderBy('created_at','desc')
                ->get();
            }
            
            $manage_user_um = ManageAccessRecords::where('company_id', auth()->user()->company_id)
            ->where('access_id', 5)
            ->orderBy('created_at','desc')
            ->get();
            
            if($manage_user_um[0]->no_access_data == 0)
            {
                return view('main.usermanagement', compact('user_records_web','manage_access_list','manage_user_um'));
            }
            else
            {
                abort(404);
            }
        }else{
            return redirect('/');
        }
    }

    public function web_user_val(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type == "NEW_USER"){
            if($request->name == ""){
                $messages = "Name is required!";
                $error[] = $messages;
            }
            else if($request->email == ""){
                $messages = "Email is required!";
                $error[] = $messages;
            }
            else if($request->newPass == ""){
                $messages = "New Password is required!";
                $error[] = $messages;
            }
            else if($request->confirmPass == ""){
                $messages = "Confirm Password is required!";
                $error[] = $messages;
            }
            else if($request->newPass != $request->confirmPass){
                $messages = "Password didn't matched! Please try again";
                $error[] = $messages;
            }
            else if($request->isAdmin == ""){
                $messages = "Select User Type";
                $error[] = $messages;
            }
            else if($request->select2 == ""){
                $messages = "Task List Access Righ is required!";
                $error[] = $messages;
            }
            else if($request->select3 == ""){
                $messages = "Project List Access Righ is required!";
                $error[] = $messages;
            }
            else if($request->select4 == ""){
                $messages = "Member Records Access Right is required!";
                $error[] = $messages;
            }
            else if($request->select4 == ""){
                $messages = "User Management Access Right is required!";
                $error[] = $messages;
            }
            
            else{
                if($request->select2 == "CONFIG" && $request->tasklist == ""){
                    $messages = "Task List Access Right is required!";
                    $error[] = $messages;
                }
                else if($request->select3 == "CONFIG" && $request->projectlist == ""){
                    $messages = "Project List Access Right is required!";
                    $error[] = $messages;
                }
                else if($request->select4 == "CONFIG" && $request->memberrecords == ""){
                    $messages = "Member Records Access Right is required!";
                    $error[] = $messages;
                }
                else if($request->select5 == "CONFIG" && $request->usermanagement == ""){
                    $messages = "User Management Access Right is required!";
                    $error[] = $messages;
                }
                else{
                    $messages = "Sucessfully Validated!";
                    $success[] = $messages;
                }
            }
        }
        else if($request->type == "EDIT_USER"){

            $user_records = ViewUsers::where('company_id', auth()->user()->company_id)->get();

            if($request->name == ""){
                $messages = "Name is required!";
                $error[] = $messages;
            }
            else if($request->email == ""){
                $messages = "Email is required!";
                $error[] = $messages;
            }
            else if($request->isAdmin == ""){
                $messages = "Select User Type";
                $error[] = $messages;
            }
            else if($request->curPass == ""){
                $messages = "Current Password is required!";
                $error[] = $messages;
            }
            else if($request->newPass != "" || $request->confirmPass != ""){
                if($request->newPass == ""){
                    $messages = "New Password is required!";
                    $error[] = $messages;
                }
                else if($request->confirmPass == ""){
                    $messages = "Confirm Password is required!";
                    $error[] = $messages;
                }
                else if($request->newPass != $request->confirmPass){
                    $messages = "Password didn't matched! Please try again";
                    $error[] = $messages;
                }
                else{
                    if(Hash::check($request->curPass, $user_records[0]->password)){
                        $messages = "Successfully Updated!";
                        $success[] = $messages;
                    }else{
                        $messages = "Your current password is incorrect!";
                        $error[] = $messages;
                    }
                }
            }else{
                if(Hash::check($request->curPass, $user_records[0]->password)){
                    $messages = "Successfully Updated!";
                    $success[] = $messages;
                }else{
                    $messages = "Your current password is incorrect!";
                    $error[] = $messages;
                }
            }
            
        }
        else if($request->type == "DELETE_USER"){
            if($request->code == ""){
                $messages = "User Code is required!";
                $error[] = $messages;
            }
            else if($request->name == ""){
                $messages = "Name is required!";
                $error[] = $messages;
            }
            else if($request->email == ""){
                $messages = "Email is required!";
                $error[] = $messages;
            }
            else{
                $messages = "Sucessfully Validated!";
                $success[] = $messages;
            }
        }
        else{
            $messages = "Invalid request...";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function web_user(Request $request){
        $message = "";
        $userType = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type == "NEW_USER"){
            if($request->isAdmin == 1){
                $userType = "Admin";
            }else{
                $userType = "Super Admin";
            }

            $userCode = date("Y")."-".strtoupper(str_random(8));
            $user_record = new UserAccount;
            $user_record->company_id = $userCode;
            $user_record->name = $request->name;
            $user_record->email = $request->email;
            $user_record->password = Hash::make($request->newPass);
            $user_record->deleted = 0;
            $user_record->is_admin = $request->isAdmin;
            $user_record->account_type = "WEB";
            $user_record->created_by = auth()->user()->company_id;
            $user_record->created_at = now();
            $user_record->updated_at = now();
            $user_record->save();

            //Dashboard
                // $ManageAccessDashboard = new ManageAccessRecords;
                // $ManageAccessDashboard->access_id = 1;
                // $ManageAccessDashboard->company_id = $userCode;
                
                // if($request->select1 == "ALL"){
                //     $ManageAccessDashboard->read_data = 0;
                //     $ManageAccessDashboard->full_access_data = 1;
                //     $ManageAccessDashboard->no_access_data = 0;
                //     $ManageAccessDashboard->custom_data = 0;
                //     $ManageAccessDashboard->add_data = 0;
                //     $ManageAccessDashboard->edit_data = 0;
                //     $ManageAccessDashboard->delete_data = 0;
                //     $ManageAccessDashboard->retrack_data = 0;
                // }
                // else if($request->select1 == "NO"){
                //     $ManageAccessDashboard->read_data = 0;
                //     $ManageAccessDashboard->full_access_data = 0;
                //     $ManageAccessDashboard->no_access_data = 1;
                //     $ManageAccessDashboard->custom_data = 0;
                //     $ManageAccessDashboard->add_data = 0;
                //     $ManageAccessDashboard->edit_data = 0;
                //     $ManageAccessDashboard->delete_data = 0;
                //     $ManageAccessDashboard->retrack_data = 0;
                // }
                // else if($request->select1 == "READ"){
                //     $ManageAccessDashboard->read_data = 1;
                //     $ManageAccessDashboard->full_access_data = 0;
                //     $ManageAccessDashboard->no_access_data = 0;
                //     $ManageAccessDashboard->custom_data = 0;
                //     $ManageAccessDashboard->add_data = 0;
                //     $ManageAccessDashboard->edit_data = 0;
                //     $ManageAccessDashboard->delete_data = 0;
                //     $ManageAccessDashboard->retrack_data = 0;
                // }
                // else if($request->select1 == "CONFIG"){
                //     $ManageAccessDashboard->read_data = 0;
                //     $ManageAccessDashboard->full_access_data = 0;
                //     $ManageAccessDashboard->no_access_data = 0;
                //     $ManageAccessDashboard->custom_data = 1;

                //     if(in_array('ADD', $request->dashboard, true)){
                //         $ManageAccessDashboard->add_data = 1;
                //     }else{
                //         $ManageAccessDashboard->add_data = 0;
                //     }

                //     if(in_array('EDIT', $request->dashboard, true)){
                //         $ManageAccessDashboard->edit_data = 1;
                //     }else{
                //         $ManageAccessDashboard->edit_data = 0;
                //     }

                //     if(in_array('REMOVE', $request->dashboard, true)){
                //         $ManageAccessDashboard->delete_data = 1;
                //     }else{
                //         $ManageAccessDashboard->delete_data = 0;
                //     }

                //     if(in_array('RETRACK', $request->dashboard, true)){
                //         $ManageAccessDashboard->retrack_data = 1;
                //     }else{
                //         $ManageAccessDashboard->retrack_data = 0;
                //     }
                // }

                // $ManageAccessDashboard->deleted = 0;
                // $ManageAccessDashboard->by_id = auth()->user()->company_id;
                // $ManageAccessDashboard->created_at = now();
                // $ManageAccessDashboard->updated_at = now();
                // $ManageAccessDashboard->save();
            //Dashboard

            //Task List
                $ManageAccessTask = new ManageAccessRecords;
                $ManageAccessTask->access_id = 2;
                $ManageAccessTask->company_id = $userCode;
                
                if($request->select2 == "ALL"){
                    $ManageAccessTask->read_data = 0;
                    $ManageAccessTask->full_access_data = 1;
                    $ManageAccessTask->no_access_data = 0;
                    $ManageAccessTask->custom_data = 0;
                    $ManageAccessTask->add_data = 0;
                    $ManageAccessTask->edit_data = 0;
                    $ManageAccessTask->delete_data = 0;
                    $ManageAccessTask->retrack_data = 0;
                }
                else if($request->select2 == "NO"){
                    $ManageAccessTask->read_data = 0;
                    $ManageAccessTask->full_access_data = 0;
                    $ManageAccessTask->no_access_data = 1;
                    $ManageAccessTask->custom_data = 0;
                    $ManageAccessTask->add_data = 0;
                    $ManageAccessTask->edit_data = 0;
                    $ManageAccessTask->delete_data = 0;
                    $ManageAccessTask->retrack_data = 0;
                }
                else if($request->select2 == "READ"){
                    $ManageAccessTask->read_data = 1;
                    $ManageAccessTask->full_access_data = 0;
                    $ManageAccessTask->no_access_data = 0;
                    $ManageAccessTask->custom_data = 0;
                    $ManageAccessTask->add_data = 0;
                    $ManageAccessTask->edit_data = 0;
                    $ManageAccessTask->delete_data = 0;
                    $ManageAccessTask->retrack_data = 0;
                }
                else if($request->select2 == "CONFIG"){
                    $ManageAccessTask->read_data = 0;
                    $ManageAccessTask->full_access_data = 0;
                    $ManageAccessTask->no_access_data = 0;
                    $ManageAccessTask->custom_data = 1;

                    if(in_array('ADD', $request->tasklist, true)){
                        $ManageAccessTask->add_data = 1;
                    }else{
                        $ManageAccessTask->add_data = 0;
                    }

                    if(in_array('EDIT', $request->tasklist, true)){
                        $ManageAccessTask->edit_data = 1;
                    }else{
                        $ManageAccessTask->edit_data = 0;
                    }

                    if(in_array('REMOVE', $request->tasklist, true)){
                        $ManageAccessTask->delete_data = 1;
                    }else{
                        $ManageAccessTask->delete_data = 0;
                    }

                    if(in_array('RETRACK', $request->tasklist, true)){
                        $ManageAccessTask->retrack_data = 1;
                    }else{
                        $ManageAccessTask->retrack_data = 0;
                    }
                }

                $ManageAccessTask->deleted = 0;
                $ManageAccessTask->by_id = auth()->user()->company_id;
                $ManageAccessTask->created_at = now();
                $ManageAccessTask->updated_at = now();
                $ManageAccessTask->save();
            //Task

            //Project
                $ManageAccessProject = new ManageAccessRecords;
                $ManageAccessProject->access_id = 3;
                $ManageAccessProject->company_id = $userCode;
                
                if($request->select3 == "ALL"){
                    $ManageAccessProject->read_data = 0;
                    $ManageAccessProject->full_access_data = 1;
                    $ManageAccessProject->no_access_data = 0;
                    $ManageAccessProject->custom_data = 0;
                    $ManageAccessProject->add_data = 0;
                    $ManageAccessProject->edit_data = 0;
                    $ManageAccessProject->delete_data = 0;
                    $ManageAccessProject->retrack_data = 0;
                }
                else if($request->select3 == "NO"){
                    $ManageAccessProject->read_data = 0;
                    $ManageAccessProject->full_access_data = 0;
                    $ManageAccessProject->no_access_data = 1;
                    $ManageAccessProject->custom_data = 0;
                    $ManageAccessProject->add_data = 0;
                    $ManageAccessProject->edit_data = 0;
                    $ManageAccessProject->delete_data = 0;
                    $ManageAccessProject->retrack_data = 0;
                }
                else if($request->select3 == "READ"){
                    $ManageAccessProject->read_data = 1;
                    $ManageAccessProject->full_access_data = 0;
                    $ManageAccessProject->no_access_data = 0;
                    $ManageAccessProject->custom_data = 0;
                    $ManageAccessProject->add_data = 0;
                    $ManageAccessProject->edit_data = 0;
                    $ManageAccessProject->delete_data = 0;
                    $ManageAccessProject->retrack_data = 0;
                }
                else if($request->select3 == "CONFIG"){
                    $ManageAccessProject->read_data = 0;
                    $ManageAccessProject->full_access_data = 0;
                    $ManageAccessProject->no_access_data = 0;
                    $ManageAccessProject->custom_data = 1;

                    if(in_array('ADD', $request->projectlist, true)){
                        $ManageAccessProject->add_data = 1;
                    }else{
                        $ManageAccessProject->add_data = 0;
                    }

                    if(in_array('EDIT', $request->projectlist, true)){
                        $ManageAccessProject->edit_data = 1;
                    }else{
                        $ManageAccessProject->edit_data = 0;
                    }

                    if(in_array('REMOVE', $request->projectlist, true)){
                        $ManageAccessProject->delete_data = 1;
                    }else{
                        $ManageAccessProject->delete_data = 0;
                    }

                    if(in_array('RETRACK', $request->projectlist, true)){
                        $ManageAccessProject->retrack_data = 1;
                    }else{
                        $ManageAccessProject->retrack_data = 0;
                    }
                }

                $ManageAccessProject->deleted = 0;
                $ManageAccessProject->by_id = auth()->user()->company_id;
                $ManageAccessProject->created_at = now();
                $ManageAccessProject->updated_at = now();
                $ManageAccessProject->save();
            //Project

            //Member
                $ManageAccessMember = new ManageAccessRecords;
                $ManageAccessMember->access_id = 4;
                $ManageAccessMember->company_id = $userCode;
                
                if($request->select4 == "ALL"){
                    $ManageAccessMember->read_data = 0;
                    $ManageAccessMember->full_access_data = 1;
                    $ManageAccessMember->no_access_data = 0;
                    $ManageAccessMember->custom_data = 0;
                    $ManageAccessMember->add_data = 0;
                    $ManageAccessMember->edit_data = 0;
                    $ManageAccessMember->delete_data = 0;
                    $ManageAccessMember->retrack_data = 0;
                }
                else if($request->select4 == "NO"){
                    $ManageAccessMember->read_data = 0;
                    $ManageAccessMember->full_access_data = 0;
                    $ManageAccessMember->no_access_data = 1;
                    $ManageAccessMember->custom_data = 0;
                    $ManageAccessMember->add_data = 0;
                    $ManageAccessMember->edit_data = 0;
                    $ManageAccessMember->delete_data = 0;
                    $ManageAccessMember->retrack_data = 0;
                }
                else if($request->select4 == "READ"){
                    $ManageAccessMember->read_data = 1;
                    $ManageAccessMember->full_access_data = 0;
                    $ManageAccessMember->no_access_data = 0;
                    $ManageAccessMember->custom_data = 0;
                    $ManageAccessMember->add_data = 0;
                    $ManageAccessMember->edit_data = 0;
                    $ManageAccessMember->delete_data = 0;
                    $ManageAccessMember->retrack_data = 0;
                }
                else if($request->select4 == "CONFIG"){
                    $ManageAccessMember->read_data = 0;
                    $ManageAccessMember->full_access_data = 0;
                    $ManageAccessMember->no_access_data = 0;
                    $ManageAccessMember->custom_data = 1;

                    if(in_array('ADD', $request->memberrecords, true)){
                        $ManageAccessMember->add_data = 1;
                    }else{
                        $ManageAccessMember->add_data = 0;
                    }

                    if(in_array('EDIT', $request->memberrecords, true)){
                        $ManageAccessMember->edit_data = 1;
                    }else{
                        $ManageAccessMember->edit_data = 0;
                    }

                    if(in_array('REMOVE', $request->memberrecords, true)){
                        $ManageAccessMember->delete_data = 1;
                    }else{
                        $ManageAccessMember->delete_data = 0;
                    }

                    if(in_array('RETRACK', $request->memberrecords, true)){
                        $ManageAccessMember->retrack_data = 1;
                    }else{
                        $ManageAccessMember->retrack_data = 0;
                    }
                }

                $ManageAccessMember->deleted = 0;
                $ManageAccessMember->by_id = auth()->user()->company_id;
                $ManageAccessMember->created_at = now();
                $ManageAccessMember->updated_at = now();
                $ManageAccessMember->save();
            //Member

            //Usermanagement
                $ManageAccessUserM = new ManageAccessRecords;
                $ManageAccessUserM->access_id = 5;
                $ManageAccessUserM->company_id = $userCode;
                
                if($request->select5 == "ALL"){
                    $ManageAccessUserM->read_data = 0;
                    $ManageAccessUserM->full_access_data = 1;
                    $ManageAccessUserM->no_access_data = 0;
                    $ManageAccessUserM->custom_data = 0;
                    $ManageAccessUserM->add_data = 0;
                    $ManageAccessUserM->edit_data = 0;
                    $ManageAccessUserM->delete_data = 0;
                    $ManageAccessUserM->retrack_data = 0;
                }
                else if($request->select5 == "NO"){
                    $ManageAccessUserM->read_data = 0;
                    $ManageAccessUserM->full_access_data = 0;
                    $ManageAccessUserM->no_access_data = 1;
                    $ManageAccessUserM->custom_data = 0;
                    $ManageAccessUserM->add_data = 0;
                    $ManageAccessUserM->edit_data = 0;
                    $ManageAccessUserM->delete_data = 0;
                    $ManageAccessUserM->retrack_data = 0;
                }
                else if($request->select5 == "READ"){
                    $ManageAccessUserM->read_data = 1;
                    $ManageAccessUserM->full_access_data = 0;
                    $ManageAccessUserM->no_access_data = 0;
                    $ManageAccessUserM->custom_data = 0;
                    $ManageAccessUserM->add_data = 0;
                    $ManageAccessUserM->edit_data = 0;
                    $ManageAccessUserM->delete_data = 0;
                    $ManageAccessUserM->retrack_data = 0;
                }
                else if($request->select5 == "CONFIG"){
                    $ManageAccessUserM->read_data = 0;
                    $ManageAccessUserM->full_access_data = 0;
                    $ManageAccessUserM->no_access_data = 0;
                    $ManageAccessUserM->custom_data = 1;

                    if(in_array('ADD', $request->usermanagement, true)){
                        $ManageAccessUserM->add_data = 1;
                    }else{
                        $ManageAccessUserM->add_data = 0;
                    }

                    if(in_array('EDIT', $request->usermanagement, true)){
                        $ManageAccessUserM->edit_data = 1;
                    }else{
                        $ManageAccessUserM->edit_data = 0;
                    }

                    if(in_array('REMOVE', $request->usermanagement, true)){
                        $ManageAccessUserM->delete_data = 1;
                    }else{
                        $ManageAccessUserM->delete_data = 0;
                    }

                    if(in_array('RETRACK', $request->usermanagement, true)){
                        $ManageAccessUserM->retrack_data = 1;
                    }else{
                        $ManageAccessUserM->retrack_data = 0;
                    }
                }

                $ManageAccessUserM->deleted = 0;
                $ManageAccessUserM->by_id = auth()->user()->company_id;
                $ManageAccessUserM->created_at = now();
                $ManageAccessUserM->updated_at = now();
                $ManageAccessUserM->save();
            //Usermanagement

            $request->session()->put('successUserM','Sucessfully Saved!');
            $request->session()->put('webUserCode',$userCode);
            $request->session()->put('webUserName',$request->name.' ('.$userType.')');
            $request->session()->put('webUserEmail',$request->email);

            $messages = "Sucessfully Saved!";
            $success[] = $messages;
        }
        else if($request->type == "DELETE_USER"){
            DB::table('users')
                ->where('company_id', $request->code)
                ->update([
                'deleted'=> 1,
                'updated_by'=> auth()->user()->company_id,
                'updated_at' => now()
            ]);

            $request->session()->put('deleteUserM','Sucessfully Deleted!');
            $request->session()->put('webUserCode',$request->code);
            $request->session()->put('webUserName',$request->name);
            $request->session()->put('webUserEmail',$request->email);

            $messages = "Sucessfully Deleted!";
            $success[] = $messages;
        }
        else if($request->type == "EDIT_USER"){
            if($request->isAdmin == 1){
                $userType = "Admin";
            }else{
                $userType = "Super Admin";
            }

            if($request->newPass != "" || $request->confirmPass != ""){
                DB::table('users')
                ->where('company_id', $request->code)
                ->update([
                'name' => $request->name,
                'email' => $request->email,
                'is_admin' => $request->isAdmin,
                'password' => Hash::make($request->newPass),
                'updated_by'=> auth()->user()->company_id,
                'updated_at' => now()
                ]);
            }else{
                DB::table('users')
                ->where('company_id', $request->code)
                ->update([
                'name' => $request->name,
                'email' => $request->email,
                'is_admin' => $request->isAdmin,
                'updated_by'=> auth()->user()->company_id,
                'updated_at' => now()
                ]);
            }

            $request->session()->put('successUserM','Sucessfully Updated!');
            $request->session()->put('webUserCode',$request->code);
            $request->session()->put('webUserName',$request->name.' ('.$userType.')');
            $request->session()->put('webUserEmail',$request->email);

            $messages = "Sucessfully Updated!";
            $success[] = $messages;
        }
        else{
            
            $messages = "Invalid request...";
            $error[] = $messages;
        }
        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function account_settings(){
        if(!empty(auth()->user()->id)){
            $user_records = ViewUsers::where('company_id', auth()->user()->company_id)->get();

            return view('main.accountsettings', compact('user_records'));
        }else{
            return redirect('/');
        }
    }

    public function account_settings_val(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        $user_records = ViewUsers::where('company_id', auth()->user()->company_id)->get();


        if($request->type == "EDIT_USER"){

            if($request->code == ""){
                $messages = "User Code is required!";
                $error[] = $messages;
            }
            else if($request->currentPass == ""){
                $messages = "Current password is required!";
                $error[] = $messages;
            }

            else if($request->newPass != "" || $request->confirmPass){
                if($request->newPass == "")
                {
                    $messages = "New Password is required!";
                    $error[] = $messages;
                }
                else if($request->confirmPass == ""){
                    $messages = "Confirm New Password is required!";
                    $error[] = $messages;
                }
                else if($request->newPass != $request->confirmPass){
                    $messages = "New Password and Confirm New Password did not matched!";
                    $error[] = $messages;
                }
                else
                {

                    if(Hash::check($request->currentPass, $user_records[0]->password)){
                        $messages = "Successfully Updated!";
                        $success[] = $messages;
                    }else{
                        $messages = "Your current password is incorrect!";
                        $error[] = $messages;
                    }
                }
            }
            else{
                if(Hash::check($request->currentPass, $user_records[0]->password)){
                    $messages = "Successfully Updated!";
                    $success[] = $messages;
                }else{
                    $messages = "Your current password is incorrect!";
                    $error[] = $messages;
                }
            }
        }
        else
        {
            $messages = "Invalid request...";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );
        echo json_encode($output);

    }

    public function account_settings_update(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type == "EDIT_USER"){

            if($request->newPass != "" || $request->confirmPass){
                DB::table('users')
                    ->where('company_id', auth()->user()->company_id)
                    ->update([
                    'name' => $request->name,
                    'email' => $request->email,
                    'password' => Hash::make($request->newPass),
                    'updated_by'=> auth()->user()->company_id,
                    'updated_at' => now()
                ]);

            }else{

                DB::table('users')
                    ->where('company_id', auth()->user()->company_id)
                    ->update([
                    'name' => $request->name,
                    'email' => $request->email,
                    'updated_by'=> auth()->user()->company_id,
                    'updated_at' => now()
                ]);

            }

            $request->session()->put('successUserAS','Sucessfully Updated!');
            $request->session()->put('webUserCode',auth()->user()->company_id);
            $request->session()->put('webUserName',$request->name);
            $request->session()->put('webUserEmail',$request->email);

            $messages = "Successfully Updated!";
            $success[] = $messages;
        }else{
            $messages = "Invalid request...";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );
        echo json_encode($output);
    }

    public function manage_access_edit(Request $request){
        $manage_access = DB::connection('mysql')->select("SELECT a.id, a.access_id, 
        (SELECT access_desc FROM tbl_manage_access_right WHERE id = a.access_id) as access_desc,
        a.company_id,
        a.read_data, 
        a.full_access_data,
        a.no_access_data,
        a.custom_data,
        a.add_data,
        a.edit_data,
        a.delete_data,
        a.retrack_data,
        a.deleted,
        a.by_id,
        a.created_at, 
        a.updated_at
        FROM 
        tbl_manage_access_right_per_user AS a
        WHERE a.company_id = '".$request->company_id."'
        ORDER BY a.access_id ASC");

        $data = "";

        $counter = 0;

        if(count($manage_access)){
            foreach($manage_access as $field){

                //Checked
                    if($field->add_data == 1){
                        $check1 = "checked";
                    }else{
                        $check1 ="";
                    }
                    if($field->edit_data == 1){
                        $check2 = "checked";
                    }else{
                        $check2 ="";
                    }
                    if($field->delete_data == 1){
                        $check3 = "checked";
                    }else{
                        $check3 ="";
                    }
                    if($field->retrack_data == 1){
                        $check4 = "checked";
                    }else{
                        $check4 ="";
                    }
                //Checked

                $data .='
                        <div class="row">
                            <div class="col-md-2">
                                '.$field->access_desc.'
                            </div>
                            <div class="col-md-2">
                                <select class="access-select-edit mdb-select accessSelectEdit'.$field->access_id.'" data-id = "'.$field->access_id.'" name="accessSelectEdit'.$field->access_id.'" id="accessSelectEdit'.$field->access_id.'" style="width: 170px!important;">
                    ';

                    if($field->full_access_data == 1){
                        if($field->access_id != 1){
                            $data .= '<option value="ALL" selected>All Access</option>';
                        }
                        $data .= '
                            <option value="NO">No Access</option>
                            <option value="READ">Read Only</option>
                        ';
                        if($field->access_id != 1){
                            $data .= '<option value="CONFIG">Custom Access</option>';
                        }
                    }
                    else if($field->no_access_data == 1){
                        if($field->access_id != 1){
                            $data .= '<option value="ALL" >All Access</option>';
                        }
                        $data .= '
                            <option value="NO" selected>No Access</option>
                            <option value="READ">Read Only</option>
                        ';
                        if($field->access_id != 1){
                            $data .= '<option value="CONFIG">Custom Access</option>';
                        }
                    }
                    else if($field->custom_data == 1){
                        if($field->access_id != 1){
                            $data .= '<option value="ALL" >All Access</option>';
                        }
                        $data .= '
                            <option value="NO">No Access</option>
                            <option value="READ">Read Only</option>
                        ';
                        if($field->access_id != 1){
                            $data .= '<option value="CONFIG" selected>Custom Access</option>';
                        }
                    }
                    else if($field->read_data == 1){
                        if($field->access_id != 1){
                            $data .= '<option value="ALL" >All Access</option>';
                        }
                        $data .= '
                            <option value="NO">No Access</option>
                            <option value="READ" selected>Read Only</option>
                        ';
                        if($field->access_id != 1){
                            $data .= '<option value="CONFIG">Custom Access</option>';
                        }
                    }


                    
                    if($field->custom_data == 1){
                        $data .= ' 
                            </select>
                                </div>
                    
                                <div class="col-md-2 access-right-edit'.$field->access_id.'" >
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input addE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "ADD" id="addE'.$field->access_id.'" '.$check1.'>
                                        <label class="custom-control-label" for="addE'.$field->access_id.'">Add</label>
                                    </div>
                                </div>

                                <div class="col-md-2 access-right-edit'.$field->access_id.'">
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input editE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "EDIT" id="editE'.$field->access_id.'" '.$check2.'>
                                        <label class="custom-control-label" for="editE'.$field->access_id.'">Edit</label>
                                    </div>
                                </div>

                                <div class="col-md-2 access-right-edit'.$field->access_id.'">
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input removeE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "REMOVE" id="removeE'.$field->access_id.'" '.$check3.'>
                                        <label class="custom-control-label" for="removeE'.$field->access_id.'">Remove</label>
                                    </div>
                                </div>

                                <div class="col-md-2 access-right-edit'.$field->access_id.'">
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input removeE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "RETRACK" id="retrackE'.$field->access_id.'" '.$check4.'>
                                        <label class="custom-control-label" for="retrackE'.$field->access_id.'">Retrack</label>
                                    </div>
                                </div>

                            </div>
                        ';
                    }
                    else{
                        $data .= ' 
                            </select>
                                </div>
                    
                                <div class="col-md-2 access-right-edit'.$field->access_id.'" style="display:none;">
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input addE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "ADD" id="addE'.$field->access_id.'" '.$check1.'>
                                        <label class="custom-control-label" for="addE'.$field->access_id.'">Add</label>
                                    </div>
                                </div>

                                <div class="col-md-2 access-right-edit'.$field->access_id.'" style="display:none;">
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input editE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "EDIT" id="editE'.$field->access_id.'" '.$check2.'>
                                        <label class="custom-control-label" for="editE'.$field->access_id.'">Edit</label>
                                    </div>
                                </div>

                                <div class="col-md-2 access-right-edit'.$field->access_id.'" style="display:none;">
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input removeE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "REMOVE" id="removeE'.$field->access_id.'" '.$check3.'>
                                        <label class="custom-control-label" for="removeE'.$field->access_id.'">Remove</label>
                                    </div>
                                </div>

                                <div class="col-md-2 access-right-edit'.$field->access_id.'" style="display:none;">
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input removeE'.$field->access_id.'" name="configE'.$field->access_id.'" value = "RETRACK" id="retrackE'.$field->access_id.'" '.$check4.'>
                                        <label class="custom-control-label" for="retrackE'.$field->access_id.'">Retrack</label>
                                    </div>
                                </div>

                            </div>
                        ';
                    }
               

                $counter++;
            }
            $data .= '
                <script>
                    $("[id^=accessSelectEdit]").on("change", function() { 
                        var $accessRights = $(this).closest(".row").children("[class*=access-right-edit]");
                        if($(this).val() == "CONFIG") {
                            $accessRights.show();
                        }
                        else {
                        $accessRights.hide();
                        }
                    });
                </script>
            ';
        }

        echo $data;
    }

    public function manage_access_update_val(Request $request){

        $message = "";
        $output = array();
        $error = array();
        $success = array();


        if($request->type == "UPDATE_ACCESS"){
            if($request->companyID == ""){
                $messages = "Name is required!";
                $error[] = $messages;
            }
            else if($request->select2 == ""){
                $messages = "Task List Access Righ is required!";
                $error[] = $messages;
            }
            else if($request->select3 == ""){
                $messages = "Project List Access Righ is required!";
                $error[] = $messages;
            }
            else if($request->select4 == ""){
                $messages = "Member Records Access Right is required!";
                $error[] = $messages;
            }
            else if($request->select5 == ""){
                $messages = "User Management Access Right is required!";
                $error[] = $messages;
            }
            
            else{
                if($request->select2 == "CONFIG" && $request->tasklist == ""){
                    $messages = "Task List Access Right is required!";
                    $error[] = $messages;
                }
                else if($request->select3 == "CONFIG" && $request->projectlist == ""){
                    $messages = "Project List Access Right is required!";
                    $error[] = $messages;
                }
                else if($request->select4 == "CONFIG" && $request->memberrecords == ""){
                    $messages = "Member Records Access Right is required!";
                    $error[] = $messages;
                }
                else if($request->select5 == "CONFIG" && $request->usermanagement == ""){
                    $messages = "User Management Access Right is required!";
                    $error[] = $messages;
                }
                else{
                    $messages = "Sucessfully Validated!";
                    $success[] = $messages;
                }
            }
        }else{
            $messages = "Invalid request...";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);
    }

    public function manage_access_update(Request $request){
        $message = "";
        $output = array();
        $error = array();
        $success = array();

        if($request->type == "UPDATE_ACCESS"){

            $manage_access = DB::connection('mysql')->select("SELECT * FROM users WHERE company_id = '".$request->companyID."'");

            //Dashboard
                // if($request->select1 == "ALL"){
                //     DB::table('tbl_manage_access_right_per_user')
                //         ->where('company_id', $request->companyID)
                //         ->where('access_id', 1)
                //         ->update([
                //         'read_data' => 0,
                //         'full_access_data' => 1,
                //         'no_access_data' => 0,
                //         'custom_data' => 0,
                //         'add_data' => 0,
                //         'edit_data' => 0,
                //         'delete_data' => 0,
                //         'retrack_data' => 0,
                //         'deleted' => 0,
                //         'updated_at' => now()
                //     ]);
                // }
                // else if($request->select1 == "NO"){
                //     DB::table('tbl_manage_access_right_per_user')
                //         ->where('company_id', $request->companyID)
                //         ->where('access_id', 1)
                //         ->update([
                //         'read_data' => 0,
                //         'full_access_data' => 0,
                //         'no_access_data' => 1,
                //         'custom_data' => 0,
                //         'add_data' => 0,
                //         'edit_data' => 0,
                //         'delete_data' => 0,
                //         'retrack_data' => 0,
                //         'deleted' => 0,
                //         'updated_at' => now()
                //     ]);
                // }
                // else if($request->select1 == "READ"){
                //     DB::table('tbl_manage_access_right_per_user')
                //         ->where('company_id', $request->companyID)
                //         ->where('access_id', 1)
                //         ->update([
                //         'read_data' => 1,
                //         'full_access_data' => 0,
                //         'no_access_data' => 0,
                //         'custom_data' => 0,
                //         'add_data' => 0,
                //         'edit_data' => 0,
                //         'delete_data' => 0,
                //         'retrack_data' => 0,
                //         'deleted' => 0,
                //         'updated_at' => now()
                //     ]);
                // }
                // else if($request->select1 == "CONFIG"){
                //     $add_data_dash = 0;
                //     $edit_data_dash = 0;
                //     $delete_data_dash = 0;
                //     $retrack_data_dash = 0;
        
                    
                //     if(in_array('ADD', $request->dashboard, true)){
                //         $add_data_dash = 1;
                //     }

                //     if(in_array('EDIT', $request->dashboard, true)){
                //         $edit_data_dash = 1;
                //     }

                //     if(in_array('REMOVE', $request->dashboard, true)){
                //         $delete_data_dash = 1;
                //     }

                //     if(in_array('RETRACK', $request->dashboard, true)){
                //         $retrack_data_dash = 1;
                //     }
                
        
                //     DB::table('tbl_manage_access_right_per_user')
                //         ->where('company_id', $request->companyID)
                //         ->where('access_id', 1)
                //         ->update([
                //         'read_data' => 0,
                //         'full_access_data' => 0,
                //         'no_access_data' => 0,
                //         'custom_data' => 1,
                //         'add_data' => $add_data_dash,
                //         'edit_data' => $edit_data_dash,
                //         'delete_data' => $delete_data_dash,
                //         'retrack_data' => $retrack_data_dash,
                //         'deleted' => 0,
                //         'updated_at' => now()
                //     ]);
                // }
            //Dashboard

            //Task
                if($request->select2 == "ALL"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 2)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 1,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select2 == "NO"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 2)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 1,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select2 == "READ"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 2)
                        ->update([
                        'read_data' => 1,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select2 == "CONFIG"){
                    $add_data_task = 0;
                    $edit_data_task = 0;
                    $delete_data_task = 0;
                    $retrack_data_task = 0;
        
                    
                    if(in_array('ADD', $request->tasklist, true)){
                        $add_data_task = 1;
                    }

                    if(in_array('EDIT', $request->tasklist, true)){
                        $edit_data_task = 1;
                    }

                    if(in_array('REMOVE', $request->tasklist, true)){
                        $delete_data_task = 1;
                    }

                    if(in_array('RETRACK', $request->tasklist, true)){
                        $retrack_data_task = 1;
                    }
                
        
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 2)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 1,
                        'add_data' => $add_data_task,
                        'edit_data' => $edit_data_task,
                        'delete_data' => $delete_data_task,
                        'retrack_data' => $retrack_data_task,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
            //Task

            //Project
                if($request->select3 == "ALL"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 3)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 1,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select3 == "NO"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 3)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 1,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select3 == "READ"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 3)
                        ->update([
                        'read_data' => 1,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select3 == "CONFIG"){
                    $add_data_proj = 0;
                    $edit_data_proj = 0;
                    $delete_data_proj = 0;
                    $retrack_data_proj = 0;
        
                    
                    if(in_array('ADD', $request->projectlist, true)){
                        $add_data_proj = 1;
                    }

                    if(in_array('EDIT', $request->projectlist, true)){
                        $edit_data_proj = 1;
                    }

                    if(in_array('REMOVE', $request->projectlist, true)){
                        $delete_data_proj = 1;
                    }

                    if(in_array('RETRACK', $request->projectlist, true)){
                        $retrack_data_proj = 1;
                    }
                
        
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 3)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 1,
                        'add_data' => $add_data_proj,
                        'edit_data' => $edit_data_proj,
                        'delete_data' => $delete_data_proj,
                        'retrack_data' => $retrack_data_proj,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
            //Project

            //Member Records
                if($request->select4 == "ALL"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 4)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 1,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select4 == "NO"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 4)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 1,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select4 == "READ"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 4)
                        ->update([
                        'read_data' => 1,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select4 == "CONFIG"){
                    $add_data_mem = 0;
                    $edit_data_mem = 0;
                    $delete_data_mem = 0;
                    $retrack_data_mem = 0;
        
                    
                    if(in_array('ADD', $request->memberrecords, true)){
                        $add_data_mem = 1;
                    }

                    if(in_array('EDIT', $request->memberrecords, true)){
                        $edit_data_mem = 1;
                    }

                    if(in_array('REMOVE', $request->memberrecords, true)){
                        $delete_data_mem = 1;
                    }

                    if(in_array('RETRACK', $request->memberrecords, true)){
                        $retrack_data_mem = 1;
                    }
                
        
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 4)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 1,
                        'add_data' => $add_data_mem,
                        'edit_data' => $edit_data_mem,
                        'delete_data' => $delete_data_mem,
                        'retrack_data' => $retrack_data_mem,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
            //Member Records


            //Usermanagement
                if($request->select5 == "ALL"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 5)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 1,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select5 == "NO"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 5)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 1,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select5 == "READ"){
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 5)
                        ->update([
                        'read_data' => 1,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 0,
                        'add_data' => 0,
                        'edit_data' => 0,
                        'delete_data' => 0,
                        'retrack_data' => 0,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
                else if($request->select5 == "CONFIG"){
                    $add_data_um = 0;
                    $edit_data_um = 0;
                    $delete_data_um = 0;
                    $retrack_data_um = 0;
        
                    
                    if(in_array('ADD', $request->usermanagement, true)){
                        $add_data_um = 1;
                    }

                    if(in_array('EDIT', $request->usermanagement, true)){
                        $edit_data_um = 1;
                    }

                    if(in_array('REMOVE', $request->usermanagement, true)){
                        $delete_data_um = 1;
                    }

                    if(in_array('RETRACK', $request->usermanagement, true)){
                        $retrack_data_um = 1;
                    }
                
        
                    DB::table('tbl_manage_access_right_per_user')
                        ->where('company_id', $request->companyID)
                        ->where('access_id', 5)
                        ->update([
                        'read_data' => 0,
                        'full_access_data' => 0,
                        'no_access_data' => 0,
                        'custom_data' => 1,
                        'add_data' => $add_data_um,
                        'edit_data' => $edit_data_um,
                        'delete_data' => $delete_data_um,
                        'retrack_data' => $retrack_data_um,
                        'deleted' => 0,
                        'updated_at' => now()
                    ]);
                }
            //Usermanagement

            $request->session()->put('accessUserM','User Access Right successfully updated!');
            $request->session()->put('webUserCode',$request->companyID);
            $request->session()->put('webUserName',$manage_access[0]->name);
            $request->session()->put('webUserEmail',$manage_access[0]->email);

            $messages = "Successfully Validated!!";
            $success[] = $messages;

        }else{
            $messages = "Invalid request...";
            $error[] = $messages;
        }

        $output = array(
            'error'=>$error,
            'success'=>$success
        );

        echo json_encode($output);

    }
}
