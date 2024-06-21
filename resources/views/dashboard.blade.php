<!-- resources/views/dashboard.blade.php -->

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>
    <div class="container">
        <h2>Dashboard</h2>
        <p>Welcome, {{ Auth::user()->name }}!</p>
        @if ( !Auth::user()->tokens)
            <form method="POST" action="{{ route('createToken') }}">
                @csrf
                <button type="submit">create token</button>
            </form>
        @else
            <p>Token: , {{ Auth::user()->tokens }}!</p>
        @endif
        
        <form method="POST" action="{{ route('logout') }}">
            @csrf
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>