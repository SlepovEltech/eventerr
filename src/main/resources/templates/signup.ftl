<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

<h1>Регистрация нового пользователя</h1>
<div class="alert alert-success" role="alert">
    ${message!" "}
</div>
<@l.login "/signup" "Зарегистрироваться"/>
<a href="/login">Авторизоваться</a>
</@c.page>