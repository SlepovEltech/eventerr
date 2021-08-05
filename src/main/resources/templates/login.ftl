<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h1>Авторизация</h1>
    <@l.login "/login" "Войти"/>
    <a href="/signup" class="link-secondary">Создать новый аккаунт</a>
</@c.page>
