<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="site"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="gr8di.label.register"/></title>
</head>

<body>
<header class="masthead">
    <div class="intro-text">
        <p class="intro-heading">Register</p>
    </div>
</header>


<section class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="card" id="card-login">
                <div class="card-block">
                    <h4 class="card-title text-center"><g:message code="gr8di.label.register"/></h4>

                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>

                    <g:hasErrors bean="${this.user}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${this.user}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                        error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>

                    <g:form class="form-horizontal " resource="${this.user}" action="registerSave" method="POST"
                            autocomplete="off">

                        <div class="form-group row text-center">

                            <label for="username" class="col-md-4 col-form-label"><g:message
                                    code='springSecurity.login.username.label'/></label>

                            <div class="col-md-6 ${hasErrors(bean: user, field: 'username', 'is-invalid')}">
                                <input type="text" class="form-control" name="user.username" id="username"
                                       value="${fieldValue(bean: user, field: 'username')}" required autofocus>
                            </div>
                        </div>

                        <div class="form-group row text-center">
                            <label for="password" class="col-md-4 col-form-label"><g:message
                                    code='springSecurity.login.password.label'/></label>

                            <div class="col-md-6 ${hasErrors(bean: user, field: 'password', 'is-invalid')}">
                                <input id="password" type="password" name="user.password" class="form-control" required>
                            </div>
                        </div>


                        <div class="form-group row text-center ">

                            <label for="firstName" class="col-md-4 col-form-label"><g:message
                                    code='gr8di.label.firstName'/></label>

                            <div class="col-md-6 ${hasErrors(bean: user, field: 'firstName', 'is-invalid')}">
                                <input type="text" class="form-control" name="user.firstName" id="firstName" required
                                       value="${fieldValue(bean: user, field: 'firstName')}" autofocus>
                            </div>
                        </div>


                        <div class="form-group row text-center ">

                            <label for="lastName" class="col-md-4 col-form-label"><g:message
                                    code='gr8di.label.lastName'/></label>

                            <div class="col-md-6 ${hasErrors(bean: user, field: 'lastName', 'is-invalid')}">
                                <input type="text" class="form-control" name="user.lastName" id="lastName" required
                                       value="${fieldValue(bean: user, field: 'lastName')}" autofocus>
                            </div>
                        </div>


                        <div class="form-group row text-center ">

                            <label for="email" class="col-md-4 col-form-label"><g:message
                                    code='gr8di.label.email'/></label>

                            <div class="col-md-6 ${hasErrors(bean: user, field: 'email', 'is-invalid')}">
                                <input type="email" class="form-control" name="user.email" id="email" required
                                       value="${fieldValue(bean: user, field: 'email')}" autofocus>
                            </div>
                        </div>

                        <div class="form-group row text-center">

                            <label for="country" class="col-md-4 col-form-label"><g:message
                                    code='gr8di.label.country'/></label>

                            <div class="col-md-6 ${hasErrors(bean: user, field: 'country', 'is-invalid')}">
                                <g:countrySelect id="country" class="form-control" name="user.country"
                                                 value="${country}" noSelection="['': '-Choose your country-']"/>
                            </div>
                        </div>


                        <div class="form-group row text-center ${hasErrors(bean: user, field: 'city', 'has-danger')}">

                            <label for="city" class="col-md-4 col-form-label"><g:message
                                    code='gr8di.label.city'/></label>

                            <div class="col-md-6">
                                <input type="text" class="form-control" name="user.city" id="city"
                                       value="${fieldValue(bean: user, field: 'city')}" required autofocus>
                            </div>
                        </div>


                        <div class="form-group row text-center ">

                            <label for="helper" class="col-md-6 col-form-label"><g:message
                                    code='gr8di.label.helper'/></label>


                            <div class="col-md-4 checkbox">
                                <input type="checkbox" class="chk" name="user.helper" id="helper"/>
                            </div>
                        </div>


                        <div class="form-group row text-center ">

                            <label for="helpKind" class="col-md-4 col-form-label"><g:message
                                    code='gr8di.label.helpKind'/></label>

                            <div class="col-md-6 ${hasErrors(bean: user, field: 'helpKind', 'has-danger')}">
                                <textarea class="form-control" name="user.helpKind" id="helpKind" cols="30" rows="10"
                                          autofocus>${fieldValue(bean: user, field: 'helpKind')}</textarea>
                            </div>
                        </div>

                        <div class="form-group row text-center">

                            <label for="isAdult" class="col-md-4 col-form-label"><g:message
                                    code='gr8di.label.isAdult'/></label>


                            <div class="col-md-6">
                                <input class="form-check-input ${hasErrors(bean: user, field: 'isAdult', 'is-invalid')}"
                                       type="checkbox" name="user.isAdult" id="isAdult"/>
                            </div>
                        </div>


                        <div class="form-group row">
                            <div class="col-md-8 offset-md-4">

                                <input type="submit" id="submit" class="btn btn-primary"
                                       value="${message(code: 'gr8di.label.register')}"/>

                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
