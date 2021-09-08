<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

<h1>Регистрация нового пользователя</h1>
<#if message??>
    <div class="alert alert-success" role="alert">
        ${message}
    </div>
</#if>

<@l.login "/signup" "Зарегистрироваться"/>
<a href="/login">Авторизоваться</a>
</@c.page>