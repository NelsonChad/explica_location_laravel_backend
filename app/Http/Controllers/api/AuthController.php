<?php

namespace App\Http\Controllers\Api;

use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

use App\Models\Explainers;
use App\Models\Students;
class AuthController extends Controller
{

    private $explainers;
    private $students;

    public function __construct(Explainers $explainers, Students $students) {
        $this->explainers = $explainers;
        $this->students = $students;
    }

    public function login(Request $request) {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            //'remember_me' => 'boolean'
        ]);

        $credentials = request(['email', 'password']);
        if(!Auth::attempt($credentials))
            return response()->json(['message' => 'Unauthorized', 'status' => false], 401);

        $user = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');
        $token = $tokenResult->token;

        if ($request->remember_me)
            $token->expires_at = Carbon::now()->addWeeks(1);
        $token->save();

        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'TOKEN_TYPE' => 'Bearer',
            'user_id' => $user->id,
            'return'=> $user,
            'status' => true,
            'expires_in' => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString()
        ]);
    }

    public function studentLogin(Request $request) {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            //'remember_me' => 'boolean'
        ]);

        $email = $request->input('email');
        $pass = $request->input('password');
        //dd($request);

        $credentials = request(['email', 'password']);

        /*if(!Auth::attempt($credentials))
            return response()->json(['message' => 'Unauthorized', 'status' => false], 401);*/


        $student = $this->students->where("email",$email)
        ->where("password",$pass)
        ->select('students.id','students.name','students.avatar','students.email','students.number','students.type')
        ->get();

        if(isset($student[0])){
            return response()->json([
                'student_id' => $student[0]->id,
                'return'=> $student[0],
                'status' => true,
            ]);
        } else {
            return response()->json(['message' => 'Unauthorized', 'status' => false], 401);
        }
    }

    public function explainerLogin(Request $request) {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            //'remember_me' => 'boolean'
        ]);

        $email = $request->input('email');
        $pass = $request->input('password');
        //dd($request);

        /*$credentials2 = request(['email', 'password']);
        if(!Auth::attempt($credentials2))
            return response()->json(['message' => 'Unauthorized', 'status' => false], 401);*/


        $explainer = $this->explainers->where("email",$email)
        ->where("password",$pass)
        ->select('explainers.id','explainers.name','explainers.avatar','explainers.email','explainers.type')
        ->get();

        //dd($explainer);

        if(isset($explainer[0])){
            return response()->json([
                'student_id' => $explainer[0]->id,
                'return'=> $explainer[0],
                'status' => true,
            ]);
        } else {
            return response()->json(['message' => 'Unauthorized', 'status' => false], 401);
        }
    }

    public function show($id){

        $user = $this->user->find($id);

        $data = ['user' => $user];
        // $data = ['data' => $product];
            return response()->json($data);
    }

    public function register(Request $request)
    {
        try{
            $request->validate([
                'name' => 'required|string',
                'address' => 'required|string',
                'avatar' => 'image|mimes:jpeg,png,jpg',
                'contact' => 'required|string',
                'email' => 'required|string|email|unique:users',
                'password' => 'required|string'
            ]);

            $user = new User;

            //_______________________UPLOAD___________________________
            /*if(!$request->hasFile('avatar')) {
                return response()->json(['message' => 'upload_file_not_found', 'status' => false], 400);
            }*/

            if ($request->hasFile('avatar')) {

                $allowedfileExtension=['jpeg','jpg','png','PNG','JPEG','JPG'];
                $files = $request->file('avatar');
                $extension = $files->getClientOriginalExtension();
                $name = $files->getClientOriginalName();

                $check = in_array($extension, $allowedfileExtension);
                    // echo 'IN FOREACH';

                if($check) {
                    $media_ext = preg_replace('/[^a-zA-Z0-9-_\.]/','', $name);

                    $media_no_ext = pathinfo($media_ext, PATHINFO_FILENAME);
                    $mFiles = $media_no_ext . '-' . uniqid() . '.' . $extension;
                    $files->move(public_path().'/uploads/avatars/', $mFiles);
                    $user->avatar = $mFiles;
                }
            }

            //_______________________END_UPLOAD___________________________

            $user->name = $request->name;
            $user->address = $request->address;
            // $user->avatar = $request->avatar;
            $user->contact = $request->contact;
            $user->email = $request->email;
            $user->password = bcrypt($request->password);
            $user->save();


            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->token;

            if ($request->remember_me)
                $token->expires_at = Carbon::now()->addWeeks(1);
            $token->save();

            return response()->json([
                'message' => 'Successfully created user!',
                'status' => true,
                'access_token' => $tokenResult->accessToken,
                'TOKEN_TYPE' => 'Bearer',
                'user_id' => $user->id,
                'return'=> $user,
                'status' => true,
                'expires_in' => Carbon::parse(
                    $tokenResult->token->expires_at
                )->toDateTimeString()
                ], 201);

        } /*catch (\Exception $e){
            if(config('app.debug')){
                return response()->json([
                    'message'=> $e->getMessage(),
                    'status' => false,], 501);
            }else{
                return response()->json(['message'=> 'Falha ao cadastrar utilizador', 'status' => false]);
                // return response()->json(['Message: '=> $e->getMessage()]);
            }
        }*/
        catch (\Illuminate\Validation\ValidationException $e){
            if(config('app.debug')){
                return response()->json([
                    'message'=> $e->errors(),
                    'status' => false,], 501);
            }else{
                return response()->json(['message'=> 'Falha ao cadastrar utilizador', 'status' => false]);
                // return response()->json(['Message: '=> $e->getMessage()]);
            }
        }
    }

    public function updateAvatar(Request $request, $id) {
        //_______________________UPLOAD___________________________
        try {
            //dd($request);
            if(!$request->hasFile('avatar')) {
                return response()->json(['message' => 'upload_file_not_found', 'status' => false], 400);
            }

            if ($request->hasFile('avatar')) {

                $allowedfileExtension=['jpeg','jpg','png','PNG','JPEG','JPG'];
                $files = $request->file('avatar');
                $extension = $files->getClientOriginalExtension();
                $name = $files->getClientOriginalName();

                $check = in_array($extension, $allowedfileExtension);
                    // echo 'IN FOREACH';

                if($check) {
                    $media_ext = preg_replace('/[^a-zA-Z0-9-_\.]/','', $name);

                    $media_no_ext = pathinfo($media_ext, PATHINFO_FILENAME);
                    $mFiles = $media_no_ext . '-' . uniqid() . '.' . $extension;
                    $files->move(public_path().'/uploads/avatars/', $mFiles);

                    /*$dataForm['avatar'] = $mFiles;

                    $user = $this->user->find($id);
                    $data = $user->update($dataForm); // Utiliza mass assignment pra actualizar
                    */

                    $user = new User;
                    $dataForm['avatar'] = $mFiles;

                    $data = $user->where('id', '=', $id)
                        ->update($dataForm);

                    return response()->json(['message: ' => 'avatar actualizado', 'return'=> $mFiles, 'status' => true], 201);
                } else {
                    return response()->json(['message: ' => 'sem avatar', 'return'=> [], 'status' => false], 501);

                }
            }
        } catch (\Illuminate\Validation\ValidationException $e){
            if(config('app.debug')){
                return response()->json([
                    'message'=> $e->errors(),
                    'status' => false,], 501);
            }else{
                return response()->json(['message'=> 'Falha ao actualizar avatar', 'status' => false]);
                // return response()->json(['Message: '=> $e->getMessage()]);
            }
        }

        //_______________________END_UPLOAD___________________________
    }
    public function update(Request $request, $id)
    {
        try{
            $userData = $request->all();

            $user = $this->user->find($id);
            $data = $user->update($userData); // Utiliza mass assignment pra actualizar

            return response()->json(['message: ' => 'utilizador actualizado', 'return'=> $user, 'status' => $data,  'code: ' => 201]);

        } catch (\Exception $e){
            if(config('app.debug')){
                return response()->json(['message: '=> $e->getMessage(),'status' => false,'Code: ' => 501]);
            }else{
                return response()->json(['message: '=> 'Falha ao Actualizar','status' => false,]);
            }
        }
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function user(Request $request)
    {
        return response()->json($request->user());
    }
}
