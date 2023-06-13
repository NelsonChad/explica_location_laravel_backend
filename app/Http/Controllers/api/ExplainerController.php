<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Explainers;
use App\Models\Contacts;
use App\Models\Subjects;
use App\Models\Enrollments;

class ExplainerController extends Controller
{
    private $totalPage = 10;
    private $explainers;
    private $contacts;
    private $subjects;
    private $enrollments;

    public function __construct(Explainers $explainers, Contacts $contacts, Subjects $subjects, Enrollments $enrollments) {
        $this->explainers = $explainers;
        $this->contacts = $contacts;
        $this->subjects = $subjects;
        $this->enrollments = $enrollments;

    }

    public function index(){
        $explainers = $this->explainers
        ->where('active', 'true')
        ->where('confirmed', 'true')
        ->orderBy('id', 'desc')

        ->paginate($this->totalPage);
        if($explainers == null){
            return $explainers = "Sem nenhum local";
        }else{

            $data =  $explainers;
            return response()->json($data);
        }
    }

        public function show($id){

        $explainer = $this->explainers
        ->select('explainers.*')
        ->find($id);

        $data = ['data' => $explainer];
            return response()->json($data);
    }

    public function showContacts($id){
        $contactsL = $this->contacts
        ->where('explainer_id',$id)
        ->select('contacts.contact')
        ->get();

        $data = ['data' => $contactsL];
            return response()->json($data);
    }

    public function showSubjects($id){
        $subjectsL = $this->subjects
        ->where('explainer_id',$id)
        ->select('subjects.name')
        ->get();

        $data = ['data' => $subjectsL];
            return response()->json($data);
    }

    public function showEnrollments($id){
        $enroll = $this->enrollments
        ->where('explainer_id',$id)
        ->join('students', 'enrollments.student_id', '=', 'students.id')
        ->select('students.name','students.avatar')
        ->get();

        $data = ['data' => $enroll];
            return response()->json($data);
    }
}
