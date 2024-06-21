<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    //
    public function getUser(Request $request) 
    {
        $user = $request->user();
        return $request->json(['user' => $user], 200);
    }
}
