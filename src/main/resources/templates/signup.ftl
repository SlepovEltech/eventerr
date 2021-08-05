<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

<h1>Регистрация нового пользователя</h1>
${message!" "}
<@l.login "/signup" "Зарегистрироваться"/>
<a href="/login">Авторизоваться</a>
</@c.page>