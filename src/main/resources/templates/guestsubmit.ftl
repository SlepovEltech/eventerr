<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <h1>Подтверждение регистрации на ${event.name}</h1>
    <h2>${user.first_name!""} ${user.last_name!""}</h2>
    <a href="/event/${event.id}/${guest.id}/submit" class="btn btn-secondary">Подтвердить присутствие</a>
    <div class="page-bg"></div>
</@c.page>

<style>

    body {
        font-family: "Arial";
    <#if event.filename?has_content>
        color: #fff;
    <#else>
        color: #000;
    </#if>
    }

    .page-bg {
        background: url("${event.filename}") no-repeat;
        background-size: cover;
        -webkit-filter: blur(5px);
        /*-moz-filter: blur(5px);*/
        /*-o-filter: blur(5px);*/
        -ms-filter: blur(5px);
        filter: blur(5px);
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: -1;
    }

</style>