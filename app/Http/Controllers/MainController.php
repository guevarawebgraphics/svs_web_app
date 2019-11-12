<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;
use App\Models\TaskModel;
use App\Models\UserAccount;
use App\Models\ProjectList;
use App\Models\ProjTask;
use App\Models\EmpProj;
use App\Models\ProjectPercentage;
use App\Models\ProjTaskView;

class MainController extends Controller
{
    public function index(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            $view_project_percentage = DB::connection('mysql')->select("SELECT * from view_project_percentage ORDER BY created_at DESC");
        
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
            $task_selected = DB::connection('mysql')->select("SELECT * FROM view_projtask WHERE projCode = '".$request->code."' and deleted = 0");
            
            if($task_selected != ""){
                foreach($task_selected as $field){

                    if($field->taskWeight != ""){
                        $taskWeight = $field->taskWeight."%";
                    }else{
                        $taskWeight = 0.00."%";
                    }
                    $data .= '
                    <tr class="row-element-lm">
                        <td>'.$field->taskCode.'</td>

                        <td>'.$field->task_title.'</td>

                        <td>'.$field->task_desc.'</td>

                        <td>'.$taskWeight.'</td>

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
                SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
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

                        <td>'.$field->position.'</td>

                        <td>'.$field->department.'</td>

                        <td>NONE</td>
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

                        <td>NONE</td>
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
                    $data .= '
                    <tr>
                        <td>'.$taskWeight.'</td>

                        <td><p>'.$field->report.'</p></td>

                        <td>'.$field->updated_by.'</td>

                        <td>'.date("F d Y - h:i a",strtotime($field->created_at)).'</td>
                    </tr>
                    ';
                    $counter++;
                }
            }

        }

