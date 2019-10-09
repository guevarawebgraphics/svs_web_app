<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;
use App\Models\TaskModel;

class AdminController extends Controller
{
    public function index(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.index');
        }else{
            return redirect('/');
        }
    }

    public function location(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.location');
        }else{
            return redirect('/');
        }
    }

    public function task(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            $task_record = TaskModel::orderBy('created_at','desc')
            ->get();

            return view('admin.task', compact('task_record'))->render();
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

            $task = new TaskModel;
            $task->task_title = $request->task_title;
            $task->task_desc = $request->desc;
            $task->weight = $request->weight;
            $task->deleted = 0;
            $task->by_id = auth()->user()->id;
            $task->updated_by = auth()->user()->name;
            $task->created_at = now();
            $task->updated_at = now();
            $task->save();

            $messages = "Successfully Saved!";
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
            
            $messages = "Successfully Saved!";
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

    public function projectlist(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.projectlist');
        }else{
            return redirect('/');
        }
    }

    public function assignproject(){
        if(!empty(auth()->user()->id) && auth()->user()->is_admin != 0){
            return view('admin.assignproject');
        }else{
            return redirect('/');
        }
    }
}
