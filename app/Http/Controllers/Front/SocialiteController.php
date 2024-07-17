<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;

use Socialite; // <-- ne pas oublier

class SocialiteController extends Controller
{
    // Les tableaux des providers autorisés
    protected $providers = [ "google", "facebook" ];

    # La vue pour les liens vers les providers
    public function loginRegister () {
    	return view("auth.login");
    }

    # redirection vers le provider
    public function redirect (Request $request) {

        $provider = $request->provider;

        // On vérifie si le provider est autorisé
        if (in_array($provider, $this->providers)) {
            return Socialite::driver($provider)->redirect(); // On redirige vers le provider
        }
        abort(404); // Si le provider n'est pas autorisé
    }

   // Callback du provider
   public function callback (Request $request) {

    $provider = $request->provider;

    if (in_array($provider, $this->providers)) {

        // Les informations provenant du provider
        $data = Socialite::driver($request->provider)->user();

        # Social login - register
        $id = $data->getId();
        $username = $data->getNickname();
        $avatar = $data->getAvatar();
        $email = $data->getEmail(); // L'adresse email
        $name = $data->getName(); // le nom
                // token
        $token = $data->token;

        // Les informations de l'utilisateur
        

        # 1. On récupère l'utilisateur à partir de l'adresse email
        $user = User::where("email", $email)->first();

        $role = Role::where("slug", 'user')->first();

        # 2. Si l'utilisateur existe
        if (isset($user)) {

            // Mise à jour des informations de l'utilisateur
            $user->name = $name;
            $user->save();

        # 3. Si l'utilisateur n'existe pas, on l'enregistre
        } else {
            
            // Enregistrement de l'utilisateur
            $user = User::create([
                'name' => $name,
                'email' => $email,
                'username' => $username,
                'avatar' => $avatar,
                'role_id' => $role->id,
                'provider' => $provider,
                'provider_id' => $id,
                'remember_token' => $token,
                'password' => bcrypt("emilie") // On attribue un mot de passe
            ]);
        }

        # 4. On connecte l'utilisateur
        auth()->login($user);

        # 5. On redirige l'utilisateur vers /home
        if (auth()->check()) return redirect(route('home'));

     }
        abort(404);
    }
}
