<?php
namespace App\Http\Controllers\Auth;
use Illuminate\Http\Request;
use Hash;
use Session;
use App\Models\User;
use App\Models\Role;
use App\Models\Contestant;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Routing\Controller;
use App\Mail\WelcomeMail;
use Mail;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Illuminate\Support\Facades\Storage;

class AuthController extends Controller
{

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    public function __construct()
    {
       // $this->middleware('guest')->except('logout');
    }

    public function index()
    {
        return view('auth.login');
    }  
      
    public function customLogin(LoginRequest $request)
    {
   
        $credentials = $request->getCredentials();

        if(!Auth::validate($credentials)):
            return redirect()->to('user-login')
                ->withErrors(trans('auth.failed'));
        endif;

        $user = Auth::getProvider()->retrieveByCredentials($credentials);

        Auth::login($user);

        return $this->authenticated($request, $user);
     
    }

    /**
     * Handle response after user authenticated
     * 
     * @param Request $request
     * @param Auth $user
     * 
     * @return \Illuminate\Http\Response
     */
    protected function authenticated(Request $request, $user) 
    {
        return redirect()->intended();
    }

    public function registration()
    {
        return view('auth.register');
    }
      
    public function customRegistration(RegisterRequest $request)
    { 
        $role = Role::where('slug','contestant')->first();
        $user = User::create([
            'name' => $request->first_name.' '.$request->last_name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => $request->password,
            'role_id' => $role->id,
        ]);

      //  die($role);
     
  
        $fileName = $request->photo->getClientOriginalName();
        $filePath = 'contestants/' .DIRECTORY_SEPARATOR.date('FY').DIRECTORY_SEPARATOR.$fileName;
  
        $path = Storage::disk('public')->put($filePath, file_get_contents($request->photo));
        $path = Storage::disk('public')->url($path);

       // Generate initial slug
        $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $request->first_name . ' ' . $request->last_name)));

        // Check if the slug already exists and modify it to be unique
        $originalSlug = $slug;
        $counter = 1;
        while (Contestant::where('slug', $slug)->exists()) {
            $slug = $originalSlug . '-' . $counter;
            $counter++;
        }

        // Create the contestant
        $user = Contestant::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'ville' => $request->ville,
            'quartier' => $request->quartier,
            'cgu' => $request->cgu,
            'user_id' => $user->id,
            'telephone' => $request->telephone,
            'photo' => $filePath,
            'bio' => $request->bio,
            'slug' => $slug,
        ]);

        $data = ([
            'name' => $request->first_name.' '.$request->last_name,
            'username' => $request->username,
            'email' => $request->email,
            'telephone' => $request->telephone,
            ]);

        Mail::to($request->email)->send(new WelcomeMail($data));

      //  auth()->login($user);

        return redirect('/')->with('success', "Account successfully registered.");
    }

    public function create(array $data)
    {
      
      return User::create([
        'name' => $data['name'],
        'email' => $data['email'],
        'role_id' => $data['role_id'],
        'password' => Hash::make($data['password'])
      ]);
    }    
    
    public function signOut() {
        Session::flush();
        Auth::logout();

        return redirect()->route('home');
    }
}