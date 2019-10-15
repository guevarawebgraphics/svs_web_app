<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;
use App\Models\TaskModel;
use App\Models\UserAccount;
use App\Models\ProjectList;

class MainController extends Controller
{
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
        }else if($request->weight == ""){
            $messages = "Weight is required!";
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
            $task->weight = $request->weight;
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
        $task_record = DB::connection('mysql')->select("SELECT * FROM tbl_task ORDER BY created_at DESC");

        $data = "";
        
        $counter = 1;
        if(count($task_record) > 0){
            foreach($task_record as $field){

                $data .='
                        <tr class="">
                            <td>'.$field->task_title.'</td>
                            <td>'.$field->task_desc.'</td>
                            <td>'.$field->weight.'</td>
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
            $request->session()->put('weightTask',$request->weight);
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
        else if($request->weight == ""){
            $messages = "Weight is required!";
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
            'weight'=> $request->weight,
            'by_id'=> auth()->user()->id,
            'updated_by'=> auth()->user()->name,
            'updated_at' => now()
            ]);

            $request->session()->put('successTask',"Successfully Updated!");
            $request->session()->put('titleTask',$request->title);
            $request->session()->put('weightTask',$request->weight);
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
            $request->session()->put('weightTask',$request->weight);
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

            return view('main.projectlist', compact('user_record','task_record'));
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

    public function assignproject(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('main.assignproject');
        }else{
            return redirect('/');
        }
    }
}
