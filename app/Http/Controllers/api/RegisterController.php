<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Explainers;
use App\Models\Contacts;
use App\Models\Subjects;
use App\Models\Enrollments;
use App\Models\Students;


class RegisterController extends Controller
{

    private $totalPage = 10;
    private $explainers;
    private $contacts;
    private $subjects;
    private $students;
    private $enrollments;

    public function __construct(Explainers $explainers, Contacts $contacts, Subjects $subjects, Students $students, Enrollments $enrollments) {
        $this->explainers = $explainers;
        $this->contacts = $contacts;
        $this->subjects = $subjects;
        $this->students = $students;
        $this->enrollments = $enrollments;
    }

    public function storeExplainer(Request $request)
    {
        try{
            $explainerData = $request->all();

            $data = $this->explainers->create($explainerData);  // Utiliza mass assignment pra cadastrar
            $idExp = $data['id']; //get inserted post ID
            // dd('ID: ' + $idPost);
            return response()->json(['message' => 'individuo criado com sucesso!', 'explainer' => $data, 'status' => true], 201);

        } catch (\Exception $e){
            if(config('app.debug')){
                return response()->json(['message'=> $e->getMessage(), 'status' => false], 501);
            }else{
                return response()->json(['message'=> 'Falha ao cadastrar', 'status' => false], 501);
            }
        }

        //$response = $this->products->add($title, $description, $price, $quantity, $address, $contact, $category_id, $user_id);
    }

    public function storeStudent(Request $request)
    {
        try{
            $studentData = $request->all();

            $data = $this->students->create($studentData);  // Utiliza mass assignment pra cadastrar
            return response()->json(['message' => 'Estudante criado com sucesso!', 'student' => $data, 'status' => true], 201);

        } catch (\Exception $e){
            if(config('app.debug')){
                return response()->json(['message'=> $e->getMessage(), 'status' => false], 501);
            }else{
                return response()->json(['message'=> 'Falha ao cadastrar', 'status' => false], 501);
            }
        }
  }

    public function storeContact(Request $request)
    {
        try{
            $contactData = $request->all();

            $data = $this->contacts->create($contactData);  // Utiliza mass assignment pra cadastrar
            $idCont = $data['id']; //get inserted post ID
            // dd('ID: ' + $idPost);
            return response()->json(['message' => 'contacto criado com sucesso!', 'contact' => $data, 'status' => true], 201);

        } catch (\Exception $e){
            if(config('app.debug')){
                return response()->json(['message'=> $e->getMessage(), 'status' => false], 501);
            }else{
                return response()->json(['message'=> 'Falha ao cadastrar', 'status' => false], 501);
            }
        }
    }

    public function storeEnrollment(Request $request)
    {
        try{
            $enrolltData = $request->all();

            $data = $this->enrollments->create($enrolltData);  // Utiliza mass assignment pra cadastrar
            // dd('ID: ' + $idPost);
            return response()->json(['message' => 'pedido enviado com sucesso!', 'status' => true], 201);

        } catch (\Exception $e){
            if(config('app.debug')){
                return response()->json(['message'=> $e->getMessage(), 'status' => false], 501);
            }else{
                return response()->json(['message'=> 'Falha ao enviar', 'status' => false], 501);
            }
        }
    }


    public function storeSubject(Request $request)
    {
        // echo 'ENTROU';
        try{
            $subjectData = $request->all();

            $data = $this->subjects->create($subjectData);  // Utiliza mass assignment pra cadastrar
            $idSub= $data['id']; //get inserted post ID
            // dd('ID: ' + $idPost);
            return response()->json(['message' => 'disciplina criada com sucesso!', 'subject' => $data, 'status' => true], 201);

        } catch (\Exception $e){
            if(config('app.debug')){
                return response()->json(['message'=> $e->getMessage(), 'status' => false], 501);
            }else{
                return response()->json(['ERROR message'=> 'Falha ao cadastrar', 'status' => false], 501);
            }
        }
    }
}