        echo $data;
    }

    public function location(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('main.location');
        }else{
            return redirect('/');
        }
    }

    public function task(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            $task_record = TaskModel::where('deleted', 0)
            ->orderBy('created_at','desc')
            ->get();

            return view('main.task', compact('task_record'));
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
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
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
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
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

            return view('main.projectlist', compact('user_record','task_record','project_record','projtask_record','emp_info','emp_selected','pm_selected'));
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
        SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
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
                                <td>'.$fieldPM->position.'</td>
                                <td>'.$fieldPM->department.'</td>
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

    public function project_dropdown(Request $request){

        $data = "";
        $counter = 1;

        if($request->type == "PM"){
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
                $data .= 'No Project Manager found';
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
                $data .= 'No Employee found';
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
                        </div>
                        <div class="col-md-4">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Task Weight" id="taskTxtFld'.$field->taskCode.'" name="taskTxtFld" value="'.$field->taskWeight.'" class="form-control">
                                
                            </div>
                        </div>
                    </div>
                    ';
                }
            }else{
                $data .= 'No Task found';
            }

        }

        echo $data;

    }

    public function project_unselected(Request $request){
        $data = "";
        $counter = 1;

        if($request->type == "PM"){
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
        else if($request->type == "EMP"){
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
                        </div>
                        <div class="col-md-4">
                            <div class="md-form svs-md-form">
                                <input type="number" data-tcode= "'.$field->taskCode.'" placeholder = "Task Weight" id="taskTxtFld'.$field->taskCode.'" name="taskTxtFld" class="form-control">
                               
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
        else if($request->lon == ""){
            $messages = "Longitude is required!";
            $error[] = $messages;
        }
        else if($request->lat == ""){
            $messages = "Latitude is required!";
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
            'est_start_date'=> $est_start_dt,
            'est_end_date'=> $est_end_dt,
            'act_start_date'=> $act_start_dt,
            'act_end_date'=> $act_end_dt,
            'longitude'=> $request->lon,
            'latitude'=> $request->lat,
            'location'=> $request->addr,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);

            //Task
            DB::table('tbl_projtask')
            ->where('projCode', $request->code)
            ->update([
            'deleted'=> 1,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
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
                'by_id'=> auth()->user()->id,
                'updated_by'=> auth()->user()->name,
                'updated_at' => now()
                ]);
            }

            //PM
            DB::table('tbl_emp_proj')
            ->where('projCode', $request->code)
            ->where('type', 'PM')
            ->update([
            'deleted'=> 1,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
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
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
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

    public function assignproject(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('main.assignproject');
        }else{
            return redirect('/');
        }
    }

    //Unused functions
    // public function project_info(Request $request){

        //     $projTask = DB::connection('mysql')->select("SELECT a.projCode, a.taskWeight , b.taskCode, b.task_title, b.task_desc FROM tbl_projtask AS a LEFT JOIN tbl_task AS b ON a.taskCode = b.taskCode WHERE a.projCode = '".$request->code."' AND a.deleted = 0 AND b.deleted = 0");
            
        //     $projEmp = DB::connection('mysql')->select("
        //         SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
        //         b.emp_no AS emp_no, b.company_id AS company_id, concat(b.lname,', ',b.fname,' ',b.mname) AS fullname, b.active AS active,

        //         c.department AS department, c.position AS position, c.team AS team, c.employment_status AS employment_status

                            
        //         FROM tbl_emp_proj AS a LEFT JOIN hris_csi_b.personal_information AS b ON a.emp_id = b.company_id
        //         LEFT JOIN hris_csi_b.employee_information AS c ON a.emp_id = c.company_id
        //         WHERE (b.active = 'yes') AND projCode = '".$request->code."' AND a.deleted = 0 AND type = 'EMP'
        //     ");


        //     $projPm = DB::connection('mysql')->select("
        //     SELECT a.id, a.projCode, a.emp_id, a.type, a.deleted, a.by_id, a.updated_by, a.created_at, a.updated_at,
        //     b.emp_no AS emp_no, b.company_id AS company_id, concat(b.lname,', ',b.fname,' ',b.mname) AS fullname, b.active AS active,

        //     c.department AS department, c.position AS position, c.team AS team, c.employment_status AS employment_status

                        
        //     FROM tbl_emp_proj AS a LEFT JOIN hris_csi_b.personal_information AS b ON a.emp_id = b.company_id
        //     LEFT JOIN hris_csi_b.employee_information AS c ON a.emp_id = c.company_id
        //     WHERE (b.active = 'yes') AND projCode = '".$request->code."' AND a.deleted = 0 AND type = 'PM'
        //     ");

        //     $data = "";
        //     $counter = 1;
        //     $counterEMP = 1;
        //     $counterPM = 1;
        //     $data .= '
        //             <hr>
        //                 <div class="row">
        //                     <div class="col-md-3">
        //                         <label><b>Task Code</b></label>
        //                     </div>
        //                     <div class="col-md-3">
        //                         <label><b>Task Title</b></label>
                                
        //                     </div>
        //                     <div class="col-md-3">
        //                         <label><b>Description</b></label>
                                
        //                     </div>
        //                     <div class="col-md-3">
        //                         <label><b>Task Weight</b></label>
                                
        //                     </div>
        //                 </div>
        //                 ';
        //     if(count($projTask)){
        //         foreach($projTask as $field){

        //             $data .='
        //                     <div class="row">
        //                         <div class="col-md-3">
        //                             '.$field->taskCode.'
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$field->task_title.'
                                    
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$field->task_desc.'
                                    
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$field->taskWeight.'
                                    
        //                         </div>
        //                     </div>
        //                     ';
        //             $counter++;
        //         }
        //     }


        //     $data .= '
        //     <hr>
        //         <div class="row">
        //             <div class="col-md-3">
        //                 <label><b>Project Manager Name</b></label>
        //             </div>
        //             <div class="col-md-3">
        //                 <label><b>Position</b></label>
                        
        //             </div>
        //             <div class="col-md-3">
        //                 <label><b>Department</b></label>
                        
        //             </div>
        //             <div class="col-md-3">
        //                 <label><b>Team</b></label>
                    
        //             </div>
        //         </div>
        //     ';

        //     if(count($projPm)){
        //         foreach($projPm as $fieldPM){
        //             $data .='
        //                     <div class="row">
        //                         <div class="col-md-3">
        //                             '.$fieldPM->fullname.'
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$fieldPM->position.'
                                    
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$fieldPM->department.'
                                    
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$fieldPM->position.'
                                
        //                         </div>
        //                     </div>
        //                     ';
        //             $counterPM++;
        //         }
        //     }


        //     $data .= '
        //     <hr>
        //         <div class="row">
        //             <div class="col-md-3">
        //                 <label><b>Employee Name</b></label>
        //             </div>
        //             <div class="col-md-3">
        //                 <label><b>Position</b></label>
                        
        //             </div>
        //             <div class="col-md-3">
        //                 <label><b>Department</b></label>
                        
        //             </div>
        //             <div class="col-md-3">
        //                 <label><b>Team</b></label>
                    
        //             </div>
        //         </div>
        //     ';

        //     if(count($projEmp)){
        //         foreach($projEmp as $fieldEMP){
        //             $data .='
        //                     <div class="row">
        //                         <div class="col-md-3">
        //                             '.$fieldEMP->fullname.'
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$fieldEMP->position.'
                                    
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$fieldEMP->department.'
                                    
        //                         </div>
        //                         <div class="col-md-3">
        //                             '.$fieldEMP->position.'
                                
        //                         </div>
        //                     </div>
        //                     ';
        //             $counterEMP++;
        //         }
        //     }
        //     echo $data;

    // }

}
