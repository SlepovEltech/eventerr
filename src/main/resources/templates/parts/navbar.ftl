<#include "security.ftl">
<#import "login.ftl" as l>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Eventer</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">События</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список пользователей</a>
                </li>
            </#if>
            <#if name!="unknown">
                <li class="nav-item">
                    <a class="nav-link" href="/my-events">Мои мероприятия</a>
                </li>
            </#if>
        </ul>
        <#if name!="unknown">
            <a href="/user/account" class="navbar-text mr-3"> ${name} </a>
            <div>
                <@l.logout />
            </div>
        <#else>
            <form action="/customlogin">
                <input type="submit" class="btn btn-secondary" value="Войти" />
            </form>
        </#if>

    </div>
</nav>