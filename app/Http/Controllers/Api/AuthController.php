<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\GuestRegisterRequest;
use App\Http\Requests\LoginRequest;
use App\Http\Resources\UserResource;
use App\Http\Resources\ContestantResource;
use App\Models\Role;
use App\Models\User;
use App\Models\Contestant;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Mail;
use App\Mail\WelcomeMail;
use Illuminate\Http\JsonResponse;

use Hash;
use Session;
use Illuminate\Support\Facades\Auth;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;


class AuthController extends Controller
{

    use AuthenticatesUsers;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Custom login method for API.
     *
     * @param  \App\Http\Requests\LoginRequest  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function mylogin(LoginRequest $request): JsonResponse
    {
        // Retrieve the credentials from the request
        $credentials = $request->getCredentials();

        
        $user = Auth::getProvider()->retrieveByCredentials($credentials);
        // Retrieve the authenticated user
        $token = $user->createToken($user->name . '-AuthToken')->plainTextToken;

        // Return the response with the user resource and token
        return response()->json([
            'message' => 'Login successful',
            'user' => new UserResource($user),
            'access_token' => $token,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(RegisterRequest $request): JsonResponse
    {
        // The validated request data is available via $request->validated() method.

        // Find the contestant role
        $role = Role::where('slug', 'contestant')->first();

        // Create the user
        $user = User::create([
            'name' => $request->first_name . ' ' . $request->last_name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => bcrypt($request->password), // Make sure to hash the password
            'role_id' => $role->id,
        ]);

        // Handle the photo upload
        $fileName = $request->photo->getClientOriginalName();
        $filePath = 'contestants/' . DIRECTORY_SEPARATOR . date('FY') . DIRECTORY_SEPARATOR . $fileName;
        $path = Storage::disk('public')->put($filePath, file_get_contents($request->photo));
        $filePath = Storage::disk('public')->url($path);

        // Generate a unique slug
        $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $request->first_name . ' ' . $request->last_name)));
        $originalSlug = $slug;
        $counter = 1;
        while (Contestant::where('slug', $slug)->exists()) {
            $slug = $originalSlug . '-' . $counter;
            $counter++;
        }

        // Create the contestant
        $contestant = Contestant::create([
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

        // Send the welcome email
        $data = [
            'name' => $request->first_name . ' ' . $request->last_name,
            'username' => $request->username,
            'email' => $request->email,
            'telephone' => $request->telephone,
        ];
        Mail::to($request->email)->send(new WelcomeMail($data));

        // Return the user and contestant as JSON resources
        return response()->json([
            'user' => new UserResource($user),
            'contestant' => new ContestantResource($contestant),
            'message' => 'Account successfully registered.',
        ], 201);
    }


    public function guestRegister(GuestRegisterRequest $request): JsonResponse
    {
        $user = User::create([
            'name' => $request->first_name . ' ' . $request->last_name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password), // Hash the password
        ]);

        if ($user) {
            Auth::login($user);
        }

        return response()->json([
            'success' => true,
            'message' => 'Account successfully registered.',
            'user' => $user, // You may want to transform this with a resource class
        ], 201);
    }


    /**
     * Custom sign out method for API.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function signOut(Request $request): JsonResponse
    {
        /**
         * @var $user App\Models\User
         */

        $user = Auth::guard('sanctum')->user();

        if (!$user) {
            return response()->json(['error' => 'Unauthenticated'], 401);
        }

        try {
            // Revoke all tokens for the authenticated user
            $user->tokens()->delete();
        } catch (\Exception $e) {
            // Log the exception for investigation
            Log::error('Token revocation failed: ' . $e->getMessage());

            return response()->json(['error' => 'Unable to revoke tokens'], 500);
        }

        return response()->json(['message' => 'Tokens revoked successfully']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
