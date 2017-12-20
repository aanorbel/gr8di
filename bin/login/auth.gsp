<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code='springSecurity.login.title'/></title>

</head>

<body>
<header class="masthead">
    <div class="intro-text">
        <p class="intro-heading">Login</p>
    </div>
</header>

<section class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="card" id="card-login">
                <div class="card-block">
                    <h4 class="card-title text-center"><g:message code='springSecurity.login.header'/></h4>


                    <g:if test='${flash.message}' >
                        <div class="alert alert-danger" role="alert">${flash.message}</div>
                    </g:if>

                    <form class="form-horizontal " action="${postUrl ?: '/login/authenticate'}" method="POST"  autocomplete="off">

                        <div class="form-group row text-center">
                            <label for="username" class="col-md-4 col-form-label"><g:message code='springSecurity.login.username.label'/></label>

                            <div class="col-md-6">
                                <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username"  required autofocus>

                            </div>
                        </div>

                        <div class="form-group row text-center">
                            <label for="password" class="col-md-4 col-form-label"><g:message code='springSecurity.login.password.label'/></label>

                            <div class="col-md-6">
                                <input id="password" type="password"  name="${passwordParameter ?: 'password'}" id="password" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6 offset-md-4">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                                        <g:message code='springSecurity.login.remember.me.label'/>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-8 offset-md-4">

                                <input type="submit" id="submit" class="btn btn-primary" value="${message(code: 'springSecurity.login.button')}"/>

                                <a class="card-link" href="">
                                    Forgot Your Password?
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
%{--

--}%
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>